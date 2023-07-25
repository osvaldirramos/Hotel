/* Copyright (c) 1995 by Oracle Corporation */
/*
   NAME
     nonblk.c
   DESCRIPTION
     Tests non-blocking connections
   MODIFIED   (MM/DD/YY)
    xxxxxxxx   03/15/95 -  change non-blocking printf to one printf
    xxxxxxxx   03/08/95 -  change stderr to stdout
    xxxxxxxx   03/05/95 -  Branch_for_patch
    xxxxxxxx   03/01/95 -  Creation
*/
 
/*
 * Name:        nonblk.c
 *
 * Description: This program performs a "long" running hardcoded insert 
 *              and demonstrates the use of non-blocking calls.
 *
 * Changes:     modified login to non-blocking 
 *
 * Setup:       Run nonblk.sql before running this program.
 *              Link program and run it. Program requires no arguments
 *
 * OCI Calls used:
 *
 *      Phase         OCI Call           Notes
 *      ------------------------------------------------------------------
 *      Login     -   olog               use nonblocking argument       
 *      Open      -   oopen
 *      Parse     -   oparse
 *      Bind      -   obndra       
 *      Describe  -   none               Hard-coded query
 *      Define    -   none               insert statement
 *      Execute   -   oexec
 *      Fetch     -   none               insert
 *      Close     -   oclose
 *      Logoff    -   olof
 *      Nonblocking - onbtst, onbclr
 * 
 * This program is for educational purposes.
 *      
 */

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#include <oratypes.h>
/* LDA and CDA struct declarations */
#include <ocidfn.h>
#ifdef __STDC__
#include <ociapr.h>
#else
#include <ocikpr.h>
#endif
/* demo constants and structs */
#include <ocidem.h>


/* oparse flags */
#define  DEFER_PARSE        1
#define  NATIVE             1
#define  VERSION_7          2

/* exit flags */
#define OCI_EXIT_FAILURE 1
#define OCI_EXIT_SUCCESS 0

#define BLOCKED -3123
#define SUCCESS 0

Lda_Def lda;                                                   /* login area */
ub1     hda[HDA_SIZE];                                          /* host area */
Cda_Def cda;                                                  /* cursor area */

/* Function prototypes */
void logon ();
void logoff ();
void setup();
void err_report();
void insert_data();
void do_exit();

/* SQL statement used in this program */

text *sqlstmt = (text *)"INSERT INTO nonblktab (col1)\
                         SELECT a.col1 \
                         FROM nonblktab a, nonblktab b";

void main(argc, argv)
eword argc;
text **argv;
{

  logon();                                       /* logon to Oracle database */

  setup();                                          /* prepare sql statement */

  insert_data();

  logoff();                                        /* logoff Oracle database */

  do_exit(OCI_EXIT_SUCCESS);

}

/* 
 * Function: setup
 *
 * Description: This routine does the necessary setup to execute the SQL
 *              statement. Specifically, it does the open, parse, bind and
 *              define phases as needed.
 *
 */
void setup()
{

  if (oopen(&cda, &lda, (text *) 0, -1, -1, (text *) 0, -1))         /* open */
  {
    err_report(&cda);
    do_exit(OCI_EXIT_FAILURE);
  }

  if (oparse(&cda, sqlstmt, (sb4) -1, DEFER_PARSE,                  /* parse */
               (ub4) VERSION_7))
  {
    err_report(&cda);
    do_exit(OCI_EXIT_FAILURE);
  }

  if (onbtst(&lda))
  {
    printf("connection is still blocking!!!\n");
    do_exit(OCI_EXIT_FAILURE);
  }

}

/* 
 * Function: insert_data
 *
 * Description: This routine inserts the data into the table
 *
 */
void insert_data()
{

   ub1 done = 0;
   static ub1 blocked_cnt = 0;          /* number of times statement blocked */
   while (!done)
   {
     switch(oexec(&cda))
     {
       case BLOCKED:                /* will come through here multiple times */
            blocked_cnt++;
            break;
       case SUCCESS:
	    done = 1;
	    break;
       default:
	    err_report(&cda);
	    do_exit(OCI_EXIT_FAILURE);             /* get out of application */
     }
			 
   }

   printf("\n Execute blocked %ld times\n", blocked_cnt);

   if (onbclr(&lda))      /* clear the non-blocking status of the connection */
   {
     err_report((Cda_Def *)&lda);
     do_exit(OCI_EXIT_FAILURE);
   }

}

/* 
 * Function: err_report
 *
 * Description: This routine prints out the most recent OCI error
 *
 */
void err_report(cursor)
Cda_Def *cursor;
{
    sword n;
    text msg[512];                      /* message buffer to hold error text */

    if (cursor->fc > 0)
      printf("\n-- ORACLE error when processing OCI function %s \n\n", 
            oci_func_tab[cursor->fc]);
    else
      printf("\n-- ORACLE error\n");
 
    n = (sword)oerhms(&lda, cursor->rc, msg, (sword) sizeof msg);
    printf("%s\n", msg);

}

/* 
 * Function: do_exit
 *
 * Description: This routine exits with a status
 *
 */
void do_exit(status)
eword status;
{

  if (status == OCI_EXIT_FAILURE)
     printf("\n Exiting with FAILURE status %d\n", status);
  else 
     printf("\n Exiting with SUCCESS status %d\n", status);
     
  exit(status);
}

/* 
 * Function: login
 *
 * Description: This routine logs on onto the database as OCITEST/OCITEST
 *
 */
void logon()
{

  ub1 done = 0;
  static ub1 logblk_cnt = 0;              /* number of times login blocked */
  while (!done)
  {
     switch (olog(&lda, hda, (text *)"OCITEST", -1, (text *)"OCITEST", -1, 
	   (text *)0, -1, OCI_LM_NBL))
     {

       case BLOCKED:              /* will come through here multiple times */
            logblk_cnt++;
	    break;
       case SUCCESS:
	    printf(" Logged on successfully\n");
	    done = 1;
	    break;
       default:
            err_report((Cda_Def *)&lda);
            do_exit(OCI_EXIT_FAILURE);
     }

  }

  printf(" Login was blocked %ld times\n", logblk_cnt);
  printf("\n Connected to ORACLE as ocitest\n");

}

/* 
 * Function: logoff
 *
 * Description: This routine closes out any cursors and logs off the database
 *
 */
void logoff()
{

  if (oclose(&cda))                                          /* close cursor */
  {
    printf("Error closing cursor 1.\n");
    do_exit(OCI_EXIT_FAILURE);
  }

  if (ologof(&lda))                                  /* log off the database */
  {
    printf("Error on disconnect.\n");
    do_exit(OCI_EXIT_FAILURE);
  }

}

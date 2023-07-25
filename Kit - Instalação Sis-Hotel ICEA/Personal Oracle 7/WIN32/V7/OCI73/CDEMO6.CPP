
/* Copyright (c) 1991 by Oracle Corporation */
/* 
 *      -- cdemo6.cc --
 *  An example program which illustrates how a C++ program
 *  can use the OCI interface to access ORACLE database.
 *
 *  This program retrieves department name, given the
 *  department number.
 *  
 *  The program queries the user for data as follows:
 *   
 *  Enter department number:
 *   
 *  The program terminates if -1 is entered
 *  when the department number is requested.
 */ 
extern "C"
{
#include <stdio.h>
#include <windows.h>
#include <oratypes.h>
#include <ociapr.h>
/* demo constants and structs */
#include <ocidem.h>
} 
extern "C"
{
#include <oratypes.h>
#include <ocidfn.h>
#include <ocidem.h>
} 
/* oparse flags */
#define  DEFER_PARSE        1
#define  NATIVE             1
#define  VERSION_7          2 
/* Class forward declarations */
class connection;
class cursor; 
/*
 * This class represents a connection to ORACLE database.
 *
 * NOTE: This connection class is just given as an example and 
 * all possible operations on a connection have not been defined.
 */
class connection
{
  friend class cursor;
  public:
    connection() 
      { state = not_connected;  
        memset(&lda,0,sizeof(Lda_Def));
        memset(&hda,0,HDA_SIZE); 
      }
    ~connection();
    sword connect(const text *username, const text *password);
    sword disconnect();
    void display_error(FILE* file) const;
  private:
    Lda_Def lda;
    ub1 hda[HDA_SIZE];
    enum conn_state
    {
      not_connected,
      connected
    };
    conn_state state;
}; 
/*
 * This class represents an ORACLE cursor.
 *
 * NOTE: This cursor class is just given as an example and all
 * possible operations on a cursor have not been defined.
 */
class cursor
{
  public:
    cursor() 
      {state = not_opened; conn = (connection *)0; }
    ~cursor();
    sword open(connection *conn_param);
    sword close();
    sword parse(const text *stmt)
      { return (oparse(&cda, (text *)stmt, (sb4)-1, 
                       DEFER_PARSE, (ub4) VERSION_7)); }
    /* bind an input variable */
    sword bind_by_position(sword sqlvnum, ub1 *progvar, 
                           sword progvarlen, sword datatype, 
                           sword scale, sb2 *indicator)
      { return (obndrn(&cda, sqlvnum, progvar, progvarlen,
                       datatype, scale, indicator, (text *)0, 
                       -1, -1)); }
    /* define an output variable */
    sword define_by_position(sword position, ub1 *buf, 
                             sword bufl, sword datatype, 
                      
      sword scale, sb2 *indicator, 
                             ub2 *rlen, ub2 *rcode)
      { return (odefin(&cda, position, buf, bufl, datatype, 
                       scale, indicator,
                       (text *)0, -1, -1, rlen, rcode)); }
    sword describe(sword position, sb4 *dbsize, sb2 *dbtype, 
                   sb1 *cbuf, sb4 *cbufl, sb4 *dsize, sb2 *prec,
                   sb2 *scale, sb2 *nullok)
      { return (odescr(&cda, position, dbsize, dbtype, 
                       cbuf, cbufl, dsize,  prec, scale, nullok));
      }
    sword execute()
      { return (oexec(&cda)); }
    sword fetch()
      { return (ofetch(&cda)); }
    sword get_error_code() const
      { return (cda.rc); }
    void display_error( FILE* file) const;
  private:
    Cda_Def cda;
    connection *conn;
    enum cursor_state
    {
      not_opened,
      opened
    };
    cursor_state state;
}; 
/*
 * Error number macros
 */
#define CONERR_ALRCON -1            /* already connected */ 
#define CONERR_NOTCON -2            /* not connected */ 
#define CURERR_ALROPN -3            /* cursor is already open */
#define CURERR_NOTOPN -4            /* cursor is not opened */


/* exit status upon failure */
#define  EXIT_FAILURE       1 
 
const text *username = (text *) "SCOTT";
const text *password = (text *) "TIGER"; 
/* define SQL statements to be used in the program */
const text *seldept = (text *) "SELECT dname FROM dept WHERE deptno = :1"; 
void err_report(FILE *file, text *errmsg, sword func_code);
void myfflush(); 
/* connection destructor */
connection::~connection() 
{
  // disconnect if connection exists
  if (state == connected)
  {
    if (disconnect())
    {
      display_error(stderr);
    }
  }
} 
/* connect to ORACLE */
sword connection::connect(const text *username, const text *password)
{
  sword status; 
  if (state == connected)
  {
    // this object is already connected
    return (CONERR_ALRCON);
  } 

  if ((status = olog(&lda, hda, (text *)username, -1,
                     (text *)password, -1, (text *) 0, -1,
                     OCI_LM_DEF)) == 0)
  {
    // successful login
    state = connected;
    printf("Connected to ORACLE as %s\n", username);
  } 
  return (status);
} 
/* disconnect from ORACLE */
sword connection::disconnect()
{
  sword status; 
  if (state == not_connected)
  {
    // this object has not been connected
    return (CONERR_NOTCON);
  } 
  if ((status = ologof(&lda)) == 0)
  {
    // successful logout
    state = not_connected;
  } 
  return (status);
} 
/* write error message to the given file */
void connection::display_error(FILE *file) const
{
  if (lda.rc != 0)
  {
    sword n;
    text msg[512]; 
    n = oerhms((cda_def *)&lda, lda.rc, msg, (sword) sizeof(msg));
    err_report(file, msg, lda.fc);
  }
} 
/* cursor destructor */
cursor::~cursor()
{
  if (state == opened)
  {
    if (close())
      display_error(stderr);
  }
} 
/* open the cursor */
sword cursor::open(connection *conn_param)
{
  sword status; 
  if (state == opened)
  {
    // this cursor has already been opened
    return (CURERR_ALROPN);
  } 
  if ((status = oopen(&cda, &conn_param->lda, (text *)0, -1, -1, 
                      (text *)0, -1)) == 0)
  {
    // successfull open
    state = opened;
    conn = conn_param;
  } 
  return (status);
} 
/* close the cursor */
sword cursor::close()
{
  sword status; 
  if (state == not_opened)
  {
    // this cursor has not been opened
    return (CURERR_NOTOPN);
  } 
  if ((status = oclose(&cda)) == 0)
  {
    // successful cursor close
    state = not_opened;
    conn = (connection *)0;
  } 
  return (status);
} 
/* write error message to the given file */
void cursor::display_error(FILE *file) const
{
  if (cda.rc != 0)
  {
    sword n;
    text msg[512]; 
    n = oerhms(&conn->lda, cda.rc, msg, (sword) sizeof(msg));
    err_report(file, msg, cda.fc);
  }
} 
int main()
{
    sword deptno;
    sword len, dsize;
    sb4   deptlen;
    sb2   db_type;
    sb1   name_buf[20];
    text  *dept; 
/* 
 *  Connect to ORACLE and open a cursor.
 *  Exit on any error.
 */
    connection conn;
    if (conn.connect(username, password))
    {
      conn.display_error(stderr);
      return(EXIT_FAILURE);
    } 
    cursor crsr;
    if (crsr.open(&conn))
    {
      crsr.display_error(stderr);
      return(EXIT_FAILURE);
    } 
    /* parse the SELDEPT statement */
    if (crsr.parse(seldept))
    {
      crsr.display_error(stderr);
      return(EXIT_FAILURE);
    } 
    /* bind the placeholder in the SELDEPT statement */
    if (crsr.bind_by_position(1, (ub1 *) &deptno, 
                              (sword) sizeof(deptno),
                              INT_TYPE, -1, (sb2 *) 0))
    {
      crsr.display_error(stderr);
      return(EXIT_FAILURE);
    }   
    /* describe the select-list field "dname" */
    len = sizeof (name_buf);
    if (crsr.describe(1, (sb4 *) &deptlen, &db_type,
                      name_buf, (sb4 *) &len, (sb4 *) &dsize, 
                     (sb2 *) 0, (sb2 *) 0, (sb2 *) 0))
    {
      crsr.display_error(stderr);
      return(EXIT_FAILURE);
    } 
    /* allocate space for dept name now that you have length */
    dept = new text((int) deptlen + 1); 
    /* define the output variable for the select-list */
    if (crsr.define_by_position(1, (ub1 *) dept, (sword)deptlen+1,
                                STRING_TYPE, -1, (sb2 *) 0, 
                               (ub2 *) 0, (ub2 *) 0))
    {
      crsr.display_error(stderr);
      delete dept;
      return(EXIT_FAILURE);
    } 
    for (;;)
    {
        /* prompt for department number, */
        /* break if given number == -1 */
        printf("\nEnter department number (or -1 to EXIT): ");
        while (scanf("%d", &deptno) != 1)
        {
          myfflush();
          printf("Invalid input, please enter a number \
                 (-1 to EXIT): ");
        }
        if (deptno == -1)
        {
          printf("Exiting... ");
          break;
        } 
        /* display the name of the corresponding department */
        if (crsr.execute() || crsr.fetch())
        {
          if (crsr.get_error_code() != NO_DATA_FOUND)
          {
            crsr.display_error(stderr);
            delete dept;
            return(EXIT_FAILURE);
          }
          else
          printf("\n  The department number that you entered \
                 doesn't exist.\n");
        }
        else
       {
       printf("\n  Department name = %s    \
              Department number = %d\n", 
              dept, deptno);
       }
    } 
    delete dept;
    printf ("\nG'day\n"); 
  return 0;
} 
void err_report(FILE *file, text *errmsg, sword func_code)
{
    fprintf(file, "\n-- ORACLE error--\n\n%s\n", errmsg);
    if (func_code > 0)
        fprintf(file, "Processing OCI function %s\n",
            oci_func_tab[func_code]);
} 
void myfflush()
{
  eb1 buf[50];
 
  fgets((char *) buf, 50, stdin);
}
  

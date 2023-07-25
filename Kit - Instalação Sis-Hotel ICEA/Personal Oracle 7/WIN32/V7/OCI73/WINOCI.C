/*
 * winoci.c
 *
 * Example OCI Application for Windows V3.0.
 *
 * by D. Colello -- Desktop Products Division.
 *
 * Copyright 1991, Oracle Corporation.
 *
 * Modified -  
 *	cchui	   10/25/94 -  replace calls to osql3 with oparse - bug 229431
 *	cchui	   10/25/94 -  replace call to olon with orlon - bug 229431
 *  dcriswel   12/03/93 -  Port to v7
 *   Colello    07/09/91 - Created from winsam.pc
 */

#include <windows.h>
#include "winoci.h"
#include <string.h>
#include "ociapr.h"

/********************************************************************/
/*                 Oracle Declaration Section                       */
/********************************************************************/

    /* Cursor and LDA for communicating with ORACLE */
    struct cda_def lda;                                        /* lda area */
#define  LDA (struct cda_def *)&lda
    struct cda_def sel_curs;                          /* cursor for SELECT */
#define  SEL_CURS  (struct cda_def *)&sel_curs
    struct cda_def dml_curs;      /* cursor for DML...insert,update,delete */
#define  DML_CURS  (struct cda_def *)&dml_curs

    /* Input host variables for logging into ORACLE. */
	char connectstr [ MAX_CONNECT + 1 ];
    char userid[ MAX_USERID + 1 ];                  /*used at CONNECT time*/
    char password[ MAX_PASSWORD + 1 ];              /*used at CONNECT time*/

    /* Input/Output host variables for EMP table. */
    char emp_empno[ 5 ];     /*used for EMP table*/
    char emp_ename[ 11 ];    /*used for EMP table*/
    char emp_job[ 10 ];      /*used for EMP table*/
    char emp_mgr[ 5 ];       /*used for EMP table*/
    char emp_hiredate[ 10 ]; /*used for EMP table*/
    char emp_sal[ 9 ];       /*used for EMP table*/
    char emp_comm[ 9 ];      /*used for EMP table*/
    char emp_deptno[ 3 ];    /*used for EMP table*/

    /* Null field indicators for table EMP. */
    short ind_emp_empno;           /*used for EMP table*/
    short ind_emp_ename;           /*used for EMP table*/
    short ind_emp_job;             /*used for EMP table*/
    short ind_emp_mgr;             /*used for EMP table*/
    short ind_emp_hiredate;        /*used for EMP table*/
    short ind_emp_sal;             /*used for EMP table*/
    short ind_emp_comm;            /*used for EMP table*/
    short ind_emp_deptno;          /*used for EMP table*/

    /* Structure to keep info on current session */
    struct oracle_session session;

    char hda[256];

/********************************************************************/
/*                   Windows Declaration Section                    */
/********************************************************************/

static HANDLE hInst;

/********************************************************************/
/*                   OCI and Windows Code.                          */
/********************************************************************/

/*
 *ProcessOracleErrorCode
 */
BOOL ProcessOracleErrorCode(hWnd, csrlda)
HWND hWnd;
struct cda_def  *csrlda;
{
    char buffer[ 133 ];               /* buffer to hold Oracle error message */

    if (csrlda->rc) {                         /* if error code is set... */

       /* Get Oracle Error Message */
       oerhms(LDA, (sb2)csrlda->rc, (char  *)buffer, sizeof(buffer)-1);

       /* Print Oracle Error */
       MessageBox(hWnd, buffer, "ORACLE Error", MB_OK);
       return FALSE;

       } /*if*/

    return TRUE;

} /*ProcessOracleErrorCode*/

/*
 *AboutDlg
 */
BOOL CALLBACK AboutDlg(hDlg, message, wParam, lParam)
HWND hDlg;
unsigned message;
WORD wParam;
LONG lParam;
{

    switch (message) {

        case WM_COMMAND :
            EndDialog(hDlg, TRUE);
            return TRUE;

        case WM_INITDIALOG :
            return TRUE;

        default :
            return FALSE;
        } /*switch*/

    return FALSE;

} /*AboutDlg*/

/*
 *GetEmpRecord
 */
PROCEDURE GetEmpRecord(hDlg)
HWND hDlg;
{

    /* clear indicator variables */
    ind_emp_empno = ind_emp_ename = ind_emp_job = ind_emp_mgr =
      ind_emp_hiredate = ind_emp_sal = ind_emp_comm = ind_emp_deptno = 0;

    /* Get input from Dialog Box */
    /* Set indicator variables if empty string */
    if (GetDlgItemText(hDlg, ID_EMPLOYEES_FLD_EMPNO,
                       emp_empno, sizeof(emp_empno)) == 0)
        ind_emp_empno = -1;

    if (GetDlgItemText(hDlg, ID_EMPLOYEES_FLD_ENAME,
                       emp_ename, sizeof(emp_ename)) == 0)
        ind_emp_ename = -1;

    if (GetDlgItemText(hDlg, ID_EMPLOYEES_FLD_JOB,
                       emp_job, sizeof(emp_job)) == 0)
        ind_emp_job = -1;

    if (GetDlgItemText(hDlg, ID_EMPLOYEES_FLD_MGR,
                       emp_mgr, sizeof(emp_mgr)) == 0)
        ind_emp_mgr = -1;

    if (GetDlgItemText(hDlg, ID_EMPLOYEES_FLD_HIREDATE,
                       emp_hiredate, sizeof(emp_hiredate)) == 0)
        ind_emp_hiredate = -1;

    if (GetDlgItemText(hDlg, ID_EMPLOYEES_FLD_SAL,
                       emp_sal, sizeof(emp_sal)) == 0)
        ind_emp_sal = -1;

    if (GetDlgItemText(hDlg, ID_EMPLOYEES_FLD_COMM,
                       emp_comm, sizeof(emp_comm)) == 0)
        ind_emp_comm = -1;

    if (GetDlgItemText(hDlg, ID_EMPLOYEES_FLD_DEPTNO,
                       emp_deptno, sizeof(emp_deptno)) == 0)
        ind_emp_deptno = -1;

    return;

} /*GetEmpRecord*/

/*
 *SetEmpRecord
 */
PROCEDURE SetEmpRecord(hDlg)
HWND hDlg;
{

    /* Set fields in Dialog Box to current values of host variables */
    SetDlgItemText(hDlg, ID_EMPLOYEES_FLD_EMPNO, emp_empno);
    SetDlgItemText(hDlg, ID_EMPLOYEES_FLD_ENAME, emp_ename);
    SetDlgItemText(hDlg, ID_EMPLOYEES_FLD_JOB, emp_job);
    SetDlgItemText(hDlg, ID_EMPLOYEES_FLD_MGR, emp_mgr);
    SetDlgItemText(hDlg, ID_EMPLOYEES_FLD_HIREDATE, emp_hiredate);
    SetDlgItemText(hDlg, ID_EMPLOYEES_FLD_SAL, emp_sal);
    SetDlgItemText(hDlg, ID_EMPLOYEES_FLD_COMM, emp_comm);
    SetDlgItemText(hDlg, ID_EMPLOYEES_FLD_DEPTNO, emp_deptno);

    return;

} /*SetEmpRecord*/

/*
 *EmployeesDlg
 */
BOOL CALLBACK EmployeesDlg(hDlg, message, wParam, lParam)
HWND hDlg;
unsigned message;
WORD wParam;
LONG lParam;
{
    /* SQL statement used to get info from database */
    char  *empsel="SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, \
                      DEPTNO FROM EMP FOR UPDATE OF EMPNO, ENAME, JOB, MGR, \
                      HIREDATE, SAL, COMM, DEPTNO";
        /*****************************************************************/
        /* You need the "FOR UPDATE OF" clause so that you can use       */
        /* the "rowid" field with UPDATE and DELETE statements. This also*/
        /* applies to a PRO*C 'WHERE CURRENT OF' clause. This field will */
        /* be valid for other statements to use if and only if you       */
        /* use the "FOR UPDATE OF" clause with the SELECT since this     */
        /* locks the ROWID until the next COMMIT [see SQL manuals].      */
        /*****************************************************************/

    /* SQL statement to delete currently fetched emp record */
    char  *delete="DELETE FROM EMP WHERE ROWID = :row_id";

    /* SQL statement to update currently fetched emp record */
    char  *update="UPDATE EMP SET EMPNO=:empno, ENAME=:ename, JOB=:job, \
                      MGR=:mgr, HIREDATE=:hiredate, SAL=:sal, COMM=:comm, \
                      DEPTNO=:deptno WHERE ROWID = :row_id";

    /* SQL statement to insert an emp record */
    char  *insert="INSERT INTO EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM, \
                      DEPTNO) VALUES (:empno,:ename,:job,:mgr,:hiredate,:sal, \
                      :comm,:deptno)";

    switch (message) {

        case WM_COMMAND :

            switch (wParam) {

                case ID_EMPLOYEES_EXIT :
                    EndDialog(hDlg, 1);
                    break;

                case ID_EMPLOYEES_SELECT :

                  /* check to see if we have an open, parsed, defined cursor */
                  /* if so, all we need to do below is re-execute the query
                     in order to get a new active set.  Otherwise, open,
                     parse, and define output buffers for the query */

                    if (session.opened == FALSE) {

                       /* open a cursor for the select from emp */
                       if (oopen(SEL_CURS, LDA, (char  *)0,
                              -1, -1, (char  *)0, -1))  {
                          ProcessOracleErrorCode(hDlg, SEL_CURS);
                          break;
                          } /*if*/

                       /* parse cursor */
                       if (osql3(SEL_CURS, (char  *)empsel, -1)) {
                          ProcessOracleErrorCode(hDlg, SEL_CURS);
                          break;
                          } /*if*/

                       /* define output buffers for the all fields
                          in the select list of our query */
                       if (odefin(SEL_CURS, 1, (char  *)emp_empno,
                             sizeof(emp_empno),
                             NULLTERM, -1, (short  *)&ind_emp_empno,
                             (char  *)0, -1, -1, (short  *)0,
                             (short  *)0)) {
                          ProcessOracleErrorCode(hDlg, SEL_CURS);
                          break;
                          } /*if*/

                       if (odefin(SEL_CURS, 2, (char  *)emp_ename,
                             sizeof(emp_ename),
                             NULLTERM, -1, (short  *)&ind_emp_ename,
                             (char  *)0, -1, -1, (short  *)0,
                             (short  *)0)) {
                          ProcessOracleErrorCode(hDlg, SEL_CURS);
                          break;
                          } /*if*/

                       if (odefin(SEL_CURS, 3, (char  *)emp_job,
                             sizeof(emp_job),
                             NULLTERM, -1, (short  *)&ind_emp_job,
                             (char  *)0, -1, -1, (short  *)0,
                             (short  *)0)) {
                          ProcessOracleErrorCode(hDlg, SEL_CURS);
                          break;
                          } /*if*/

                       if (odefin(SEL_CURS, 4, (char  *)emp_mgr,
                             sizeof(emp_mgr),
                             NULLTERM, -1, (short  *)&ind_emp_mgr,
                             (char  *)0, -1, -1, (short  *)0,
                             (short  *)0)) {
                          ProcessOracleErrorCode(hDlg, SEL_CURS);
                          break;
                          } /*if*/

                       if (odefin(SEL_CURS, 5,
                             (char  *)emp_hiredate,
                             sizeof(emp_hiredate),
                             NULLTERM, -1, (short  *)&ind_emp_hiredate,
                             (char  *)0, -1, -1, (short  *)0,
                             (short  *)0)) {
                          ProcessOracleErrorCode(hDlg, SEL_CURS);
                          break;
                          } /*if*/

                       if (odefin(SEL_CURS, 6, (char  *)emp_sal,
                             sizeof(emp_sal),
                             NULLTERM, -1, (short  *)&ind_emp_sal,
                             (char  *)0, -1, -1, (short  *)0,
                             (short  *)0)) {
                          ProcessOracleErrorCode(hDlg, SEL_CURS);
                          break;
                          } /*if*/

                       if (odefin(SEL_CURS, 7, (char  *)emp_comm,
                             sizeof(emp_comm),
                             NULLTERM, -1, (short  *)&ind_emp_comm,
                             (char  *)0, -1, -1, (short  *)0,
                             (short  *)0)) {
                          ProcessOracleErrorCode(hDlg, SEL_CURS);
                          break;
                          } /*if*/

                       if (odefin(SEL_CURS, 8, (char  *)emp_deptno,
                             sizeof(emp_deptno),
                             NULLTERM, -1, (short  *)&ind_emp_deptno,
                             (char  *)0, -1, -1, (short  *)0,
                             (short  *)0)) {
                          ProcessOracleErrorCode(hDlg, SEL_CURS);
                          break;
                          } /*if*/
                       } /*if*/


                    /* execute the query to get a new active set */
                    if (oexec(SEL_CURS)) {
                       ProcessOracleErrorCode(hDlg, SEL_CURS);
                       break;
                       } /*if*/

                    session.opened = TRUE;
                    session.nomore = FALSE;

                case ID_EMPLOYEES_FETCH :

                    if (session.opened == FALSE) {
                        MessageBox(hDlg, "No active set", "ORACLE", MB_OK);
                        break;
                        } /*if*/

                    if (session.nomore == TRUE) {
                        MessageBox(hDlg, "No more data", "ORACLE", MB_OK);
                        break;
                        } /*if*/

                    if (ofetch(SEL_CURS)) {
                       if ((SEL_CURS)->rc != NO_MORE_DATA) {
                          ProcessOracleErrorCode(hDlg, SEL_CURS);
                          break;
                          } /*if*/
                       else {
                          session.nomore = TRUE;
                          MessageBox(hDlg, "No more data", "ORACLE", MB_OK);
                          break;
                          } /*else*/
                       } /*if*/

                    SetEmpRecord(hDlg);

                    break;

                case ID_EMPLOYEES_INSERT :

                    /* Get current contents of the dialog box */
                    GetEmpRecord(hDlg);

                    /* open a cursor for the INSERT */
                    if (oopen(DML_CURS, LDA, (char  *)0,
                           -1, -1, (char  *)0, -1))  {
                       ProcessOracleErrorCode(hDlg, SEL_CURS);
                       break;
                       } /*if*/

                    /* parse the INSERT SQL statement */
                    if (osql3(DML_CURS, (char  *)insert, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    /* Bind the 8 columns in the emp table to their respective
                       host variables where the data to be inserted resides */
                    if (obndrv(DML_CURS, (char  *)":empno", -1,
                           (char  *)emp_empno, sizeof(emp_empno),
                           NULLTERM, -1, (short  *)&ind_emp_empno,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    if (obndrv(DML_CURS, (char  *)":ename", -1,
                           (char  *)emp_ename, sizeof(emp_ename),
                           NULLTERM, -1, (short  *)&ind_emp_ename,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    if (obndrv(DML_CURS, (char  *)":job", -1,
                           (char  *)emp_job, sizeof(emp_job),
                           NULLTERM, -1, (short  *)&ind_emp_job,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    if (obndrv(DML_CURS, (char  *)":mgr", -1,
                           (char  *)emp_mgr, sizeof(emp_mgr),
                           NULLTERM, -1, (short  *)&ind_emp_mgr,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    if (obndrv(DML_CURS, (char  *)":hiredate", -1,
                           (char  *)emp_hiredate, sizeof(emp_hiredate),
                           NULLTERM, -1, (short  *)&ind_emp_hiredate,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    if (obndrv(DML_CURS, (char  *)":sal", -1,
                           (char  *)emp_sal, sizeof(emp_sal),
                           NULLTERM, -1, (short  *)&ind_emp_sal,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    if (obndrv(DML_CURS, (char  *)":comm", -1,
                           (char  *)emp_comm, sizeof(emp_comm),
                           NULLTERM, -1, (short  *)&ind_emp_comm,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    if (obndrv(DML_CURS, (char  *)":deptno", -1,
                           (char  *)emp_deptno, sizeof(emp_deptno),
                           NULLTERM, -1, (short  *)&ind_emp_deptno,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    /* insert the row */
                    if (oexec(DML_CURS)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    /* close the cursor */
                    if (oclose(DML_CURS)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    break;

                case ID_EMPLOYEES_UPDATE :

                    if (session.opened == FALSE) {
                        MessageBox(hDlg, "No active set", "ORACLE", MB_OK);
                        break;
                        } /*if*/

                    /* Get current data from dialog box */
                    GetEmpRecord(hDlg);

                    /* open a cursor for the UPDATE */
                    if (oopen(DML_CURS, LDA, (char  *)0,
                           -1, -1, (char  *)0, -1))  {
                       ProcessOracleErrorCode(hDlg, SEL_CURS);
                       break;
                       } /*if*/

                    /* parse the UPDATE SQL statement */
                    if (osql3(DML_CURS, (char  *)update, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    /* Bind the host variable ":row_id" to the rowid in the
                         cursor used for the select statement */
                    if (obndrv(DML_CURS, (char  *)":row_id", -1,
                           (char  *)&((SEL_CURS)->rid), 16, ROWID,
                           -1, (short  *)0, (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    /* Bind the 8 columns in the emp table to their respective
                       host variables where the updated data resides */
                    if (obndrv(DML_CURS, (char  *)":empno", -1,
                           (char  *)emp_empno, sizeof(emp_empno),
                           NULLTERM, -1, (short  *)&ind_emp_empno,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    if (obndrv(DML_CURS, (char  *)":ename", -1,
                           (char  *)emp_ename, sizeof(emp_ename),
                           NULLTERM, -1, (short  *)&ind_emp_ename,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    if (obndrv(DML_CURS, (char  *)":job", -1,
                           (char  *)emp_job, sizeof(emp_job),
                           NULLTERM, -1, (short  *)&ind_emp_job,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    if (obndrv(DML_CURS, (char  *)":mgr", -1,
                           (char  *)emp_mgr, sizeof(emp_mgr),
                           NULLTERM, -1, (short  *)&ind_emp_mgr,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    if (obndrv(DML_CURS, (char  *)":hiredate", -1,
                           (char  *)emp_hiredate, sizeof(emp_hiredate),
                           NULLTERM, -1, (short  *)&ind_emp_hiredate,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    if (obndrv(DML_CURS, (char  *)":sal", -1,
                           (char  *)emp_sal, sizeof(emp_sal),
                           NULLTERM, -1, (short  *)&ind_emp_sal,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    if (obndrv(DML_CURS, (char  *)":comm", -1,
                           (char  *)emp_comm, sizeof(emp_comm),
                           NULLTERM, -1, (short  *)&ind_emp_comm,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    if (obndrv(DML_CURS, (char  *)":deptno", -1,
                           (char  *)emp_deptno, sizeof(emp_deptno),
                           NULLTERM, -1, (short  *)&ind_emp_deptno,
                           (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    /* update the row */
                    if (oexec(DML_CURS)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    /* close the cursor */
                    if (oclose(DML_CURS)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    break;

                case ID_EMPLOYEES_DELETE :

                    if (session.opened == FALSE) {
                        MessageBox(hDlg, "No active set", "ORACLE", MB_OK);
                        break;
                        } /*if*/

                    /* open a cursor for the DELETE */
                    if (oopen(DML_CURS, LDA, (char  *)0,
                           -1, -1, (char  *)0, -1))  {
                       ProcessOracleErrorCode(hDlg, SEL_CURS);
                       break;
                       } /*if*/

                    /* parse the DELETE SQL statement */
                    if (osql3(DML_CURS, (char  *)delete, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    /* Bind the host variable ":row_id" to the rowid in the
                         cursor used for the select statement */
                    if (obndrv(DML_CURS, (char  *)":row_id", -1,
                           (char *)&((SEL_CURS)->rid), 16, ROWID,
                           -1, (short  *)0, (char  *)0, -1, -1)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    /* delete the row */
                    if (oexec(DML_CURS)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    /* close the cursor */
                    if (oclose(DML_CURS)) {
                        ProcessOracleErrorCode(hDlg, DML_CURS);
                        break;
                        } /*if*/

                    break;

                case ID_EMPLOYEES_CLEAR :
                    emp_empno[ 0 ] = EOS;
                    emp_ename[ 0 ] = EOS;
                    emp_job[ 0 ] = EOS;
                    emp_mgr[ 0 ] = EOS;
                    emp_hiredate[ 0 ] = EOS;
                    emp_sal[ 0 ] = EOS;
                    emp_comm[ 0 ] = EOS;
                    emp_deptno[ 0 ] = EOS;
                    SetEmpRecord(hDlg);
                    break;

                case ID_EMPLOYEES_COMMIT :

                    /* Commit work done so far. */
                    if (ocom(LDA))
                        ProcessOracleErrorCode(hDlg, LDA);

                    /* COMMIT frees locks so close the SELECT. */
                    if (session.opened == TRUE)
                       if (oclose(SEL_CURS))
                          ProcessOracleErrorCode(hDlg, SEL_CURS);
                       else {
                          session.opened = FALSE;
                          session.nomore = TRUE;
                          } /*else*/

                    break;

                case ID_EMPLOYEES_ROLLBACK :

                    /* Rollback work done so far. */
                    if (orol(LDA))
                        ProcessOracleErrorCode(hDlg, LDA);

                    /* ROLLBACK frees locks so close the SELECT. */
                    if (session.opened == TRUE)
                       if (oclose(SEL_CURS))
                          ProcessOracleErrorCode(hDlg, SEL_CURS);
                       else {
                          session.opened = FALSE;
                          session.nomore = TRUE;
                          } /*else*/

                    break;

                default :
                    return FALSE;
                } /*switch*/

            break;

        case WM_INITDIALOG :
            break;

        default :
            return FALSE;
        } /*switch*/

    return TRUE;

} /*EmployeesDlg*/

/*
 *DoEmployees
 */
PROCEDURE DoEmployees(hInst, hWnd)
HANDLE hInst;
HWND hWnd;
{

    DialogBox(hInst, MAKEINTRESOURCE(EMPLOYEESBOX), hWnd, EmployeesDlg);
    return;

} /*DoEmployees*/

/*
 *WinMain
 */
int WINAPI WinMain( hInstance, hPrevInstance, lpszCmdLine, cmdShow )
HANDLE hInstance, hPrevInstance;
LPSTR lpszCmdLine;
int cmdShow;

{
    WNDCLASS SampleClass;
    HMENU hmenuSystem, hmenuSample;
    HWND hWnd;
    MSG msg;
    char szAbout[ MAX_ABOUT_STRING + 1 ];
    char szAppName[ MAX_APPNAME_STRING + 1 ];
    char szSampleMenu[ MAX_SAMPLEMENU_STRING + 1 ];
    char szTitle[ MAX_TITLE_STRING + 1 ];

    /* Lock our data segment, in case we are a small or medium model program.
        If not, it is possible that some of the  pointers that are passed
        in to ora6win.dll via OCI might become invalid. */
    LockSegment(-1);

    /* Load strings from resource */
    LoadString(hInstance, IDS_ABOUT, szAbout, MAX_ABOUT_STRING);
    LoadString(hInstance, IDS_APPNAME, szAppName, MAX_APPNAME_STRING);
    LoadString(hInstance, IDS_SAMPLEMENU,
                                szSampleMenu, MAX_SAMPLEMENU_STRING);
    LoadString(hInstance, IDS_TITLE, szTitle, MAX_TITLE_STRING);

    if (!hPrevInstance) {
        SampleClass.style = CS_HREDRAW | CS_VREDRAW;
        SampleClass.lpfnWndProc = (WNDPROC)SampleWndProc;
        SampleClass.cbClsExtra = 0;
        SampleClass.cbWndExtra = 0;
        SampleClass.hInstance = hInstance;
        SampleClass.hIcon = LoadIcon(hInstance, szAppName);
        SampleClass.hCursor = LoadCursor(NULL, IDC_ARROW);
        SampleClass.hbrBackground = (HBRUSH)GetStockObject( WHITE_BRUSH );
        SampleClass.lpszMenuName = szSampleMenu;
        SampleClass.lpszClassName = szAppName;

        if (!RegisterClass((LPWNDCLASS)&SampleClass))
            return FALSE;

        } /*if*/

    /* Initialize the current connection structure. */
    session.connected = FALSE;
    session.opened = FALSE;
    session.nomore = TRUE;

    hInst = hInstance;

    hmenuSample = LoadMenu(hInst, "SAMPLEMENU");

    hWnd = CreateWindow(szAppName,
                        szTitle,
                        WS_OVERLAPPEDWINDOW,
                        CW_USEDEFAULT,
                        CW_USEDEFAULT,
                        CW_USEDEFAULT,
                        CW_USEDEFAULT,
                        (HWND)NULL,
                        (HMENU)NULL,
                        (HANDLE)hInst,
                        NULL);

    hmenuSystem = GetSystemMenu(hWnd, FALSE);
    InsertMenu(hmenuSystem, 0, MF_BYPOSITION | MF_STRING, IDS_ABOUT,
                                                            szAbout);
    ShowWindow(hWnd, SW_SHOWNORMAL);
    UpdateWindow(hWnd);

    while (GetMessage((LPMSG)&msg, NULL, 0, 0)) {
        TranslateMessage((LPMSG)&msg);
        DispatchMessage((LPMSG)&msg);
        } /*while*/

    return( (int)msg.wParam );

} /*WinMain*/

/*
 *SampleWndProc
 */
long CALLBACK SampleWndProc(hWnd, message, wParam, lParam)
HWND hWnd;
unsigned message;
WORD wParam;
LONG lParam;
{
    static HWND hInst;
    HMENU hmenuSample;

    switch (message) {

        case WM_CREATE :
            hInst = ((LPCREATESTRUCT) lParam)->hInstance;
            return TRUE;

        case WM_SYSCOMMAND :
            switch (wParam) {
                case IDS_ABOUT:
                    DialogBox(hInst, MAKEINTRESOURCE(ABOUTBOX),
                            hWnd, AboutDlg);
                    return TRUE;
                default:
                    break;
                } /*switch*/
            break;

        case WM_COMMAND :
            if (LOWORD(lParam) == 0) {    /*message from a menu*/

                switch (wParam) {

                    case IDM_EXIT :
                        SendMessage(hWnd, WM_CLOSE, 0, 0L);
                        return TRUE;

                    case IDM_ORACLE_CONNECT :
                        if (DoLogon(hInst, hWnd) == TRUE) {
                            hmenuSample = GetMenu(hWnd);
                            EnableMenuItem(hmenuSample, IDM_ORACLE_CONNECT,
                                                                  MF_GRAYED);
                            EnableMenuItem(hmenuSample, IDM_ORACLE_DISCONNECT,
                                                                  MF_ENABLED);
                            EnableMenuItem(hmenuSample, IDM_ORACLE_EMPLOYEES,
                                                                  MF_ENABLED);
                            } /*if*/
                        return TRUE;

                    case IDM_ORACLE_DISCONNECT :
                        if (DoDisconnect(hWnd) == TRUE) {
                            hmenuSample = GetMenu(hWnd);
                            EnableMenuItem(hmenuSample, IDM_ORACLE_CONNECT,
                                                                  MF_ENABLED);
                            EnableMenuItem(hmenuSample, IDM_ORACLE_DISCONNECT,
                                                                  MF_GRAYED);
                            EnableMenuItem(hmenuSample, IDM_ORACLE_EMPLOYEES,
                                                                  MF_GRAYED);
                            } /*if*/
                        return TRUE;

                    case IDM_ORACLE_EMPLOYEES :
                        DoEmployees(hInst, hWnd);
                        return TRUE;

                    default :
                        break;
                    } /*switch*/
                } /*if*/
            break;

        case WM_CLOSE :
            /* Disconnect before terminating Windows application. */
            if (session.connected == TRUE)
                DoDisconnect(hWnd);

            break; /* Let this pass thru so default operation can occur. */

        case WM_DESTROY :
            PostQuitMessage(0);
            break;

        default:
            break;
        } /*switch*/

    /* Performs default operation. */
    return( DefWindowProc(hWnd, message, wParam, lParam) );

} /*SampleWndProc*/

/*
 *LogonDlg
 */
BOOL CALLBACK LogonDlg(hDlg, message, wParam, lParam)
HWND hDlg;
unsigned message;
WORD wParam;
LONG lParam;
{

    switch (message) {

        case WM_COMMAND :

            switch (wParam) {

                case ID_LOGON_OK :
                    GetDlgItemText(hDlg, ID_LOGON_USERID,
                                       userid, MAX_USERID);
                    GetDlgItemText(hDlg, ID_LOGON_PASSWORD,
                                       password, MAX_PASSWORD);
                    GetDlgItemText(hDlg, ID_LOGON_CONNECT,
                                       connectstr, MAX_CONNECT);
                    EndDialog(hDlg, 1);
                    return TRUE;

                case ID_LOGON_CANCEL :
                    EndDialog(hDlg, 0);
                    return TRUE;

                default :
                    break;
                } /*switch*/

            break;

        case WM_INITDIALOG :
            return TRUE;

        default :
            return FALSE;
        } /*switch*/

    return FALSE;

} /*LogonDlg*/

/*
 *DoLogon
 */
int DoLogon(hInst, hWnd)
HANDLE hInst;
HWND hWnd;
{
    char connstr[ MAX_USERID + MAX_CONNECT + 2 ];
                                            /* used to store userid@database */

    if (session.connected == TRUE)
        return TRUE;

    while (session.connected == FALSE) {

        /* Give the Logon Dialog Box -- control passes to LogonDlg(). */
        if (DialogBox(hInst, MAKEINTRESOURCE( LOGONBOX ), hWnd,
                      LogonDlg) == 0)
            break;

        /* Append host string to username. */
        strcpy(connstr, userid);
        if (strlen(connectstr) != 0) {
            strcat(connstr, "@");
            strcat(connstr, connectstr);
            } /*if*/

        /* Call orlon() to do connect. */
        if (olon(LDA, (char  *)connstr, -1,
                   (char  *)password, -1, 0)) {
            ProcessOracleErrorCode(hWnd, LDA);
            if (MessageBox(hWnd, "Login to ORACLE",
                                  "ORACLE", MB_RETRYCANCEL) != IDRETRY)
                break;
            } /*if*/
        else {
            MessageBox(hWnd, "Logon Successful", "ORACLE", MB_OK);
            session.connected = TRUE;
            } /*else*/

        } /*while*/

    return( session.connected );

} /*DoLogon*/

/*
 *DoDisconnect
 */
int DoDisconnect(hWnd)
HWND hWnd;
{
    if (session.connected == FALSE)
        return TRUE;

    if (session.opened == TRUE)
        if (oclose(SEL_CURS))
           ProcessOracleErrorCode(hWnd, SEL_CURS);
        else {
           session.opened = FALSE;
           session.nomore = TRUE;
           } /*else*/

    /* Commits the current transaction and releases the current connection.*/

    /* Commit work done so far. */
    if (ocom(LDA))
        ProcessOracleErrorCode(hWnd, LDA);
    else
        MessageBox(hWnd, "Commit Successful", "ORACLE", MB_OK);

    /* Disconnect the current connection. */
    if (ologof(LDA))
        ProcessOracleErrorCode(hWnd, LDA);
    else {
        MessageBox(hWnd, "Disconnect Successful", "ORACLE", MB_OK);
        session.connected = FALSE;
        } /*else*/

    return((session.connected == FALSE) ? TRUE : FALSE);

} /*DoDisconnect*/

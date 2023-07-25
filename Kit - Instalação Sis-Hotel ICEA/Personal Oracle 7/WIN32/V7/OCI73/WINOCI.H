/*
 * winoci.h
 *
 * Example OCI Application for Windows V3.0.
 *
 * by D. Colello -- Desktop Products Division.
 *
 * Copyright 1991, Oracle Corporation.
 */

#define APPNAME                      "Winoci"

/* String maximum sizes. */
#define MAX_ABOUT_STRING             10
#define MAX_APPNAME_STRING           20
#define MAX_SAMPLEMENU_STRING        20
#define MAX_TITLE_STRING             20

/* String table constant ids. */
#define IDS_ABOUT                   100
#define IDS_APPNAME                 101
#define IDS_SAMPLEMENU              102
#define IDS_TITLE                   103

/* System Resource ids. */
#define ABOUTBOX                      1
#define LOGONBOX                      2
#define EMPLOYEESBOX                  3

/* Main menu bar ids. */
#define IDM_ORACLE_CONNECT          100
#define IDM_ORACLE_DISCONNECT       101
#define IDM_ORACLE_EMPLOYEES        102
#define IDM_EXIT                    110

/* Logon dialog box ids. */
#define ID_LOGON_TEXT1              100
#define ID_LOGON_TEXT2              101
#define ID_LOGON_TEXT3              102
#define ID_LOGON_TEXT4              103
#define ID_LOGON_USERID             104
#define ID_LOGON_PASSWORD           105
#define ID_LOGON_CONNECT            106
#define ID_LOGON_OK                 107
#define ID_LOGON_CANCEL             108

/* Employees dialog box ids. */
#define ID_EMPLOYEES_SELECT         100
#define ID_EMPLOYEES_FETCH          101
#define ID_EMPLOYEES_UPDATE         102
#define ID_EMPLOYEES_INSERT         103
#define ID_EMPLOYEES_DELETE         104
#define ID_EMPLOYEES_CLEAR          105
#define ID_EMPLOYEES_COMMIT         106
#define ID_EMPLOYEES_ROLLBACK       107
#define ID_EMPLOYEES_EXIT           108
#define ID_EMPLOYEES_TEXT1          120
#define ID_EMPLOYEES_TEXT2          121
#define ID_EMPLOYEES_TEXT3          122
#define ID_EMPLOYEES_TEXT4          123
#define ID_EMPLOYEES_TEXT5          124
#define ID_EMPLOYEES_TEXT6          125
#define ID_EMPLOYEES_TEXT7          126
#define ID_EMPLOYEES_TEXT8          127
#define ID_EMPLOYEES_FLD_EMPNO      140
#define ID_EMPLOYEES_FLD_ENAME      141
#define ID_EMPLOYEES_FLD_JOB        142
#define ID_EMPLOYEES_FLD_MGR        143
#define ID_EMPLOYEES_FLD_HIREDATE   144
#define ID_EMPLOYEES_FLD_SAL        145
#define ID_EMPLOYEES_FLD_COMM       146
#define ID_EMPLOYEES_FLD_DEPTNO     147

/* Maximum sizes of Dialog Box fields */
#define MAX_USERID                   20
#define MAX_PASSWORD                 20
#define MAX_CONNECT                  20

typedef void PROCEDURE;

#define EOS '\0'
#define EOL '\n'

#define NULLTERM        5   /* Oracle datatype for Null-terminated string */
#define ROWID          11                  /* Oracle datatype for a rowid */
#define NO_MORE_DATA 1403 /* Oracle error code for no more data to select */

/* Prototypes for Winoci.c functions */
int WINAPI WinMain(HANDLE, HANDLE, LPSTR, int);
BOOL CALLBACK AboutDlg(HWND, unsigned, WORD, LONG);
long CALLBACK SampleWndProc(HWND, unsigned, WORD, LONG);
int DoLogon(HANDLE, HWND);
PROCEDURE DoEmployees(HANDLE, HWND);
int DoDisconnect(HWND);
BOOL CALLBACK LogonDlg(HWND, unsigned, WORD, LONG);
BOOL CALLBACK EmployeesDlg(HWND, unsigned, WORD, LONG);
PROCEDURE GetEmpRecord(HWND);
BOOL ProcessOracleErrorCode(HWND, struct cda_def *);
BOOL SampleInit(HANDLE);
PROCEDURE SetEmpRecord(HWND);

/* Structure to hold session information */
struct oracle_session {
    BOOL connected;    /* Is there a current connection? */
    BOOL opened;       /* Is the cursor open? */
    BOOL nomore;       /* Have we fetched all the rows? */
};


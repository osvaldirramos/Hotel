 $Header: readme.doc,v 1.28.710.2 94/04/01 14:00:53 wmaimone: Exp  
 
-------------------------------------------------------------------------  
                    Oracle7 Server 
                    Release 7.3.2 
 
------------------------------------------------------------------------- 
Copyright (C) Oracle Corporation 1993, 1994, 1995 
 
Primary Author:        Jason Durbin 
Contributing Authors:  Brom Mahbod, Anupam Bhide, Rita Moran, Tracy Lee
 
This software/documentation contains proprietary information of Oracle 
Corporation; it is provided under a license agreement containing 
restrictions on use and disclosure and is also protected by copyright  
law. Reverse engineering of the software is prohibited. 
 
If this software/documentation is delivered to a U.S. Government Agency  
of the Department of Defense, then it is delivered with Restricted Rights  
and the following legend is applicable: 
 
RESTRICTED RIGHTS LEGEND:
Use, duplication, or disclosure by the Government is subject to restrictions 
as set forth in subparagraph (c)(1)(ii) of DFARS 252.227-7013, Rights in 
Technical Data and Computer Software (October 1988). 
 
If this software/documentation is delivered to a U.S. Government Agency  
not within the Department of Defense, then it is delivered with 
"Restricted Rights," as defined in FAR 52.227-14, Rights in Data - 
General,  including Alternate III (June 1987). 
 
Oracle Corporation, 500 Oracle Parkway, Redwood City, CA  94065. 
 
The information in this document is subject to change without notice.  
If you find any problems in the documentation, please report them to us in  
writing. Oracle Corporation does not warrant that this document is error free. 
 
Oracle, CASE*Dictionary, Pro*Ada, Pro*COBOL, Pro*FORTRAN, Pro*Pascal, 
Pro*PL/I, SQL*Connect, SQL*Forms, SQL*Loader, SQL*Net, and  
SQL*Plus are registered trademarks of Oracle Corporation. CASE*Designer, 
CASE*Method, Oracle7, Oracle Parallel Server, PL/SQL, Pro*C/C++, 
SQL*Module, Oracle Server Manager and Trusted Oracle7 are trademarks of 
Oracle Corporation. 
 
All trade names referenced are the service mark, trademark, or registered 
trademark of the respective manufacturer.  
  
----------------------------------------------------------------------------  
  
 
TABLE OF CONTENTS  
-----------------  
  
Section Description  
-------  -----------  
  
      Introduction  
      ------------  
   
 0.1     Purpose of this README  
 0.2     Cover Letter and Licensing  
 0.3     Oracle7 Documentation Currently Available  
  
  
      Oracle Version 6  
      ---------------- 
  
 1.0     Before You Migrate  
 1.1        Offline Tablespaces   
   
 2.0     National Language Support  
 2.1        WW Date Format  
  
  
      Oracle7 Release 7.3.2 
      ---------------------  
  
 3.0     Forward Compatibility  
  
 4.0     Backward Compatibility  
  
 5.0     Server Changes     
 5.1        Data Dictionary Views
 5.1.1         New ARGUMENTS Views 
 5.1.2         New Data Dictionary Views to Support 
               Updatable Join Views
 5.2        Star Hint
 5.3        Parallel Queries  
 5.4        Single Process Mode
 5.5        Thread Safety
 5.6        Initialization Parameter PARALLEL_MIN_SERVERS
 5.7        Updatable Join Views
 
 6.0     Upgrading and Downgrading  
 6.1        General Comments about Upgrading and Downgrading  
 6.2        Upgrade Issues  
 6.2.1         New Compatibility Type and Resizable Datafiles  
 6.3        Downgrade Issues  

 7.0     Fixes/Enhancements  
 7.1        Fixes/Enhancements in Release 7.3.2  
   
 8.0     Known Server Restrictions           
 8.1        Restrictions Awaiting Fixes  
 8.2        Restriction on The Export Utility
  
 9.0     National Language Support   
 9.1        General  
 9.2        Character Sets  
 9.2.1         Applications and Multibyte Character Sets  
 9.3        Conversion Between Non-String and String Values  
 
10.0     PL/SQL Behavior Changes After Upgrade 
10.1        Behavior Change Caused By Bugfix 237911  
              After Upgrading To PL/SQL 2.1.5 Or Any Higher Release 
10.2       Behavior Change Caused By Bugfix 190119  
             After Upgrading To PL/SQL 2.1.6 Or Any Higher Release  
10.3       Behavior Change Caused By Bugfixes 235190 And 235193  
             After Upgrading To PL/SQL 2.1.6 Or Any Higher Release 
10.4       PLS-905 Error During Execution/Parse of a Cursor Holding  
             an Anonymous PL/SQL Block 

11.0     Compiled Triggers
11.1       The COMPILE Option
11.2       THE DEBUG Option

12.0     Tuning Issues
12.1       LRU Latch Contention
12.2       Sort Improvements
12.2.1       SORT_DIRECT_WRITES Parameter
12.2.2       Performance Tradeoffs of Direct Disk I/O for Sorts
12.2.3       Using Direct Disk I/O for Sorts with the Parallel Query 
             Option
12.2.4       Optimizing Sort Performance with TEMPORARY Tablespaces
12.3       Recreating an Index
12.4       Histograms
12.4.1       Height-Balanced Histograms
12.4.2       Advantages of Height-Balanced Histograms
12.4.3       When to Use Histograms
12.4.4       How to Use Histograms
12.4.5       Choosing the Number of Buckets for a Histogram
12.4.6       Viewing Histograms
12.5       EXPLAIN PLAN Improvements
12.6       Hash Join Execution
12.6.1       USE_HASH
12.7       Anti-Joins
12.7.1       How to Use an Anti-Join
12.8       Serializable Transactions
12.9       Parallel Query
12.9.1       Default Degree of Parallelism
12.9.2       Minimum Number of Query Servers
12.10      Oracle Trace
12.10.1      Instrumentation of Oracle for Oracle Trace
12.10.2      Enabling and Disabling Oracle Trace

13.0     Oracle Parallel Server: Releasable Hashed PCM Locks

14.0     Oracle7 Server SQL Reference Update
14.1        CREATE CLUSTER Statement



 
-----------------------------------------------------------------------------
 
  
**********************  
*                    *  
*    Introduction    *  
*                    *  
**********************  
  
0.1 Purpose of this README  
--------------------------        
   This README file is relevant only to the delivered Oracle7 Server  
and its integral parts, such as SQL, PL/SQL, the Oracle Call Interface (OCI), 
SQL*Loader, Import/Export utilities, Server Manager and so on. On many
operating systems, the file name of this document is README.DOC. 
  
   This README documents any differences between the server (and its integral   
parts) and its documented functionality, as well as fixed bugs, and known
problems and workarounds.  
  
   Each operating system release, such as UNIX, DEC VAX/VMS, MS-DOS,  
AOS/VS, and so on, often also provides an operating system-specific
README document. There may also be additional README files for
specific Oracle products such as SQL*Forms. The README file is
provided in lieu of release notes, system bulletins, or similar 
publications. 
  
  
0.2 Cover Letter and Licensing  
------------------------------        
   Please read the cover letter included with your Oracle7 package.  
It contains important information about licenses for Oracle7 product  
options. 
  
  
0.3 Oracle7, Release 7.3 Documentation Currently Available  
---------------------------------------------        
    A32542  PL/SQL User's Guide and Reference  
    A32538  Oracle7 Server SQL Reference   
    A32541  Oracle7 Server Utilities 
    A32539  Oracle7 Server Messages  
    A42525  Programmer's Guide to the Oracle Precompilers  
    A32546  Programmer's Guide to the Oracle Call Interfaces  
    A32548  Programmer's Guide to the Oracle Pro*C/C++ Precompiler  
    A42522  Oracle7 Parallel Serve Concepts and Administration 
    A19691  Trusted Oracle7 Server Administrator's Guide  
    A32540  Oracle7 Server Migration Guide  
    A32534  Oracle7 Server Concepts  
    A32535  Oracle7 Server Administrator's Guide  
    A32536  Oracle7 Server Application Developer's Guide  
    A14808  Oracle Server Manager(TM) User's Guide  
    A32543  Oracle7 Server Distributed Systems, Volume I: Distributed  
              Data  
    A32545  Oracle7 Server Distributed Systems, Volume II: Replicated  
              Data  
    A32537  Oracle7 Server Tuning  
    A32589  Oracle7 Server Reference  
    A21026  SQL*Module User's Guide and Reference, Release 1.1
    A42524  Pro*COBOL Supplement to the Oracle Precompilers Guide  
    A42523  Pro*FORTRAN Supplement to the Oracle Precompilers Guide  
    A30625  Programmer's Guide to the Oracle Call Interface for  
              Ada 
    A32549  Programmer's Guide to the Pro*Ada Precompiler 
    A30888  Oracle Server Manager for Windows Installation Guide  
            SQL*DBA to Oracle Server Manager Migration Guide
      

-----------------------------------------------------------------------------
 
> 
 
************************  
*                      *  
*   Oracle Version 6   *  
*                      *  
************************  
  
  
  
1.0 Before You Migrate  
====================== 


  
   IMPORTANT:   
     
     ONCE YOU MIGRATE AN ORACLE VERSION 6 DATABASE TO Oracle7,   
     YOU MUST **NOT** RUN ORACLE VERSION 6 AGAINST THAT DATABASE.   
  
To migrate to release 7.3 from Oracle Version 6, follow the  
instructions documented in the Oracle7 Server Migration Guide. You can
migrate directly from  Version 6 to release 7.3; it is not necessary
to install version 7.0.  
  
  
1.1 Offline Tablespaces  
-----------------------        
If you are running 6.0.34.3 or earlier, make sure that you pay  
special attention to the information about managing offline tablespaces  
in Chapter 7 of the Oracle7 Server Migration Guide.  
  
 
2.0 National Language Support  
=============================  
     
If you use National Language Support features, you should also read  
Section 9.0, "National Language Support."  
  
2.1 WW Date Format  
------------------        
The WW date format element behaves differently in Oracle7 than in  
Oracle Version 6. In version 6, depending on the territory component of the  
value  of the LANGUAGE initialization parameter, WW returned a week number  
based  on either the ISO standard or the number of days from January 1. In  
Oracle7,  WW always returns a week number based on the number of days 
from January 1, regardless of the value of the NLS_TERRITORY initialization 
parameter, and  the new IW date format element returns the ISO
standard week number. If your version 6 application used WW to return 
the ISO standard week number, replace WW with IW. 
  
-----------------------------------------------------------------------------
 
  
  
*****************************  
*                           *  
*   Oracle7 Release 7.3.2   *  
*                           *  
*****************************  
  
  
  
3.0 Forward Compatibility  
=========================  
        
Future releases will have changes for which you can prepare now. For  
example, to comply with future SQL ANSI standards. If you follow these  
recommendations, upgrading to newer releases of Oracle will be simplified. 
  
Feature                             Recommendation  
---------------------------------   ----------------------------------------  
A string of zero length ('')        Your application should use a NULL when  
is not equivalent to a NULL         the value is unknown.  
 
GLOBAL_NAMES initialization         If you use or will use distributed  
parameter                           processing, set this parameter to TRUE 
                                    to ensure a unique identifying name for 
                                    your database in a networked environment. 
 
SELECT privilege will be            Always grant the SELECT privilege to a 
required on tables that             user or role if you grant the UPDATE 
users update.                       or DELETE privileges on the table. See 
                                    also Oracle7 Server Reference, 
                                    Release 7.3 for more information 
                                    about the initialization 
                                    parameter, SQL92_SECURITY. 
  
  
  
4.0 Backward Compatibility  
==========================  
  
If a new release of Oracle7 incorporates changes or new features,  
the changes and new features must be disabled before you downgrade to  
a previous release. For more information about backward compatibility,  
see Oracle7 Server Migration, Release 7.3, Chapter 9, "Upgrading and  
Downgrading between Oracle7 Releases."  
 
  
  
5.0 Server Changes 
==================  
 

5.1 Data Dictionary Views 
------------------------- 
  
Data dictionary views maintained in Oracle7 for backward compatibility  
to Oracle Version 5 and Version 6, created in the files CATALOG5.SQL  
and  CATALOG6.SQL, will be obsoleted starting with Oracle, Version 8.   
All references to these dictionary views should be removed. 

5.1.1 New ARGUMENTS Views

The ALL_ARGUMENTS and USER_ARGUMENTS view has been added, showing  
  arguments for stored objects. 
 
   ALL_ARGUMENTS - Arguments in objects accessible to the user 
    OWNER - Username of the owner of the object 
    OBJECT_NAME - Procedure or function name 
    OVERLOAD - Overload identifier 
    PACKAGE_NAME - Package name 
    OBJECT_ID - Object number of the object 
    ARGUMENT_NAME - Argument name 
    POSITION - Position in argument list, or null for function return value 
    SEQUENCE - Argument sequence, including all nesting levels 
    DATA_LEVEL - Nesting depth of argument for composite types 
    DATA_TYPE - Datatype of the argument 
    DEFAULT_VALUE - Default value for the argument 
    DEFAULT_LENGTH - Length of default value for the argument 
    IN_OUT - Argument direction (IN, OUT, or IN/OUT) 
    DATA_LENGTH - Length of the column in bytes 
    DATA_PRECISION - Decimal digits (number) or binary digits (float) 
    DATA_SCALE - Digits to the right of decimal point in a number 
    RADIX - Argument radix for a number 
 
   USER_ARGUMENTS- Arguments in objects owned by the user 
    OWNER - Username of the owner of the object 
    OBJECT_NAME - Procedure or function name 
    OVERLOAD - Overload identifier 
    PACKAGE_NAME - Package name 
    OBJECT_ID - Object number of the object 
    ARGUMENT_NAME - Argument name 
    POSITION - Position in argument list, or null for function return value 
    SEQUENCE - Argument sequence, including all nesting levels 
    DATA_LEVEL - Nesting depth of argument for composite types 
    DATA_TYPE - Datatype of the argument 
    DEFAULT_VALUE - Default value for the argument 
    DEFAULT_LENGTH - Length of default value for the argument 
    IN_OUT - Argument direction (IN, OUT, or IN/OUT) 
    DATA_LENGTH - Length of the column in bytes 
    DATA_PRECISION - Decimal digits (number) or binary digits (float) 
    DATA_SCALE - Digits to the right of decimal point in a number 
    RADIX - Argument radix for a number 


5.1.2 New Data Dictionary Views to Support Updatable Join Views

The following data dictionary views have been added 
to support the updatable join view functionality described 
in section 5.8 of this document. 

USER_UPDATABLE_COLUMNS

ALL_UPDATABLE_COLUMNS

DBA_UPDATABLE_COLUMNS

These views describe the columns of the join views in the database, 
updatable or not. The significance of the USER, DBA, and ALL 
prefixes follows the same convention as for the Data Dictionary. The 
following are the columns in these views:

Column Name		Comments						

OWNER			Owner of the view.					

TABLE_NAME		Name of the view		

COLUMN			Name of the column					

UPDATABLE		Is the column updatable? Y/N	

  
5.2 Star Hint 
-------------  
  
The STAR hint forces a star query plan to be used if possible. 
A star plan has the largest table in the query last  
in the join order and joins it with a nested loops join on a  
concatenated index. The STAR hint applies when there are at least  
3 tables and the large table's concatenated index has at least 3 columns 
and there are no conflicting access or join method hints.   

5.3 Parallel Queries 
--------------------

If any table in a query has a parallel degree greater than one
(including the default degree), Oracle uses the cost-based optimizer
for that query (even if OPTIMIZER_MODE = RULE or if there is a rule
hint in the query itself). 
 
5.4 Single Process Mode
-----------------------

Single-process mode (INIT.ORA parameter SINGLE_PROCESS=TRUE) has been 
desupported in this release.  


5.5 Thread Safety
-----------------

Note that although your operating system may support threading, it may NOT
support client-side thread safety. If this is the case, your libraries
cannot be made thread safe. 

If your operating system DOES support client-side thread safety, you  may
also need (depending on your platform) a special set of client-side
libraries to implement thread safety. See your operating-specific
documentation and release notes to see if Oracle supplies these
libraries for your operating system.

5.6 Initialization Parameter PARALLEL_MIN_SERVERS (Shared Pool Allocation)
--------------------------------------------------------------------------

The system parameter PARALLEL_MIN_SERVERS allows you to specify the
number of processes to be started and reserved for parallel query
operations at startup. The syntax is:

  PARALLEL_MIN_SERVERS=n

where n is the number of processes you want to start and reserve for
parallel query operations.

The advantage of starting these processes at startup is the reduction
of process creation overhead. Note that Oracle reserves memory from
the shared pool for these processes, therefore, you should add
additional memory using the initialization parameter SHARED_POOL_SIZE
to compensate. You can use the following formula to determine how much
memory to add:

  (CPUs + 2)*(PARALLEL_MIN_SERVERS)*1.5*(BLOCK_SIZE)

See the Oracle7 Server Reference for more information about the
parameter BLOCK_SIZE.

5.7 Updatable Join Views
------------------------

Views that involve joins are updatable in this release under 
certain conditions. ROWIDs can be selected from join views in 
some cases. This material clarifies material in the Oracle7 Server 
SQL Reference. Specifically, it affects the functionality of the INSERT, 
UPDATE, and DELETE statements and supplements the description 
of view updatability in the CREATE VIEW statement.

Definitions

Prior to Release 7.3, views containing joins were not updatable. 
In Release 7.3, they are updatable under specified conditions. 
The following defines these conditions: 

  o A join column is a column that is used to form comparisons 
    between the values in the tables in a join. The most common 
    sort of join, called an equijoin, compares two columns, one 
    from each table joined, and limits the results of the join to 
    those combinations of rows that make the values in these two 
    columns equal.

  o A join view is a view that contains a join. 

  o A key-preserved table is a table in a join view, all of whose 
    key columns are present as keys in the join view. This means 
    the keys must not only be in the join view, but must still be 
    unique and not null in the join view. This implies that a 
    key-preserved table generally cannot be an outer-joined table. 
    Such would be possible only if the outer join did not in fact 
    generate any nulls, which is a function of the data and therefore 
    inadmissible as a basis for operations.

For further clarification of these definitions, see CREATE VIEW (for 
views) and SELECT (for joins) in the Oracle7 Server SQL Reference.

Criteria

Given the above, you can execute the DML statements - INSERT, UPDATE, 
and DELETE - on a join view provided that all of the following are true

  o The DML statement affects only one of the tables underlying the join.

  o If the statement is UPDATE, then all columns updated are extracted
    from a key-preserved table. In addition, if the view has the CHECK
    OPTION, join columns and columns taken from tables that are
    referenced more than once in the view are shielded from UPDATE.

  o If the statement is DELETE, then there is one and only one 
    key-preserved table in the join. This table may be present more 
    than once in the join, unless the view has the CHECK OPTION.

  o If the statement is INSERT, then all columns into which values are
    inserted come from a key-preserved table and the view does not
    have the CHECK OPTION. 

ROWID Selection

You can select a ROWID from a join view, provided that there is one
and only one key-preserved table in the join. The ROWID of that table 
becomes the ROWID of the view. 
 
  
6.0 Upgrading and Downgrading  
=============================  

  
6.1 General Comments about Upgrading and Downgrading  
----------------------------------------------------  
  
To upgrade from release 7.2.2 to release 7.3.2, you must run the
following scripts:

   CAT7203.SQL
   CAT7301.SQL
   CAT7302.SQL

and follow the instructions in Oracle7 Server Migration, Release 7.3,
Chapter 9, "Upgrading and Downgrading between Oracle7 Releases".
  
6.2 Upgrade Issues  
------------------  
  
6.2.1 New Compatibility Type and Resizable Datafiles  
  
A new compatibility type was added as of Release 7.2. It  
guarantees that, when any feature of resizable datafiles is  
used, Oracle will either automatically upgrade to the current 
release or issue an error message if such operation is not allowed,  
according to the COMPATIBLE parameter.  
 
  
6.3 Downgrade Issues  
--------------------  
 
To downgrade from release 7.3.2 to release 7.2.x, you must run the
script:

   CAT7301D.SQL

and follow the instructions in Oracle7 Server Migration, 
Release 7.3, Chapter 9, "Upgrading and Downgrading between 
Oracle7 Releases".  Note that although Oracle7 Server Migration 
says cat7302d.sql must be run to downgrade from 7.3.2, this is not
the case for UNIX systems. 
  

7.0 Fixes/Enhancements  
======================================  
  
This section lists fixes or enhancements introduced in Release 7.3.2.  
Each fix or enhancement is noted with a fix number. Your support  
contract may allow you access to the Oracle bug database; if so,  
you can use the fix number, also known as the bug number, to obtain  
more information about a particular fix.  
  
Fixes/Enhancements in Release 7.3.2.2  
-------------------------------------  

  234290 

Recursive type definitions were not correctly detected and could cause
a session to crash.

  260954 

Functions referenced by views created using CREATE FORCE VIEW are now
recompiled after the view is created.

  262011 

A SELECT from a table and view with a DECODE in the qualification
could cause an ORA-602 error to be issued and a core dump.

  268657 

Recompiling a PL/SQL block on a heavily loaded system could cause an
access violation.

  275069 

A CREATE VIEW statement with a text length greater than 64K would
execute without error but the view definition in the data dictionary 
would be corrupted. The 64K limit is now enforced and an error
returned on execution.

  282296 

When doing a SHUTDOWN IMMEDIATE with auditing turned on, internal
error [1114] could occur when users were also in the process of
logging off causing a shared memory corruption.

  287340 

The number of open cursors could exceed the maximum specified by
MAX_CURSORS due to a cursor being left open in certain situations.

  287762 

When using the cost-based optimizer, a NOT IN subquery with functions 
in the SELECT list could cause errors.

  289564 

If an update contained a PL/SQL function that contained a sequence that
was not initially selected from, an internal error would occur.

  296465 

An access violation could occur after logging off then logging back
on due to a process not being properly terminated and, therefore, causing
the maximum number of processes to be exceeded.

  297014

A describe of ORA_KGLR7_IDL_SB4 would hang then drop to the SQL*DBA
prompt, producing a trace file. 

  297213 

If a database link name was incorrect or the link did not exist, a
trace file (ORA_.TRC) would be created but no information would be
logged in the alert log.

  299581 

If a NULL was used as the actual for a PL/SQL function called from
within a SQL statement, PLS-425 would be issued.

  299941 

If a PL/SQL function called from a SQL statement found no data, the
exception was not handled correctly. Such functions will now return
null and ORA-1403 [No data found].

  303400 

Certain row cache locks were not released when a table was dropped.

  305391 

Statements using OR optimization were not parallelized correctly.

  307619 

Calling SUBSTR on a string with a negative position (e.g. greater than
the string length) caused incorrect results. 

  308777 

If the password file was used at login but the parameter ORA_NLS had
not been set, the shadow server process would crash.

  311427

Remote cursors used for fetching remote sequence numbers were not
closed properly.

  311569

In a replicated system, tables with a large number of columns and/or
constraints could cause a PL/SQL numeric or value error when calling
DBMS_REPCAT.CREATE_MASTER_REPOBJECT.

  313497 

The cost-based optimizer would choose the slower path even when the
FIRST_ROWS hint is provided. Note, however, that using bind variables
as constants can make the cost-based optimizer less efficient.

  315199

PL/SQL cursors that should have been using shared memory when 
accessing the same remote objects through synonyms were not doing so.

  317185

When attempting to start multiple instances in parallel, library cache
lock deadlock would occur.

  318811

An ORA 600 [13012] error would occur when using before update
triggers or chained rows.

  319157

Assignments involving variables of <cursor>%ROWTYPE where the cursor
selects a character-valued expression(e.g. a function, not a column),
the data could be incorrectly copied. Note that applications affected
by this bug must be recompiled in order for the fix to take affect.

  320188

The INDEX_DESC hint did not work correctly for join queries.

  322613

When calling DBMS_REPCAT.ADD_MASTER_DATABASE, if truncated tables
existed, the error ORA-2211 was issued and information in the table
DBA_REPDDL was corrupted.

  323816

Using PRIOR on an index table did not work correctly when a
referenced key did not exist.

  324303

In a replicated system, if the deferred RPC queue was very large,
performance was severely impacted. Since Oracle sorts the deferred RPC
queue before pushing it to a destination and any exception requires a
resort, propagation is slowed, therefore, an index is now created to
avoid this.

  325513

Compilation errors that occurred because a client-side procedure was
compiled against a non-existent server-side procedure did not go away
after the server-side procedure was compiled and the client-side
procedure recompiled.

  328860

An IN subquery with an outer join would cause error ORA-3113 to issued
when the cost-based analyzer was enabled.

  331994

When using an optimized view and there is a column that is referenced
more than once in a select list, and the query is part of a union
block, the error ORA-03113 [End of file communication] would be issued.

  373189

Fixed a bug which severely degrades performance on platforms which
support 128 bit floating point types and where these floating point
operations are performed in software. 

Solaris only: Oracle strongly recommends that the patch for the bug 
described above is applied.  For your convenience we included the patch
on the media for the 7.3.2.2 release.

  333030   

Corrected a problem with hash clusters during update operations. The blocks
contained within the clusters were not returned to the freelist when applicable.

  334379

Corrected a problem with a to_date function in the WHERE clause. The language format set for
session was not overriding, as it should, the language format set during
database creation.

  347793

Fixed a problem during a small window of time where a process died
abnormally while in the process of fetching a new SCN. Due to this bug,
other processes in the same instance may signal an ORA-600 [2258].

  305135 

Fixed a bug causing errors ORA-600[17176] and ORA-600[17285] because of
communication failures in remotely executed PLSQL procedures.

  319003

Fixed bug causing failure during remote update of a long column when
there are 0 rows to be updated.

  327095

Corrected a problem where connection failed while creating a synonym to 
reference remote packaged functions using dblinks.

  338264

Fixed bug where select on a remote table through a dblink causes error ORA-1403 
when the WHERE clause has a comp-3 host variable.

  347231

Parallel Query: Corrected the parallel execution access path for joins
of tables in the same index cluster.
 
  326015

Cost Based Optimizer: Corrected CBO to avoid using an index to do order by
for first_rows when the index cost is greater than the cost of a sort.

  342068

Cost Based Optimizer: Outer join with merge join where outer table is in
a remote database can return too many rows.  This is now fixed.

  334016

Corrected memory leak occurring after repeated open/execute/close cycles
of the dbms_sql package.

  359219

Space Management: Fixed bug that caused unbalanced freelists, leading to
degraded space management.

  350174

Fixed a problem causing error ORA-600 [6711] due to a corruption in 
C_TS# cluster.

  329021

Corrected deadlock problem when running multiple ANALYZE INDEX COMPUTE
STATISTICS on indexes associated with the same table.

  331038

Corrected Index truncate not working on certain platforms because of undo
record being created too large. Also, the code prior to 7.3.2.2 did not
differentiate between undo formats generated under pre-7.2 and post-7.2
Oracle which could have caused a core dump if applied. These problems are
corrected in 7.3.2.2.

  361540

OPS: Create table as select (CTAS) was holding DDL locks on the tables 
(or base tables in case of views) during the population of the table. This 
caused a deadlock when a DDL operation was run on a table on the select list. 
This is corrected in 7.3.2.2.
 
  347998

Under certain conditions, parallel instance recovery could raise error
ORA-600 [9003].  This is corrected in 7.3.2.2.

  326658

SQL*LOADER: Direct load fails to load records when packed decimal column is 
in a "WHEN" clause.  This is corrected in 7.3.2.2.

  325294

Direct load of data in character sets JA16SJIS or JA16EUC fails with
error ORA-2353.  This is corrected in 7.3.2.2.

  330789

SYMMETRIC REPLICATION: When dbms_defer_sys.execute_error raises an exception, 
it overwrites the original call with the new error number and message in 
deferror.  This is corrected in 7.3.2.2.

.

8.0 Known Server Restrictions  
=============================  
  
 
8.1 Restrictions Awaiting Fixes  
------------------------------- 

141539

Do NOT ANALYZE system tables. You should not use the ANALYZE command 
on the tables owned by user SYS. Using the ANALYZE command to gather 
or compute statistics on certain SYS tables causes deadlocks. In this 
release, the data dictionary views that reference the SYS tables
execute efficiently with rule-based optimization.

You can, however, use DBMS_UTILITY.ANALYZE_SCHEMA on the SYS schema. 
See The Oracle Server Reference for more information.
 
8.2 Restriction on the Export Utility
-------------------------------------
When using the new direct path export in Release 7.3,
read-consistency will fail because of a parsing error
in the UPI two-task support.

Specifically, when DIRECT = Y and CONSISTENT = Y,
the following error message
will be generated for each table exported:

   EXP-00008:  ORACLE error 1025 encountered
   ORA-01025:  UPI parameter out of range

    
9.0 National Language Support   
=============================  
  
This section is only relevant if you use National Language  
Support features.   
 
If you used National Language Support features in Oracle Version 6,  
see Section 2.0, "National Language Support."  
  
9.1 General  
-----------  
Some National Language Support interactive interface prompts  
require YES/NO responses rather than the appropriate National Language  
Support language-independent equivalent.  
  
9.2 Character Sets  
------------------  
Single byte and multibyte character encoding schemes are supported.  
     
RESTRICTION: Character sets that replace "|" (vertical bar) and "@"  
(at) with another character CANNOT use these characters in object  
names. For example, D7DEC replaces "|" with O-umlaut, thus O-umlaut  
is not allowed in object names as it would be interpreted as the  
concatenation symbol. This is the same restriction that applied with  
7-bit character sets in Oracle version 6.  
 
RESTRICTION: If your system has a character set that does not  
contain "^" (caret) and "~" (tilde), you MUST use "<<>" or "!=" for  
inequality testing.  (The ANSI/ISO SQL standard permits only "<<>".)  
  
9.2.1 Applications and Multibyte Character Sets  
 
The use of multibyte character sets affects the way that many  
Oracle applications interpret the lengths of character data. Problems  
can arise when the client and the server use a character  
representation with a differing number of bytes per character.  
  
Note: None of the problems mentioned in the remainder of this section  
should arise if one of following conditions are met:  
  
   * Both the client and the server use a single-byte character set.  
  
   * The multibyte character set is guaranteed to have the same number  
     of bytes per character as the single-byte character set.  
  
However, remember that when the length of character string data is  
specified in an OCI bind or define call, it is always specified in  
bytes, not characters. Also, when CHAR(n) and VARCHAR(n) table columns  
or PL/SQL variables are declared, n is the number of bytes in the  
column or variable.  
  
The basic problem occurs when a character string is moved between  
client and server; its length in bytes can change. In the worst case,  
the length of the string can shrink or increase by a factor of five.  
  
In any conversion, four ratios and as many as three character sets  
may be involved. The characters sets are client, network, and server.  
The four ratios are: 
  
Client-Send    (ratio between client character set and network)  
Server-Send    (ratio between server character set and network)  
Client-Receive (ratio between client character set and network for  
                receiving)  
Server-Receive (ratio between server character set and network for  
                receiving)  
  
Usually, three of the four are 1:1. For example, in the case of a  
JEUC client and a WE8DEC server, the network character set is WE8DEC:  
  
       Client Server Send 1:1 1:1 Receive 2:1 1:1  
 
These character set conversion problems affect OCI applications and  
tools that use the UPI, such as SQL*Forms and the precompilers.  
 
 
9.3 Conversion Between Non-String and String Values  
---------------------------------------------------  
When a string variable is to receive the output from a non-string  
datatype, the string variable must be large enough to receive the  
translated output. String lengths are specified in bytes on the client  
side, and this may cause problems when a non-string value must be  
converted to a multibyte string value. The following examples  
demonstrate this using Server Manager line mode; analogies are made to
OCI and precompiler applications.  
  
Note: The declaration of "my_string" in the VARIABLE statement is  
always in bytes. my_string VARCHAR2(4) is a four byte variable named  
"my_string", and my_string VARCHAR2(8) is an eight byte variable.  
 
When running on a client that uses a single byte character set, the  
following example works:  
 
    SVRMGR> variable my_string VARCHAR2(4);  
    SVRMGR> BEGIN  
    SVRMGR> SELECT 1234 INTO :my_string from dual;  
    SVRMGR> END;  
    SVRMGR> /  
 
The example works because the numeric literal 1234 has a precision  
of four, and the varchar2 variable is four BYTES long. On a client  
machine that is using a multibyte character set, this example would  
fail, returning an ORA-006502 error. 
 
Note: Even the following example could fail if the character set on  
the client side is multibyte:  
 
     SVRMGR> variable my_string VARCHAR2(8)  
     SVRMGR> BEGIN  
          2> SELECT 1234 INTO :my_string FROM dual;  
          3> END;  
          4> /  
  
because there is no guarantee that characters are always represented  
in two bytes.  
  
In OCI applications, make sure that the output length that you use  
in the ODEFIN call (the BUFL parameter) and the host language string  
variable are sized sufficiently to receive converted values. In  
precompiler applications, make sure that the host variable string  
for the output is large enough.  
  
 
 
10.0 PL/SQL Behavior Changes After Upgrade 
==========================================  
 
10.1 Behavior Change Caused by Bugfix 237911 After Upgrading to PL/SQL  
     2.1.5 or Any Higher Release 
----------------------------------------------------------------------
 
Description of Behavior Change:  
 
The PL/SQL compiler must check that the elements of the INTO-target  
list of a select statement or cursor fetch statement are assignable and  
report errors PLS-00363 or PLS-00403 if they are not assignable.  PL/SQL  
2.1.4 and earlier releases failed to correctly check the assignability  
of all but the last element in the INTO-target list of select and fetch  
statements. 
 
Consider the following example PL/SQL procedure: 
 
  PROCEDURE  p (...) IS  
  ...  
  BEGIN  
    SELECT * INTO <<a>, <<b>, <<c> FROM <<table>;  
  END;  
  
PL/SQL 2.1.4 correctly checked the assignability of <<c> while failing  
to do the complete set of checks for <<a> and <<b>.  In particular,  
it failed to report errors on <<a> and <<b> if they were any of the following: 
 
    - a reference to an IN parameter  
    - the name of a function  
    - a string-literal  
    - a reference to a scalar for-loop variable  
    - a reference to a constant  
    - a reference to an enumeration-literal (e.g.: TRUE, FALSE)  
  
Releases 2.1.5 and higher now correctly report this error. 
 
If you upgrade to release 2.1.5, or higher, and your procedure has  
the constructs described above, an attempt to recompile your procedure, 
either automatically or manually, will result in either 
 
    - error PLS-00363, if the upgrade is to 2.1.5  
    - error PLS-00403, if the upgrade is to any release higher than  
      2.1.5  
  
Corrective Action:  
  
  You have two choices:  
  
    a)  If you are in a position to fix the PL/SQL code:  
          Fix your PL/SQL code and recompile the procedure.  
          (example: decide carefully if your procedure should use 
          IN parameter or an IN OUT parameter and fix your code accordingly). 
  
    b)  If fixing the PL/SQL code is not an option, then:  
  
        If you are running 2.2.x or 2.3.x, do one of the following:  
  
          1.  Disable bugfix 237911 permanently by performing the  
              following steps:  
              a.  Shutdown the database instance  
              b.  Add the following line to the INIT.ORA file:  
                      event="10925 trace name context forever"  
              c.  Startup the database instance  
  
          2.  Disable bugfix 237911 temporarily to allow your procedure 
              to compile by performing the following steps:  
              a.  Turn off bugfix 237911 temporarily by doing:  
                  ALTER SESSION SET EVENTS='10925 trace name context  
                  forever';  
              b.  ALTER PROCEDURE <<procedure-name> COMPILE;  
              c.  Enable bugfix 237911 again by doing:  
                  ALTER SESSION SET EVENTS='10925 trace name context off'; 
  
        If you are running 2.1.6, do the following to permanently  
        disable bugfix 237911 in 2.1.6:  
  
          Call your Support Rep and ask for a 2.1.6 patch for bugfix  
          284597 to backout bugfix 237911.  
 
10.2 Behavior Change Caused by Bugfix 190119 After Upgrading To PL/SQL  
     2.1.6 or Any Higher Release 
----------------------------------------------------------------------
 
Description of Behavior Change:  
 
The "end" identifier that is optional at the end of a package, 
procedure or function must match the name of the entity it ends; if there  
is a mismatch, the compiler must report error PLS-00113.  PL/SQL 2.1.5  
and lower versions did not report any errors if the identifiers did  
not match. PL/SQL 2.1.6 and higher revisions now correctly report the error  
if the identifiers do not match, for example, as in: 
 
     PACKAGE PKG IS  
       ...  
     END PKGXXX;  
  
Corrective Action: 
  
  You have two choices:  
  
    a)  If you are in a position to fix the PL/SQL code:  
        Fix the "end" identifier so that it matches or remove it and  
        recompile your procedure.  
  
    b)  If fixing the PL/SQL code is not an option, then:  
  
        If you are running 2.2.x or 2.3.x, do one of the following:  
  
          1.  Disable bugfix 190119 permanently by performing the  
              following steps: 
  
              a.  Shutdown the database instance.  
              b.  Add the following line to the INIT.ORA file:  
                      event="10926 trace name context forever."  
              c.  Startup the database instance.  
  
          2.  Disable bugfix 190119 temporarily to allow your procedure  
              to compile by performing the following steps:  
 
              a.  Turn off bugfix 190119 temporarily by doing:  
                  ALTER SESSION SET EVENTS='10926 trace name context  
                  forever'; 
              b.  ALTER PROCEDURE <<procedure-name> COMPILE;  
              c.  Enable bugfix 190119 again by doing:  
                  ALTER SESSION SET EVENTS='10926 trace name context off';  
  
        If you are running 2.1.6, do the following to permanently  
        disable bugfix 190119:  
  
          Call your Support Rep and ask for a 2.1.6 patch for bugfix  
          284599 to backout bugfix 190119.  
 
10.3 Behavior Change Caused by Bugfixes 235190 and 235193  
     After Upgrading to PL/SQL 2.1.6 or Any Higher Release 
----------------------------------------------------------
 
Description of Behavior Change:  
 
The PL/SQL compiler must flag multiple incomplete (forward) type  
declarations for the same type with error PLS-00105.  It must also  
flag incomplete types that are not completed within the same compilation  
unit (stored PL/SQL procedure/package/function) with error PLS-00311. 
PL/SQL 2.1.5 and earlier releases failed to flag these errors  
(see bugs 235190 and 235193).  PL/SQL 2.1.6 and higher releases  
now correctly flag these errors.  However, because of this combination  
of errors, certain PL/SQL programs that previously compiled without  
errors will now compile with either error PLS-00105 or PLS-00311.  
 
For example:  
 
     PACKAGE PKG1 IS  
       TYPE r;  
       TYPE r; -- will now compile with error PLS-00105  
       TYPE r IS record (a VARCHAR2(10));  
     END;  
     PACKAGE PKG2 IS  
       TYPE r; -- will now compile with error PLS-00311  
     END;  
  
Corrective Action: 
  
  You have two choices:  
  
    a)  If you are in a position to fix the PL/SQL code:  
        Remove all but one of the incomplete type-declarations  
        and recompile procedure.  
  
    b)  If fixing the PL/SQL code is not an option,perform one of the
        following two actions:  
  
        If you are running 2.2.x or 2.3.x, do one of the following:  
  
          1.  Disable bugfixes 235190 & 235193 permanently by performing  
              the following steps:  
 
              a.   Shutdown the database instance.  
              b.   Add the following line to the INIT.ORA file:  
                       event="10927 trace name context forever."  
              c.   Startup the database instance.  
  
          2.  Disable bugfixes 235190 and 235193 temporarily to allow  
              your procedure to compile by performing the following  
              steps:  
 
              a.  Turn off bugfix 235190 & 235193 temporarily by doing:  
                  ALTER SESSION SET EVENTS='10927 trace name context  
                  forever';  
              b.  ALTER PROCEDURE <<procedure-name> COMPILE;  
              c.  Enable bugfixes 235190 and 235193 again by doing:  
                  ALTER SESSION SET EVENTS='10927 trace name context off'; 
 
        If you are running 2.1.6, do the following to permanently  
        disable bugfixes 235190 and 235193:  
 
        Call your Support Rep and ask for a 2.1.6 patch for bugfix  
        284598 to backout bugfixes 235190 and 235193.  
 
 
10.4    PLS-905 Error During Execution/Parse of a Cursor Holding  
        an Anonymous PL/SQL Block 
----------------------------------------------------------------
 
This error can occur when an anonymous PL/SQL block references a remote  
object (through a database link) and the remote object has been altered. 
For this to happen, the cursor holding the anonymous PL/SQL needs  
to be in the following state. 
 
* It has been previously fully compiled 
* Since it was last fully compiled, it has been partly aged out of  
  the cache 
 
(Note that "parse" and "compile" are synonymous in this description.)  
 
The problem here is that the cursor keeps an old dependency reference  
on the remote object (which has the old timestamp of the object).  During  
PL/SQL compilation we notice that the timestamp on the remote object doesn't  
match the timestamp in the dependency entry and the dependency is marked  
invalid.  Later, the PL/SQL compiler tries to lock the remote object  
through the dependency entry and discovers that the dependency is  
invalid. It then signals the PLS-905 error. 
 
It is important to note that if the cursor had not been aged out at  
all, then we would have executed and found the timestamp mismatch.   
This would have instead signalled an error such as: 
                           
ORA-04068: existing state of packages has been discarded  
ORA-04062: timestamp of procedure "SCOTT.P1" has been changed 
 
To summarize, here are the conditions that can be encountered when  
an anonymous PL/SQL block is parsed and executed and which references  
a remote object that has been modified since the cursor was last completely  
compiled. 
  
1. If the cursor has been fully aged out of the cache (the parse/compilation  
of the cursor has to start at square 1) then the dependency timestamp  
will be set to the new one and the cursor will parse and execute without  
errors. 
 
2. If the cursor is in the state that it is partly compiled (it still  
has the old dependency information), then PL/SQL compilation will discover  
a timestamp mismatch and signal the ORA-905 error. 
 
3. If the cursor is fully compiled (nothing has been aged out of the  
shared pool), then PL/SQL execution will discover the timestamp mismatch  
and signal the error ORA-4062. 
 
The workaround if condition 2 or 3 is encountered is to reissue the  
the operation that signaled the error.  This works because the cursor  
is marked to be fully recompiled when the timestamp mismatches are
detected. 



11.0 Compiled Triggers
======================

11.1 The COMPILE Option
-----------------------

The COMPILE option allows a user to manually recompile an 
invalid trigger object.

The syntax for the ALTER TRIGGER command with the COMPILE 
option is:

  ALTER TRIGGER <triggername> COMPILE

Note that, since triggers now have dependencies, they can become 
invalid if an object they the trigger depends on changes. 

11.2 The DEBUG Option
---------------------

The DEBUG option allows PL/SQL information to be generated during 
trigger recompilation.

The syntax for the ALTER TRIGGER command with the DEBUG option is:

  ALTER TRIGGER <triggername> DEBUG


12.0 Tuning Issues
======================

This section describes the changes to Oracle7 Server Tuning. Topics 
in this section include:

12.1  lru latch contention
12.2  sort improvements
12.3  recreating an index
12.4  histograms
12.5  EXPLAIN PLAN improvements
12.6  hash join execution
12.7  parallel query processor affinity
12.8  anti-joins
12.9  serializable transactions
12.10 Oracle Trace


12.1 LRU Latch Contention
-------------------------

The following section should be added to Chapter 10 "Tuning Contention".

Contention for the LRU latch can impede performance on symmetric 
multiprocessor (SMP) machines with a large number of CPUs. The LRU 
latch controls the replacement of buffers in the buffer cache. For 
SMP systems, Oracle automatically sets the number of LRU latches to be
one half the number of CPUs on the system. For non-SMP systems, one 
LRU latch is sufficient.

You can specify the number of LRU latches on your system with the 
initialization parameter DB_BLOCK_LRU_LATCHES. This parameter sets the
maximum value for the desired number of LRU latches. Each LRU latch
will control a set of buffers and Oracle balances allocation of
replacement buffers among the sets. To select the appropriate value
for DB_BLOCK_LRU_LATCHES, consider the following:

  o The maximum number of latches is twice the number of CPUs in the
    system. For example, DB_BLOCK_LRU_LATCHES can range from 1...2*CPUs.

  o A latch should have no less than 50 buffers in its set (for small 
    buffer caches there is no added value if you select a larger number of 
    sets). The size of the buffer cache determines a maximum boundary 
    condition on the number of sets.

  o Do not create multiple latches when Oracle runs in single process 
    mode. Oracle automatically uses only one LRU latch in single
    process mode.

  o If your workload on the instance is large, then you should have a 
    higher number of latches. For example, if you have 32 CPUs in your
    system, choose a number between half the number of CPUs (16) and 
    actual number of CPUs (32) in your system.

Note: You cannot dynamically change the number of sets during the
lifetime of the instance.



12.2 Sort Improvements
----------------------

The following four sections replace the sections on page 11-4 of 
Oracle7 Server Tuning, Release 7.2.


12.2.1 SORT_DIRECT_WRITES parameter

If memory and temporary space are abundant on your system, and you 
perform many large sorts to disk, you can set the initialization
parameter SORT_DIRECT_WRITES to increase sort performance. When this 
parameter is set to TRUE, each sort will allocate several large
buffers in memory for direct disk I/O. You can set the initialization 
parameters SORT_WRITE_BUFFERS and SORT_WRITE_BUFFER_SIZE to control
the number and size of these buffers. The sort will write an entire 
buffer for each I/O operation. The Oracle process performing the sort 
writes the sort data directly to the disk, bypassing the buffer cache.

The default value of SORT_DIRECT_WRITES is AUTO. When the parameter 
is unspecified or set to AUTO, Oracle automatically allocates direct 
write buffers if the SORT_AREA_SIZE is at least ten times the minimum 
direct write buffer configuration. 

The memory for the direct write buffers is subtracted from the sort 
area, so the total amount of memory used for each sort is still 
SORT_AREA_SIZE. Setting SORT_WRITE_BUFFERS and SORT_WRITE_BUFFER_SIZE 
has no effect when SORT_DIRECT_WRITES is AUTO.


12.2.2 Performance Tradeoffs of Direct Disk I/O for Sorts

Setting SORT_DIRECT_WRITES to TRUE causes each Oracle process that 
sorts to allocate memory in addition to that already allocated for 
the sort area. The additional memory allocated is calculated as follows:

  SORT_WRITE_BUFFERS * SORT_WRITE_BUFFER_SIZE

The minimum direct write configuration on most platforms is two 32K 
buffers (2 * 32K) , so direct write is generally allocated only if 
the sort area is 640K or greater. With a sort area smaller than this, 
direct write will not be performed.

Ensure that your operating system has enough free memory available 
to accommodate this increase. Also, sorts that use direct writes will 
tend to consume more temporary segment space on disk

One way to avoid increasing memory usage is to decrease the sort area 
by the amount of memory allocated for direct writes. Note that
reducing the sort area may increase the number of sorts to disk, which
will decrease overall performance. A good rule of thumb is that the
total memory allocated for direct write buffers should be less than 
one-tenth of the memory allocated for the sort area. If the minimum 
configuration of the direct write buffers is greater than one-tenth 
of your sort area, then you should not trade sort area for direct
write buffers. 

12.2.3 Using Direct Disk I/O for Sorts with the Parallel Query Option

The following section replaces the section on page 6-16 of Oracle7 
Server Tuning, Release 7.2.

If memory and temporary space are abundant on your system, and you 
perform many large sorts to disk, you can set the initialization
parameter SORT_DIRECT_WRITES to increase sort performance. Note that 
each query server will allocate its own set of direct write buffers 
(when SORT_DIRECT_WRITES is set to TRUE), so the total amount of
memory allocated for buffers is the number of query servers 
multiplied by SORT_WRITE_BUFFERS, the number of direct write 
buffers, multiplied by SORT_WRITE_BUFFER_SIZE. In addition to the 
increased memory usage, sorts that use direct writes will tend to 
consume more temporary segment space on disk. 

Setting SORT_DIRECT_WRITES to AUTO causes Oracle to allocated the 
memory for the direct write buffers out of the total sort area.

12.2.4 Optimizing Sort Performance with TEMPORARY Tablespaces

The following sections should be placed before "Avoiding Sorts" 
on page 11-3 of Oracle7 Server Tuning.

You can optimize sort performance of sorts by specifying a tablespace 
as TEMPORARY upon creation (or subsequently altering that tablespace) 
and performing the sort in that tablespace. Normally, a sort may 
require many space allocation calls to allocate and deallocate 
temporary segments. If a tablespace is specified as TEMPORARY, one 
sort segment in that tablespace is cached and used for each instance 
requesting a sort operation. This scheme bypasses the normal space 
allocation mechanism and can greatly improve performance of 
medium-sized sorts that cannot be done completely in memory.

To specify a tablespace as temporary, use the TEMPORARY keyword 
of the CREATE TABLE or ALTER TABLE commands. TEMPORARY cannot be used 
with tablespaces that contain permanent objects (such as tables or 
rollback segments). See the Oracle7 Server SQL Reference chapter for 
more information about the syntax of the CREATE TABLE and ALTER TABLE 
commands.


12.3 Recreating an Index
------------------------

The following section should be placed before "Reducing Free List 
Contention" on page 11-5 of Oracle7 Server Tuning.

You may wish to recreate an index in order to compact it and clean 
up fragmented space, or to change the index's storage
characteristics. When creating a new index which is a subset of 
an existing index, or when rebuilding an existing index with new 
storage characteristics, Oracle uses the existing index instead of 
the base table to improve performance. 

Consider, for example, a table named CUST with columns NAME, 
CUSTID, PHONE, ADDR, BALANCE, and an index named I_CUST_CUSTINFO 
on columns NAME, CUSTID and BALANCE of the table. To create a new 
index named I_CUST_CUSTNO on columns NAME and CUSTID, you would 
enter:

  CREATE INDEX I_CUST_CUSTNO on CUST(NAME,CUSTID)

Oracle will automatically use the existing index (I_CUST_CUSTINFO) 
to create the new index rather than accessing the entire table. 
Note that the syntax used is the same as if the index I_CUST_CUSTINFO 
did not exist.

Similarly, if you have an index on the EMPNO and MGR columns of 
the EMP table, and you want to change the storage characteristics 
of that composite index, Oracle can use the existing index to create 
the new index.

Use the ALTER INDEX REBUILD command to change the storage 
characteristics of an existing index. The REBUILD uses the existing 
index as the basis for the new index. All index storage commands are 
supported, such as STORAGE (for extent allocation), TABLESPACE (to 
move the index to a new tablespace), and INITRANS (to change the 
initial number of entries). See Oracle7 Server SQL Reference for more 
information about the CREATE INDEX and ALTER INDEX commands.


12.4 Histograms
---------------

For uniformly distributed data, the cost-based approach makes 
fairly accurate guesses at the cost of executing a particular 
statement. However, when the data is not uniformly distributed, 
the optimizer cannot accurately estimate the selectivity of a 
query. For non-uniformly distributed data, Oracle allows you to 
store histograms describing the data distribution of a particular 
column.


12.4.1 Height-Balanced Histograms

Oracle's histograms are height balanced (as opposed to width
balanced). Width-balanced histograms divide the data into a fixed 
number of equal-width ranges and then count the number of values 
falling into each range. Height-balanced histograms place the same 
number of values into each range so that the endpoints of the range 
are determined by how many values are in that range.

For example, suppose that the values in a single column of a 1000-row 
table range between 1 and 100, and suppose that you want a 10-bucket 
histogram (ranges in a histogram are often referred to as "buckets"). 
In a width-balanced histogram, the buckets would be of equal width 
(1-10, 11-20, 21,-30, etc.) and each bucket would count the number of 
rows that fall into that range. In a height-balanced histogram, each 
bucket has the same height (in this case 100 rows), and then the 
endpoints for the buckets would be determined by the density of the 
distinct values in the column. 


12.4.2 Advantages of Height-Balanced Histograms

The advantage of the height-balanced approach is clear when the data 
in the above example is highly skewed. Supposed that 800 rows of the 
example table had the value 5, and the remaining 200 rows are evenly 
distributed between 1 and 100. The width-balanced histogram would have
820 rows in the bucket labeled "1-10", and approximately 20 rows in
the other buckets. The height-balanced histogram would have one bucket
labeled "1-5", seven buckets labeled "5-5", one bucket labeled "5-50",
and one bucket labeled "50-100".

If you wanted to know how many rows in the table contained the value 
"5", it is apparent from the height-balanced histogram that
approximately 80% of the rows contain this value. However, the 
width-balanced histogram does not provide a mechanism for 
differentiating between the value "5" and the value "6". You would 
compute only 8% of the rows contain the value "5" in a width-balanced 
histogram. Thus, height-balanced histograms are more appropriate for 
determining the selectivity of column values.


12.4.3 When to Use Histograms

Histograms are stored in the dictionary and computed by using the 
ANALYZE command on a particular column. Therefore, there is a 
maintenance and space cost for using histograms. You should only 
compute histograms for columns which you know have highly-skewed 
data distribution.

Also, be aware that histograms, as well as all optimizer statistics, 
are static. If the data distribution of a column changes frequently, 
it is necessary to recompute the histogram for a given column.

Histograms are not useful for columns with the following characteristics:

  o all predicates on the column use bind variables
  o the column data is uniformly distributed
  o the column is not used in WHERE clauses of queries
  o the column is unique and is used only with equality predicates


12.4.4 How to Use Histograms

Create histograms on columns that are frequently used in WHERE clauses
of queries and have a highly-skewed data distribution. You create a 
histogram by using the ANALYZE TABLE command. For example, if you want
to create a 10-bucket histogram on the SAL column of the EMP table,
issue the following statement:

  ANALYZE TABLE emp COMPUTE STATISTICS FOR COLUMNS sal SIZE 10;

The SIZE keyword states the maximum number of buckets for the
histogram. You would create a histogram on the SAL column if there
were an unusual number of employees with the same salary and few 
employees with other salaries.

For more information about the ANALYZE command and its options, 
see the Oracle7 Server SQL Reference.


12.4.5 Choosing the Number of Buckets for a Histogram

The default number of buckets is 75. This value provides an 
appropriate level of detail for most data distributions. However, 
since the number of buckets in the histogram, the sampling rate, 
and the data distribution all affect the usefulness of a histogram, 
you may need to experiment with different numbers of buckets to obtain
the best results.

If the number of frequently occurring distinct values in a column 
is relatively small, then it is useful to set the number of buckets 
to be greater than the number of frequently occurring distinct values.


12.4.6 Viewing Histograms

You can find information about existing histograms in the database 
through the following data dictionary views: USER_HISTOGRAMS, 
ALL_HISTOGRAMS, and DBA_HISTOGRAMS. The number of buckets in each 
column's histogram is found in USER_TAB_COLUMNS, ALL_TAB_COLUMNS, 
and DBA_TAB_COLUMNS dictionary views. For more information and column 
descriptions of these views, see the Oracle7 Server Reference chapter 
of this manual. 



12.5 EXPLAIN PLAN Improvements
------------------------------

The following replaces the description of the PLAN_TABLE table in 
Appendix A of Oracle7 Server Tuning, Release 7.2.


12.5.1 Output Table Columns

The PLAN_TABLE used by the EXPLAIN PLAN command contains the following
columns: 



STATEMENT_ID

The value of the option STATEMENT_ID parameter specified in the 
EXPLAIN PLAN statement. 


TIMESTAMP

The date and time when the EXPLAIN PLAN statement was issued. 


REMARKS

Any comment (of up to 80 bytes) you wish to associate with each step 
of the explained plan. If you need to add or change a remark on any 
row of the PLAN_TABLE, use the UPDATE statement to modify the rows 
of the PLAN_TABLE. 


OPERATION

The name of the internal operation performed in this step. See 
Appendix A of Oracle7 Server Tuning for information on the contents 
of this column.

In the first row generated for a statement, the column contains one 
of these values, depending on the type of the statement: 

 'DELETE STATEMENT'
 'INSERT STATEMENT'
 'SELECT STATEMENT'
 'UPDATE STATEMENT' 


OPTIONS

A variation on the operation described in the OPERATION column. See 
Appendix A of Oracle7 Server Tuning for information on the contents 
of this column.


OBJECT_NODE

The name of the database link used to reference the object (a table 
name or view name). For local queries using the parallel query option,
this column describes the order in which output from operations is 
consumed.


OBJECT_OWNER

The name of the user that owns the schema containing the table or index. 


OBJECT_NAME

The name of the table or index. 


OBJECT_INSTANCE

A number corresponding to the ordinal position of the object as it 
appears in the original statement. The numbering proceeds from left 
to right, outer to inner with respect to the original statement text. 
Note that view expansion will result in unpredictable numbers. 


OBJECT_TYPE

A modifier that provides descriptive information about the object; 
for example, NON-UNIQUE for indexes. 


OPTIMIZER

The current mode of the optimizer.


SEARCH_COLUMNS

Not currently used. 


ID

A number assigned to each step in the execution plan. 


PARENT_ID

The ID of the next execution step that operates on the output of the 
ID step.


POSITION

The order of processing for steps that all have the same PARENT_ID. 


OTHER

Other information that is specific to the execution step that a user 
may find useful.


OTHER_TAG

Describes the contents of the OTHER column.


COST

The cost of the operation as estimated by the optimizer's cost-based 
approach. For statements that use the rule-based approach, this column
is null. Cost is not determined for table access operations. The value
of this column does not have any particular unit of measurement, it is
merely a weighted value used to compare costs of execution plans.


CARDINALITY

The cost-based approach's estimate of the number of rows accessed by 
the operation.


BYTES

The cost-based approach's estimate of the number of bytes accessed by 
the operation.


Column Contents/Description

SERIAL

The statement is a locally executed serial query plan.

SERIAL_FROM_REMOTE

The statement is executed at a remote site.

PARALLEL_COMBINED_WITH_PARENT

The parent of this operation is an operator that performs the parent 
and child operation together.

PARALLEL_COMBINED_WITH_CHILD

The child of this operation is an operator that performs the parent 
and child operation together.

PARALLEL_TO_SERIAL

The SQL in the OTHER column is the top level of the parallel execution
plan.

PARALLEL_TO_PARALLEL

This operation consumes data from a parallel source and outputs its 
data in parallel.

PARALLEL_FROM_SERIAL

This operation consumes data from a serial operation and outputs its 
data in parallel.

Table 1 - 1 
Possible Values of the OTHER_TAG column of the PLAN Table.


12.6 Hash Join Execution
------------------------

The following section should be placed before "Choosing Execution 
Plans for Join Statements" on page 5-49 of Oracle7 Server Tuning.

To perform a hash join, Oracle follows these steps: 

1.  Oracle performs a full table scan on each of the tables and 
splits each into as many partitions as possible based on the 
available memory.

2.  Oracle builds a hash table from one of the partitions (if 
possible, Oracle will select a partition that fits into available 
memory). Oracle then uses the corresponding partition in the other 
table to probe the hash table. All partitions pairs that do not fit 
into memory are placed onto disk.

3.  For each pair of partitions (one from each table), Oracle uses 
the smaller one to build a hash table and the larger one to probe 
the hash table.

Oracle can only perform a hash join for an equijoin. 

The execution plan for this statement using a hash join is as follows:

SELECT * 

        FROM emp, dept 
        WHERE emp.deptno = dept.deptno;

To execute this statement, Oracle performs these steps: 

* Steps 2 and 3 perform full table scans of the EMP and DEPT tables. 

* Step 1 builds a hash table out of the rows coming from 2 and probes 
it with each row coming from 3.

You must issue the statement ALTER SESSION SET HASH_JOIN_ENABLED =TRUE 
in order to enable the selection of the hash join algorithm. See
Oracle7 Server SQL Reference for more information on the syntax of the
ALTER SESSION command.

The initialization parameter HASH_AREA_SIZE controls the memory to be 
used for hash join operations and the initialization parameter 
HASH_MULTIBLOCK_IO_COUNT controls the number of blocks a hash join 
operation should read and write concurrently. See Oracle7 Server 
Reference for more information about these initialization parameters. 

The following section should be placed before "Hints for Parallel 
Query Execution" on page 7-26 of Oracle7 Server Tuning.

12.6.1 USE_HASH

The USE_HASH hint causes Oracle to join each specified table with 
another row source with a hash join. The syntax of the USE_HASH hint is

  USE_HASH (table1 table2 ... ) ...

where table is a table to be joined to the row source resulting from 
joining the previous tables in the join order using a hash join.



12.7 Anti-Joins

An anti-join is a form of join with reverse logic. Instead of
returning rows when there is a match (according to the join predicate)
between the left and right side, an anti-join will return those rows 
from the left side of the predicate for where there was no match on
the right. This behavior is exactly that of a NOT IN subquery with the
right side of the anti-join predicate corresponding to the subquery.

An anti-join uses sort-merge or hash joins to evaluate the NOT IN 
subquery provided that certain conditions are met. Assume that the 
subquery predicate is of the form (colA1, colA2, ... colAn) NOT IN 
(SELECT colB1, colB2, ..., colBn FROM ...). The following conditions 
must be true for the subquery to be transformed into a hash or 
sort-merge anti-join:

  o All of the references to the columns in A must be simple reference
    to columns. References to columns in B must either be simple 
    references to columns or aggregate functions (MIN, MAX, SUM,
    COUNT, or AVG) applied directly to a simple column if the subquery
    contains a GROUP BY. No other expressions are allowed.

  o All column references must be know to be not null.

  o The subquery must not have any correlation predicates. That is, 
    predicates referencing anything in surrounding query blocks.

  o The WHERE clause of the surrounding query must not have ORs at 
    the top-most logical level.

  o Anti-joins can only be used with the cost-based approach.


12.7.1 How to Use an Anti-Join

Oracle transforms NOT IN subqueries into sort-merge or hash anti-joins
if the conditions in the previous section are true and there is a hint
or initialization parameter specifying that the transformation take place. 

For a specific query, place the MERGE_AJ or HASH_AJ hints into the NOT IN 
subquery. MERGE_AJ uses a sort-merge anti-join and HASH_AJ uses a hash
anti-join. For example:

SELECT * FROM emp
        WHERE ename LIKE 'J%' AND
                        deptno IS NOT NULL AND
                        deptno NOT IN (SELECT /*+ HASH_AJ/ deptno FORM dept
                                        WHERE deptno IS NOT NULL AND
                                        loc = 'DALLAS');

If you wish the anti-join transformation to always occur if the conditions 
in the previous section are met, set the ALWAYS_ANTI_JOIN initialization 
parameter to MERGE or HASH. The transformation to the corresponding 
anti-join type will always take place when possible.



12.8 Serializable Transactions
------------------------------

The following sections should be placed before "Shared SQL and PL/SQL"
on page 4-12 of Oracle7 Server Tuning.

Oracle allows application developers to set the isolation level of 
transactions. The isolation level determines what changes the 
transaction and other transactions can see. The ISO/ANSI SQL3 
specification details the following levels of transaction isolation:


SERIALIZABLE

transactions lose no updates, provide repeatable reads, and do not 
experience phantoms. Changes made to a serializable transaction are 
visible only to the transaction itself.


READ COMMITTED

transactions do not have repeatable reads and changes made this 
transaction or other transactions are visible to all transactions. 
This is the default transaction isolation.

If you wish to set the transaction isolation level, you must do so 
before the transaction begins. Use the SET TRANSACTION ISOLATION level
statement for a particular transaction, or the ALTER SESSION SET 
ISOLATION LEVEl statement for all subsequent transactions in the
session. See Oracle7 Server SQL Reference for more information on the 
syntax of SET TRANSACTION and ALTER SESSION.



12.9 Parallel Query 
-------------------

The following sections replace "Default Degree of Parallelism" on 
page 6-10 of Oracle7 Server Tuning, Release 7.2. The parameters 
PARALLEL_DEFAULT_SCANSIZE and PARALLEL_DEFAULT_MAX_SCANS are 
obsolete in release 7.3.


12.9.1 Default Degree of Parallelism

Oracle determines the number of disks that the table is stored on 
and the number of CPUs in the system and then selects the smaller of 
these two values as the default degree of parallelism. The default 
degree of parallelism is used when you do not specify a degree of 
parallelism in a hint or within a table's definition.

For example, your system has 20 CPUs and you issue a parallel query 
on a table that is stored on 15 disk drives. The default degree of 
parallelism for your query is 15 query servers.


12.9.2 Minimum Number of Query Servers

Oracle can perform a query in parallel as long as there are at least 
two query servers available. If there are too few query servers 
available, your query may execute slower than expected. You can 
specify that a minimum percentage of requested query servers must be 
available in order for the query to execute. This ensures that your 
query executes with a minimum acceptable parallel query performance. 
If the minimum percentage of requested servers are not available, the 
query does not execute and returns an error.

Specify the desired minimum percentage of requested query servers with
the initialization parameter PARALLEL_QUERY_MIN_PERCENT. For example, 
if you specify 50 for this parameter, then at least 50% of the query
servers requested for any parallel operation must be available in
order for the operation to succeed. If 20 query servers are requested,
then at least 10 must be available or an error is returned to the
user. If PARALLEL_QUERY_MIN_PERCENT is set to null, then all parallel 
operations will proceed as long as at least two query servers 
are available for processing.



12.10 Oracle Trace
------------------

Oracle Trace collects performance data for any application#most
notably, transaction processing and database applications. It provides
for the gathering and reporting of event-based performance data from 
layered products and application programs that contain calls to Oracle
Trace routines. Oracle Trace is designed to operate with minimal 
performance impact on the system and can be used in both development 
and production environments.

Oracle Trace can be used to assist in pinpointing the reasons for an 
application's poor performance. General reasons for poor performance 
can be any of the following:

  o data access contention
  o poorly or incorrectly designed databases
  o not enough servers to handle user requests
  o inefficient database queries
  o actual use of the application differs from the intended use
  o inadequate hardware resources

Finding specific causes for these general problems requires data about
the application's resource use and response time. Oracle Trace
collects a variety of such data from all layers of an application -- 
the user interface, the processing engine, and the database.


12.10.1 Instrumentation of Oracle For Oracle Trace

The Oracle Server has been instrumented for use with Oracle Trace. To 
gather statistics, Oracle Trace requires a facility definition file. 
For more information about instrumentation and facility definition
files, see the Oracle Trace Instrumentation Guide.


12.10.2 Enabling and Disabling Oracle Trace

Oracle Trace can be enabled and configured on an instance-wide or 
per-session basis. To enable and configure Oracle Trace for the entire
instance, you must set ORACLE_TRACE_ENABLED to TRUE, and set other 
ORACLE_TRACE_* initialization parameters for the destination of the 
collection, the size of the collection, and so on. For information 
about these parameters, see the Oracle7 Server Reference. 


To enable and configure Oracle Trace for an individual session, use 
the DBMS_ORACLE_TRACE_USER.SET_ORACLE_TRACE procedure.



13.0 Oracle Parallel Server: Releasable Hashed PCM Locks
--------------------------------------------------------

You can specify releasable hashed PCM locks by using the R option 
with the GC_FILES_TO_LOCKS parameter. Releasable hashed PCM locks 
are taken from the pool of GC_RELEASABLE_LOCKS rather than from 
GC_DB_LOCKS. GC_FILES_TO_LOCKS parameter. The syntax for setting 
this parameter is:

  GC_FILES_TO_LOCKS="{file_list=#locks[!blocks][EACH][R][:]} . . ."

where

file_list	specifies a single file, range of files, or list of 
                files and ranges as follows:  

                fileidA[-fileidC][,fileidE[-fileidG]] ...

		Query the data dictionary view DBA_DATA_FILES to find 
                the correspondence between file names and file ID numbers. 

#locks		sets the number of PCM locks to assign to file_list. A
                value of zero (0) for #locks means that fine grain
                lock will be used instead of hashed locks.

!blocks		specifies the number of contiguous data blocks to be
                covered by each lock

EACH		specifies #locks as the number of locks to be allocated 
                to each file in file_list

R		specifies that the hashed locks are releasable: they
                may be released by the instance when they are no longer 
                needed. Releasable hashed PCM locks are taken from the
                pool GC_RELEASABLE_LOCKS rather than GC_DB_LOCKS.


14.0 Oracle7 Server SQL Reference Update
========================================

14.1 CREATE CLUSTER Statement

The following information supplements or corrects the information in
Chapter 4 of the Oracle7 Server SQL Reference, Release 7.2 under the
heading CREATE CLUSTER.

Under the discussion of the keyword phrase "HASH IS" there is the
following text:

  The expression must:

    o evaluate to a positive value
    o contain one or more columns of datatype INTEGER or datatype
      NUMBER with scale 0

This should read:

  The expression must:

    o evaluate to a positive value
    o contain at least one column with referenced columns of any
      datatype as long as the entire expression evaluates to a 
      number of scale 0 (for example, NUM_COLUMN * length(VARCHAR2_COLUMN)) 




<<End of 7.3.2 README file>>  

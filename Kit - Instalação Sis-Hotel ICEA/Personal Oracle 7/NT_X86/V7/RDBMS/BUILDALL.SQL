spool %ORACLE_HOME%\DATABASE\build.log
SET TERMOUT OFF
SET ECHO OFF
connect internal@2:ORCL
@@build_db.sql
@%rdbms73%\admin\catalog.sql
@%rdbms73%\admin\catalog6.sql
@%rdbms73%\admin\catproc.sql
@@scott.sql
connect internal@2:ORCL
@@demo.sql
connect system/manager@2:ORCL
@%rdbms73%\admin\catdbsyn.sql
@%oracle_home%\dbs\pupbld.sql
connect internal@2:ORCL
alter rollback segment rb_temp offline;
shutdown;
spool off


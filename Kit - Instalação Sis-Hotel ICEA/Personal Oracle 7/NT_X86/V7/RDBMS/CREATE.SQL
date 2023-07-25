spool C:\ORA_NT\DATABASE\create.log
 connect internal/manager@2:ORCL
@C:\ORA_NT\RDBMS73\admin\catalog.sql
@C:\ORA_NT\RDBMS73\admin\catproc.sql
shutdown
spool off
exit
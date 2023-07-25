spool %ORACLE_HOME%\DATABASE\createdb.log
connect internal@2:orcl
startup nomount pfile=%init_path%\initorcl.ora
create controlfile reuse set database oracle
datafile '%seedd_path%\sys1orcl.ora',
         '%seedd_path%\tmp1orcl.ora',
         '%seedd_path%\rbs1orcl.ora',
         '%seedd_path%\usr1orcl.ora'
logfile '%seedl_path%\log1orcl.ora' size %seedl_size%k,
        '%seedl_path%\log2orcl.ora' size %seedl_size%k resetlogs;
alter database oracle open resetlogs;
update props$ set VALUE$ = '%seed_charset%' where NAME = 'NLS_CHARACTERSET';
%create_po7%
%grant_po7%
commit
shutdown
spool off
exit

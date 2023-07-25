create user demo identified by demo;
grant connect to demo;
grant resource to demo;
alter user demo default tablespace user_data;
alter user demo temporary tablespace temporary_data;
connect demo/demo@2:orcl
alter session set NLS_TERRITORY = AMERICA;
alter session set NLS_LANGUAGE = AMERICAN;
@@bdemobld.sql

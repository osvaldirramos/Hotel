rem 
Rem  Copyright (c) 1995 by Oracle Corporation 
Rem    NAME
Rem      nonblk.sql
Rem    DESCRIPTION
Rem      Demo script for nonblk.c
Rem    MODIFIED   (MM/DD/YY)
Rem     xxxxxxxx   03/09/95 -  change internal to system
Rem     xxxxxxxx   03/05/95 -  Branch_for_patch
Rem     xxxxxxxx   03/01/95 -  Creation

set echo on;
connect system/manager;
drop user ocitest cascade;
create user ocitest identified by ocitest;
grant connect,resource to ocitest;
connect ocitest/ocitest;

create table nonblktab (col1 varchar2(30));
insert into nonblktab values ('A');
insert into nonblktab values ('AB');
insert into nonblktab values ('ABC');
insert into nonblktab values ('ABCD');
insert into nonblktab values ('ABCDE');
insert into nonblktab values ('ABCDEF');
insert into nonblktab values ('ABCDEFG');
insert into nonblktab values ('ABCDEFGH');
insert into nonblktab values ('ABCDEFGHI');
insert into nonblktab values ('ABCDEFGHIJ');
insert into nonblktab values ('ABCDEFGHIJK');
insert into nonblktab values ('ABCDEFGHIJKL');

commit;


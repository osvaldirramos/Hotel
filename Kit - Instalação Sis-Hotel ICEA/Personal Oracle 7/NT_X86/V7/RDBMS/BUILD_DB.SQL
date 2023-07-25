--
-- $Header: build_db.sql 1.1 94/10/18 15:55:37 gdudey Osd<desktop/netware> $ Copyr (c) 1994 Oracle
--
-- This file must be run out of the directory containing the
-- initialization file.

startup nomount pfile=%init_path%\initorcl.ora

--  Create database

create database oracle
    controlfile reuse
    logfile '%seedl_path%\log1orcl.ora' size %seedl_size%K reuse,
            '%seedl_path%\log2orcl.ora' size %seedl_size%K reuse
    datafile '%seedd_path%\sys1orcl.ora' size %seedd_sysi_size%M reuse autoextend on
      next %seedd_syse_size%M maxsize %seedd_sysm_size%M 
    character set %seed_charset%;

create rollback segment rb_temp;

-- Create additioanal tablespaces ...

-- USER_DATA: Create user sets this as the default tablespace
-- TEMPORARY_DATA: Create user sets this as the temporary tablespace
-- ROLLBACK_DATA: For rollback segments

create tablespace user_data
    datafile '%seedd_path%\usr1orcl.ora' size %seedd_usri_size%M reuse autoextend on
      next %seedd_usre_size%M maxsize %seedd_usrm_size%M;
create tablespace rollback_data
    datafile '%seedd_path%\rbs1orcl.ora' size %seedd_rbsi_size%M reuse autoextend on
      next %seedd_rbse_size%M maxsize %seedd_rbsm_size%M;
create tablespace temporary_data
    datafile '%seedd_path%\tmp1orcl.ora' size %seedd_tmpi_size%M reuse autoextend on
      next %seedd_tmpe_size%M maxsize %seedd_tmpm_size%M;
alter rollback segment rb_temp online;

-- Change the SYSTEM users' password, default tablespace and
-- temporary tablespace.

alter user system temporary tablespace temporary_data;
alter user system default tablespace user_data;

-- Create 16 rollback segments.  Allows 16 concurrent users with open
-- transactions updating the database. This should be enough.

create public rollback segment rb1 storage(initial 50K next 50K)
  tablespace rollback_data;
create public rollback segment rb2 storage(initial 50K next 50K)
  tablespace rollback_data;
create public rollback segment rb3 storage(initial 50K next 50K)
  tablespace rollback_data;
create public rollback segment rb4 storage(initial 50K next 50K)
  tablespace rollback_data;
create public rollback segment rb5 storage(initial 50K next 50K)
  tablespace rollback_data;
create public rollback segment rb6 storage(initial 50K next 50K)
  tablespace rollback_data;
create public rollback segment rb7 storage(initial 50K next 50K)
  tablespace rollback_data;
create public rollback segment rb8 storage(initial 50K next 50K)
  tablespace rollback_data;
create public rollback segment rb9 storage(initial 50K next 50K)
  tablespace rollback_data;
create public rollback segment rb10 storage(initial 50K next 50K)
  tablespace rollback_data;
create public rollback segment rb11 storage(initial 50K next 50K)
  tablespace rollback_data;
create public rollback segment rb12 storage(initial 50K next 50K)
  tablespace rollback_data;
create public rollback segment rb13 storage(initial 50K next 50K)
  tablespace rollback_data;
create public rollback segment rb14 storage(initial 50K next 50K)
  tablespace rollback_data;
create public rollback segment rb15 storage(initial 50K next 50K)
  tablespace rollback_data;
create public rollback segment rb16 storage(initial 50K next 50K)
  tablespace rollback_data;


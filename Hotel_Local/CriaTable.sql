rem *=============================================================
rem * DBA: Osvaldir Donizetti Ramos(29.Mar.2000)
rem * Definicoes de Variaveis de ambiente:
rem *    ORACLE_BASE = /u01/oracle
rem *    ORACLE_HOME = /u01/oracle/72230
rem *    ORACLE_SID  = IPV
rem *
rem * Cria as TABLESPACEs, ROLEs e os USERs da 'instance' IPV.
rem *=============================================================
 
rem *-------------------------------------------------------------
rem * Tablespace BDC: Banco de Dados do BDC
rem * Respnsavel: 
rem *-------------------------------------------------------------

create tablespace Curso
datafile '/u01/oradata/ipv/Curso01.dbf' size 300M online;

rem *-------------------------------------------------------------
rem * Tablespace INDBDC: Banco de Dados do INDBDC
rem * Respnsavel: 
rem *-------------------------------------------------------------

create tablespace INDCurso
datafile '/u01/oradata/ipv/indCurso01.dbf' size 150M online;

rem *-------------------------------------------------------------
rem * Cria uma 'tablespace' para WEB DB
rem *-------------------------------------------------------------

create tablespace WEBDB
datafile '/u01/oradata/ipv/webdb01.dbf' size 60M online;

rem *-------------------------------------------------------------
rem * Cria uma 'tablespace' para area temporaria/doc do WEB DB
rem *-------------------------------------------------------------

create tablespace WEBTMP
datafile '/u01/oradata/ipv/webtmp01.dbf' size 60M online;

rem *-------------------------------------------------------------
rem * Cria uma 'tablespace' para os 'sites' do WEB DB
rem *-------------------------------------------------------------

create tablespace WEBSITE
datafile '/u01/oradata/ipv/website01.dbf' size 100M online;

rem *-------------------------------------------------------------
rem * Cria uma 'tablespace' temporaria
rem *-------------------------------------------------------------

rem create tablespace TEMP
rem datafile '/u01/oradata/IPV/temp01.dbf' size 150M
rem default storage (initial 256k next 256k pctincrease 0)
rem online;

rem *-------------------------------------------------------------
rem * Cria a role Desenvolvedor
rem *-------------------------------------------------------------

create role DESENVOLVEDOR;
grant CREATE SESSION, CREATE PROCEDURE, CREATE SEQUENCE,
 CREATE TABLE, CREATE VIEW to DESENVOLVEDOR;

rem *-------------------------------------------------------------
rem * Desenvolvedor do ATFM
rem *-------------------------------------------------------------

create user Curso identified by ipvhtl
default tablespace Curso
temporary tablespace TEMP;
grant DESENVOLVEDOR to Curso;
grant UNLIMITED TABLESPACE to Curso;

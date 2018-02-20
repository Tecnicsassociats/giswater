﻿CREATE ROLE "role_basic" NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
CREATE ROLE "role_om" NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
CREATE ROLE "role_edit" NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
CREATE ROLE "role_epa" NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
CREATE ROLE "role_master" NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
CREATE ROLE "role_admin" SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;

GRANT role_basic TO role_om;
GRANT role_om TO role_edit;
GRANT role_edit TO role_epa;
GRANT role_epa TO role_master;
GRANT role_master TO role_admin;




CREATE USER kobo WITH PASSWORD 'bahis@321';
create database coredb;
GRANT ALL PRIVILEGES ON DATABASE coredb to kobo;
\c coredb
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;

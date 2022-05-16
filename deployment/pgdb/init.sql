\set ON_ERROR_STOP on
drop database coredb;
drop user kobo;
CREATE USER kobo WITH PASSWORD 'bahis@321';
create database coredb;
GRANT ALL PRIVILEGES ON DATABASE coredb to kobo;

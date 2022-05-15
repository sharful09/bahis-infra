#base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

#Datbase Information most of those will need to go to docker-compose
ENV PSQL_ADMIN="postgres"
ENV KOBO_PSQL_DB_NAME="coredb"
ENV KOBO_PSQL_DB_USER="kobo"
ENV KOBO_PSQL_DB_PASS="bahis@321"
ENV DATABASE_SERVER_IP="localhost"
ENV DATABASE_URL="postgis://$KOBO_PSQL_DB_USER:$KOBO_PSQL_DB_PASS@$DATABASE_SERVER_IP:5432/$KOBO_PSQL_DB_NAME"

RUN apt update

# RUN apt -y install net-tools python-dev gfortran libatlas-base-dev libjpeg-dev python-numpy   python-pandas-doc openjdk-8-jre zlib1g-dev binutils libproj-dev libxslt1-dev libxslt1-dev libxml2-dev libmemcached-dev python-lxml  virtualenv nodejs  uuid-dev libcap-dev libpq-dev   python-dev build-essential uwsgi  unzip  wget ca-certificates git

RUN apt -y install lsb-release wget ca-certificates net-tools binutils gnupg2

COPY coredb.sql .
COPY init.sql .


RUN apt-get install wget ca-certificates
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
RUN  apt update
RUN  apt list --upgradable
# RUN apt -y install  postgresql-13-postgis-3
# RUN pg_ctlcluster 13 main start

#     # command: sudo -u postgres psql -c "CREATE USER kobo WITH PASSWORD 'bahis@321';"
#     # command: cd /home/vagrant/src_bahis/scripts/template


#     # command: sudo -u postgres psql -c "create database coredb;"
#     # command: sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE coredb to kobo;"
#     # command: sudo -u postgres psql  -c "CREATE EXTENSION IF NOT EXISTS postgis;" -d coredb
#     # command: sudo -u postgres psql  -c "CREATE EXTENSION IF NOT EXISTS postgis_topology;" -d coredb

# # RUN su postgres
# # RUN psql coredb < coredb.sql
# CMD ["postgres"]

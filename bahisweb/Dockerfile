#base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV BAHIS_ENV=/opt/envbahis
ENV PATH="$BAHIS_ENV/bin:$PATH"
ENV DJANGO_SETTINGS_MODULE="kobocat_settings"
ENV PYTHONPATH="/env:$PYTHON_PATH"
ENV V_R="/"
ENV V_E="/env"
ENV SRC_DIR="/src_bahis"
ENV ip="127.0.0.1"
ENV KOBOCAT_PATH="$SRC_DIR/kobocat"
ENV KOBOCAT_TEMPLATES_PATH="$SRC_DIR/kobocat-template"

#Datbase Information most of those will need to go to docker-compose
ENV PSQL_ADMIN="postgres"
ENV KOBO_PSQL_DB_NAME="coredb"
ENV KOBO_PSQL_DB_USER="kobo"
ENV KOBO_PSQL_DB_PASS="bahis@321"
ENV DATABASE_SERVER_IP="localhost"
ENV DATABASE_URL="postgis://$KOBO_PSQL_DB_USER:$KOBO_PSQL_DB_PASS@$DATABASE_SERVER_IP:5432/$KOBO_PSQL_DB_NAME"

#settings specific details
ENV DJANGO_LIVE_RELOAD="False"
ENV DJANGO_SITE_ID="1"
ENV DJANGO_SECRET_KEY="P2Nerc3oG2564z5mHTGUhAoh2CzOMVenWBNMNWgWU796n"
ENV CLEAN_APT_CACHE="True"


RUN apt update

RUN apt -y install net-tools python-dev gfortran libatlas-base-dev libjpeg-dev python-numpy   python-pandas-doc openjdk-8-jre zlib1g-dev binutils libproj-dev libxslt1-dev libxslt1-dev libxml2-dev libmemcached-dev python-lxml  virtualenv nodejs  uuid-dev libcap-dev libpq-dev   python-dev build-essential uwsgi  unzip  wget ca-certificates git

RUN virtualenv -p /usr/bin/python2.7 $BAHIS_ENV

#copy requirements file to image
COPY requirements.txt .
RUN pip install -r requirements.txt

#Patching libgeos
COPY libgeos.py_fix .
RUN mv libgeos.py_fix $BAHIS_ENV/lib/python2.7/site-packages/django/contrib/gis/geos/libgeos.py

RUN git clone https://github.com/mixmixmix/bahis-serve-tmp.git $SRC_DIR
#give uwsgi some python2 abilities, long lost in the mist of the past
COPY python27_plugin.so .
RUN cp python27_plugin.so /usr/lib/uwsgi/plugins/

COPY bahis.ini .
CMD ["uwsgi", "--ini", "bahis.ini"]

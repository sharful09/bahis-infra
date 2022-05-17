#Usage:
#run with your current database you want o switch to:
#whichdb=coredb-29-03-2022.sql ./resetdb.sh
psql -U postgres -h localhost -p 99 -f init.sql
psql -U postgres -h localhost -p 99 -d coredb -f $whichdb

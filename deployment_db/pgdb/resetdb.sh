#Usage:
#run with your current database you want o switch to:
#whichdb=coredb-29-03-2022.sql ./resetdb.sh
set -e
psql -U postgres -h localhost -p 99 -f init.sql --set ON_ERROR_STOP
psql -U postgres -h localhost -p 99 -d coredb -f $whichdb --set ON_ERROR_STOP

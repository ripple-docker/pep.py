#!/bin/sh

sed -i 's/MYSQL_ROOT_PASSWORD/'"$MYSQL_ROOT_PASSWORD"'/g' config.ini
exec "$@"
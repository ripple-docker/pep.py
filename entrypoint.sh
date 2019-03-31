#!/bin/sh

sed -i 's/MYSQL_ROOT_PASSWORD/'"$MYSQL_ROOT_PASSWORD"'/g' config.ini
sed -i 's/CIKEYVALUE/'"$CIKEY"'/g' config.ini
exec "$@"
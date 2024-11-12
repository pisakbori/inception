#!/bin/sh

echo "before mysqld"

mysqld --user=mysql --bootstrap --verbose=0  --skip-networking=0 <<EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DB};
FLUSH PRIVILEGES;
CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PWD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PWD}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';
FLUSH PRIVILEGES;
EOF

echo =========================== after mysqld

mysqladmin -u root -p$MYSQL_ROOT_PWD shutdown;


echo ===========================after mysqladmin

exec mysqld_safe

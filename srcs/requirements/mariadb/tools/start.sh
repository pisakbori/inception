#!/bin/sh



echo ===========================

mysqld --user=mysql --bootstrap --verbose=0  --skip-networking=0 <<EOF
CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};
FLUSH PRIVILEGES;
CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

echo ===========================

# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown;
ps

echo ===========================

exec mysqld_safe

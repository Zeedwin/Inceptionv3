#!/bin/sh
DIRECTORY="/var/lib/mysql/$DB_NAME"

if ! [ -d "$DIRECTORY" ]; then
    cat << eof > /tmp/create_db.sql
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT';
FLUSH PRIVILEGES;
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
eof
    mariadbd --user=mysql &
    sleep 3
    mariadb < /tmp/create_db.sql
    printf '\n\n\nFLUSH TABLES;\n' >> dump.sql
    echo "use $DB_NAME;" | cat - dump.sql | mariadb
    kill %1
    rm /tmp/create_db.sql
fi
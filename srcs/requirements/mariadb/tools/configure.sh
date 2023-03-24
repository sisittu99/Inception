#!/bin/bash

if [ ! -d "/run/mysqld" ]
then
    mkdir -p /run/mysqld
    chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/mysql" ]
then
    chown -R mysql:mysql /var/lib/mysql
    
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null
    
    tmp='mktemp'

    if [ ! -f "$tmp" ]
    then
        return 1
    fi

    cat << EOF > $tmp
USE mysql; #usa il database sequel
FLUSH PRIVILEGES; #update dei permessi sul database
DELETE FROM mysql.user WHERE User='root'; #cancella dalla tabella user lo user di default ''
DROP DATABASE test; #cancella la tabella test
DELETE FROM mysql.db WHERE Db='test'; #cancella dalla tabella db il database test
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1'); #cancella dalla tabella degli user il campo root quando l'indirizzo di provenienza non è il localhost

ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; #cambia password utente root da localhost

CREATE DATABASE $WP_DB_NAME DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
CREATE USER $WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD';
GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

# IF NOT EXISTS $WP_DB_NAME
# IF NOT EXISTS $WP_DB_ADMIN IDENTIFIED BY $WP_DB_PASSWORD

    /usr/bin/mysqld --user=mysql --bootstrap < $tmp
    rm -f $tmp
    
fi

sed -i 's/skip-networking/# skip-networking/g' /etc/mysql/conf.d/mysql.cnf
sed -i "s/#bind-address=.*/bind-address=0.0.0.0/g" /etc/mysql/conf.d/mysql.cnf

echo "MariaDB starting"
#/usr/bin/mysqld
exec mysqld --user=mysql --console


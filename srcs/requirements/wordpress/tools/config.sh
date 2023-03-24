#!/bin/sh

echo "mariadb $(getent hosts mariadb | awk '{ print $1 }')" >> /etc/hosts

#wait for mariadb, then connect with credentials

##
while ! mysql -h$MYSQL_HOSTNAME -u$WP_DB_USER -p$WP_DB_PASSWORD $WP_DB_NAME &>/dev/null;
do
    sleep 3
done

chown -R mysql: /var/run/mysqld

if [ ! -f "/var/www/html/wordpress/index.php" ];
then

	#
	mv /tmp/index.html /var/www/html/wordpress/index.html

	## variabili
	wp core download --allow-root
	wp config create --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD --dbhost=$MYSQL_HOSTNAME --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp db create --allow-root
	wp core install --url=$DOMAIN_NAME --title="Inception" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root
	wp theme activate twentytwentythree --allow-root
    
fi

echo "WORDPRESS START STATUS : OK"

/usr/sbin/php-fpm7 -F -R

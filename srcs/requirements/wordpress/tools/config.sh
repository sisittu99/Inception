#!/bin/sh

#wait for mariadb, then connect with credentials

while ! mariadb --host=$DATABASE_NAME --user=$DATABASE_ADMIN --password=$DATABASE_ADMIN_PWD $DATABASE_NAME &>/dev/null;
do
    sleep 3
done

if [ ! -f "/var/www/html/wordpress/index.php" ];
then

	mv /tmp/index.html /var/www/html/wordpress/index.html


	wp core download --allow-root
	wp config create --dbname=$DATABASE_NAME --dbuser=$DATABASE_ADMIN --dbpass=$DATABASE_ADMIN_PWD --dbhost=$DATABASE_NAME --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp db create --allow-root
	wp core install --url=$DOMAIN_NAME --title="Inception" --admin_user=$DATABASE_ADMIN --admin_password=$DATABASE_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $USER_42 $WP_ADMIN_EMAIL --role=author --user_pass=$DATABASE_ADMIN_PWD --allow-root
	wp theme activate twentytwentythree --allow-root
    
fi

echo "WORDPRESS START STATUS : OK"

/usr/sbin/php-fpm7 -F -R
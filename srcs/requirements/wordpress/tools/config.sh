#!/bin/sh

#wait for mariadb, then connect with credentials

while ! mariadb -h $DATABASE_NAME -u $DATABASE_ADMIN -p $DATABASE_ADMIN_PWD $DATABASE_NAME &>/dev/null;
do
    sleep 3
done

if [ ! -f "/var/www/html/wordpress/index.php" ];
then

	mv /tmp/index.html /var/www/html/wordpress/index.html


	wp core download --allow-root
	wp config create --dbname=$DATABASE_NAME --dbuser=$DATABASE_ADMIN --dbpass=$DATABASE_ADMIN_PWD --dbhost=$MYSQL_HOSTNAME --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp db create --allow-root
	wp core install --url=$DOMAIN_NAME --title="Inception" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root
	wp theme activate twentytwentythree --allow-root
    
fi

echo "WORDPRESS START STATUS : OK"

/usr/sbin/php-fpm7 -F -R
#!/bin/sh

if [ ! -f /var/www/html/wp-config.php ]; then

cd /var/www/html

# Downloads WordPress core files, run the command as root
wp core download --version=6.6.2 --locale=en_US

# This will generate the WordPress configuration file
wp config create --dbname=${WP_DATABASE} --dbuser=${WP_USER} --dbpass=${WP_PASSWORD} --dbhost=${WP_HOST}

wp core install --url=$DOMAIN/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email

# Create a new WordPress user, and sets its role to author ( --role=author )
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD 
fi

exec php-fpm82 --nodaemonize

#!/bin/sh

if [ ! -d "/var/www/html" ]; then
  mkdir -p /var/www/html
fi

cd /var/www/html

# Downloads WordPress core files, run the command as root
wp core download --allow-root --version=6.6.2 --locale=en_US

# # This will generate the WordPress configuration file
wp config create --allow-root --dbname=${WP_DATABASE} --dbuser=${WP_USER} --dbpass=${WP_PASSWORD} --dbhost=${WP_HOST}

# Install WordPress
wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}

# Create a new WordPress user, and sets its role to author ( --role=author )
wp user create "${WP_USER}" "${WP_EMAIL}" --user_pass="${WP_PASSWORD}" --role=author

exec php-fpm82 --nodaemonize

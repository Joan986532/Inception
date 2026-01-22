#!/bin/bash

set -eu

if [ ! -f /usr/local/bin/wp/wp-cli.phar ]; then

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp core download --allow-root
fi

if [ ! -f /var/www/html/wp-config.php ]; then

	cd /var/www/html
	rm -f index.html index.nginx-debian-html
	wp config create --dbname=$SQL_NAME --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --allow-root
	wp core install --url=$DOMAIN_NAME --title=inception --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_MAIL --allow-root
	wp user create $WP_USER2 $WP_MAIL2 --role=author --user_pass=$WP_PASS2 --allow-root
	wp user set-role 2 editor --allow-root
fi

exec "$@"

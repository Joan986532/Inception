#!/bin/bash

set -eu

if [ ! -f /usr/local/bin/wp/wp-cli.phar ]; then

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
fi

if [ ! -f "wp-config.php" ]; then

	wp core download --allow-root
	wp config create --dbname=$SQL_NAME --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --allow-root
	wp core install --url=$DOMAIN_NAME --title=inception --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_MAIL --allow-root
	wp user create $WP_USER2 $WP_MAIL2 --role=author --user_pass=$WP_PASS2 --allow-root
	wp user set-role 2 editor --allow-root

	# REDIS
	wp config set WP_REDIS_HOST redis --allow-root
	wp config set WP_REDIS_PORT 6379 --allow-root
	wp config set WP_REDIS_DATABASE 0 --allow-root

	wp plugin install redis-cache --activate --allow-root
	wp redis enable --allow-root
	wp config set WP_CACHE true --raw --allow-root
fi

exec "$@"

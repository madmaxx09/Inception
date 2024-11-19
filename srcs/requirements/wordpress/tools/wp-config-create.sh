#!/bin/bash

if [ ! -d "/var/www/html/wordpress" ]; then
	mkdir -p /var/www/html/wordpress
	chmod 777 -R /var/www/html/wordpress
fi

cd /var/www/html/wordpress
rm -rf /var/www/html/wordpress/*

echo "before if"

if ! wp core is-installed 2>/dev/null; then

	echo "in if"

	wp core download	--allow-root
	echo "down"
	wp config create	--allow-root \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=mariadb:3306 \
						--path='/var/www/html/wordpress/'
	echo "confcreated"
	wp core install	--allow-root \
					--url=$MYWP_URL \
					--title="Hello World !" \
					--admin_user=$MYWP_ADMIN_USER \
					--admin_password=$MYWP_ADMIN_PASSWORD \
					--admin_email=$MYWP_ADMIN_EMAIL

	wp user create	--allow-root \
					$MYWP_SUB_USER \
					$MYWP_SUB_EMAIL \
					--role=$MYWP_SUB_ROLE \
					--user_pass=$MYWP_SUB_PASSWORD

	wp	--allow-root \
		theme install astra --activate

	wp	--allow-root \
		plugin update --all

	ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm
else
	echo "wordpress already downloaded"
fi

exec /usr/bin/php-fpm -F

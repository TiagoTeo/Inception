#!/bin/sh

# Create directories if they don't exist
mkdir /var/www 2> /dev/null
mkdir /var/www/html 2> /dev/null

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	curl -LO https://wordpress.org/latest.tar.gz
	tar xzvf latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress
    cp wp-config-sample.php wp-config.php

	# Import env variables in the config file
	sed -i "s/username_here/$DB_USER/g" wp-config.php
	sed -i "s/password_here/$DB_PASSWORD/g" wp-config.php
	sed -i "s/localhost/$DB_HOST/g" wp-config.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config.php
	# Core installation needs for wordpress and admin user added
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL}
	# Adds an extra user with no admin permissions
	wp user create --allow-root ${WP_USER} ${WP_EMAIL} --user_pass=${WP_USER_PASS};
fi

# Starts the PHP-FPM in the foreground
exec /usr/sbin/php-fpm7.4 -F
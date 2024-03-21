FROM debian:bullseye

# Install necessary packages (curl, php-mysqli, php-fpm) and clean up unecessary files
RUN apt-get update && apt-get -y install \
	curl \
	php-mysqli \
	php-fpm \
	&& rm -rf /var/lib/apt/lists/*

# Downloads and installs WordPress CLI (WordPress Command Line Interface) for managing WordPress installations.
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Create a directory for PHP runtime files to enable PHP to start correctly
RUN mkdir /run/php

COPY ./tools/script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh

EXPOSE 9000

ENTRYPOINT /usr/local/bin/script.sh



# ENTRYPOINT [ "tail", "-f", "/dev/null" ]
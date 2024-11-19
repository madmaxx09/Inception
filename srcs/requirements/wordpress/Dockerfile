FROM debian:bullseye

RUN apt-get update \
    && apt-get -y install wget \
	&& apt-get install -y php \
	&& apt-get install -y php-fpm \
	&& apt-get install -y php-mysql \
	&& apt-get install -y sendmail \
	&& apt-get install -y mariadb-client \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp \
	&& mkdir /run/php

COPY /conf/www.conf etc/php/7.4/fpm/pool.d/www.conf

COPY /tools/wp-config-create.sh /usr/local/bin

RUN chmod 777 -R /usr/local/bin/wp-config-create.sh

ENTRYPOINT ["bash", "usr/local/bin/wp-config-create.sh"]


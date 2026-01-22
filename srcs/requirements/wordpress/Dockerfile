FROM debian:bookworm

RUN apt update && apt upgrade && apt install -y curl wget php8.2 php-fpm php-mysql

RUN mkdir -p /run/php && chown www-data:www-data /run/php

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d
WORKDIR /var/www/html

COPY ./tools/script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/script.sh"]
CMD ["php-fpm8.2", "-F"]

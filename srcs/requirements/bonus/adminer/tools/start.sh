#!/bin/bash

cat /etc/php/8.2/fpm/pool.d/www.conf | grep listen

php-fpm8.2 -F &
PHP_PID=$!

for i in {1..10}; do
    if [ -S /run/php/php8.2-fpm.sock ]; then
        ls -la /run/php/php8.2-fpm.sock
        break
    fi
    sleep 1
done

if [ ! -S /run/php/php8.2-fpm.sock ]; then
    exit 1
fi

exec "$@"

#!/bin/bash

echo "=== Configuration PHP-FPM ==="
cat /etc/php/8.2/fpm/pool.d/www.conf | grep listen

echo "=== Démarrage PHP-FPM ==="
php-fpm8.2 -F &
PHP_PID=$!

echo "=== Attente du socket ==="
for i in {1..10}; do
    if [ -S /run/php/php8.2-fpm.sock ]; then
        echo "✓ Socket trouvé!"
        ls -la /run/php/php8.2-fpm.sock
        break
    fi
    echo "Attente... ($i/10)"
    sleep 1
done

if [ ! -S /run/php/php8.2-fpm.sock ]; then
    echo "✗ ERREUR: Socket introuvable!"
    echo "Contenu de /run/php/:"
    ls -la /run/php/
    echo "Logs PHP-FPM:"
    tail -20 /var/log/php8.2-fpm.log
    exit 1
fi

echo "=== Démarrage Nginx ==="
nginx -g 'daemon off;'

# php-fpm8.2 -F &
# nginx -g "daemon off;"

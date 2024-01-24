#!/bin/bash

echo "------------------------------------------------";
echo "Install composer dependencies";
echo "------------------------------------------------";

# Use if composer is inside a subdirectory
#composer -dsomesubdir install --prefer-dist
composer install --prefer-dist # --ignore-platform-reqs

echo "-----------------------------";
echo "RUN PHP";
echo "-----------------------------";
# -------------------
# Run PHP
# -------------------
set -e

echo Additional scanned directories: ${PHP_INI_SCAN_DIR}

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

exec "$@"
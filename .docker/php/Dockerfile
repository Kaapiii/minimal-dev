ARG PHP_VERSION

FROM php:${PHP_VERSION}-fpm
LABEL maintainer="Markus Liechti"

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

# Install additional PHP Extensions: https://github.com/mlocati/docker-php-extension-installer
RUN install-php-extensions @composer gd xdebug

RUN apt-get update \
    && apt-get install -y msmtp git zip

RUN if ! id -u $APP_UID > /dev/null 2>&1; then useradd -u$APP_UID payrexx-fpm; else echo "Skipping User Creation"; fi && \
    # configure msmtp
    printf "account default\nhost mailhog\nport 1025\nfrom \"dev@minimal.localhost\"" > /etc/msmtprc && \
    # Alias for xdebug CLI
    echo "alias debug=\"PHP_IDE_CONFIG='serverName=localhost' XDEBUG_CONFIG='idekey=PHPSTORM' php\"" >> /etc/bash.bashrc

WORKDIR /srv/app/

#Copy xdebug settings ini file
COPY .docker/php/conf.d/ /usr/local/etc/php/conf.d/

COPY .docker/php/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["php-fpm"]

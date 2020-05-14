FROM php:7.4.5-fpm-alpine3.11 as base
RUN set -ex && apk --update --no-cache add git icu-dev postgresql-dev libzip-dev zlib-dev postgresql-libs postgresql-dev && \
docker-php-ext-install pgsql pdo_pgsql bcmath intl opcache zip && \
chown -R www-data:www-data /var/www && chmod -R 755 /var/www
COPY --from=composer /usr/bin/composer /usr/bin/composer
WORKDIR /var/www
EXPOSE 9001

FROM base as debug
RUN apk --update --no-cache add autoconf g++ make && \
    pecl install -f xdebug-2.9.4 && \
    docker-php-ext-enable xdebug && \
    apk del --purge autoconf g++ make
COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
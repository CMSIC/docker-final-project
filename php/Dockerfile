FROM php:8.1-fpm-alpine

WORKDIR /var/www/html

EXPOSE 9000

RUN apk add --no-cache curl

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apk add --no-cache zip libzip-dev
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo pdo_mysql
FROM php:7.0-fpm

# Copie les fichiers du projet dans le container
COPY . /app


RUN apk add --no-cache curl

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
#copy in the "/" test.txt
COPY test.txt /var/www/html/



RUN apk add --no-cache zip libzip-dev
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install nodejs



WORKDIR /var/www/html

EXPOSE 9000

# Execute les commandes necessaire pour laravel (composer install , npm run build, php artisan migrate:fresh --seed)
RUN composer install && npm install && npm run build &&  php artisan migrate:fresh --seed

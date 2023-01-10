FROM php:7.4-fpm

# Copie les fichiers du projet dans le container
COPY . /app

# Installe les dépendances de l'application
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    && docker-php-ext-install pdo_mysql \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install --working-dir=/var/www/html

# Change le propriétaire des fichiers
RUN chown -R www-data:www-data /var/www/html

# change le répertoire de travail
WORKDIR /var/www/html

RUN apk add --no-cache curl

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Execute les commandes necessaire pour laravel (composer install , npm run build, php artisan migrate:fresh --seed)
RUN composer install && npm install && npm run build &&  php artisan migrate:fresh --seed

# Expose le port 9000 pour PHP
EXPOSE 9000

# Spécifie le utilisateur qui va executer le processus
USER www-data
FROM php:8.1-fpm
#Quand vous mélangez docker-compose et Dockerfile, ça sert à rien de préciser l'image dans le docker-compose, 
#HEIIIIIN C PR CA QUE CA MARCHE PAS !!!!!!!
#L'image de PHP est trop ancienne pour le composer install, je cherche un tag + récent
#php:latest au pire ? 
#Oui et non, latest si jamais y'a une version de PHP trop récente, ton Dockerfile peut ne plus fonctionner 
#true true 
#On va tester la 7.4 pour voir
#Y'aura pleins d'images que tu devras retirer parce que ça rajoute des images
# Copie les fichiers du projet dans le container

RUN apt update && apt install -y git zip unzip
COPY . /app

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
#copy in the "/" test.txt
COPY test.txt /var/www/html/


#RUN apk add --no-cache zip libzip-dev
#RUN docker-php-ext-configure zip
#RUN docker-php-ext-install zip
#RUN docker-php-ext-install pdo pdo_mysql
#RUN docker-php-ext-install nodejs

COPY app /var/www/html/app
#J'vais essayer de regarder pk ça reconnait pas le chemin
#pause ?????
WORKDIR /var/www/html/app

EXPOSE 9000

# Execute les commandes necessaire pour laravel (composer install , npm run build, php artisan migrate:fresh --seed)
#RUN composer install && npm install && npm run build &&  php artisan migrate:fresh --seed
RUN composer install
#RUN php artisan migrate:fresh --seed ça au pire tu le feras manuellement c'est pas un soucISOKok

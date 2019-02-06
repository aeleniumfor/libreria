FROM php:7.0-apache

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    adduser libreria
    
RUN apt update 
RUN apt install -y git zip unzip

USER libreria
WORKDIR /var/www/html/libreria/app


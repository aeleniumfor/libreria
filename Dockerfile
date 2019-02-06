FROM ubuntu:18.04


RUN apk add curl && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    adduser libreria
USER libreria
WORKDIR /libreria/app

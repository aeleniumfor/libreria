#!/bin/sh
docker stop libreria
# docker build ./ -t libreria
dockerid=$(docker run --rm -p 8081:80 -v $(pwd)/app:/var/www/html/libreria/app --name libreria -d php:7.0-apache)
echo $dockerid
#
docker exec $dockerid /bin/bash -c "curl -sS https://getcomposer.org/installer | php"
docker exec $dockerid /bin/bash -c "adduser libreria"
docker exec $dockerid /bin/bash -c "apt update && apt install -y git zip unzip && rm composer.phar"
docker exec $dockerid /bin/bash -c "cd /var/www/html/libreria/app && composer install"
docker exec -it $dockerid /bin/bash

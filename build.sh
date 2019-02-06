#!/bin/sh
if [ $0 -eq "build" ]; then 
    docker stop libreria
    dockerid=$(docker run --rm -p 8081:80 -v $(pwd)/app:/var/www/html/libreria/app --name libreria -d php:7.0-apache)
    echo $dockerid
    docker exec $dockerid /bin/bash -c "curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer"
    docker exec $dockerid /bin/bash -c "adduser libreria"
    docker exec $dockerid /bin/bash -c "apt update && apt install -y git zip unzip"
    docker exec $dockerid /bin/bash -c "su libreria && cd /var/www/html/libreria/app && composer install"
elif [$0 -eq "exec"]; then
    docker exec -it $dockerid /bin/bash

fi

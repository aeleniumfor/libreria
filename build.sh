#!/bin/sh
if [ $1 = "build" ]; then 
    dockerid=$(docker ps --filter name=libreria_php7_1 --format "{{.ID}}")
    docker exec $dockerid /bin/bash -c "curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer"
    docker exec $dockerid /bin/bash -c "adduser libreria"
    docker exec $dockerid /bin/bash -c "apt update && apt install -y git zip unzip"
    docker exec $dockerid /bin/bash -c "su libreria && composer install"
elif [ $1 = "stop" ]; then
    docker-compose down -v
else
    echo $dockerid
fi

#!/bin/sh
if [ $1 = "build" ]; then 
    docker stop libreria
    dockerid=$(docker run --rm -p 8081:80 -v $(pwd)/html:/var/www/html --name libreria -d php:7-fpm)
    docker exec $dockerid /bin/bash -c "curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer"
    docker exec $dockerid /bin/bash -c "adduser libreria"
    docker exec $dockerid /bin/bash -c "apt update && apt install -y git zip unzip"
    docker exec $dockerid /bin/bash -c "su libreria && composer install"
elif [ $1 = "exec" ]; then
    dockerid=$(docker ps --filter name=libreria --format "{{.ID}}")
    docker exec -it $dockerid /bin/bash
else
    echo $dockerid
fi

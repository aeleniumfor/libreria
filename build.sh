docker stop libreria
docker rm libreria
docker build ./ -t libreria
docker rmi $(docker images -f "dangling=true" -q)
docker run -v $(pwd)/app:/libreria/app  --name libreria -it libreria ash

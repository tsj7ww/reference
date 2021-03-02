# ...
docker system prune

# clean up all containers
docker stop $(docker ps -aq) # ps = list docker ids
docker rm $(docker ps -aq)
docker rmi $(docker images -q)

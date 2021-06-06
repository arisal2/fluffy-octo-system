# Script to nuke everything related to docker - sometimes it is necessary during development
# BE CAREFUL WITH THIS SCRIPT AS IT WILL REMOVE EVERYTHING RELATED TO DOCKER
# USE AT YOUR OWN RISK
# You HAVE BEEN WARNED

# echo 'Clearing containers...'
docker rm -f $(docker ps -a -q)

# echo 'Clearing images...'
docker rmi -f $(docker images -a -q)

# echo 'Clearing volumes...'
docker volume prune

# echo 'Clearing networks...'
docker network prune
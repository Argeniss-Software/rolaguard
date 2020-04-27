echo "Tagging Docker images..."

docker image tag postgres:community rolaguardcommunity/postgres:latest
docker image tag backend:community rolaguardcommunity/backend:latest
docker image tag frontend:community rolaguardcommunity/frontend:latest
docker image tag data-collectors:community rolaguardcommunity/data-collectors:latest
docker image tag packet-writer:community rolaguardcommunity/packet-writer:latest
docker image tag engine:community rolaguardcommunity/engine:latest
docker image tag system-backoffice:community rolaguardcommunity/system-backoffice:latest

# to check all docker's images were built
docker images

echo "Pushing Docker images to dockerhub..."

docker login -u rolaguardcommunity

docker push rolaguardcommunity/postgres:latest
docker push rolaguardcommunity/backend:latest
docker push rolaguardcommunity/frontend:latest
docker push rolaguardcommunity/data-collectors:latest
docker push rolaguardcommunity/packet-writer:latest
docker push rolaguardcommunity/engine:latest
docker push rolaguardcommunity/system-backoffice:latest

echo "Building Docker images..."

docker build -t postgres:community ../../../postgres
docker build -t backend:community ../../../backend
docker build -t frontend:community ../../../frontend
docker build -t data-collectors:community ../../../data-collectors
docker build -t packet-writer:community ../../../packet-writer
docker build -t engine:community ../../../engine
docker build -t system-backoffice:community ../../../system-backoffice

# to check all docker's images were built
docker images
#!/bin/sh
chmod +x Build-DockerImages.sh
chmod +x Deploy-DockerImages.sh

echo "Setting up Minikube..."

# to check minikube health
echo ">>> minikube status <<<"
minikube status

# to point your shell to minikube's docker-daemon
eval $(minikube -p minikube docker-env)

# to check if we're looking docker's images inside minikube
echo ">>> docker images <<<"
docker images

# to build docker's images inside minikube
echo ">>> ./Build-DockerImages <<<"
./Build-DockerImages.sh

# to deploy docker's images to minikube
echo ">>> ./Deploy-DockerImages <<<"
./Deploy-DockerImages.sh

# if you want to use images from dockerhub, please comment the previous two commands: ./Build-DockerImages.ps1 and ./Deploy-DockerImages.ps1
#echo ">>> ./Deploy-DockerHubImages <<<"
#./Deploy-DockerHubImages.sh

# to list IP and ports exposed
echo ">>> minikube service postgres --url <<<"
minikube service postgres --url

echo ">>> Setting Kubernetes IP in /etc/hosts. You might need to enter yout password: <<<"
# update or add the new minikube ip to hosts file
MINIKUBE_IP=$(minikube ip)
HOSTS_ENTRY="$MINIKUBE_IP localhost.rolaguard"

if grep -Fq "localhost.rolaguard" /etc/hosts > /dev/null
then
    sudo sed -i '' '/localhost.rolaguard/d' /etc/hosts
    echo "$HOSTS_ENTRY" | sudo tee -a /etc/hosts
    echo "Updated hosts entry"
else
    echo "$HOSTS_ENTRY" | sudo tee -a /etc/hosts
    echo "Added hosts entry"
fi
open http://localhost.rolaguard:30003/

# to open k8s dashboard into default browser
echo ">>> minikube dashboard <<<"
minikube dashboard
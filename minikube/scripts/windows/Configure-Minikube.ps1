echo "Setting up Minikube..."

# to check minikube health
echo ">>> minikube status <<<"
minikube status

# to point your shell to minikube's docker-daemon
minikube -p minikube docker-env | Invoke-Expression

# to check if we're looking docker's images inside minikube
echo ">>> docker images <<<"
docker images

# to build docker's images inside minikube
echo ">>> ./Build-DockerImages <<<"
./Build-DockerImages.ps1

# to deploy docker's images to minikube
echo ">>> ./Deploy-DockerImages <<<"
./Deploy-DockerImages.ps1

# if you want to use images from dockerhub, please comment the previous two commands: ./Build-DockerImages.ps1 and ./Deploy-DockerImages.ps1
#echo ">>> ./Deploy-DockerHubImages <<<"
#./Deploy-DockerHubImages.ps1

# to list IP and ports exposed
echo ">>> minikube service postgres --url <<<"
minikube service postgres --url

# remove old minikube ip from hosts file
$hosts = "$env:windir\System32\drivers\etc\hosts"
(Get-Content $hosts) -notmatch "localhost.rolaguard" | Out-File $hosts

# add hte new minikube ip to hosts file
$minikube_ip = minikube ip
echo "$minikube_ip localhost.rolaguard" >>  $hosts
echo ">>> updated hosts file with new minikube IP: $minikube_ip <<<"
start http://localhost.rolaguard:30003/

# to open k8s dashboard into default browser
echo ">>> minikube dashboard <<<"
minikube dashboard
# Install and run RoLaGuard on Linux

This guide provide the steps needed to install and run RoLaGuard in a Linux machine with Ubuntu 18.04 or newer.

## Prerequisites

Open a console and run the following lines to install some dependencies

```bash
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates software-properties-common curl gcc git dnsmasq openvpn bridge-utils resolvconf
```

### Choose a driver

Minikube can use two drivers to run, virtualbox or kvm2. Choose one and install the needed packages.

#### Virtualbox

```bash
sudo apt-get install virtualbox virtualbox-ext-pack
```

#### KVM

```bash
sudo apt-get install qemu-kvm qemu virt-manager virt-viewer libvirt-bin
```

### Download and install minikubes, docker and kubectl

Download the latest versions of the software and install them.

#### Minikubes

```bash
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube
```

#### Kubectl

```bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

#### Docker

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce
```

### Docker machine

```bash
curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` -o ~/docker-machine
chmod +x ~/docker-machine
sudo cp ~/docker-machine /usr/local/bin/
```

## Run RoLaGuard

First, give all the scripts execution permissions

```bash
chmod +x *.sh
```

To run RoLaGuard simply run

```bash
./Run-Rolaguard.sh
```

## Optional: separated steps

The *run_rolaguard.sh* script deletes old files, download and start the K8s cluster, build the docker images of each RoLaGuard component and deploy all these images. If you only want to start the K8s cluster, run the following line:

```bash
./Start-Minikube.sh
```

To only build and deploy the docker images (the cluster must be up!):

```bash
./Configure-Minikube.sh
```

## Optional: build & deploy local Docker images separately

After having created the K8s cluster with minikube (it's important to have the cluster running before building the images!), you can build the local Docker images with the provided scripts.

To build altogether run:

```bash
./Build-DockerImages.sh
```

If you want to build the components separately, comment out the specif line in this file.

After having build all necessary Docker images, deploy the services/deployments with:

```bash
./Deploy-DockerImages.sh
```

If you want to deploy the components separately, comment out the specif line in this file.

## Minikube dashboard

To open the Kubernetes Dashboard run the following line:

```bash
minikube dashboard
```

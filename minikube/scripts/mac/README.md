## Install and run RoLaGuard in macOS

#### Prerequisites

* **Install Virtualbox** 
```
brew cask install virtualbox
```

* **Install Docker CLI** (skip it, if you already have _Docker Desktop_ installed) 
```
brew install docker
```

* **Install Kubernetes CLI** (skip it, if you already have _Docker Desktop_ installed)
```
brew install kubectl 
```
`source:` [Install with Homebrew on macOS](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-with-homebrew-on-macos)
* **Install Minikube**
```
brew install minikube
```
`source:` [Install Minikube using Homebrew](https://kubernetes.io/docs/tasks/tools/install-minikube/)


#### Run RoLaGuard Community Edition on Minikube cluster
```
cd ./minikube/scripts/mac/
chmod +x Run-Minikube.sh
./Run-Minikube.sh
```

## Minikube dashboard

To open the Kubernetes Dashboard run the following line:

```bash
minikube dashboard
```

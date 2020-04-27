## Install RoLaGuard on Windows

> The following platform and Minikube version was tested:
> minikube v1.8.1 on Microsoft Windows 10 Pro N Build 18363

Open a Windows PowerShell (**Admin**) console (`Win+X > A`)

#### Prerequisites

* **Change execution policy** to run PowerShell scripts (if applicable)
```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

* **Install Chocolatey** package manager for Windows (skip it, if you already have _Chocolatey_ installed)
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
`source:` [Installing Chocolatey](https://chocolatey.org/install)

* **Enable Hyper-V** or install VirtualBox
```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```
`source:` [Install Hyper-V on Windows 10](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v?redirectedfrom=MSDN)

`note:` if you have Windows 10 Home Edition, you can't enable Hyper-V (see [Windows 10 Hyper-V System Requirements](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/reference/hyper-v-requirements?redirectedfrom=MSDN)), in this case you must install VirtualBox
```
choco install virtualbox
```
`source:` [VirtualBox](https://chocolatey.org/packages/virtualbox)

* **Install Docker CLI** (skip it, if you already have _Docker Desktop_ installed)
```
choco install docker-cli
```
`source:` [Docker CLI](https://chocolatey.org/packages/docker-cli)

* **Install Kubernetes CLI** (skip it, if you already have _Docker Desktop_ installed)
```
choco install kubernetes-cli
```
`source:` [Install on Windows using Chocolatey or Scoop](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-on-windows-using-chocolatey-or-scoop)

* **Install Minikube**
```
choco install minikube
```
`source:` [Install Minikube using Chocolatey](https://kubernetes.io/docs/tasks/tools/install-minikube/)

#### Run RoLaGuard Community Edition on Minikube cluster

```
cd ./minikube/scripts/windows/
Get-Item -Path *.* -Filter *.ps1 -Stream "Zone.Identifier" -ErrorAction SilentlyContinue | foreach {Unblock-File -Path $_.FileName }
./Run-Minikube.ps1
```

##### Start Minikube cluster

```
cd ./minikube/scripts/windows/
Get-Item -Path *.* -Filter *.ps1 -Stream "Zone.Identifier" -ErrorAction SilentlyContinue | foreach {Unblock-File -Path $_.FileName }
./Start-Minikube.ps1
```

##### Build & Deploy local Docker images

To build and deploy altogether run:
```
./Configure-Minikube.ps1
```

##### Optional: Build & Deploy local Docker images separatly
###### Build local Docker images

After having created the K8s cluster with minikube (it's important to have the cluster running before building the images!), you can build the local Docker images with the following provided scripts.

To build altogether run:
```
./Build-DockerImages.ps1
```

If you want to build the components separately, comment out the specif line in ``Build-DockerImages.ps1``

###### Deploy Docker images in local K8s cluster

After having build all necessary Docker images, deploy the services/deployments with the provided scripts.

To deploy altogether run:

```
./Deploy-DockerImages.ps1
```

If you want to deploy the components separately, comment out the specif line in ``Deploy-DockerImages.ps1``

#### Notes

## Minikube dashboard

To open the Kubernetes Dashboard run the following line:

```bash
minikube dashboard
```

##### VirtualBox issues
* VirtualBox and Hyper-V are having a conflict<br />
If your computer is running Hyper-V. VirtualBox won't boot a 64bits VM when Hyper-V is activated. Either use Hyper-V as a driver, or disable the Hyper-V hypervisor. (To skip this check, use `minikube start` with `--virtualbox-no-vtx-check`)<br />
Suggestion: use  `minikube start` with `--driver=hyperv` or disable Hyper-V using (run as Administrator, it requires a restart): 
```
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
```
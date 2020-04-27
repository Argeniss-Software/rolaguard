[![Argeniss](https://media-exp1.licdn.com/dms/image/C4E0BAQECczwxIh_lPg/company-logo_200_200/0?e=1593043200&v=beta&t=6L_SOvjBESf5QRyxgCznlBMmo-gPkq-4f1bhtEmID7U)](https://argeniss.com/)

# RoLaGuard Community Edition

## Run RoLaGuard from a virtual machine

The easiest way to run RoLaGuard is to use a VM with Minikube, with all components preinstalled, and ready to use.
1. Download the VM file from [here](https://rolaguard-community.s3-us-west-2.amazonaws.com/ova/2020-04-15/rolaguard-minikube.ova), it's an OVA file, you could import on any hosted hypervisor software (we recommend [VirtualBox](https://www.virtualbox.org/wiki/Downloads))
1. Import the VM downloaded into your system: `VBoxManage import rolaguard-minikube.ova`
1. Power on the VM imported: `VBoxManage startvm "rolaguard-minikube" --type headless`
1. Access to RoLaGuard from your browser: http://localhost:30003 
<br><br>

>###### Notes:
>* To power off your VM, just run: `VBoxManage controlvm "rolaguard-minikube" acpipowerbutton`
>* If it's needed, you could access to your VM: `ssh -p 11122 root@127.0.0.1` with password: root
>* And also, you could see the Kubernetes Dashboard [here](http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/)
 

<br><br>
## Run RoLaGuard in a Minikube cluster
1. Clone this project and its submodules `git clone --recurse-submodules https://github.com/Argeniss-Software/rolaguard`

To install [Minikube](https://minikube.sigs.k8s.io/) and configure RoLaGuard Community Edition on a local Kubernetes cluster follow the instructions for your OS:

* [Windows](./minikube/scripts/windows/README.md)
* [macOS](./minikube/scripts/mac/README.md)
* [Linux](./minikube/scripts/linux/README.md)

Once Minikubes is running and all RoLaGuard conponents are active, to access the RoLaGuard web interface, write this address in you web browser:

http://localhost.rolaguard:30003

To access the system use these credentials:

* user: admin
* password: admin

> _Please, remember to change the password!!_

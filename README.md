[![Argeniss](https://media-exp1.licdn.com/dms/image/C4E0BAQECczwxIh_lPg/company-logo_200_200/0?e=1593043200&v=beta&t=6L_SOvjBESf5QRyxgCznlBMmo-gPkq-4f1bhtEmID7U)](https://argeniss.com/)

# RoLaGuard Community Edition

## Run RoLaGuard from a virtual machine

The easiest way to run RoLaGuard is to use a VM with all components preinstalled and ready to use. Download the VM file from [here](https://rolaguard-community.s3-us-west-2.amazonaws.com/ova/rolaguard-compose.ova)(MD5 checksum= 0e4a299dc7787d51accb4e923b1cc0ca). It's an OVA file you can import on any hosted hypervisor software (we recommend [VirtualBox](https://www.virtualbox.org/wiki/Downloads)).

### Using VirtualBox GUI
1. Open VirtualBox
1. File -> Import Appliance
1. Locate your OVA file in the import box -> Continue -> Import

### Using VirtualBox in the console
1. Import the VM downloaded into your system: `VBoxManage import path/to/rolaguard-compose.ova`
1. Power on the VM imported: `VBoxManage startvm "rolaguard-compose" --type headless`

### Log into RolaGuard
1. Once the VM is running, it will start to load all the RoLaGuard services.
1. Wait a couple minutes to let all the components start and follow this link http://localhost:30000.
1. Sign in to the system using admin/admin as user and password (remember to change the password). An open network server is pre-loaded for testing, therefore, some alerts must appear. 

> Notes:
>* To power off your VM, just run: `VBoxManage controlvm "rolaguard-compose" acpipowerbutton`
>* If it's needed, you could access to your VM: `ssh -p 11122 root@127.0.0.1` with password: root
 
## Run RoLaGuard using docker-compose

To install docker-compose, go to [this link](https://docs.docker.com/compose/install/) and follow the instructions for your OS. Note that for Windows and MacOS, docker-compose is included in Docker desktop. For Linux, you'd have to download both programs separately

After docker-compose is installed, follow these steps:

1. Clone this project and its submodules `git clone --recurse-submodules https://github.com/Argeniss-Software/rolaguard && cd rolaguard` 
1. Execute `docker-compose up`. Running this command will pull the images from [DockerHub](https://hub.docker.com/search?q=rolaguard&type=image). If you prefer to build the images locally, you have to run these commands before:
    ``` bash
    docker build -t rolaguardcommunity/postgres:latest ./postgres
    docker build -t rolaguardcommunity/backend:latest ./backend
    docker build -t rolaguardcommunity/frontend:latest ./frontend
    docker build -t rolaguardcommunity/data-collectors:latest ./data-collectors
    docker build -t rolaguardcommunity/packet-writer:latest ./packet-writer
    docker build -t rolaguardcommunity/engine:latest ./engine
    docker build -t rolaguardcommunity/system-backoffice:latest ./system-backoffice
    ```
1. Once you executed `docker-compose up`, **wait until all the components init** (it may take a couple minutes) and access the RoLaGuard web interface following this link http://localhost:30000.

To access the system use these credentials:

* user: admin
* password: admin

> _Please, remember to change the password_

An open network server is pre-loaded, therefore, some alerts must appear.


## Run RoLaGuard using Makefile
To start up the system locally with all the modules running inside docker containers, simply run _make all_ command. This will clean up the database, pull the develop branch of all modules, and build the images. It'll take a time to finish its execution, so please be patient. Go to the [Makefile](./Makefile) to see other options. 

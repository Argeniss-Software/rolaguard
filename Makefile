pull-all: # checkout to latests branches and pull
	cd postgres && git checkout master && git pull
	cd backend && git checkout develop && git pull
	cd data-collectors && git checkout develop && git pull
	cd engine && git checkout develop && git pull
	cd frontend && git checkout develop && git pull
	cd packet-writer && git checkout develop && git pull
	cd system-backoffice && git checkout develop && git pull


pull-submods-master: # pull all submodules from master
	git submodule foreach git pull origin master

pull-submods-develop: # pull all submodules from develop
	git submodule foreach git pull origin develop

build-imgs-local: # build images locally
	docker build -t rolaguardcommunity/postgres:latest ./postgres
	docker build -t rolaguardcommunity/backend:latest ./backend
	docker build -t rolaguardcommunity/frontend:latest ./frontend
	docker build -t rolaguardcommunity/data-collectors:latest ./data-collectors
	docker build -t rolaguardcommunity/packet-writer:latest ./packet-writer
	docker build -t rolaguardcommunity/engine:latest ./engine
	docker build -t rolaguardcommunity/system-backoffice:latest ./system-backoffice

up:
	docker-compose up -d

up-debug:
	docker-compose up

dstop: 
	docker-compose stop

drm:
	docker-compose rm

cdb: #clean db
	cd postgres && sudo rm -Rf db-data/

# basically clean all, pull develop on submodules, build images locally and start up the system!
all: dstop drm cdb pull-all build-imgs-local up
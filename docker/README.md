Vagrant Image mit Docker
------------------------

### Übersicht 

    +---------------------------------------------------------------+
    ! Container-Engine: Docker                                      !	
    +---------------------------------------------------------------+
    ! Gast OS: Ubuntu 16.04                                         !	
    +---------------------------------------------------------------+
    ! Hypervisor: VirtualBox                                        !	
    +---------------------------------------------------------------+
    ! Host-OS: Windows, MacOS, Linux                                !	
    +---------------------------------------------------------------+
    ! Notebook - Schulnetz 10.x.x.x                                 !                 
    +---------------------------------------------------------------+
	
### Beschreibung

Einfache VM mit Docker installiert.

In der VM können folgende Beispiele ausprobiert werden:

* [apache - Apache Web Server](apache/)
* [db - MySQL Datenbank](mysql/)
* [apache4X - Scriptscript welches 4 Web Server Container erstellt](apache4X/)
* [compose - Docker Compose](compose/)
* [dotnet - .NET Entwicklungsumgebung](dotnet/)
* [microservice - Micro Service mit Node.js](microservice/)
* [jenkins - Build Umgebung](jenkins/)

Die Beispiele befinden sich, in der VM, im Verzeichnis `/vagrant`. Die Anwahl ist wie folgt:

	vagrant up
	vagrant ssh
	cd /vagrant/<Beispiel>
	
**Beispiele mit eigener VM**

Folgende Beispiele erzeugen eine oder mehrere VMs' welche mittels Docker Swarm oder Data Center zusammengehängt werden können.

* [swarm - Docker Swarm](swarm/)
* [dc - Docker Data Center](dc/)


### Aktivierung Docker TCP Port (2375, 2376)

Soll via docker for Windows auf die Docker Engine in der VM zugegriffen werden ist der Port 2375 (unverschlüsselt) oder 2376 (verschlüsselt) freizuschalten.

Dazu in der VM die Datei `/etc/systemd/system/multi-user.target.wants/docker.service` folgenden Eintrag erweitern:

	ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375
	
Service docker und systemd restarten

    sudo systemctl daemon-reload
    sudo service docker restart

Der Port 2375 muss dann in der VirtualBox Oberfläche oder in `Vagrantfile` freigegeben werden

	config.vm.network "forwarded_port", guest:2375, host:2375, auto_correct: false
	
oder ein Privates Netzwerk (besser) eingerichtet werden:

    config.vm.network "private_network", ip: "192.168.55.100"	
	
Der Zugriff via docker for Windows erfolgt dann mittels:

	docker -H tcp://localhost ...
	docker -H tcp://192.168.55.100 ...
	
z.B.

	docker -H tcp://localhost run hello-world
	
**Links:**

* [dockerd](https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-socket-option)

### Docker REST

Wenn wie oben der Docker Port aktiviert ist, kann via REST (curl) Aufrufen auf Docker zugegriffen werden.

Anzeige der Images:

	curl http://192.168.55.100:2375/v1.24/images/json 

Erstellen eines Containers:

	curl -X POST -H "Content-Type: application/json" \
	     http://192.168.55.100:2375/v1.24/containers/create \
	     -d '{ "Image": "hello-world" }'

Anschliessend kann der Container anhand der ID gestartet werden:

    curl -X POST -H "Content-Type: application/json" http://192.168.55.100:2375/v1.24/containers/<id>/start

**Links:**

* [Getting started with the Engine API](https://docs.docker.com/engine/api/getting-started/)

### Alternativen (docker-machine - nur Windows) mit VirtualBox

docker for Windows installieren und bei der Aufforderung `hyper-v` zu aktivieren Abbrechen!

Git-Bash starten und neue VM mittels folgenden Befehlen erstellen:

	docker-machine create -d "virtualbox" dockervm
	
Zugriffsinformationen ausgeben:	
	
	docker-machine env dockervm
	
`export` Anweisungen kopieren und in Git-Bash ausführen, z.B. 

    export DOCKER_TLS_VERIFY="1"
    export DOCKER_HOST="tcp://192.168.99.100:2376"
    export DOCKER_CERT_PATH="C:\Users\...\.docker\machine\machines\dockervm"
    export DOCKER_MACHINE_NAME="dockervm"
    export COMPOSE_CONVERT_WINDOWS_PATHS="true"

Ausprobieren mittels

	docker run hello-world
	
Um eine Shell in einem Docker Container zu starten ist `winpty` Voranzustellen

	winpty docker run --rm -it ubuntu bash
	
In die VM kann mittels `ssh` gewechselt werden:

	ssh -i $DOCKER_CERT_PATH/id_rsa docker@192.168.99.100


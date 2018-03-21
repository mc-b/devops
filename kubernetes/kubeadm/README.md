Kubernetes Installation via kubeadm
-----------------------------------

Ausgehend von Vagrantfile mit Docker Installation wird zusätzlich Kubernetes installiert.

**TODO:** Ingress Addon Installieren.

### Installation

[docker](https://download.docker.com/win/static/stable/x86_64/) und [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) downloaden in in PATH ablegen

Dieses Repository in der Git/Bash Shell clonen:

	git clone https://github.com/mc-b/devops.git

Virtuelle Maschine erstellen:

	cd devops/kubernetes/kubeadm
	vagrant up

Evtl. ist vorher die fixe IP und der Hostname im Vagrantfile anzupassen. Siehe Bemerkungen im Vagrantfile.

Beim Starten werden zwei Verzeichnisse angelegt:

- .docker - Zertifikate für Docker Client 
- .kube - Konfigurationsdatei und Zertifikate für Kubernetes.

Diese zwei Verzeichnisse sind ins HOME Verzeichnis des Users zu kopieren.

Anschliessend kann mittels `docker` und `kubectl` die Kubernetes VM gesteuert werden

	docker -H <fixe IP>:2376 --tls ps
	kubectl get services

Um auf die `-H` und `--tls` Argumente verzichten zu können sind folgende Umgebungsvariablen zu setzen:

	DOCKER_HOST=tcp://<fixe-IP>:2376
	DOCKER_TLS_VERIFY=1

Wird die IP-Adresse oder der Hostname geändert, muss die Virtuelle Maschine frisch erstellt werden.

ACHTUNG: Evtl. gesetzte Umgebungsvariablen `DOCKER_CERT_PATH` dürfen nicht gesetzt sein.

### Dashboard

Das Dashboard ist Standardmässig nicht erreichbar. Dazu muss zuerst ein Proxy zur lokalen Maschine eingerichtet werden:
	
	kubectl proxy
	
Anschliessend kann das Dashboard angewählt werden. Der Logindialog kann mit `Skip` übersprungen werden.

[http://localhost:8001/ui/](http://localhost:8001/ui/)

### Neue Nodes hinzufügen (nicht getestet)

Neue Nodes können mittels der Standard Vagrant Docker Umgebung aufgesetzt werden. Der Master muss
via ssh sich mit den Nodes verbinden können.

Anschliessend sind auf jeder Node der Token und Hash, von der Ausgabe von `kubeadm init` wie folgt auszuführen:

	kubeadm join --token <token> --discovery-token-ca-cert-hash <hash>
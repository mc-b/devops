Kubernetes Beispiele
--------------------

### Benötigte Software

* [Git](https://git-scm.com/)
* [VirtualBox](https://www.virtualbox.org/)

**Hinweis:** Git auf Windows ohne CR/LF Umwandlung installieren.

Für die weitergehenden Beispiele wird die Ausführbare Datei `docker` benötigt. Trick: Download neuste [Zip-Datei](https://download.docker.com/win/static/stable/x86_64/), diese entpacken und `docker.exe` im PATH ablegen.  

### Beispiele

* [Internet der Dinge](iot)
* [OS Ticket](osticket)
* [MySQL und Adminer](mysql)
* [Compiler](compiler)
* [Big Data](bigdata)
* [Minio](minio)
* [Helm](helm)
* [Tests - ohne Beschreibung](test)

### Starten und Stoppen von Containern/Pods

Nach einer der untenstehenden Installationsarten (Vagrant, Minikube, Docker) können Container/Pods mittels dem CLI [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) oder via Weboberfläche gestartet werden.

Am einfachsten ist es wenn eine Beschreibung im YAML Format, z.B. [fhem.yaml](iot/fhem.yaml) vorhanden ist.

Z.B. FHEM Hausautomation Service starten

	kubectl create -f iot/fhem-port.yaml
	
Alle erstellte Objekte anzeigen lassen

	kubectl get all -o wide	
	
oder 

	kubectl get pods,service,deployment,replicaset -o wide --selector=app=fhem-port
	
Es sollte ein Pod, mit einem Replica-Set, einem Deployment und einen Service, jeweils mit `fhem-port` gelabbelt, vorhanden sein. Dem Services wurde der nächste freie Port der Node zugewiesen. 

	kubectl get service -o wide --selector=app=fhem-port
	
Der URL ergibt sich aus der IP-Adresse der Node und dem Angezeigten Port, z.B. `http://192.168.60.102:30252`.

	https://<IP Adresse LoadBalancer>/fhem, z.B. https://192.168.99.100/fhem
	
Stoppen und Löschen (löscht den Service, die Bereitstellung und den Zugriff via /path).

	kubectl delete service,deployments,ingresses fhem

Alternativ kann ein Container/Pod zum Arbeiten auf der CLI gestartet werden:

	kubectl create -f test/debian.yaml
	
Wechsel in das CLI des Containers/Pods

	kubectl exec -it debian -- bash

### Installation via Vagrant

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

ACHTUNG: Evtl. gesetzte Umgebungsvariable `DOCKER_CERT_PATH` darf nicht gesetzt sein.

#### Dashboard

Das Dashboard ist Standardmässig nicht erreichbar. Dazu muss zuerst ein Proxy zur lokalen Maschine eingerichtet werden:
	
	kubectl proxy
	
Anschliessend kann das Dashboard angewählt werden. Der Logindialog kann mit `Skip` übersprungen werden.

[http://localhost:8001/ui/](http://localhost:8001/ui/)

#### Cluster einrichten

Die Kubernetes/Vagrant Installation ist Standardmässig Clusterfähig. Bei der Installation wird der Befehl ausgegeben, um weitere Nodes hinzuzufügen. Der Befehl sieht in etwa so aus:

	kubeadm join --token <token> 192.168.60.100:6443 --discovery-token-ca-cert-hash <hash>

Weitere Nodes können mittels der Docker Umgebung hinzugefügt werden.

Vorgehen, [Docker](../docker/) VM normal aufsetzen und `kubeadm` installieren.

	sudo -i
	curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    sudo echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/Kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubelet kubeadm

Nach der Installation ist der `kubeadm join` Befehl von oben auszuführen. Dadurch wird die Docker VM dem Kubernetes Cluster hinzugefügt. Falls der `kubeadm join` nicht mehr sichtbar ist, kann ein neuer Token generiert wreden.

	sudo kubeadm token create --print-join-command

Getestet kann der Cluster mittels dem dockercloud/hello-world Images.

	kubectl create -f test/dockercloud.yaml
	
Es werden 3 Container/Pods erstellt, welche gleichmässig auf die Nodes verteilt werden.

Node wieder aus Cluster entfernen:

	kubectl drain --ignore-daemonsets <node>
    kubectl delete node <node>
    

### Installation via Minikube - Windows

- [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/) und [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) downloaden in in PATH ablegen

Dieses Repository in der Git/Bash Shell clonen:

	git clone https://github.com/mc-b/devops.git

minikube starten (Windows: via PowerShell auf LW C: !)

	minikube start --vm-driver=virtualbox
	
Web Oberfläche starten

	minikube dashboard
	
Docker Umgebungsvariablen ausgeben 

	minikube docker-env
	
Ausgabe z.B. unter Windows:

	SET DOCKER_TLS_VERIFY=1
	SET DOCKER_HOST=tcp://192.168.99.100:2376
	SET DOCKER_CERT_PATH=C:\Users\<Username>\.minikube\certs
	SET DOCKER_API_VERSION=1.23
	REM Run this command to configure your shell:
	REM @FOR /f "tokens=*" %i IN ('minikube docker-env') DO @%i

Diese Variablen werden gebraucht um von der Kommandozeile auf den Kubernetes Cluster zuzugreifen.

Sie sollten, in Windows als Umgebungsvariablen und unter Linux/Mac im Startupscript `.bashrc` eingetragen werden.

ACHTUNG: bei Starten/Stoppen des Cluster kann evtl. eine andere IP-Adresse vergeben werden.	
	
### Installation - Docker Community (CE) Edition 

Sicherstellen, dass das System wo Docker installiert wird, mindestens 8 GB RAM hat.

Docker CE (Edge) vom [Docker Store](https://store.docker.com/search?type=edition&offering=community) downloaden und installieren.

Auf Docker Settings wechseln und im Tab Kubernetes, CheckBox Kubernetes aktivieren.

Kubernetes DashBoard installieren und Port weiterleiten:

	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
	kubectl proxy
	 
Aufruf des DashBoards mittels (die Securityeinstellungen können mittels `skip` übergangen werden):

[http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/](http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/)

Der Services müssen auf `NodePort` zusteuern. Die IP-Adresse des `NodePort` findet man in den Docker Settings unter Network, der `NodePort` bekommt die IP-Adresse 1, z.B. 10.0.75.1. Aus dem gemapptem Port des Services und der IP Adresse des `NodePorts` ergibt sich der URL: z.B. http://10.0.75.1:30549.


#### Links

* [Using kubeadm to Create a Cluster](https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/)
* [Kubernetes-powered Docker CE ](https://www.melvinvivas.com/kubernetes-powered-docker-ce/)
* [DashBoard](https://github.com/kubernetes/dashboard)
	
### Tutorials

* [Minikube aufsetzen](https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/) 
* [Deployment (Bereitstellung) als Service eintragen](https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/)


### Reference

* [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)

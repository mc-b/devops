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
* [Minio](minio)
* [Helm](helm)
* [Tests - ohne Beschreibung](test)

### Installation via Minikube - Windows

- [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/) und [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) downloaden in in PATH ablegen

- Dieses Repository in der Git/Bash Shell clonen:

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
	
#### Starten und Stoppen von Services

Services können mittels dem CLI [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) oder via Weboberfläche gestartet werden.

Am einfachsten ist es wenn eine Beschreibung im YAML Format, z.B. [fhem.yaml](iot/fhem.yaml) vorhanden ist.

FHEM Hausautomation Service starten

	kubectl create -f iot/fhem.yaml
	
Erstellten Service, Bereitstellung und Zugriffspath überprüfen

	kubectl get services,deployments,ingresses -o wide	
	
Der Service ist dann über folgenden Path zugreifbar:

	https://<IP Adresse LoadBalancer>/fhem, z.B. https://192.168.99.100/fhem
	
Stoppen und Löschen (löscht den Service, die Bereitstellung und den Zugriff via /path).

	kc delete service,deployments,ingresses fhem

Wenn nicht mit einen Zugriffs Path (Ingresses) gearbeitet werden kann, ist mit NodePort oder LoadBalancer zu arbeiten.
Dabei wird kein Ingress erstellt sondern dem Service der nächste freie Port im LoadBalancer zugewiesen.

Für ein Beispiel siehe [fhem-port.yaml](iot/fhem-port.yaml). Der Zugriff auf den Services kann mittels `minikube` erfolgen:

	minikube service --url iot/fhem-port
	
Wird `minikube` ohne --url aufgerufen, wird statt der Ausgabe des URL's der Standardbrowser aufgerufen.

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

* [Kubernetes-powered Docker CE ](https://www.melvinvivas.com/kubernetes-powered-docker-ce/)
* [DashBoard](https://github.com/kubernetes/dashboard)
	
### Tutorials

* [Minikube aufsetzen](https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/) 
* [Deployment (Bereitstellung) als Service eintragen](https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/)


### Reference

* [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)
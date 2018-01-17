Kubernetes Beispiele
--------------------

### Installation via Minikube - Windows

- [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/) und [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) downloaden in in PATH ablegen

minikube starten (via PowerShell auf LW C: !)

	minikube start --vm-driver=virtualbox
	
Web Oberfläche starten

	minikube dashboard
	
Docker Umgebungsvariablen ausgeben (diese entweder in Startscript `.bashrc` oder in Windows als Umgebungsvariablen setzen):

	minikube docker-env
	
### Starten und Stoppen von Services

Services können mittels dem CLI [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) oder via Weboberfläche gestartet werden.

Am einfachsten ist es wenn eine Beschreibung im YAML Format, z.B. [fhem.yaml](iot/fhem.yaml) vorhanden ist.

FHEM Hausautomation Service starten

	kubectl create -f fhem.yaml
	
Erstellten Service, Bereitstellung und Zugriffspath überprüfen

	kubectl get services,deployments,ingresses -o wide	
	
Der Service ist dann über folgenden Path zugreifbar:

	https://<IP Adresse LoadBalancer>/fhem, z.B. https://192.168.99.100/fhem
	
Stoppen und Löschen (löscht den Service, die Bereitstellung und den Zugriff via /path).

	kc delete service,deployments,ingresses fhem

Wenn nicht mit einen Zugriffs Path (Ingresses) gearbeitet werden kann, ist mit NodePort oder LoadBalancer zu arbeiten.
Dabei wird kein Ingress erstellt sondern dem Service der nächste freie Port im LoadBalancer zugewiesen.

Für ein Beispiel siehe [fhem-port.yaml](iot/fhem-port.yaml). Der Zugriff auf den Services kann mittels `minikube` erfolgen:

	minikube service --url fhem-port
	
Wird `minikube` ohne --url aufgerufen, wird statt der Ausgabe des URL's der Standardbrowser aufgerufen.
	
### Tutorials

* [Minikube aufsetzen](https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/) 
* [Deployment (Bereitstellung) als Service eintragen](https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/)


### Reference

* [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)
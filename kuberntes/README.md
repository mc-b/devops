Kubernetes Beispiele
--------------------

### Installation via Minikube - Windows

- [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/) und [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) downloaden in in PATH ablegen

minikube starten (via PowerShell auf LW C: !)

	minikube start --vm-driver=virtualbox
	
Web Oberfläche starten

	minikube dashboard
	
Docker Umgebungsvariablen ausgehen (diese sind am einfachsten Global zu setzen):

	minikube docker-env
	
### Tutorials

* [Minikube aufsetzen](https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/) 
* [Deployment (Bereitstellung) als Service eintragen](https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/)


### Reference

* [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)
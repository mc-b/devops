Helm
----

Helm ist ein Werkzeug zur Verwaltung von Kubernetes-Charts. 


Kubernetes-Charts sind Pakete vorkonfigurierter Kubernetes-Ressourcen, welche wie Gesamthaft mittels eines Befehles installiert werden können

Helm Einsatzgebiete:
* Suchen und verwenden Sie beliebte Software, die als Kubernetes-Charts verpackt ist
* Teilen Sie Ihre eigenen Anwendungen als Kubernetes-Charts
* Erstellen Sie reproduzierbare Builds Ihrer Kubernetes-Anwendungen
* Verwalten Sie Ihre Kubernetes-Manifestdateien auf intelligente Weise
* Verwalten Sie Releases von Helm-Paketen


### Drupal

Quelle: https://github.com/kubernetes/charts/tree/master/stable/drupal

Installation

	helm install --name mydrupal stable/drupal --set serviceType=LoadBalancer
	
Userinterface aufrufen

	minikube service mydrupal-drupal
	
* User: user
* Password: `kubectl get secret --namespace default mydrupal-drupal -o jsonpath="{.data.drupal-password}" | base64 --decode`

### Jenkins

	helm install --name myjenkins stable/jenkins
	
* User: admin
* Password: `kubectl get secret --namespace default myjenkins-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode`
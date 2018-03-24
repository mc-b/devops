Add-Ons
-------

### Dashboard

Kubernetes Dashboard ist eine webbasierte Benutzeroberfläche für Kubernetes-Cluster. Es ermöglicht Benutzern, im Cluster ausgeführte Anwendungen zu verwalten und Fehler zu beheben sowie den Cluster selbst zu verwalten.

Je nach verwendeter Installation ist das Dashboard separat zu starten und anders anzusprechen.

Links

* [github Projekt](https://github.com/kubernetes/dashboard)

### Ingress

Ingress ist ein API-Objekt, das den externen Zugriff auf die Dienste in einem Cluster, normalerweise HTTP, verwaltet.

Ingress kann Load-Balancing, SSL-Terminierung und namensbasiertes virtuelles Hosting bereitstellen.

#### Installation

Wenn Kubernetes Umgebung mit `minikube` installiert ist:

	minikube addons enable ingress
	
Links

* [Ingress Doku](https://kubernetes.io/docs/concepts/services-networking/ingress/)
* [Installation Guide](https://github.com/kubernetes/ingress-nginx/blob/master/deploy/README.md)
* [github Projekt](https://github.com/kubernetes/ingress-nginx)

### Weave Scope und Net

[Weave Scope](https://www.weave.works/) ist ein Werkzeug zur grafischen Visualisierung Ihrer Container, Pods, Dienste usw.

Weave Net bietet Netzwerk- und Netzwerkrichtlinien, funktioniert auf beiden Seiten einer Netzwerkpartition und benötigt keine externe Datenbank.

#### Installation

	kubectl apply -f "https://cloud.weave.works/k8s/scope.yaml?k8s-version=$(kubectl version | base64 | tr -d '\n')"
	kubectl port-forward -n weave "$(kubectl get -n weave pod --selector=weave-scope-component=app \
	-o jsonpath='{.items..metadata.name}')" 4040


Das UI kann via [http://localhost:4040](http://localhost:4040) geöffnet werden.

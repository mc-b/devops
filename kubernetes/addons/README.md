Add-Ons
-------

### Weave Scope und Net

[Weave Scope](https://www.weave.works/) ist ein Werkzeug zur grafischen Visualisierung Ihrer Container, Pods, Dienste usw.

Weave Net bietet Netzwerk- und Netzwerkrichtlinien, funktioniert auf beiden Seiten einer Netzwerkpartition und benötigt keine externe Datenbank.

#### Installation

	kubectl apply -f "https://cloud.weave.works/k8s/scope.yaml?k8s-version=$(kubectl version | base64 | tr -d '\n')"
	kubectl port-forward -n weave "$(kubectl get -n weave pod --selector=weave-scope-component=app -o jsonpath='{.items..metadata.name}')" 4040


Das UI kann via [http://localhost:4040](http://localhost:4040) geöffnet werden.

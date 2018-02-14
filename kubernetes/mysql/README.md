MySQL mit UI Adminer
--------------------

Standard MySQL und Adminer (UI) Docker Container.

### Starten

	kubectl create -f mysql.yaml
	kubectl create -f adminer.yaml
	
	minikube service adminer

Zugangsdaten:	
* System  : MySQL
* Host    : mysql
* Username: test
* Password: secret

### MySQL Kommandline

Im MySQL Container kann mit folgendem Befehle eine `Bash` gestartet werden:

	kubectl exec -it `kubectl get pods --selector='app=mysql' -o jsonpath='{.items[0].metadata.name}'` -- bash

Um anschliessend den MySQL Client aufzurufen: 

	mysql -u test -p 
	
Alternativ kann der MySQL Container von allen anderen Containern, mit installiertem MySQL-Client wie folgt erreicht werden:

	mysql -h mysql -u test -p

	
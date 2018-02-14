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

### Daten in MySQL importieren

Dazu steht ein Docker Image, mit Installiertem mysql-client und git, zur Verfügung.

Docker Image builden:

	docker build . -t loaddata
	
Docker Image als Pod laufen lassen:

	kubectl run --image loaddata lc --image-pull-policy=IfNotPresent --restart=Never
	
Aufräumen:

	kubectl delete pod lc

In `loaddata.sh` stehen die SQL Befehle drin, um die Datanbank mit Daten zu füllen.


### MySQL Kommandline

Im MySQL Container kann mit folgendem Befehle eine `Bash` gestartet werden:

	kubectl exec -it `kubectl get pods --selector='app=mysql' -o jsonpath='{.items[0].metadata.name}'` -- bash

Um anschliessend den MySQL Client aufzurufen: 

	mysql -u test -p 
	
Alternativ kann der MySQL Container von allen anderen Containern, mit installiertem MySQL-Client wie folgt erreicht werden:

	mysql -h mysql -u test -p

	
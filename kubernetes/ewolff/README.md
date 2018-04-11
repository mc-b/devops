Beispiele aus dem Buch Microservices Rezepte
--------------------------------------------

Diese Beispiele sind aus dem Microservices Buch, dass unter [https://github.com/ewolff/microservice](https://github.com/ewolff/microservice) zu finden ist.

Um die Beispiele zu Compilieren braucht es eine Java/Maven Umgebung mit `docker` und `kubectl`.

Diese steht im Verzeichnis `dockerindocker/maven-cli.yaml` zur Verfügung.

Um die Befehle unten abzusetzen ist zuerst die Java/Maven Umgebung zu starten und in dessen Container zu wechseln:

	git clone https://github.com/mc-b/devops.git
	cd devops/kubernetes
	kubectl create -f dockerindocker/maven-cli.yaml
	kubectl exec -it maven-cli -- bash
	
Im Container noch `docker-compose` installieren und die Umgebung ist bereit:

	curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
	chmod 755 /usr/local/bin/docker-compose	

### SCS ESI Beispiel (Frontend)

Für in sich geschlossene Systeme müssen mehrere Frontends integriert werden. Dieses Beispiel zeigt, wie dies zu tun ist. Varnish dient als Cache, und ESI (Edge Side Includes) wird verwendet, um mehrere Backends in eine HTTP-Site zu integrieren.

Microservices compilieren und Docker Images aufbereiten:

	cd /src/ewolff
	git clone https://github.com/mc-b/SCS-ESI.git
	cd SCS-ESI/scs-demo-esi-order/
	mvn clean package -Dmaven.test.skip=true
	cd ../docker
	docker-compose build
	docker images | grep scs

Die compilierten Microservices werden im Startverzeichnis der VM abgelegt. 	

Anschliessend können die Microservices gestartet werden:
	
	docker-compose up -d
    docker ps | grep scs
    
Probieren mittels [http://<ip NodePort>:8080](http://192.168.60.100:8080) und [http://<ip NodePort>:8090](http://192.168.60.100:8090).

Nach dem Test die Container wieder beenden, mittels:

	docker-compose down    

#### Links

* [github Repository](https://github.com/ewolff/SCS-ESI)

### Microservice Kafka Sample

Dies ist ein Beispiel um zu zeigen, wie Kafka für die Kommunikation zwischen Microservices verwendet werden kann.

Microservices compilieren und Docker Images aufbereiten:

	cd /src/ewolff
	git clone https://github.com/mc-b/microservice-kafka.git
	cd microservice-kafka/microservice-kafka
	mvn clean package -Dmaven.test.skip=true
	cd ../docker
	docker-compose build
	docker images | grep mskafka
	
Die compilierten Microservices werden im Startverzeichnis der VM abgelegt. 	

Anschliessend können die Microservices gestartet werden:
	
	docker-compose up -d
    docker ps | grep mskafka	

Probieren mittels [http://<ip NodePort>:8080](http://192.168.60.100:8080).

Nach dem Test die Container wieder beenden, mittels:

	docker-compose down       

#### Links

* [github Repository](https://github.com/ewolff/microservice-kafka)

### Microservice Kubernetes Sample

Dieses Projekt ist eine Demo für das
[Microservices Buch](http://microservices-buch.de/) ([English](http://microservices-book.com/)).

Dieses Projekt erzeugt eine vollständigen Microservice-Demo in 
Docker-Containern. Die Services sind mit Java, Spring und Spring Cloud
implementiert.

Das System hat drei Microservices:
- Order um Bestellungen entgegenzunehmen
- Customer für Kundendaten
- Catalog für die Waren

Microservices compilieren und Docker Images aufbereiten:

	cd /src/ewolff
	git clone https://github.com/mc-b/microservice-kubernetes.git
	cd microservice-kubernetes/microservice-kubernetes-demo/
	mvn clean package -Dmaven.test.skip=true
	
	# docker build
	docker build --tag=microservice-kubernetes-demo-apache apache
	docker build --tag=microservice-kubernetes-demo-catalog microservice-kubernetes-demo-catalog
	docker build --tag=microservice-kubernetes-demo-customer microservice-kubernetes-demo-customer
	docker build --tag=microservice-kubernetes-demo-customer microservice-kubernetes-demo-customer
	docker build --tag=microservice-kubernetes-demo-order microservice-kubernetes-demo-order
	docker build --tag=microservice-kubernetes-demo-hystrix-dashboard microservice-kubernetes-demo-hystrix-dashboard
   
Die compilierten Microservices werden im Startverzeichnis der VM abgelegt. 	

Anschliessend können die Microservices gestartet werden:

	kubectl run apache --image=microservice-kubernetes-demo-apache:latest --port=80 --image-pull-policy='IfNotPresent'
	kubectl expose deployment/apache --type="LoadBalancer" --port 80
	kubectl run catalog --image=microservice-kubernetes-demo-catalog:latest --port=8080 --image-pull-policy='IfNotPresent'
	kubectl expose deployment/catalog --type="LoadBalancer" --port 8080
	kubectl run customer --image=microservice-kubernetes-demo-customer:latest --port=8080 --image-pull-policy='IfNotPresent'
	kubectl expose deployment/customer --type="LoadBalancer" --port 8080
	kubectl run order --image=microservice-kubernetes-demo-order:latest --port=8080 --image-pull-policy='IfNotPresent'
	kubectl expose deployment/order --type="LoadBalancer" --port 8080
	kubectl run hystrix-dashboard --image=microservice-kubernetes-demo-hystrix-dashboard:latest --port=8080 --image-pull-policy='IfNotPresent'
	kubectl expose deployment/hystrix-dashboard --type="LoadBalancer" --port 8080
    
#### Links

* [github Repository](https://github.com/ewolff/microservice-kubernetes) 
* [github Repository Microservice](https://github.com/ewolff/microservice)   
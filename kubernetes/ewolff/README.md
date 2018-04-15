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
	
### SCS ESI Beispiel (Frontend)

Für in sich geschlossene Systeme müssen mehrere Frontends integriert werden. Dieses Beispiel zeigt, wie dies zu tun ist. Varnish dient als Cache, und ESI (Edge Side Includes) wird verwendet, um mehrere Backends in eine HTTP-Site zu integrieren.

Microservices compilieren und Docker Images aufbereiten:

	cd /src/ewolff
	git clone https://github.com/mc-b/SCS-ESI.git
	cd SCS-ESI/scs-demo-esi-order/
	mvn clean package -Dmaven.test.skip=true
	cd ..
    docker build -t scsesi_varnish docker/varnish
    docker build -t scsesi_common scs-demo-esi-common
    docker build -t scsesi_order scs-demo-esi-order
	docker images | grep scs

Die compilierten Microservices werden im Startverzeichnis der VM abgelegt. 	

Anschliessend können die Microservices gestartet werden:
	
	cd /src/ewolff 
	kubectl create -f SCS-ESI.yaml
	kubectl create -f SCS-ESI-order.yaml
	kubectl get pods
    
Probieren mittels [http://ip NodePort:32080](http://192.168.60.100:32080) und [http://ip NodePort:32090](http://192.168.60.100:32090).

Nach dem Test die Container wieder beenden, mittels:

	kubectl delete -f SCS-ESI.yaml
	kubectl delete -f SCS-ESI-order.yaml

#### Links

* [github Repository](https://github.com/ewolff/SCS-ESI)

### Microservice Kafka Sample

Dies ist ein Beispiel um zu zeigen, wie Kafka für die Kommunikation zwischen Microservices verwendet werden kann.

Microservices compilieren und Docker Images aufbereiten:

	cd /src/ewolff
	git clone https://github.com/mc-b/microservice-kafka.git
	cd microservice-kafka/microservice-kafka
	mvn clean package -Dmaven.test.skip=true
	cd ..
	
    docker build -t mskafka_apache docker/apache	
    docker build -t mskafka_postgres docker/postgres
    docker build -t mskafka_order microservice-kafka/microservice-kafka-order
    docker build -t mskafka_shipping microservice-kafka/microservice-kafka-shipping
    docker build -t mskafka_invoicing microservice-kafka/microservice-kafka-invoicing
	docker images | grep mskafka
	
Die compilierten Microservices werden im Startverzeichnis der VM abgelegt. 	

Anschliessend können die Microservices gestartet werden:
	
	cd /src/ewolff 
	kubectl create -f ms-kafka/
    kubectl get pods | grep mskafka	

Probieren mittels [http://ip NodePort:32080](http://192.168.60.100:32080).

Nach dem Test die Container wieder beenden, mittels:

	kubectl delete -f ms-kafka/

#### Testen

In Kafka Container wechseln und Topics anschauen und dessen Meldungen

	kubectl exec -it $(kubectl get po --selector=app=mskafka-kafka -o=jsonpath='{ .items[0].metadata.name }') -- bash
	cd /opt/kafka
	bin/kafka-topics.sh --list --zookeeper zookeeper:2181
	bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic order --from-beginning

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
	docker build --tag=microservice-kubernetes-demo-apache:0.0.1 apache
	docker build --tag=microservice-kubernetes-demo-catalog:0.0.1 microservice-kubernetes-demo-catalog
	docker build --tag=microservice-kubernetes-demo-customer:0.0.1 microservice-kubernetes-demo-customer
	docker build --tag=microservice-kubernetes-demo-customer:0.0.1 microservice-kubernetes-demo-customer
	docker build --tag=microservice-kubernetes-demo-order:0.0.1 microservice-kubernetes-demo-order
	docker build --tag=microservice-kubernetes-demo-hystrix-dashboard:0.0.1 microservice-kubernetes-demo-hystrix-dashboard
	docker images | grep microservice
   
Die compilierten Microservices werden im Startverzeichnis der VM abgelegt. 	

Anschliessend können die Microservices gestartet werden:

	cd /src/ewolff
	kubectl create -f ms-kubernetes/
    kubectl get pods | grep microservice	

Probieren mittels [http://ip NodePort:32080](http://192.168.60.100:32080).

Nach dem Test die Container wieder beenden, mittels:

	kubectl delete -f ms-kubernetes/
	    
#### Links

* [github Repository](https://github.com/ewolff/microservice-kubernetes) 
* [github Repository Microservice](https://github.com/ewolff/microservice)   
Container verlinken (alt)
-------------------------

Docker-Links sind die einfachste Möglichkeit, Container auf dem gleichen Host miteinander reden lassen zu können. Nutzen Sie das Standardnetzwerk-Modell von Docker, geschieht die Kommunikation zwischen Containern über ein internes Docker-Netzwerk, so dass sie nicht im Host-Netzwerk erreichbar ist.

Beispiel:

	docker run -it --rm --link mysql:mysql ubuntu:14.04 bash
	
Innerhalb des Containers:

	env

		PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
		HOSTNAME=53a8e2acc32c
		MYSQL_PORT=tcp://172.17.0.2:3306
		MYSQL_PORT_3306_TCP=tcp://172.17.0.2:3306
		MYSQL_PORT_3306_TCP_ADDR=172.17.0.2
		MYSQL_PORT_3306_TCP_PORT=3306
		MYSQL_PORT_3306_TCP_PROTO=tcp
		MYSQL_NAME=/tender_feynman/mysql
		HOME=/root

	sudo apt-get update && sudo apt-get install -y curl mysql-client
	
Testen ob der Port aktiv ist:

	curl -f http://${MYSQL_PORT_3306_TCP_ADDR}:${MYSQL_PORT_3306_TCP_PORT}

MySQL Client starten

	 mysql -uroot -padmin -h${MYSQL_PORT_3306_TCP_ADDR}

### Links

* [Container links](https://docs.docker.com/engine/userguide/networking/default_network/dockerlinks/)
* [IoTKit Wetty - unter run:](https://github.com/mc-b/IoTKit/blob/master/docker/wetty/makefile)
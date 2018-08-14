Named Volumes
-------------

Seit der Version 1.9 existiert das Kommando `docker volume` zur Verwaltung von Volumes auf einem Docker Host. 

Man kann damit verschiedene [Volume-Driver-Dateisysteme](https://docs.docker.com/engine/extend/plugins_volume/) für Container bereitstellen.

Ein Volume kann nun auf einem Host angelegt werden und verschiedenen Container bereitgestellt werden. 

Volumes können einheitlich mit diesen Befehlen verwaltet werden. 

Wenn keine Default-Dateien auf dem Volume benötigt werden, kann auf einen separaten Datencontainer verzichtet werden.

Mit diesem Schritt können nun verschiedene Dateisysteme und Optionen effizient in Containern genutzt werden.

**Beispiele:**

Erstellt eine Volume `mysql`

	docker volume create mysql
	
Ausgabe aller vorhandenen Volumes

	docker volume ls
	
Erstellt einen Container c2 und hängt das Volume unter /var/lib/mysql ein.

	docker run  -it --name c2 -v mysql:/var/lib/mysql --rm busybox
	
Die Abhängigkeit Volume Verzeichnis kann auch im `Dockerfile` hinterlegt werden.

	VOLUME mysql:/var/lib/mysql

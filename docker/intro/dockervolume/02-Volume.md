Volumes
-------

Volumes sind ein spezielles Verzeichnis auf dem Host in dem einem oder mehreren Container ihre Daten ablegen.

Volumes bieten mehrere nützliche Funktionen für persistente oder gemeinsam genutzte Daten:
* Volumes werden initialisiert, wenn ein Container erstellt wird. 
* Wenn das Image des Containers Daten am angegebenen Einhängepunkt enthält, werden die vorhandenen Daten nach der Volumeninitialisierung in das neue Volume kopiert. 
* Volumes können gemeinsam genutzt und unter Containern wiederverwendet werden.
* Änderungen an einem "Data volumes" erfolgen direkt.
* Änderungen an einem "Data volumes" werden nicht berücksichtigt, wenn Sie ein Image aktualisieren.
* Volumes bleiben bestehen, auch wenn der Container selbst gelöscht wird.
* Volumes sind so ausgelegt, dass die Daten unabhängig vom Lebenszyklus des Containers bestehen bleiben. 
* Docker löscht nie automatisch Volumes (wirklich?), wenn Sie einen Container entfernen, kann deshalb "Müll" übrigbleiben.

**Beispiele**

Busybox Container starten und neues Volume `/data` anlegen

	docker run --network=host -it --name c2 -v /data --rm busybox
	# Im Container
	cd /data
	mkdir t1
	echo "Test" >t1/test.txt
	# Ctrl+p + Ctrl+q
	docker inspect c2
	# Nach Mounts suchen, z.B. 
	        "Mounts": [
            {
                "Type": "volume",
                "Name": "ea99634523a0aa3d6fbf7ee02c491029170d7105f9c5404760a71e046ad55c67",
                "Source": "/var/lib/docker/volumes/ea99634523a0aa3d6fbf7ee02c491029170d7105f9c5404760a71e046ad55c67/_data",
                "Destination": "/data",
                "Driver": "local",
                "Mode": "",
                "RW": true,
                "Propagation": ""
            }
	# Datei ausgeben
	sudo cat /var/lib/docker/volumes/ea99634523a0aa3d6fbf7ee02c491029170d7105f9c5404760a71e046ad55c67/_data/t1/test.txt

Datenverzeichnis /var/lib/mysql vom Container auf dem Host einhängen (mount)

	docker run -d -p 3306:3306  -v ~/data/mysql:/var/lib/mysql --name mysql --rm mysql
	# Datenverzeichnis
	ls -l ~/data/mysql

Einzelne Datei einhängen

	docker run --rm -it -v ~/.bash_history:/root/.bash_history ubuntu /bin/bash

### Links

* [Manage data in containers](https://docs.docker.com/engine/tutorials/dockervolumes/)


Sammlung von Tools für DevOps
-----------------------------

Lose Sammlung von DevOps Tools. 

**Nicht für Produktion verwenden**

### Gogs

![](https://gogs.io/img/screenshots/4.png)

Ein einfacher Git Server mit Weboberfläche. Erinnert stark an github.

Starten:

	kubectl create -f gogs.yaml
	
Web Oberfläche mittels [Cluster-IP:32300](http://192.168.137.100:32300) anwählen.	

Werte bei **Installationsschritte für den ersten Start** wie folgt anpassen:
* Datenbanktyp: SQLite3
* Pfad: /data/gogs.db
* Anwendungs-URL: IP-Adresse und Port Cluster, z.B. http://192.168.137.100:32300/

Einstellungen, wenn es sich um einen nicht frei zugänglichen Server handelt:
* Server und sonstige Einstellungen 
    * Registrierung deaktivieren: true
    * Captcha aktivieren: false 
* Administrator Einstellungen: Admin User inkl. Password einrichten.

Ansonsten erhält der erste User wo sich registriert, Adminstrator Rechte.

Mittels `+` - `Neue Migration` bestehendes Repository von GitHub kopieren
* Adresse kopieren: [https://github.com/mc-b/bpmn-tutorial.git](https://github.com/mc-b/bpmn-tutorial.git)
* Repository-Name: bpmn-tutorial

Vorgang wiederholen für:
* [https://github.com/mc-b/microservice-kubernetes](https://github.com/mc-b/microservice-kubernetes)
* [https://github.com/mc-b/microservice-kafka.git](https://github.com/mc-b/microservice-kafka.git)
* [https://github.com/mc-b/SCS-ESI.git](https://github.com/mc-b/SCS-ESI.git)

In `Git/Bash` wechseln und Repository clonen:

	git clone http://192.168.137.100:32300/root/microservice-kubernetes.git
	
Daten, z.B. README.md verändern und wieder einchecken:
	
	cd microservice-kubernetes
	vi README.md
	git add -A
	git commit -m "Beschreibung nachgefuehrt"
	git push

Ohne Änderung in `gogs.yaml` schreibt Gogs die Daten ins Verzeichnis /data/gogs, welches bei der Vagrant Installations Variante im kubernetes/data Verzeichnis auf dem Host gespeichert wird. D.h. die Daten bleiben auch nach Beenden des Containers, der VM erhalten.
	
**Links**

* [Website](https://gogs.io/)
* [Docker Image](https://hub.docker.com/r/gogs/gogs/)

### Kanboard

![](https://kanboard.org/assets/img/board.png)

Kanboard ist eine Open-Source Kanban-Projektmanagement-Software.

Es erlaubt Aufgaben in Projekten und Sprints (Swimlanes) zu managen. Die Columns können frei angepasst werden.

Starten:

	kubectl create -f kanboard.yaml
	
Web Oberfläche mittels [Cluster-IP:32200](http://192.168.137.100:32200) anwählen. Username/Password ist `admin`.

Ohne Änderung in `kanboard.yaml` schreibt Kanboard die Daten ins Verzeichnis /data/kanboard, welches bei der Vagrant Installations Variante im kubernetes/data Verzeichnis auf dem Host gespeichert wird. D.h. die Daten bleiben auch nach Beenden des Containers, der VM erhalten.

**Links**

* [Website](https://kanboard.org/)
* [Docker Image](https://hub.docker.com/r/kanboard/kanboard/)

### Jenkins mit Blueocean

![](https://jenkins.io/images/blueocean/blueocean-successful-pipeline.png)

Jenkins ist ein Continuous Integration- und Delivery-Server. 

Für die Installation wird ein Admin Password benötigt, welches aus dem Log des Jenkins Pods ausgelesen werden kann.

Um die Blueocean Oberfläche anzusprechen ist dem URL /blue hintenanzustellen.

Starten:

	kubectl create -f jenkins.yaml
	
Die Oberfläche wird fix auf Port 32100 zugewiesen und via [Cluster-IP:32100](http://192.168.137.100:32100) erreichbar.

Initialer Username und Password ist `admin`. Diese Werte können in `jenkins.yaml` geändert werden.

Oberfläche Blue Ocean anwählen und neue Pipeline mittels `git` und Repository-URL, z.B. von `gogs` [http://192.168.137.100:32300/root/microservice-kubernetes.git](http://192.168.137.100:32300/root/microservice-kubernetes.git) anlegen. 

**Links**

* [Website](https://jenkins.io/)
* [Docker Image](https://hub.docker.com/r/jenkinsci/blueocean/)
* [Docker absichern](https://wiki.jenkins.io/display/JENKINS/Standard+Security+Setup)
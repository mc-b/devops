Sammlung von Tools für DevOps
-----------------------------

Lose Sammlung von DevOps Tools. 

**Nicht für Produktion verwenden**

### Gogs

![](https://gogs.io/img/screenshots/4.png)

Ein einfacher Git Server mit Weboberfläche. Erinnert stark an github.

**Links**

* [Website](https://gogs.io/)
* [Docker Image](https://hub.docker.com/r/gogs/gogs/)

### Kanboard

![](https://kanboard.org/assets/img/board.png)

Kanboard ist eine Open-Source Kanban-Projektmanagement-Software.

Es erlaubt Aufgaben in Projekten und Sprints (Swimlanes) zu managen. Die Columns können frei angepasst werden. 

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
	
Die Oberfläche wird fix auf Port 32100 zugewiesen und via [http://192.168.60.100:32100](http://192.168.60.100:32100) erreichbar.

Das Initiale Password kann im Logs des Jenkins Pods ausgelesen werden. 

**Links**

* [Website](https://jenkins.io/)
* [Docker Image](https://hub.docker.com/r/jenkinsci/blueocean/)
* [Docker absichern](https://wiki.jenkins.io/display/JENKINS/Standard+Security+Setup)
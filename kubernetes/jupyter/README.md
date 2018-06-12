Jupyter
-------

![](https://jupyter.org/assets/main-logo.svg)

- - -

### Jupyter

Project Jupyter hat sich zum Ziel gesetzt, Open-Source-Software, offene Standards und Services, für interaktives Computing, in Dutzenden von Programmiersprachen zu entwickeln.

Starten:

	kubectl create -f jupyter/jupyter.yaml
	
Web Oberfläche mittels [Cluster-IP:32388](http://192.168.137.100:32388) anwählen.

Das Verzeichnis `work` zeigt ins lokale Verzeichnis `kubernetes/data/jupyter`, d.h. die Daten bleiben auch nach Beenden des Containers, der VM erhalten. Siehe auch [Gemeinsames Datenverzeichnis](../data/).

Beispiele für Machine Learning findet man auf [https://notebooks.azure.com/djcordhose/libraries/buch](https://notebooks.azure.com/djcordhose/libraries/buch). Diese können mittels Download und Upload in die Jupyter Umgebung importiert werden.

### BeakerX

BeakerX ist eine Sammlung von Kerneln und Erweiterungen der interaktiven Jupyter- Computerumgebung. Es bietet JVM-Unterstützung, interaktive Diagramme, Tabellen, Formulare, Publizierung und mehr. 

Starten:

	kubectl create -f jupyter/beakerx.yaml
	
Web Oberfläche mittels [Cluster-IP:32088](http://192.168.137.100:32088) anwählen.

Das Verzeichnis `work` zeigt ins lokale Verzeichnis `kubernetes/data/jupyter`, d.h. die Daten bleiben auch nach Beenden des Containers, der VM erhalten. Siehe auch [Gemeinsames Datenverzeichnis](../data/).
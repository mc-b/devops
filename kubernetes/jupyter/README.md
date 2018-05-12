Jupyter
-------

![](https://jupyter.org/assets/main-logo.svg)

- - -


Project Jupyter hat sich zum Ziel gesetzt, Open-Source-Software, offene Standards und Services, für interaktives Computing, in Dutzenden von Programmiersprachen zu entwickeln.

Starten:

	kubectl create -f jupyter/jupyter.yaml
	
Web Oberfläche mittels [Cluster-IP:32388](http://192.168.137.100:32388) anwählen.

Ohne Änderung in `jupyter.yaml` schreibt Jupyter die Daten ins Verzeichnis /data/jupyter, welches bei der Vagrant Installations Variante im kubernetes/data Verzeichnis auf dem Host gespeichert wird. D.h. die Daten bleiben auch nach Beenden des Containers, der VM erhalten.


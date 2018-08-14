Datencontainer
--------------

Früher wurden Datencontainer erstellt, deren einziger Zweck das gemeinsame Nutzen von Daten durch andere Container war.

Dazu musste zuerst ein Container via `docker run` gestartet werden damit andere via `--volumes-from` darauf zugreifen konnten.

Diese Methode war zwar funktionsfähig aber nicht ausbaufähig.

**Beispiel:**

Container mit Datencontainer `dbdata` erstellen

	docker create -v /dbdata --name dbstore busybox 
	
Zweiten Container erstellen welche auf den Datencontainer `dbdata` zugreift

	 docker run -it --volumes-from dbstore --name db busybox
	 # Im Container
	 ls -l /dbdata

Der Datencontainer `dbdata` ist unter dem root-Verzeichnis als `/dbdata` eingehängt.


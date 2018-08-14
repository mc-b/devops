Dockerfile
----------

	FROM ubuntu:14.04
	MAINTAINER Marcel mc-b Bernet <marcel.bernet@ch-open.ch>
	
	# root Password setzen, damit kein Dialog erscheint und die Installation haengt!
	RUN echo 'mysql-server mysql-server/root_password password S3cr3tp4ssw0rd' | debconf-set-selections 
	RUN echo 'mysql-server mysql-server/root_password_again password S3cr3tp4ssw0rd' | debconf-set-selections 
	
	# Installation
	RUN apt-get update && apt-get install -y mysql-server
	
	# mysql config - Port fuer alle Hosts oeffnen
	RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
	
	CMD ["mysqld"]
	
Beispiel Dockerfile wo MySQL im 	
- - - 

Ein Dockerfile ist eine Textdatei mit einer Reihe von Schritten, die genutzt werden können, um ein Docker-Image zu erzeugen.

Dazu wird zuerst ein Verzeichnis erstellt und darin eine Datei mit Namen `Dockerfile`.

Anschliessend kann das Image wie folgt gebuildet werden:

	docker build -t mysql .
	
gestartet:

	docker run --rm -d --name mysql mysql

Funktionsfähigkeit überprüfen:

	docker exec -it mysql bash
	
und im Container

	ps -ef
	netstat -tulpen
	
**Wenn ein interner Server vorhanden ist, kann des Grundimage (ubuntu:14.04) wie folgt von dort geladen und installiert werden:**
 
    wget {{config.server}}/docker/ubuntu-14.04.tar
    docker load -i ubuntu-14.04.tar
    docker tag ubuntu:14.04 ubuntu:latest
    rm ubuntu-14.04.tar
	
### Konzepte

**Build Context**

* Der Befehl `docker build` erfordert ein `Dockerfile` und einen Build Context. 
* Der Build Context ist der Satz lokaler Dateien und Verzeichnisse, die aus ADD- oder COPY-Anweisungen im Dockerfile angesprochen werden können. 
* Er wird im Allgemeinen als Pfad zu einem Verzeichnis definiert.

**Layer / Imageschichten**

* Jede Anweisung in einem Dockerfile führt zu einer neuen Imageschicht – einem Layer –, die wieder zum Starten eines neuen Containers genutzt werden
kann. 
* Die neue Schicht wird erzeugt, indem ein Container mit dem Image der vorigen Schicht gestartet, dann die Dockerfile-Anweisung ausgeführt und
schließlich ein neues Image gespeichert wird.
*  Ist eine Dockerfile-Anweisung erfolgreich abgeschlossen worden, wird der temporär erzeugte Container wieder gelöscht.

### Anweisungen im Dockerfile

* **ADD:** Kopiert Dateien aus dem Build Context oder von URLs in das Image.
* **CMD:** Führt die angegebene Anweisung aus, wenn der Container gestartet wurde. Ist auch ein ENTRYPOINT definiert, wird die Anweisung als Argument für ENTRYPOINT verwendet.
* **COPY:** Wird verwendet, um Dateien aus dem Build Context in das Image zu kopieren. Es gibt die zwei Formen COPY src dest und COPY ["src", "dest"]. Das JSON-Array-Format ist notwendig, wenn die Pfade Leerzeichen enthalten.
* **ENTRYPOINT:** Legt eine ausführbare Datei (und Standardargumente) fest, die beim Start des Containers laufen soll. Jegliche CMD-Anweisungen oder an docker run nach dem Imagenamen übergebenen Argumente werden als Parameter an das Executable durchgereicht. ENTRYPOINT-Anweisungen werden häufig genutzt, um »Start«-Skripten anzustoßen, die Variablen und Services initialisieren, bevor andere übergebene Argumente ausgewertet werden.
* **ENV:** Setzt Umgebungsvariablen im Image.
* **EXPOSE:** Erklärt Docker, dass der Container einen Prozess enthält, der an dem oder den angegebenen Port(s) lauscht.
* **HEALTHCHECK:** Die Docker Engine prüft regelmäßig den Status der Anwendung im Container.

	HEALTHCHECK --interval=5m --timeout=3s \
	CMD curl -f http://localhost/ || exit 1

* **MAINTAINER:** Setzt die "Autor"-Metadaten des Image auf den angegebenen Wert
* **RUN:** Führt die angegebene Anweisung im Container aus und bestätigt das Ergebnis.
* **SHELL:** Die Anweisung SHELL erlaubt es seit Docker 1.12, die Shell für den folgenden RUN-Befehl zu setzten. So ist es möglich, dass nun auch direkt bash, zsh oder Powershell-Befehle in einem Dockerfile genutzt werden können.
* **USER:** Setzt den Benutzer (über Name oder UID), der in folgenden RUN-, CMD- oder ENTRYPOINT-Anweisungen genutzt werden soll.
* **VOLUME:** Deklariert die angegebene Datei oder das Verzeichnis als Volume. Besteht die Datei oder das Verzeichnis schon im Image, wird sie beziehungsweise es in das Volume kopiert, wenn der Container gestartet wird.
* **WORKDIR:** Setzt das Arbeitsverzeichnis für alle folgenden RUN-, CMD-, ENTRYPOINT-, ADD oder COPY-Anweisungen.

### Links

* [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
* [Docker Official Image packaging for MySQL Community Server](https://github.com/docker-library/mysql)
* [Windows Container Samples](https://docs.microsoft.com/en-us/virtualization/windowscontainers/samples)


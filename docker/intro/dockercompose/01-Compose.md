Docker Compose
--------------

	mysql:
	 build: mysql
	 ports:
	  - 3306:3306
	 volumes:
	  - ~/data:/var/lib/mysql

	apache:
	 build: apache
	 ports:
	  - 8080:80
	 volumes:
	  - ~/web:/var/www/html
	 links:
     - mysql
	  
Beispiel einer docker-compose.yml Datei 

- - - 

[Docker Compose](https://docs.docker.com/compose/overview/) ist dazu gedacht, Docker-Umgebungen schneller erstellen zu können. 

Dabei werden [YAML-Dateien] genutzt, um die Konfiguration für eine Gruppe von Containern abzulegen.

Compose befreit uns davon, unsere eigenen Skripten für die Orchestrierung warten zu müssen – einschließlich des Startens, Verlinkens, Aktualisierens und Stoppens unserer Container.

### Anweisungen in docker-compose.yml

- **apache:** oder **mysql:** - deklariert den Namen des zu bauenden Containers.
- **build:** - Verzeichnis wo der Dockerfile liegt.
- **ports:** - Port mapping analog -p bei `docker run`.
- **volumes:** - Volume mapping analog -v bei `docker run`.
- **links:** - Linking analog -l bei `docker run`

### Befehle

- **docker-compose up** - Startet alle Container, die in der Compose-Datei definiert sind, und sammelt die Ausgabe. Meist werden Sie das Argument -d verwenden, um Compose im Hintergrund laufen zu lassen.
- **docker-compose build** - Baut alle Images aus Dockerfiles neu. Der Befehl up baut nur fehlende Images, daher verwenden Sie diesen Befehl, wenn Sie ein Image aktualisieren müssen.
- **docker-compose ps** - Stellt Informationen zum Status der durch Compose verwalteten Container bereit.
- **docker-compose run** - Ruft einen Container für das einmalige Ausführen eines Befehls auf. Damit werden auch alle verlinkten Container gestartet, sofern nicht das Argument --no-deps mitgegeben wird.
- **docker-compose logs** - Gibt aggregierte und farbig hervorgehobene Logs für die durch Compose verwalteten Container aus.
- **docker-compose stop** - Stoppt Container, ohne sie zu entfernen.
- **docker-compose rm** - Entfernt gestoppte Container. Mit dem Argument -v werden auch alle durch Docker verwalteten Volumes entfernt.

### Installation

Docker-Compose muss einmalig installiert werden.

	sudo apt-get install -y docker-compose

### Links

* [Docker Compose](https://docs.docker.com/compose/overview/)

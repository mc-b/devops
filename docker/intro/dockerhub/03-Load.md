Images und Container - von/nach Dateien
---------------------------------------

Um Container und Images einfach nur zwischen verschiedenen Hosts hin und her zu verschieben, wird keine Registry benötigt.

Container können mittels `docker export` und `docker import` und Images mittels `docker save` und `docker load` von/nach Dateien kopiert werden.


### Container export und import

Container exportieren

	docker ps
	
	CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                  NAMES
	7fd371d71357        vagrant_apache      "/bin/sh -c '/bin/..."   3 hours ago         Up 3 hours          0.0.0.0:8080->80/tcp   vagrant_apache_1

	docker export vagrant_apache_1 -o va1.tar
	
	ls -lh
	
	total 200M
	-rwxrwxrwx 1 ubuntu ubuntu  731 Feb  2 08:28 Dockerfile
	-rwxrwxrwx 1 ubuntu ubuntu 200M Feb  2 12:36 va1.tar

Container importieren, z.B. auf einem anderen Host. Dabei wir ein Image erzeugt.

	docker import va1.tar va1
	
	docker images
	
	REPOSITORY          TAG                 IMAGE ID            CREATED                  SIZE
	va1                 latest              167ec5ca640c        Less than a second ago   200 MB


### Images save und load

Eigene Images ausgeben

	/vagrant/mysql$ docker images
	
	REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
	mysql               latest              24be8efe0428        2 hours ago         346 MB
	apache              latest              4221b4f12ce8        2 hours ago         225 MB


Images im TAR-Format sichern
	
	docker save mysql -o mysql.tar
	docker save apache -o apache.tar
	
Images wiederherstellen

	docker load -i mysql.tar  
	
### Links

* [Difference between save and export in Docker](https://tuhrig.de/difference-between-save-and-export-in-docker/)
	
	

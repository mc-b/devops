Reflexion / Dokumentation
-------------------------

Mittels Ports können Container mit der Aussenwelt verbunden werden.


Container können mittels folgenden Methoden untereinander kommunizieren:

* Linken (alt)

* Docker container networking (neu)

### Beispiele

* [docker](https://github.com/mc-b/devops/tree/master/docker/mysql/) - VM mit Docker und MySQL Container. Port 3306 wird publiziert.

### Hinweise

	docker -p 3306:3306 mysql ..

und 

	docker -P mysql ...
	
Haben keine Einfluss auf die Kommunikation bzw. Ports innerhalb der Container sondern nur gegen den Host.
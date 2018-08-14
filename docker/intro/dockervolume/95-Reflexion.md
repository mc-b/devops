Reflexion / Dokumentation
-------------------------

Bis jetzt gingen alle Änderungen im Dateisystem beim Löschen des Docker Containers komplett verloren.

Um Daten Persistent zu halten stellt Docker verschiedene Varianten zur Verfügung

* Ablegen der Daten auf dem Host

* Sharen der Daten zwischen Container

* Eigene, sogenannte Volumes, zum Ablegen von Daten

### Beispiele

* [apache](https://github.com/mc-b/devops/tree/master/docker/apache/) - VM/Docker mit Apache und freigegebenem Volume.
* [apache4X](https://github.com/mc-b/devops/tree/master/docker/apache4X)  apache4Xmm.sh Shellscript zur Erstellung von 4 Containern.


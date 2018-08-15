Reflexion / Dokumentation
-------------------------

Ein Dienst ist ein Programm, das beim Start des Rechners automatisch ausgeführt wird und im Hintergrund darauf wartet, seine Aufgabe zu erledigen. 

Prinzipiell gibt es zwei Arten von Diensten: 
* interne für beim Systemstart relevante bzw. hardwarenahe Aufgaben
* vom Benutzer nachinstallierte Dienste, zu denen in der Regel alle Serverdienste gehören.

[systemd](https://wiki.ubuntuusers.de/systemd/) ist ein System- und Sitzungs-Manager (Init-System), der für die Verwaltung aller auf dem System laufenden Dienste über die gesamte Betriebszeit des Rechners, vom Startvorgang bis zum Herunterfahren, zuständig ist.

Der Cron-Daemon ist ein Dienst, der automatisch Skripte und Programme zu vorgegebenen Zeiten starten kann. 

Anacron ist ein cron-ähnlicher Taskplaner, allerdings erfordert er nicht das kontinuierliche Laufen des Systems. Er kann zum Ausführen von täglich, wöchentlich oder monatlich (und ab Ubuntu 14.04 auch stündlich) anstehenden Aufträgen verwendet werden, die normalerweise von cron ausgeführt werden.

### Beispiele

* [iotsrv](https://github.com/mc-b/devops/tree/master/vagrant/iotsrv) - Multi Maschine Umgebung mit REST / CGI 

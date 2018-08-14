Sicherheitstips
---------------

Diese Seite enthält praktische Tipps zum Absichern von Container-Deployments.

Nicht alle Ratschläge werden für alle Deployments umsetzbar sein, aber Sie sollten sich mit den grundlegenden Tools vertraut machen, die Sie dabei einsetzen können.

Die nachfolgenden Sicherheitstips sind aus dem Buch: [Docker, Adrian Mouat, dpunkt.verlag](https://www.dpunkt.de/buecher/12553/9783864903847-docker.html).

### Ein User setzen

Um zu vermeiden, dass root genutzt wird, sollten Ihre Dockerfiles immer einen Benutzer mit weniger Rechten erstellen und mit der USER-Anweisung zu ihm wechseln.

	RUN groupadd -r user_grp && useradd -r -g user_grp user
	USER user
	
### Netzwerkzugriffe von Containern beschränken

Ein Container sollte in der Produktivumgebung nur die Ports öffnen, die er tatsächlich benötigt, und diese sollten auch nur für die anderen Container erreichbar sein, die sie brauchen.

### setuid/setgid-Binaries entfernen

Die Wahrscheinlichkeit, dass Ihre Anwendung keine setuid- oder setgid-Binaries benötigt, ist recht hoch.14 Können wir solche Binaries deaktivieren oder entfernen, verhindern wir, dass sie zur unerlaubten Rechteauswertung eingesetzt werden.

	FROM ubuntu:14.04
	
	... Installation der benötigten Software
	... User anlegen
	
	RUN find / -perm +6000 -type f -exec chmod a-s {} \; || true

### Den Speicher begrenzen

Durch die Begrenzung des verfügbaren Speichers schützen Sie sich vor DoSAngriffen und Anwendungen mit Speicherlecks, die nach und nach den Speicher
auf dem Host auffressen.

	docker run -m 128m --memory-swap 128m amouat/stress stress --vm 1 --vm-bytes 127m -t 5s
	
### Den CPU-Einsatz beschränken

Kann ein Angreifer einen Container – oder eine ganze Gruppe – dazu bringen, die CPU des Host vollständig auszulasten, werden andere Container auf dem Host
nicht mehr arbeiten können, und man hat es mit einem DoS-Angriff zu tun.

In Docker wird die CPU-Zuteilung über eine relative Gewichtung ermittelt, wobei ein Standardwert von 1024 genutzt wird – normalerweise erhalten also
alle Container gleich viel CPU-Zeit.

Beispiel: starten von 4 Container mit unterschiedlicher CPU Gewichtung

	docker run -d --name load1 -c 2048 amouat/stress
	docker run -d --name load2 amouat/stress
	docker run -d --name load3 -c 512 amouat/stress
	docker run -d --name load4 -c 512 amouat/stress
	docker stats $(docker inspect -f {{.Name}} $(docker ps -q))

### Neustarts begrenzen

Stirbt ein Container immer wieder und wird dann neu gestartet, muss das System nicht unerheblich Zeit und Ressourcen aufwenden, was im Extremfall auch zu
einem DoS führen kann. 

Das lässt sich leicht mit der Neustart-Vorgabe on-failure statt always vermeiden. 

	docker run -d --restart=on-failure:10 my-flaky-image
	
### Zugriffe auf die Dateisysteme begrenzen

Wenn Sie verhindern, dass Angreifer in Dateien schreiben, stören Sie eine ganze Reihe von Angriffen und machen das Leben von Hackern ganz allgemein schwerer.

Sie können kein Skript in eine Datei schreiben und Ihre Anwendung dazu bringen, diese auszuführen, oder kritische Daten oder Konfigurationsdateien überschreiben.

Seit Docker 1.5 können Sie docker run das Flag --read-only übergeben, welches das Dateisystem des Containers komplett schreibgeschützt macht:

	docker run --read-only ubuntu touch x
	
### Capabilities einschränken
 
Der Linux-Kernel definiert eine Reihe von Berechtigungen – Capabilities –, welche Prozessen zugewiesen werden können, um ihnen einen erweiterten Zugriff
auf das System zu gestatten.

Die Capabilities decken einen großen Funktionsbereich ab, vom Ändern der Systemzeit bis hin zum Öffnen von Netzwerk-Sockets.

	docker run --cap-drop all --cap-add CHOWN ubuntu chown 100 /tmp

### Ressourcenbeschränkungen (ulimits) anwenden

Der Linux-Kernel definiert Ressourcenbeschränkungen, die für Prozesse gesetzt werden können – zum Beispiel die Anzahl der Kind-Prozesse, die sich forken lassen, oder die Anzahl der zulässigen offenen File-Deskriptoren. 

Diese lassen sich auch auf Docker-Container anwenden – entweder durch Übergabe des Flags --ulimit an docker run oder durch das Setzen containerübergreifender Standards per --default-ulimit beim Start des Docker Daemon.

	docker run --ulimit cpu=12:14 amouat/stress stress --cpu 1


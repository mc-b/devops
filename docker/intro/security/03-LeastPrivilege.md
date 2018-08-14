Least Privilege
---------------

Ein weiteres wichtiges Prinzip, dem Sie folgen sollten, ist das des Least Privilege – der geringsten Rechte. Jeder Prozess und Container sollte nur mit so viel Zugriffsrechten und Ressourcen laufen, wie er gerade braucht, um seine Aufgaben zu erfüllen. 

Der größte Vorteil davon ist, dass ein Angreifer bei einem kompromittierten Container trotzdem nur begrenzte Rechte hat, um auf andere Daten oder
Ressourcen zuzugreifen.

Um dieses Ziel zu erreichen, können Sie einige Schritte gehen, um die Möglichkeiten von Containern einzuschränken, zum Beispiel:

* sicherstellen, dass Prozesse in Containern nicht als root laufen, so dass das Ausnutzen von Sicherheitslücken in einem Prozess dem Angreifer keine root-
Berechtigungen geben
* Dateisysteme schreibgeschützt einsetzen, so dass Angreifer keine Daten überschreiben oder böswillige Skripten speichern können
* die Kernel-Aufrufe, die ein Container ausführen kann, einschränken, um die Angriffsoberfläche zu verringern
* die Ressourcen begrenzen, die ein Container nutzen kann, um DoS-Angriffe zu verhindern, bei denen ein kompromittierter Container oder eine Anwendung
so viele Ressourcen aufbraucht (wie zum Beispiel Speicher oder CPUZeit), dass der Host zum Halten kommt

**Docker-Berechtigungen == Root-Berechtigungen**

Dieses Kapitel konzentriert sich auf die Sicherheit beim Ausführen von Containern, aber ich möchte Sie auch darauf hinweisen, dass Sie darauf
achten müssen, wem Sie Zugriff auf den Docker Daemon gewähren. Jeder Benutzer, der Docker-Container starten und ausführen kann, besitzt letztendlich
root-Zugriff auf den Host. Denken Sie zum Beispiel daran, dass Sie folgenden Befehl ausführen können:

	docker run -v /:/homeroot -it ubuntu bash

Jetzt können Sie auf jede Datei und jeden Befehl auf dem Host-Rechner zugreifen.

Lassen Sie für Ihren Docker-Container einen Zugriff über die Remote-API zu, achten Sie darauf, wie Sie diesen absichern und wem Sie den
Zugriff erteilen. Beschränken Sie den Zugriff wenn möglich auf das lokale Netzwerk.
Reflexion / Dokumentation
-------------------------

Linux kennt als Multiuser-Betriebssystem - wie alle unixoiden Betriebssysteme - das Konzept verschiedener Benutzer. Diese haben nicht alle unbedingt dieselben Rechte und Privilegien. 

Neben den eigentlichen Benutzerkonten für reale Personen existieren auf dem System noch viele **Systemdienste mit einem eigenen Benutzerkonto**. Dadurch wird erreicht, dass eine mögliche Schwachstelle in einem Dienst nicht zu große Auswirkungen auf das System haben kann.

Das Homeverzeichnis ist der Ort, an dem Benutzer ihre Daten ablegen können und an dem Programme ihre benutzerspezifischen Einstellungen hinterlegen. Nur hier hat der einzelne Benutzer volle Schreib- und Leserechte. Und nur hier sollten Benutzer ihre Daten speichern. 

Dateisysteme sind die Schnittstellen zwischen dem Betriebssystem und den Partitionen auf Datenträgern. Sie organisieren die geordnete Ablage von Daten.

Zugriffsrechte regeln, welcher Benutzer und welche Gruppe den Inhalt eines Verzeichnisses (ein Verzeichnis ist auch nur eine Datei) lesen, schreiben oder ausführen darf.

### Beispiele

* [https://github.com/mc-b/devops/tree/master/vagrant/ssh](mm/) - Multi Maschine Umgebung mit fixen IP-Adressen und zwei Admin Usern

### Hinweise

Die Befehle `useradd` zum User anzulegen etc. sind extra nicht in der Doku vorhanden, damit Sie selber auf dem 
Internet recherchieren müssen, bzw. den Link unten auf der entsprechenden Seite anwählen.

Problematisch ist allerdings das Password mitzugeben, dass geht nur mit Tricks:

	# User und Gruppen in alle VM hinzufuegen
	config.vm.provision "shell", inline: <<-SHELL
      sudo groupadd myadmin
      sudo useradd admin01 -g myadmin -m -s /bin/bash
      sudo useradd admin02 -g myadmin -m -s /bin/bash
      sudo chpasswd <<<admin01:admin
      sudo chpasswd <<<admin02:admin
	SHELL

Drei <<< sind Gleichbedeutend mit 

	chpasswd <<%EOF%
	admin01:admin
	%EOF%

was im Vagrantfile Probleme bereiten könnte.
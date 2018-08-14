Benutzer und Gruppen
--------------------

### Benutzer

Linux kennt als Multiuser-Betriebssystem - wie alle unixoiden Betriebssysteme - das Konzept verschiedener Benutzer. Diese haben nicht alle unbedingt dieselben Rechte und Privilegien. 

Neben den eigentlichen Benutzerkonten für reale Personen existieren auf dem System noch viele **Systemdienste mit einem eigenen Benutzerkonto**. Dadurch wird erreicht, dass eine mögliche Schwachstelle in einem Dienst nicht zu große Auswirkungen auf das System haben kann.

![](../images/user.png)

Die Benutzer stehen in der Datei `/etc/passwd`. Die Passwörter in der Datei `/etc/shadow`.

Der Systemverwalteraccount "root" hat alle Rechte. Da dieser kein Password besitzt kann mit diesem nicht eingeloggt werden. Sollen Befehle mit "root" durchgeführt werden ist `sudo` voranzustellen.

Beispiele:

	sudo apt-get update
	sudo apt-get -y install apache2

Wer und wie (z.B. mit/ohne Password) ein Benutzer `sudo` verwenden kann steht in der Datei `/etc/sudoers` bzw. im Verzeichnis `/etc/sudoers.d`.

### Gruppen

Jeder Benutzer ist einer Hauptgruppe zugeordnet, kann daneben aber auch Mitglied weiterer Gruppen sein. Der Zugriff auf gewisse Hardware oder Dienste ist auf die Mitglieder einer bestimmten Gruppe beschränkt. So dürfen z.B. nur Benutzer, die zur Gruppe "audio" gehören, Klänge über die Soundkarte ausgeben. Möchte man nun einem Benutzer die Berechtigung für die Soundkarte geben, so erreicht man dies, indem man ihn in die Gruppe "audio" aufnimmt.

Die Gruppen stehen in der Datei `/etc/group`

### Links

* [Benutzer und Gruppen](https://wiki.ubuntuusers.de/Benutzer_und_Gruppen/)
* [Proper way to add a user account via bash script](http://askubuntu.com/questions/319714/proper-way-to-add-a-user-account-via-bash-script)
* [sudo](https://wiki.ubuntuusers.de/sudo/)
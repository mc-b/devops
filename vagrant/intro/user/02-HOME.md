Homeverzeichnis
---------------

	ubuntu@db01:~$ ll -a
	total 28
	drwxr-xr-x 3 ubuntu ubuntu 4096 Jan 30 10:28 ./
	drwxr-xr-x 3 root   root   4096 Jan 29 16:10 ../
	-rw------- 1 ubuntu ubuntu  634 Jan 29 17:52 .bash_history
	-rw-r--r-- 1 ubuntu ubuntu  220 Aug 31  2015 .bash_logout
	-rw-r--r-- 1 ubuntu ubuntu 3771 Aug 31  2015 .bashrc
	-rw-r--r-- 1 ubuntu ubuntu  655 Jun 24  2016 .profile
	drwx------ 2 ubuntu ubuntu 4096 Jan 29 16:11 .ssh/

<p style="font-size: 0.5em">Homeverzeichnis</p>

- - -

Das Homeverzeichnis ist der Ort, an dem Benutzer ihre Daten ablegen können und an dem Programme ihre benutzerspezifischen Einstellungen hinterlegen. Nur hier hat der einzelne Benutzer volle Schreib- und Leserechte. Und nur hier sollten Benutzer ihre Daten speichern. 

Das Homeverzeichnis setzt sich aus `/home` und dem jeweiligen Benutzernamen zusammen.

Einstellungen werden üblicherweise in versteckten Dateien und Verzeichnissen gespeichert. Diese erkennt man daran, dass die Namen mit einem Punkt beginnen. `.bashrc` oder `.ssh` sind Beispiele für solche Konfigurationsdateien bzw. -verzeichnisse.

### Das Zeichen "~"

Oft wird die Kurzform ~/Ordnername verwendet. Die Tilde ~ steht für eine Shell-Extension, also quasi eine Abkürzung, die immer auf /home/BENUTZERNAME/ verweist. Heißt der Benutzer also z.B. db01 wird `~` durch `/home/db01/` ersetzt.

### Login Prozess

Beim Einloggen eines Users werden folgende Konfigurationen durchlaufen:

* `/etc/profile.d` 
* `~/.profile`
* `~/.bashrc`

Im Verzeichnis `/etc/profile.d` stehen Einstellungen für alle Benutzer.  


### Links

* [Homeverzeichnis](https://wiki.ubuntuusers.de/Homeverzeichnis/)
* [Der Login Prozess im Detail](http://flylib.com/books/en/1.304.1.112/1/)
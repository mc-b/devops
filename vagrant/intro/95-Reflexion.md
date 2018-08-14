Reflexion / Dokumentation
-------------------------

[Vagrant](https://de.wikipedia.org/wiki/Vagrant_(Software)) ist eine Open-Source Ruby-Anwendung zum Erstellen und Verwalten von virtuellen Maschinen.

Vagrant wird über die Kommandozeile [(CLI)](https://de.wikipedia.org/wiki/Kommandozeile) bedient.

Die wichtigsten Befehle sind:

- [vagrant init](https://www.vagrantup.com/docs/cli/init.html) - Initialisiert im aktuellen Verzeichnis eine Vagrant Umgebung und erstellt, falls nicht vorhanden, ein Vagrantfile.
- [vagrant up](https://www.vagrantup.com/docs/cli/up.html) - Erzeugt und Konfiguriert eine neue Virtuelle Maschine, basierend auf Vagrantfile.
- [vagrant ssh](https://www.vagrantup.com/docs/cli/ssh.html) - Wechselt von lokalen CLI in die CLI Umgebung (Bash) der Virtuellen Maschine mittels [SSH](https://de.wikipedia.org/wiki/Secure_Shell)
- [vagrant status](https://www.vagrantup.com/docs/cli/status.html) - Zeigt den aktuellen Status des VM an
- [vagrant port](https://www.vagrantup.com/docs/cli/port.html) - Zeigt die Weitergeleiteten Ports der VM an
- [vagrant halt](https://www.vagrantup.com/docs/cli/halt.html) - Stoppt die laufende Virtuelle Maschine
- [vagrant destroy](https://www.vagrantup.com/docs/cli/destroy.html) - Stoppt die Virtuelle Maschine und zerstört sie.

### Beispiele

* [web](https://github.com/mc-b/devops/tree/master/vagrant/web) - Einfacher Webserver 
* [db](https://github.com/mc-b/devops/tree/master/vagrant/db) - Datenbank
* [rest](https://github.com/mc-b/devops/tree/master/vagrant/rest) - Multi Maschine Umgebung mit REST / CGI 
* [iot](https://github.com/mc-b/devops/tree/master/vagrant/iot) - IoTKit Entwicklungsumgebung

### Hinweise

* Bei Platzproblemen auf dem Harddisk ist es Empfehlenswert nach jeweiligen Übung die VM(s) mittels `vagrant destroy -f` wieder zu zerstören.

* Die Ablageort der VMs kann in VirtualBox im Pulldownmenu unter -> Datei -> Einstellungen verändert werden.

* Das Verzeichnis `.vagrant` (wo sich auch die Vagrantfile Datei befindet) beinhaltet einen Link auf die VM und den SSH Key aber keine VM. 

* Ist das laden der Pakete zu langsam, können die lokalen Paketquellen verwendet werden. Dazu die `Vagrantfile` wie folgt Erweitern:

    # Packages vom lokalen Server holen
    config.vm.provision "shell", inline: <<-SHELL
    	sudo sed -i -e"1i deb 10.1.66.11/apt-mirror/mirror/archive.ubuntu.com/ubuntu xenial main restricted" /etc/apt/sources.list
    	sudo ap-get update
    	SHELL
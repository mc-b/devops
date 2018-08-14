Reflexion / Dokumentation
-------------------------

Die OpenSSH-Suite ist fester Bestandteil quasi aller Linux-Distributionen.

Diese drei wichtigen Eigenschaften führten zum Erfolg von ssh :
* Authentifizierung der Gegenstelle, kein Ansprechen falscher Ziele
* Verschlüsselung der Datenübertragung, kein Mithören durch Unbefugte
* Datenintegrität, keine Manipulation der übertragenen Daten

Wem die Authentifizierung über Passwörter trotz der Verschlüsselung zu unsicher ist, der benutzt das Public-Key-Verfahren. Hierbei wird asymmetrische Verschlüsselung genutzt, um den Benutzer zu authentifizieren. 

Tunnel bzw. Tunneling bezeichnet in einem Netzwerk die Konvertierung und Übertragung eines Kommunikationsprotokolls, das für den Transport in ein anderes Kommunikationsprotokoll eingebettet wird. 

### Beispiele

* [ssh](https://github.com/mc-b/devops/tree/master/vagrant/ssh/) - Multi Maschine Umgebung mit fixen IP-Adressen, zwei Admin Usern und SSH Keys

### Hinweise

-

### Lösung

Siehe Zeilen mit `su - admin01 -c "m ....`, welche Zusätzlich einzufügen sind. Zusätzlich werden die Server in /etc/hosts eingetragen
um den Wechsel von Server zu Server zu Vereinfachen.

Die Keys müssen manuell mittels `ssh-copy-id web01:` von der database VM auf die web VM kopiert werden.

	# -*- mode: ruby -*-
	# vi: set ft=ruby :
	
	# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
	VAGRANTFILE_API_VERSION = "2"
	
	Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	  # All Vagrant configuration is done here. The most common configuration
	  # options are documented and commented below. For a complete reference,
	  # please see the online documentation at vagrantup.com.
	
	  # Every Vagrant virtual environment requires a box to build off of.
	  config.vm.define "database" do |db|
	    db.vm.box = "ubuntu/xenial64"
		db.vm.provider "virtualbox" do |vb|
		  vb.memory = "512"  
		end
	    db.vm.hostname = "db01"
	    db.vm.network "private_network", ip: "192.168.55.100"
	    # MySQL Port nur im Private Network sichtbar
		# db.vm.network "forwarded_port", guest:3306, host:3306, auto_correct: false
	  	db.vm.provision "shell", path: "db.sh"
		db.vm.provision "shell", inline: <<-SHELL
		  # Debug ON!!!
	      set -o xtrace
		  echo '127.0.0.1 localhost db01\n192.168.55.101 web01' > /etc/hosts
	      su - admin01 -c "mkdir .ssh && chmod 700 .ssh && ssh-keygen -t rsa -f .ssh/id_rsa -b 4096 -C admin01@tbz.ch -P ''"
	      su - admin02 -c "mkdir .ssh && chmod 700 .ssh && ssh-keygen -t rsa -f .ssh/id_rsa -b 4096 -C admin02@tbz.ch -P ''"
	SHELL
	  end
	  
	  config.vm.define "web" do |web|
	    web.vm.box = "ubuntu/xenial64"
	    web.vm.hostname = "web01"
	    web.vm.network "private_network", ip:"192.168.55.101"
		web.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true
		web.vm.provider "virtualbox" do |vb|
		  vb.memory = "512"  
		end     
	  	web.vm.synced_folder ".", "/var/www/html"  
		web.vm.provision "shell", inline: <<-SHELL
		  # Debug ON!!!
	      set -o xtrace
		  sudo apt-get update
		  sudo apt-get -y install apache2 mysql-client nmap
		  echo '127.0.0.1 localhost web01\n192.168.55.100 db01' > /etc/hosts
	SHELL
		end 
		# User und Gruppen in alle VM hinzufuegen
		config.vm.provision "shell", inline: <<-SHELL
		  # Debug ON!!!
	      set -o xtrace
	      sudo groupadd myadmin
	      sudo useradd admin01 -g myadmin -m -s /bin/bash
	      sudo useradd admin02 -g myadmin -m -s /bin/bash
	      sudo chpasswd <<<admin01:admin
	      sudo chpasswd <<<admin02:admin
	SHELL
	 end

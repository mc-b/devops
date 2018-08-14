Firewall
--------

[ufw](http://wiki.ubuntuusers.de/ufw) steht für Uncomplicated Firewall. Ziel von ufw ist es, ein unkompliziertes Kommandozeilen-basiertes Frontend für das sehr leistungsfähige, aber nicht gerade einfach zu konfigurierende [iptables](https://de.wikipedia.org/wiki/Iptables) zu bieten. ufw unterstützt sowohl IPv4 als auch IPv6.


### Ausgabe der offenen Ports {#ausgabe-der-offenen-ports}

	netstat -tulpen
	
### Installation {#installation}

	sudo apt-get install ufw

### Start / Stop {#start-stop}

	sudo ufw status
	sudo ufw enable
	sudo ufw disable

### Firewall Regeln {#firewall-regeln}

	# Port 80 (HTTP) öffnen für alle
	vagrant ssh web
	sudo ufw allow 80/tcp
	exit
	
	# Port 22 (SSH) nur für den Host (wo die VM laufen) öffnen
	vagrant ssh web
	w
	sudo ufw allow from 10.0.2.2 to any port 22
	exit
	
	# Port 3306 (MySQL) nur für den web Server öffnen
	vagrant ssh database
	sudo ufw allow from 192.168.55.101 to any port 3306
	exit
	
**Testen:**

	curl -f 192.168.55.101
	curl -f 192.168.55.100:3306
		
		
**Löschen von Regeln:**

	sudo ufw status numbered
	sudo ufw delete 1


### Ausgehende Verbindungen

Ausgehende Verbindungen werden standardmässig erlaubt. 

Werden keine Ausgehenden Verbindungen benötigt oder nur bestimmte (z.B. ssh) können zuerst alle geschlossen und dann einzelne Freigeschaltet werden.

	sudo ufw deny out to any
	sudo ufw allow out 22/tcp 

### Links

* [Schützen Sie Ihr System mit der Firewall UFW](http://www.ubuntu-user.de/Heft/Heftarchiv/2010/1/Schuetzen-Sie-Ihr-System-mit-der-Firewall-UFW)
* [Die Neuerungen von Linux 4.10 ](https://www.heise.de/ct/artikel/Die-Neuerungen-von-Linux-4-10-3596869.html)
Reflexion / Dokumentation
-------------------------

Eine [Firewall](http://de.wikipedia.org/wiki/Firewall) (von englisch firewall ‚Brandwand‘ oder ‚Brandmauer‘) ist ein Sicherungssystem, das ein Rechnernetz oder einen einzelnen Computer vor unerwünschten Netzwerkzugriffen schützt und ist weiter gefasst auch ein Teilaspekt eines Sicherheitskonzepts.

Der [Reverse Proxy](http://de.wikipedia.org/wiki/Reverse_Proxy) ist ein Proxy, der Ressourcen für einen Client von einem oder mehreren Servern holt. Die Adressumsetzung wird in der entgegengesetzten Richtung vorgenommen, wodurch die wahre Adresse des Zielsystems dem Client verborgen bleibt. Während ein typischer Proxy dafür verwendet werden kann, mehreren Clients eines internen (privaten – in sich geschlossenen) Netzes den Zugriff auf ein externes Netz zu gewähren, funktioniert ein Reverse Proxy genau andersherum.

### Beispiele

* [fwrp](https://github.com/mc-b/devops/tree/master/vagrant/fwrp/) - Apache (als Reverse Proxy), MySQL und ein Master Server mit OpenLDAP.

### Hinweise

Neben dem Einrichten des Firewall muss man beachten, dass das Monitoring vom db01 an master nicht mehr funktioniert, weil der
Port 80 gesperrt ist.

Der Croneintrag ist wie folgt zu ändern:

	/1   *    *    *    *	curl -f http://localhost:3306 && { curl -X POST http://web01/master/cgi-bin/rest -d "MySQL=up"; } || { curl -X POST http://web01/master/cgi-bin/rest -d "MySQL=down"; }
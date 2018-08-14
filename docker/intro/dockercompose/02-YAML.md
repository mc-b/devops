YAML -  "YAML Ain't Markup Language"
------------------------------------


	apache:
	 # Einzelwert 
	 build: apache
	 # Array 
	 ports:
	  - 8080:80
	  - 2222:22
	 volumes:
	  - ~/web:/var/www/html
	  
Beispiel einer docker-compose.yml Datei 

- - -

[YAML](https://de.wikipedia.org/wiki/YAML) ist eine vereinfachte Auszeichnungssprache (englisch markup language) zur Datenserialisierung, angelehnt an XML (ursprünglich) und an die Datenstrukturen in den Sprachen Perl, Python und C sowie dem in [RFC 2822](https://tools.ietf.org/html/rfc2822) vorgestellten E-Mail-Format.

***Design Ziele***

Die grundsätzliche Annahme von YAML ist, dass sich jede beliebige Datenstruktur nur mit assoziativen Listen, Listen (Arrays) und Einzelwerten (Skalaren) darstellen lässt. Durch dieses einfache Konzept ist YAML wesentlich leichter von Menschen zu lesen und zu schreiben als beispielsweise XML, außerdem vereinfacht es die Weiterverarbeitung der Daten, da die meisten Sprachen solche Konstrukte bereits integriert haben.

### Links

* [Offizielle Website](http://www.yaml.org/)
* [ YAML-Spezifikation](http://www.yaml.org/spec/)
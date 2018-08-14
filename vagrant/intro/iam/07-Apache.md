Apache HTTPS (Web) Server
-------------------------

![](../../../images/Apache.png)

[HyperText Transfer Protocol Secure](https://de.wikipedia.org/wiki/Hypertext_Transfer_Protocol_Secure) (HTTPS, englisch für sicheres Hypertext-Übertragungsprotokoll) ist ein Kommunikationsprotokoll im World Wide Web, um Daten abhörsicher zu übertragen. Technisch definiert es als eine zusätzliche Schicht zwischen HTTP und TCP.

Der aktuelle Apache Server ist in der aktuellen Version bereits für HTTPS vorbereitet.

### https:// Freischalten {#https-freischalten}

	# Default Konfiguration in /etc/apache2/sites-available freischalten (wird nach sites-enabled verlinkt)
	sudo a2ensite default-ssl.conf
	# SSL Modul in Apache2 aktivieren
	sudo a2enmod ssl
	
	# Optional http:// deaktivieren
	sudo a2dissite 000-default.conf 
	# Datei /etc/apache2/ports.conf editieren und <Listen 80< durch Voranstellen von # deaktivieren
	
	# Apache Server frisch starten
	sudo service apache2 restart

### User/Password Authentisierung aktivieren {#user-password-authentisierung-aktivieren}

	# .htpasswd Datei erzeugen (ab dem zweiten User ohne -c), Password wird verlangt                        
	sudo htpasswd -c /etc/apache2/.htpasswd guest
	
	# /etc/apache2/sites-enabled/default-ssl.conf Editieren und vor </VirtualHost> folgendes Einfügen
	  <Directory "/var/www/html">
	        AuthType Basic
	        AuthName "Restricted Content"
	        AuthUserFile /etc/apache2/.htpasswd
	        Require valid-user
	    </Directory>

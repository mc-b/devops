LDAP - Lightweight Directory Access Protocol
--------------------------------------------

    dn: cn=Muster,cn=apache2,dc=nodomain
    cn:  Muster
    gidnumber: 500
    homedirectory: /home/users/Muster
    loginshell: /bin/sh
    objectclass: inetOrgPerson
    objectclass: posixAccount
    objectclass: top
    sn: Muster
    uid: muster
    uidnumber: 1000
    userpassword: {MD5}9WGq9u8L8U1CCLtGpMyzrQ==
 
Beispiel für ein LDAP Entry

- - -

[LDAP](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol) basiert auf dem Client-Server-Modell und kommt bei sogenannten Verzeichnisdiensten (englisch directories oder directory services) zum Einsatz. 

Es beschreibt die Kommunikation zwischen dem LDAP-Client und dem Verzeichnis-(Directory-)Server. 

Aus einem solchen Verzeichnis können objektbezogene Daten, wie zum Beispiel Personendaten oder Rechnerkonfigurationen, ausgelesen werden. 

Die Kommunikation erfolgt auf Basis von Abfragen.

Das Verzeichnis kann beispielsweise ein Adressbuch enthalten: In seinem E-Mail-Client stößt ein Nutzer die Aktion Suche die Mailadresse von Joe User an. Der E-Mail-Client formuliert eine LDAP-Abfrage an das Verzeichnis, das die Adressinformationen bereitstellt. Das Verzeichnis formuliert die Antwort und übermittelt sie an den Client: joe.doe@example.org.

Mittlerweile hat sich im administrativen Sprachgebrauch eingebürgert, dass man von einem LDAP-Server spricht. Damit meint man einen Directory-Server, dessen Datenstruktur der LDAP-Spezifikation entspricht und der über das LDAPv3-Protokoll Daten austauschen kann.

### Beispiel

Im Verzeichnis ldap befindet ein Vagrantfile welcher OpenLDAP mit UI ([http://localhost:8081/phpldapadmin](http://localhost:8081/phpldapadmin)) auf der Master VM installiert.

Einloggen mittels:
* Login DN: cn=admin,dc=nodomain
* Password: admin 

Anschliessend können Einträge im LDIF Format importiert werden, z.B.:

[Posix](https://de.wikipedia.org/wiki/Portable_Operating_System_Interface) Gruppe, entspricht Eintrag in /etc/group

    dn: cn=apache2,dc=nodomain
    cn: apache2
    gidnumber: 500
    objectclass: posixGroup
    objectclass: top

[Posix](https://de.wikipedia.org/wiki/Portable_Operating_System_Interface) Account, entspricht Eintrag in /etc/passwd

    dn: cn=Muster,cn=apache2,dc=nodomain
    cn:  Muster
    gidnumber: 500
    homedirectory: /home/users/Muster
    loginshell: /bin/sh
    objectclass: inetOrgPerson
    objectclass: posixAccount
    objectclass: top
    sn: Muster
    uid: muster
    uidnumber: 1000
    userpassword: {MD5}9WGq9u8L8U1CCLtGpMyzrQ==
    
#### Konfiguration Apache

Anschliessend ist der Apache Webserver so zu konfigurieren, dass User/Password via LDAP geholt werden.

Dazu ist die Datei `/etc/apache2/apache2.conf` wie folgt zu Erweitern (Zeilen innerhalb `<Directory /var/www> </Directory>`):

    <Directory /var/www/>
            Options Indexes FollowSymLinks
            AllowOverride None
            #Require all granted
            Order deny,allow
            Deny from All
            AuthName "Company.com Intranet"
            AuthType Basic
            AuthBasicProvider ldap
            #AuthzLDAPAuthoritative off
            AuthLDAPUrl ldap://localhost/dc=nodomain?uid
            Require valid-user
            Satisfy any
    </Directory>

Nach den dem Restart von Apache mittels `service apache2 restart`,  erscheint eine Loginmaske auf [http://localhost:8081](http://localhost:8081) wo man sich mittels Username `muster` und Password `xxx` am Webserver anmelden kann.

### Befehle

Ausgabe Server Informationen

    slapcat
    
Ausgabe aller Entries im LDAP Server

    ldapsearch -x -LLL -H ldap:/// -b dc=nodomain dn
    
Aufbereiten der Klassendatei aus Microsoft Office 365 im LDIF Format. 

Dazu muss die Klassendatei wie folgt aufbereitet und im CSV Format (mit Strichpunkt als Trennzeichen) gespeichert sein:

    Name      Vorname   Ablageort                             Username
    Muster    Hans      git@gitlab.com:hmuster/M300.git       hmuster

    sed -n '1,$p' test.csv | awk -F";" 'BEGIN { i=1002 }
                                                   { print "dn: cn="$4",cn=apache2,dc=nodomain\n" \
                                                     "changetype: add\n"\
                                                     "cn: " $4"\n"\
                                                     "gidnumber: 500\n"\
                                                     "homedirectory: /home/users/"$4"\n"\
                                                     "loginshell: /bin/sh\n"\
                                                     "objectClass: inetOrgPerson\n"\
                                                     "objectClass: posixAccount\n"\
                                                     "objectClass: top\n"\
                                                     "sn: " $1"\n"\
                                                     "uid: " $3"\n"\
                                                     "userpassword: {MD5}9WGq9u8L8U1CCLtGpMyzrQ=="
                                                     print "uidnumber: " i++ "\n"
                                                     }' >adressen.ldif
    ldapadd -x -D "cn=admin,dc=nodomain" -w admin -f adressen.ldif


### Links

* [Wikipedia](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol)
* [LDAP Software](https://en.wikipedia.org/wiki/List_of_LDAP_software)
* [OpenLDAP-Server](https://help.ubuntu.com/lts/serverguide/openldap-server.html)
* [How To Install and Configure OpenLDAP and phpLDAPadmin](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-openldap-and-phpldapadmin-on-an-ubuntu-14-04-server)
* [How To Use LDIF Files](https://www.digitalocean.com/community/tutorials/how-to-use-ldif-files-to-make-changes-to-an-openldap-system)
* [Apache Authentication and Authorization](https://httpd.apache.org/docs/trunk/howto/auth.html)


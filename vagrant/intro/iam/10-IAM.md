Identitätsmanagement
--------------------

	Certificate:
	    Data:
	        Version: 3 (0x2)
	        Serial Number: 1 (0x1)
	        Signature Algorithm: md5WithRSAEncryption
	        Issuer: C=AT, ST=Steiermark, L=Graz, O=TrustMe Ltd, OU=Certificate Authority, CN=CA/Email=ca@trustme.dom
	        Validity
	            Not Before: Oct 29 17:39:10 2000 GMT
	            Not After : Oct 29 17:39:10 2001 GMT
	        Subject: C=AT, ST=Vienna, L=Vienna, O=Home, OU=Web Lab, CN=anywhere.com/Email=xyz@anywhere.com
	        Subject Public Key Info:
	            Public Key Algorithm: rsaEncryption
	            RSA Public Key: (1024 bit)
	                Modulus (1024 bit):
	                    00:c4:40:4c:6e:14:1b:61:36:84:24:b2:61:c0:b5:
	                    ...
	                Exponent: 65537 (0x10001)
	        X509v3 extensions:
	            X509v3 Subject Alternative Name:
	                email:xyz@anywhere.com
	            Netscape Comment:
	                mod_ssl generated test server certificate
	            Netscape Cert Type:
	                SSL Server
	    Signature Algorithm: md5WithRSAEncryption
	        12:ed:f7:b3:5e:a0:93:3f:a0:1d:60:cb:47:19:7d:15:59:9b:
			...
			
Beispiel für ein [X.509-Zertifikat](https://de.wikipedia.org/wiki/X.509)

- - -

Als Identitätsmanagement (IdM) wird der zielgerichtete und bewusste Umgang mit Identität, Anonymität und Pseudoanonymität bezeichnet. Der Personalausweis ist ein Beispiel für eine staatlich vorgegebene Form der Identifizierung.

Durch die Vernetzung über das Internet hat die Frage von bewusster Anonymität bzw. bewusstem Umgang mit Teilen der eigenen Identität eine neue und zuvor nie gekannte Komplexitätsstufe erreicht. 

Im Internet wird regelmäßig mit (Teil-)Identitäten gespielt. Es gibt aber auch ernsthafte Prozesse und Fragen der Anonymität im Internet und der Identifizierbarkeit. In vielerlei Hinsicht können Identitätsmanagementsysteme problematisch sein, wenn nicht klar ist, was mit den Daten geschieht, die ggf. ungewollt zu weitergehender Identifizierung führen können.

In der realen wie in der digitalen Welt gibt es verschiedenste Formen des Identitätsmanagements. Gemäß ISO/IEC JTC 1/SC 27/WG 5 „A framework for IdM“[1] umfasst IdM:
* den Identifikationsprozess einer Einheit (inkl. optionaler Authentisierung)
* die Information, die mit der Identifikation einer Einheit innerhalb eines bestimmten Kontexts verbunden ist
* die sichere Verwaltung von Identitäten.

### Warum Identitätsmanagement? 

Einer der Gründe, warum man sich in Unternehmen mit Identitätsmanagement (im anglisierten Sprachgebrauch Identity-Management) beschäftigt, ist die Anforderung, personenbezogene Daten konsistent, ständig verfügbar und verlässlich bereitzuhalten. Dienste wie ein Mail-System oder eine Personalbuchhaltung sind auf diese Daten angewiesen, ohne sie wäre kein individualisierter Betrieb möglich.

**Beispiel:** Ein Mitarbeiter hat ein Mail-Konto, das nur ihm selbst zugeordnet ist. Hierfür benötigt er eine individuelle Mailadresse, einen sogenannten Account mit dem dazugehörigen Passwort. Diese Daten sind nur für ihn und nicht für die Allgemeinheit bestimmt.

**Gegenbeispiel:** Eine Firmenpräsentation ist für alle Mitarbeiter einheitlich und bedarf keiner Individualisierung.

### Identitätsmanagement von Unternehmen

Je größer ein Unternehmen ist, desto mehr müssen Identitäten und Berechtigungen verwaltet werden. Dazu werden sogenannte Identity-Management-Architekturen eingesetzt. Dabei handelt es sich um Softwarekomponenten, die die Identitäten und deren Zugriffsrechte verwalten.

Der Begriff Identity-Management im Software-Umfeld umfasst keinen genau definierten Funktionsumfang. So fokussieren sich beispielsweise einfache Systeme ausschließlich auf die Synchronisation von personenbezogenen Daten, während umfassendere Architekturen dagegen Workflow-Prozesse einbeziehen, die ein hierarchisches Genehmigungs-Modell von Vorgesetzten beinhalten, um Datenänderungen umzusetzen.

Eine Identity-Management-Architektur sollte über ein Provisionierungsmodul verfügen, das es erlaubt, den Benutzern automatisch aufgrund ihrer jeweiligen Rolle (und auch Aufgaben) in der Organisation individuelle Berechtigungen zu erteilen. Hier stellt sich aber bereits die Frage, wie weit Identity-Management über die ausschließliche Verwaltung personenbezogener Daten hinweg Applikations-Funktionalitäten integrieren soll (z. B. ist die „Quota“ auf einem Mailserver kein personenbezogenes Datum, sondern eine Applikations-Information).

**Identity-Management in einem Unternehmen hat vielfach Schnittstellen zum sogenannten Access Management**, das beispielsweise für Portale die Zugriffsrechte verwaltet, Single Sign-on (SSO) ermöglicht oder Security Policies verwaltet. Für die Kombination von Identity-Management und Access Management wurde in der Informationstechnik (IT) daher mittlerweile der Begriff „Identity and Access Management“ (IAM oder IdAM) geprägt.

### Links

* [Use an X.509 certificate for SSH Login](https://trueg.wordpress.com/2012/09/06/use-an-x-509-certificate-for-ssh-login/)

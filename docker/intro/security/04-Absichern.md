Container absichern
-------------------

Zu den wichtigsten Dingen, um einen Container abzusichern, gehören:

* Die Container laufen in einer VM oder auf einem dedizierten Host, um zu vermeiden, dass andere Benutzer oder Services angegriffen werden können.

* Der Load Balancer/Reverse Proxy ist der einzige Container, der einen Port nach außen freigibt, wodurch viel Angriffsfläche verschwindet. Monitoring oder Logging-Services sollten über private Schnittstellen oder VPN nutzbar sein.

* Alle Images definieren einen Benutzer und laufen nicht als root.

* Alle Images werden über ihren Hash heruntergeladen oder auf anderem Wege sicher erhalten und verifiziert.

* Die Anwendung wird überwacht und es wird Alarm ausgelöst, wenn eine ungewöhnliche Netzwerklast oder auffällige Zugriffsmuster erkannt werden.

* Alle Container laufen mit aktueller Software und im Produktivmodus – Debug-Informationen sind abgeschaltet.

* AppArmor oder SELinux sind auf dem Host aktiviert

* Services wie z.B. Apache, Mysql ist mir irgendeiner Form der Zugriffskontrolle oder einem Passwortschutz ausgestattet.

**Weitere Massnahmen:**

* Unnötige setuid-Binaries werden aus den identidock-Images entfernt. Damit verringert sich das Risiko, dass Angreifer, die Zugriff auf einen Container erhalten haben, ihre Berechtigungen erweitern können.

* Dateisysteme werden so weit wie möglich schreibgeschützt eingesetzt. 

* Nicht benötigte Kernel-Berechtigungen werden so weit wie möglich entfernt. 

**Beim Einsatz sicherheitskritischer Container:**

* Der Speicher für jeden Container wird durch das Flag -m begrenzt. Damit werden ein paar DoS-Angriffe und Speicherlecks eingedämmt. Die Container
müssen dabei entweder per Profiler analysiert werden oder man gibt sehr großzügige Speichergrenzen vor.

* SELinux mit speziellen Typen für die Container ausführen. Das kann eine sehr effektive Sicherheitsmaßnahme sein, aber sie erfordert einiges an Arbeit.

* Ein ulimit auf die Anzahl der Prozesse anwenden. Diese Grenze ist für den Benutzer des Containers gültig, daher kann es schwieriger einzusetzen sein, als man denkt. So vermeidet man die Gefahr von Fork-Bomben, die als DoSAngriff eingesetzt werden.

* Interne Kommunikation wird verschlüsselt, so dass es für Angreifer schwieriger wird, die Daten zu beeinflussen.

Zusätzlich sollte es regelmäßige Audits für das System geben, um sicherzustellen, dass alles aktuell ist und sich keine Container Ressourcen unter den Nagel reißen.
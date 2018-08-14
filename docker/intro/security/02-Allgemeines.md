Worüber Sie sich Gedanken machen sollten
----------------------------------------

An was für Sicherheitsprobleme sollten Sie also in einer containerbasierten Umgebung denken? 

Die folgende Liste ist nicht abschließend, wird Ihnen aber schon genug Bereiche aufführen:

**Kernel Exploits**

Anders als in einer VM wird der Kernel gemeinsam von allen Containern und dem Host verwendet, wodurch Angriffsstellen im Kernel deutlich mehr Auswirkungen
haben. Sollte ein Container eine Kernel Panic verursachen, zieht das den ganzen Host mit herunter. In VMs ist die Situation viel besser – ein
Angreifer müsste einen Angriff sowohl durch den VM-Kernel als auch den Hypervisor leiten, bevor er an den Host-Kernel kommt.


**Denial-of-Service-(DoS-)Angriffe**

Alle Container teilen sich die Kernel-Ressourcen. Kann ein Container den Zugriff auf bestimmte Ressourcen ganz für sich beanspruchen – auch so etwas
wie den Speicher oder esoterischere Ressourcen wie User IDs (UIDs) –, kann er die anderen Container auf dem Host verhungern lassen, was einem Denialof-
Service entspricht, bei dem berechtigte Anwender nicht mehr Teile des Systems oder das System im Ganzen ansprechen können.

**Container-Breakouts**

Ein Angreifer, der Zugriff auf einen Container erhält, sollte nicht dazu in der Lage sein, auf andere Container oder den Host zuzugreifen. Da die Benutzer
nicht über Namensräume getrennt sind, bekommen alle Prozesse, die aus dem Container ausbrechen, auf dem Host die gleichen Privilegien wie im Container
– sind Sie im Container root, werden Sie auch root auf dem Host.

Das bedeutet auch, dass Sie sich über mögliche Privilege-Escalation-Angriffe Gedanken machen müssen, bei denen ein Anwender mehr Rechte erhält, als ihm
eigentlich zustehen – meist durch einen Fehler im Anwendungscode, der mit zusätzlichen Berechtigungen laufen muss. Da sich die Container-Technologie
immer noch in der Anfangsphase befindet, sollten Sie bei Ihren Überlegungen zur Sicherheit davon ausgehen, dass Container-Breakouts unwahrscheinlich,
aber möglich sind.

**Vergiftete Images**

Woher wissen Sie, dass die von Ihnen eingesetzten Images sicher sind, nicht manipuliert wurden und von dem stammen, der das vorgibt? Kann ein
Angreifer Sie dazu bringen, sein Image auszuführen, sind sowohl der Host als auch Ihre Daten gefährdet. Genauso wollen Sie sicher sein, dass von Ihnen
ausgeführte Images aktuell sind und keine Softwareversionen mit bekannten Sicherheitslücken enthalten.

**Verratene Geheimnisse**

Greift ein Container auf eine Datenbank oder einen Service zu, muss er sehr wahrscheinlich ein Geheimnis wie einen API-Schlüssel oder Benutzernamen
und Passwort kennen. Ein Angreifer, der auf dieses Geheimnis Zugriff hat, kann auch den Service nutzen. Das Problem wird in einer Microservices-
Architektur noch akuter, in der Container fortlaufend stoppen und wieder gestartet werden – verglichen mit einer Architektur mit einer kleinen Zahl von
langlebigen VMs.
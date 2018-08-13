Reflexion / Dokumentation
-------------------------

Unter **[Cloud Computing](https://de.wikipedia.org/wiki/Cloud_Computing)** (deutsch Rechnerwolke) versteht man die Ausführung von Programmen, die nicht auf dem lokalen Rechner installiert sind, sondern auf einem anderen Rechner, der aus der Ferne aufgerufen wird (bspw. über das Internet).

Eine **dynamische Infrastruktur-Plattform** ist ein System, das Rechen-Ressourcen bereitstellt (Virtualisiert),
insbesondere Server (compute), Speicher (storage) und Netzwerke (networks), und diese
Programmgesteuert zuweist und verwaltet, sogenannte **Virtuelle Maschinen** (VM).

Damit "Infrastructure as Code" auf "Dynamic Infrastructure Platforms" genutzt werden können, müssen sie die folgenden Anforderungen erfüllen:

- **Programmierbar** - Ein Userinterface ist zwar angenehm und viele Cloud Anbieter haben eines, aber für "Infrastructure as Code"
muss die Plattform via Programmierschnittstelle ([API](https://de.wikipedia.org/wiki/Programmierschnittstelle)) ansprechbar sein.
- **On-demand** - Ressourcen (Server, Speicher, Netzwerke) schnell erstellen und vernichtet.
- **Self-Service** - Ressourcen anpassen und auf eigene Bedürfnisse zuschneiden.
- **Portabel** - Anbieter von Ressourcen müssen austauschbar sein.
- Sicherheit, Zertifizierungen (z.B. [ISO 27001](https://de.wikipedia.org/wiki/ISO/IEC_27001)), ...


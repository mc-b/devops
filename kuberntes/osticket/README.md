OSS Ticket
==========

### Übersicht 

    +---------------------------------------------------------------+
    ! Container: OSS Ticket                                         !	
    ! Container: MySQL                                              !	
    +---------------------------------------------------------------+
    ! Container-Engine: Docker / Kubernetes                         !	
    +---------------------------------------------------------------+
    ! Host-OS: Windows, MacOS, Linux                                !	
    +---------------------------------------------------------------+
    ! Notebook - Schulnetz 10.x.x.x                                 !                 
    +---------------------------------------------------------------+

### Beschreibung

[osTicket](http://osticket.com/) ist ein Open-Source-Support-Ticket-System. 

Es leitet Anfragen, die per E-Mail, Webformularen und Telefonanrufen erstellt wurden, nahtlos in eine einfache, benutzerfreundliche webbasierte Kunden-Support-Plattform für mehrere Benutzer um.

**Starten:**

	kubectl create -f mysql.yaml
	kubectl create -f osticket.yaml

**User Interface:**

	minikube service osticket
	
Geöffneter URL mit /scp/ ergänzen, z.B. [http://192.168.99.100:31229/scp/](http://192.168.99.100:31229/scp/)	
	
* username: ostadmin
* password: Admin1
	
### Docker Repositories

* [OSS Ticket](https://hub.docker.com/r/campbellsoftwaresolutions/osticket/)
* [Offizielles MySQL Image](https://hub.docker.com/_/mysql/) 
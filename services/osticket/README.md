OSS Ticket
==========

### Übersicht 

    +---------------------------------------------------------------+
    ! Container: OSS Ticket                                         !	
    ! Container: MySQL                                              !	
    +---------------------------------------------------------------+
    ! Container-Engine: Docker                                      !	
    +---------------------------------------------------------------+
    ! Gast OS: Ubuntu 16.04                                         !	
    +---------------------------------------------------------------+
    ! Hypervisor: VirtualBox                                        !	
    +---------------------------------------------------------------+
    ! Host-OS: Windows, MacOS, Linux                                !	
    +---------------------------------------------------------------+
    ! Notebook - Schulnetz 10.x.x.x                                 !                 
    +---------------------------------------------------------------+

### Beschreibung

[osTicket](http://osticket.com/) ist ein Open-Source-Support-Ticket-System. 

Es leitet Anfragen, die per E-Mail, Webformularen und Telefonanrufen erstellt wurden, nahtlos in eine einfache, benutzerfreundliche webbasierte Kunden-Support-Plattform für mehrere Benutzer um.

**Starten:**

	cd services/ossticket
	vagrant up
	

**User Interface:**

[http://localhost:8080/scp/](http://localhost:8080/scp/)
	
* username: ostadmin
* password: Admin1
	
### Docker Repositories

* [OSS Ticket](https://hub.docker.com/r/campbellsoftwaresolutions/osticket/)
* [Offizielles MySQL Image](https://hub.docker.com/_/mysql/) 
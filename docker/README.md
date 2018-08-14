Container
---------

Container ändern die Art und Weise, wie wir Software entwickeln, verteilen und laufen lassen, grundlegend.

Entwickler können Software lokal bauen, die woanders genauso laufen wird – sei es ein Rack in der IT Abteilung,
der Laptop eines Anwenders oder ein Cluster in der Cloud. 

Administratoren können sich auf die Netzwerke, Ressourcen und die Uptime konzentrieren und müssen weniger Zeit mit dem Konfigurieren von Umgebungen und dem Kampf mit Systemabhängigkeiten verbringen.

### Einleitung Container

* [Container](intro/01-Container.md)
* [Geschichte](intro/02-Geschichte.md)
* [Microservices](intro/10-Microservices.md)
* [Reflexion ](intro/95-Reflexion.md)
* [Fragen](intro/96-Fragen.md)
    
### Docker und Kubernetes

Für die Docker Beispiele eignet sich am Besten die Docker Testumgebung unten.
    
#### Docker Grundlagen

* [Docker](intro/docker/01-Docker.md)    
* [Architektur](intro/docker/02-Architektur.md)    
* [Befehle](intro/docker/03-Befehle.md)    
* [Dockerfile](intro/docker/10-Dockerfile.md)    
* [Reflexion ](intro/docker/95-Reflexion.md)
* [Fragen](intro/docker/96-Fragen.md)

#### Kubernetes

Für Kubernetes ist es am Besten die Umgebung aus dem Kurs [Docker und Kubernetes – Übersicht und Einsatz](https://github.com/mc-b/dok) zu Verwenden.

**Service Discovery, Cluster- und Orchestrierung**
* [Service Discovery](intro/orchestrierung/01-Discovery.md)
* [Clustering und Orchestrierung](intro/orchestrierung/02-Orchestrierung.md)
* [Load Balancing am Beispiel Web Server](intro/orchestrierung/12-Webserver.md)

**Kubernetes**
* [Kubernetes (K8s)](intro/orchestrierung/30-Kubernetes.md)
* [Reflexion ](intro/orchestrierung/95-Reflexion.md)
* [Fragen](intro/orchestrierung/96-Fragen.md)

#### Docker (optional)
    
**Container mit der Aussenwelt verbinden und verlinken (optional)**
* [Ports](intro/dockernetwork/01-Ports.md)    
* [Container verlinken (alt) (optional)](intro/dockernetwork/02-Linken.md)    
* [Docker container networking (neu) (optional)](intro/dockernetwork/10-Network.md)    
* [Reflexion ](intro/dockernetwork/95-Reflexion.md)
* [Fragen](intro/dockernetwork/96-Fragen.md)   
    
**Volumes (optional)**
* [Einleitung](intro/dockervolume/01-Einleitung.md)
* [Volumes](intro/dockervolume/02-Volume.md)
* [Datacontainer (optional)](intro/dockervolume/03-DataContainer.md)
* [Named Volumes (optional)](intro/dockervolume/04-NamedVolumes.md)
* [Reflexion ](intro/dockervolume/95-Reflexion.md)
* [Fragen](intro/dockervolume/96-Fragen.md) 
    
**Bereitstellen von Images - Docker Hub (optional)**
* [Bereitstellen von Images](intro/dockerhub/01-Einleitung.md)
* [Docker Hub](intro/dockerhub/02-DockerHub.md)
* [Images und Container - von/nach Dateien](intro/dockerhub/03-Load.md)
* [Private Registry](intro/dockerhub/04-Registry.md)
* [Reflexion ](intro/dockerhub/95-Reflexion.md)
* [Fragen](intro/dockerhub/96-Fragen.md)

**Docker Compose (optional)**
* [Docker Compose](intro/dockercompose/01-Compose.md)
* [YAML](intro/dockercompose/02-YAML.md)
* [Reflexion ](intro/dockercompose/95-Reflexion.md)
* [Fragen](intro/dockercompose/96-Fragen.md) 

### Container Sichern und Beschränken

**Protokollieren und Überwachen**
* [Einleitung](intro/dockerlogs/01-Einleitung.md)
* [Logging](intro/dockerlogs/02-Logging.md)
* [Überwachen und Benachrichtigen](intro/dockerlogs/03-Monitoring.md)
* [Reflexion ](intro/dockerlogs/95-Reflexion.md)
* [Fragen](intro/dockerlogs/96-Fragen.md)
      
**Container sichern und beschränken (optional)**
* [Einleitung](intro/security/01-Einleitung.md)
* [Worüber Sie sich Gedanken machen sollten](intro/security/02-Allgemeines.md)
* [Least Privilege](intro/security/03-LeastPrivilege.md)
* [Container absichern](intro/security/04-Absichern.md)
* [Container nach Host trennen](intro/security/05-Hosts.md)
* [Sicherheitstips](intro/security/10-Tips.md)    
* [Reflexion ](intro/security/95-Reflexion.md)
* [Fragen](intro/security/96-Fragen.md)      
    
**Kontinuierliche Integration, Unittest (optional)**
* [Kontinuierliche Integration](intro/citest/01-CI.md)
* [Unittest](intro/citest/02-Unittest.md)
* [Reflexion ](intro/citest/95-Reflexion.md)
* [Fragen](intro/citest/96-Fragen.md)

### Docker Testumgebung (alt)

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

**Beschreibung**

Einfache VM mit Docker installiert.

In der VM können folgende Beispiele ausprobiert werden:

* [apache - Apache Web Server](apache/)
* [db - MySQL Datenbank](mysql/)
* [apache4X - Scriptscript welches 4 Web Server Container erstellt](apache4X/)
* [compose - Docker Compose](compose/)
* [dotnet - .NET Entwicklungsumgebung](dotnet/)
* [microservice - Micro Service mit Node.js](microservice/)
* [jenkins - Build Umgebung](jenkins/)

Die Beispiele befinden sich, in der VM, im Verzeichnis `/vagrant`. Die Anwahl ist wie folgt:

	vagrant up
	vagrant ssh
	cd /vagrant/<Beispiel>
	


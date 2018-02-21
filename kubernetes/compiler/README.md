Compiler 
--------

### Übersicht 

    +---------------------------------------------------------------+
    !                                                               !	
    !    +-------------------------+                                !
    !    ! Compiler Umgebung       !                                !
    !    ! mountPath: /src         !                                !       
    !    ! hostPath:  /c/Users/tmp !                                !       
    !    +-------------------------+                                !
    !                                                               !	
    ! Container: Volume: /src                                       !	
    +---------------------------------------------------------------+
    ! Container-Engine: Docker                                      !	
    +---------------------------------------------------------------+
    ! Gast OS: Ubuntu 16.04                                         !	
    +---------------------------------------------------------------+
    ! Hypervisor: VirtualBox mountet: C:/Users an /c/Users          !	
    +---------------------------------------------------------------+
    ! Host-OS: Windows, MacOS, Linux                                !	
    +---------------------------------------------------------------+
    ! Notebook - Schulnetz 10.x.x.x                                 !                 
    +---------------------------------------------------------------+
    
**Achtung:**  Verzeichnis `C:\Users\tmp` erstellen und Rechte für Normalen User freischalten

### Beschreibung
    
Häufig werden für Spezialaufgaben, z.B. Crosscompiling auf ARM Plattform, ein bestimmer Compiler benötigt.

Dabei lohnt es sich aber nicht den Compiler mit allen Abhängigkeiten lokal auf dem eigenen System zu installieren.

### Beispiele

#### Maven und BPMN-Backend

Für [BPMN-Backend](https://github.com/bernet-tbz/bpmn-tutorial/tree/master/bpmn-backend) braucht es [Maven](https://maven.apache.org/) und die Java Entwicklungsumgebung.

Statt Maven und Java auf dem eigenen System zu installieren, kann der [maven Container](https://hub.docker.com/_/maven/) und die Datei `maven.yaml` verwendet werden.

Container erzeugen und in diesen wechseln:

	kubectl create -f maven.yaml
	kubectl exec -it maven -- bash
	
Anschliessend können die Befehle laut [BPMN-Backend](https://github.com/bernet-tbz/bpmn-tutorial/tree/master/bpmn-backend) ausgeführt werden.

Dabei wird im Verzeichnis `C:\Users\tmp` (Linux: `/home/tmp`) ein Verzeichnis mit den Maven Projekt erzeugt.

### DotNet

Es existiert ein [Docker Beispiel](https://github.com/mc-b/devops/tree/master/docker/dotnet) (ohne Kubernetes), welches aber auch in der Kubernetes Umgebung lauffähig ist.

Bilden des Containers und Aufruf bzw. Wechsel in Container

	docker build -t dotnetapp .
	kubectl run -it --rm --image dotnetapp dotnet --image-pull-policy=IfNotPresent
	
*Im Container*

	dotnet out/dotnetapp.dll


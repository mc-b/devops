Gemeinsames Datenverzeichnis
----------------------------

Gemeinsames Datenverzeichnis welches von Kubernetes Master und Nodes genützt wird. Z.B. für
* Kanboard - Datenbank (Plug-Ins im Container, weil sonst Probleme mit Persistent Volume in Kubernetes)
* Gogs - Git Repositories und Datenbank

### Aufbau

    +---------------------------------------------------------------+
    ! Docker Container Verbinden sich mit data-claim, z.B.          !	
    !  volumes:                                                     !
    ! - name: container-storage                                     !                                     
    !    persistentVolumeClaim:                                     !
    !     claimName: data-claim                                     !	
    +---------------------------------------------------------------+
    ! Persistent Volume Claim data-claim fordert Speicher von Volume!	
    +---------------------------------------------------------------+
    ! Persistent Volume: data-volume zeigt auf /data in VM          !	
    +---------------------------------------------------------------+
    ! Vagrant mounted data Verzeichnis im aktuellen Vereichnis      !
    ! config.vm.synced_folder "data", "/data"                       !                 
    +---------------------------------------------------------------+
    
#### Vagrant Installation

Keine Aktionen notwendig. 

Im Vagrantfile wird das PersistentVolume und PersistenVolumeClaim erzeugt:

	kubectl create -f /vagrant/data/
	
#### Docker Installation

Auf Windows ist in Docker Settings `Share Drives`, z.B. Laufwerk C:/User/mydata mounten.

`data/DataVolume.yaml` hostPath ändern

    hostPath:
     path: "/data"
	    
auf

    hostPath:
     path: "c/User/mydata"
     
ändern und PersistentVolume erzeugen.

	kubectl create -f data/DataVolume.yaml

Anschliessend können die Pods, welche Persistenten Speicher benötigtigen, z.B. Gogs, erzeugt werden, z.B.:

	kubectl create -f devops/gogs.yaml
		    
    
Docker Datacenter
-----------------

    +---------------------------------------------------------------+
    !      node1                           node2                    !	
    !    +--------------------+          +---------------------+    !
    !    ! Container          !          ! Container           !    !       
    !    +--------------------+          +---------------------+    !       
    !    ! Docker DataCenter  !          ! Docker Node(s)      !    !       
    !    ! Container-Engine   !          ! Container-Engine    !    !       
    !    ! Gast OS: Ubuntu    !          ! Gast OS: Ubuntu     !    !       
    !    +--------------------+          +---------------------+    !
    !                                                               !	
    +---------------------------------------------------------------+
    ! Hypervisor: VirtualBox                                        !	
    +---------------------------------------------------------------+
    ! Host-OS: Windows, MacOS, Linux                                !	
    +---------------------------------------------------------------+
    ! Notebook - Schulnetz 10.x.x.x                                 !                 
    +---------------------------------------------------------------+

In diesem Verzeichnis befindet sich ein Vagrantfile welcher zwei Nodes generiert um einen Docker Datacenter einzurichten.

Starten Docker Data Center:

	vagrant ssh node1
	
	docker run --rm -it \
     -v /var/run/docker.sock:/var/run/docker.sock \
	  --name ucp docker/ucp install -i \
     --swarm-port 3376 --host-address 192.168.65.100
     
Die Admin Oberfläche kann unter [https://192.168.65.100](https://192.168.65.100) erreicht werden.

Eine Lizenz ist zum Testen nicht notwendig.

Über die [Admin Oberfläche](https://192.168.65.100) können weitere Node(s) hinzufügt werden. 
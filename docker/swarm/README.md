Docker Swarm
------------

    +---------------------------------------------------------------+
    !      master                          workers 1 + 2            !	
    !    +--------------------+          +---------------------+    !
    !    ! Container          !          ! Container           !    !       
    !    +--------------------+          +---------------------+    !       
    !    ! Swarm Master       !          ! Swarm Workers 1 + 2 !    !       
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

Umgebung mit einem Master und 2 Worker Nodes mit Docker.

Mit dieser Umgebung kann ein Swarm Master und 2 Worker Nodes simuliert werden.

Initialisierung auf der Master VM: 

	vagrant ssh master

	docker  swarm  init  --advertise-addr  192.168.55.100
	
Die Ausgabe sollte ungefähr so aussehen, dieser Befehl ist jeweils auf den anderen VM auszuführen um dem Swarm beizutreten.	
	
    docker  swarm  join  \
    --token  SWMTKN-1-56lxa2y65iwzwpzdjekzpzqyrbe9v18j0e176corfso479knmd-46io8mgywlpbetse81cr7zsjc 192.168.55.100:2377

Nach dem Join der weiteren VM's kann auf dem Master die Nodes ausgegeben werden

	docker node ls

	ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
	437kxcuaowr68w43hlehxplpv    worker1   Ready   Active
	ommiame21iunrdcbqnb8v0ryn *  master    Ready   Active        Leader
	
Falls der Befehl um den Swarm beizutretten nicht mehr bekannt ist kann dieser wie folgt angezeigt werden:

	docker swarm join-token worker
	
Anschliessend, kann zu Testzwecken eine Reihe von Container gestartet werden:

	docker service create --replicas 2 --name helloworld alpine ping docker.com
	docker service create --replicas 1 --name hello alpine ping docker.com
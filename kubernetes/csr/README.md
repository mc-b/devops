Zertifikate
-----------

Konfigurationsdateien welche im Vagrantfile benötigt werden um die Zertifikate zu erstellen.

Um diese für `kubectl` Verwenden zu können, kann mit folgenden Befehlen eine `.kube/config` Datei erzeugt werden:

	kubectl config set-cluster vgkube --certificate-authority=$HOME/.kube/ca.crt \
    --embed-certs=false --server=https://vgkube:8443
 
	kubectl config set-credentials minikube --client-key=$HOME/.kube/client.key \
				--client-certificate=client.crt --embed-certs=false 
				
	kubectl config set-context vgkube --cluster=vgkube --user=minikube
	kubectl config use-context vgkube
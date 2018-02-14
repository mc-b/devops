Minio
-----

[Minio](https://www.minio.io/) ist ein Hochleistungs-Server für verteilte Objekte.

Minio wurde für grosse private Cloud-Infrastrukturen entwickelt.

Die YAML Datei wurde mittels dem [Minio Konfigurator](https://www.minio.io/kubernetes.html) erstellt.

### Start

	kubectl create -f minio.yaml
	
	minikube service minio-service

Zugangsdaten:
* Access-Key: admin
* Secret-Key: admin123
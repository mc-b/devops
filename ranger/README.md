Ranger
------

[Rancher](https://rancher.com/) is enterprise management for Kubernetes.

Every distro. Every cluster. Every cloud.


### Installation

Diese Installationsanweisung basiert auf [Vagrant Quick Start](https://rancher.com/docs/rancher/v2.x/en/quick-start-guide/deployment/quickstart-vagrant/).

Klonen des quickstart Repositories

	git clone https://github.com/rancher/quickstart
	
Wechseln in das vagrant Verzeichnis

	cd quickstart/vagrant
	
**Optional** können in der Datei `config.yaml` Memory und Anzahl Nodes angepasst werden. Bei Tests funktioniert Ranger auch nur mit einer Node.

Umgebung starten mittels

	vagrant up
	
Nach Beendigung des Setups ist die Rancher Oberfläche via [https://172.22.101.101](https://172.22.101.101) und Username/Password `admin` erreichbar.
	
### Links

* [Deploying Rancher Server](https://rancher.com/docs/rancher/v2.x/en/quick-start-guide/deployment/)
* [Deploying Workloads](https://rancher.com/docs/rancher/v2.x/en/quick-start-guide/workload/)
OpenShift
---------

Red Hat® [OpenShift](https://www.openshift.com/) is a container application platform that brings docker and Kubernetes to the enterprise.

### MiniShift

Minishift is a tool that helps you run OpenShift locally by running a single-node OpenShift cluster inside a VM. You can try out OpenShift or develop with it, day-to-day, on your local host.

MiniShift Umgebung mit OpenShift anlegen. Erzeugt eine VM mit OpenShift darin.

	minishift start --vm-driver=virtualbox
	
`oc` aktiveren

	export PATH=/c/Users/mbern/.minishift/cache/oc/v3.6.0/:$PATH
	
	oc login -u system:admin
	oc status


#### Links

* [Doku](https://docs.openshift.org/latest/minishift/index.html)

### OC

The OpenShift CLI (oc) exposes commands for managing your applications, as well as lower level tools to interact with each component of your system.

#### Links

* [Doku](https://docs.openshift.com/enterprise/3.0/cli_reference/get_started_cli.html)


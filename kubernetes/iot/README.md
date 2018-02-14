Test Container aus dem Internet der Dinge Bereich
-------------------------------------------------

### FHEM

[FHEM](http://fhem.de/) ist ein einfache Hausautomationslösung welche in Perl geschrieben ist.

Für [FHEM](http://fhem.de/) existiert ein Container einer vordefinierten Konfiguration um den [IoTKit](https://github.com/mc-b/IoTKitV2/blob/master/smarthome/02-FHEM.md) anzusprechen.

FHEM Starten - Port Weiterleitungs Variante

	kubectl create -f fhem-port.yaml
	minikube service fhem-port

FHEM Starten - Ingress Variante

	kubectel create -f fhem.yaml
	
Aufruf FHEM UI mittels folgendem URL:

	http://<IP LoadBalancer>/fhem



Test Container aus dem Internet der Dinge Bereich
-------------------------------------------------

### FHEM

[FHEM]() ist ein einfache Hausautomationslösung welche in Perl geschrieben ist.

Für [FHEM]() existiert ein Container einer vordefinierten Konfiguration um den [IoTKit]() anzusprechen.

FHEM Starten - Port Weiterleitungs Variante

	kubectl create -f fhem-port.yaml
	minikube service fhem-port

FHEM Starten - Ingress Variante

	kubectel create -f fhem.yaml
	
Aufruf FHEM UI mittels folgendem URL:

	http://<IP LoadBalancer>/fhem



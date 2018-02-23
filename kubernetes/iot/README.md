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

### OpenHAB (Eclipse Smart Home)

open Home Automation Bus (openHAB) ist eine in Java entwickelte Softwarelösung, die Komponenten zur Gebäudeautomatisierung von den verschiedensten Anbietern hersteller- und protokollneutral in einer Plattform miteinander verbindet.

openHAB Starten (Standard Image)

	kubectl create -f openhab.yaml
	minikube service openhab.yaml
	
In der openHAB Oberfläche die Demo Oberfläche initialisieren und dann ins PaperUI wechseln.

[IoTKit](https://github.com/mc-b/IoTKitV2) an USB und Ethernet Kabel anschliessen und [RPCHTTPServerSmartHomeV2](https://os.mbed.com/teams/smdiotkit2ch/code/RPCHTTPServerSmartHomeV2/) Programm auf IoTKit laden. Reset Taste drücken und IP-Adresse, welche auf dem OLED-Display angezeigt wird notieren.
	
Zurück auf der Kommandline: Pod-Id ausgeben

	kubectl get pods --selector='app=openhab'	

IoTKit Add-On von github holen

	wget https://github.com/mc-b/IoTKit/releases/download/V1.0/ch.iotkit.smarthome.binding.mbedRPC_1.0.0.201511131556.jar
	
Add-On in Container kopieren:

	kubectl cp ch.iotkit.smarthome.binding.mbedRPC_1.0.0.201511131556.jar <pod-id>:/openhab/addons
	
In die obenHAB Oberfläche wechseln und kontrollieren ob unter `Configuration` -> `Bindings` die IoTKit Bindings erscheint (es dauert ein Weilchen).

Wenn Nein: Unter `Configuration` -> `System` -> `Add-on Management` die Unterstützung für 1.x Bindings aktivieren.

Mittels `Configuration` -> `Things` zuerst IoTKit Gateway, mit IP-Adresse des IoTKit, erstellen. Anschliessend können die Einzelnen IoTKit Geräte wie LED, Sensoren, Aktoren etc. erstellt werden.

#### Links

* [CH Open Workshoptage 2015](https://os.mbed.com/teams/ch-open-wstage2015/wiki/SmartHome)

### Mosquitto

Mosquitto – Open-Source-MQTT-Broker und Teil des Eclipse-IoT-Projektes (iot.eclipse.org).

Mosquitto Starten

	kubectl create -f mosquitto.yaml
	
Mosquitto Port (Original 1883) anzeigen  	

	kubectl get services -o wide --selector=app=mosquitto

Mittels den Mosquitto Client Programmen (`apt-get install mosquitto-clients`) oder dem [IoTKit](https://github.com/mc-b/IoTKitV2) können Nachrichten über den Mosquitto Broker gesendet und empfangen werden.

Auf allen Topics horchen:

	mosquitto_sub -p <Mosquitto-Port> -h 192.168.99.100 -t '#'

Daten an Mosquitto Broker senden:

	mosquitto_pub -p <Mosquitto-Port> -h 192.168.99.100 -t mbed/k64f/iotkit/light -m "1.1" -q 0	

#### Links

* [MQTT IoTKit](https://github.com/mc-b/IoTKitV2/tree/master/mqtt)
* [MQTT Publish](https://github.com/mc-b/IoTKitV2/blob/master/mqtt/MQTTPublish)
* [MQTT Subcribe](https://github.com/mc-b/IoTKitV2/blob/master/mqtt/MQTTSubscribe)


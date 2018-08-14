Load Balancing am Beispiel Web Server
-------------------------------------

Mittels Lastverteilung (englisch Load Balancing) werden in der Informatik umfangreiche Berechnungen oder große Mengen von Anfragen auf mehrere parallel arbeitende Systeme verteilt. 

Insbesondere bei Webservern ist eine Lastverteilung wichtig, da ein einzelner Host nur eine begrenzte Menge an HTTP-Anfragen auf einmal beantworten kann. 

Für unsere Zwecke kann Lastverteilung als der Prozess des Verteilens von Anfragen auf verschiedene Container betrachtet werden.

Für dieses Beispiel verwenden wir [hello-world](https://github.com/docker/dockercloud-hello-world/) von Docker Cloud und [cURL](https://de.wikipedia.org/wiki/CURL).

### Beispiel

hello-world Beispiel starten

	kubectl create -f dok/test/dockercloud.yaml
	
Webseite mittels cURL Abfragen:

	startsvc hello-world
	
**Die Abfragen werden gleichmässig auf die zwei hello-world Services verteilt.**

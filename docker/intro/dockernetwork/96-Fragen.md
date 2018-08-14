### Fragen

{% exercise %}
* Was passiert mit den Daten in der MySQL Datenbank wenn der Container gelöscht wird?
{% solution %}  
	 	Sie werden gelöscht, bzw. gehen verloren
{% endexercise %}

{% exercise %}
* Was passiert mit der Installierten Software aus dem Container verlinken Beispiel?
{% solution %}  
	 	Wenn der Container weg ist, sind auch die Änderungen darin weg.
{% endexercise %}

{% exercise %}
* Wie können wir die SQL Freigabe Befehle automatisieren?
{% solution %}  
	 	ENTRYPOINT mit einem Script
{% endexercise %}
	
{% exercise %}
* Wie können wir die Installierte Software aus dem Container verlinken Beispiel persistieren?
{% solution %}  
	 	In Dockerfile übertragen, bzw. ein Dockerfile erstellen.
{% endexercise %}

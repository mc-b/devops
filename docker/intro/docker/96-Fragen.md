### Fragen

{% exercise %}
* Was ist der Unterschied zwischen einem Docker Image und einem Container?
{% solution %}  
	 	Image = gebuildet und readonly, Container Image + aktuelle Änderungen im Filesystem
{% endexercise %}

{% exercise %}
* Was ist der Unterschied zwischen einer Virtuellen Maschine und einem Docker Container?
{% solution %}  
	 	VM hat Betriebssystem mit am laufen, Docker nur die eigenen Prozesse
{% endexercise %}
	
{% exercise %}
* Wie bekomme ich Informationen zu einem laufenden Docker Container?
{% solution %}  
	 	docker logs, docker inspect
{% endexercise %}

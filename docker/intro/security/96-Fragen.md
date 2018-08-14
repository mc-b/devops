### Fragen

{% exercise %}
* Wie kann `docker run -v /:/homeroot -it ubuntu bash` durch Normale User verhindert werden?
{% solution %}  
	 	nur `root` darf Container starten
{% endexercise %}

{% exercise %}
* Wie können verschiedene Mandanten getrennt werden?
{% solution %}  
	 	Mittels VM's
{% endexercise %}
	
{% exercise %}
* Wie kann der Ressourcenverbrauch von Containern eingeschränkt werden?
{% solution %}  
	 	https://docs.docker.com/config/containers/resource_constraints/#configure-the-default-cfs-scheduler 
{% endexercise %}

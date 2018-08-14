### Fragen

{% exercise %}
* Was ist der Unterschied zwischen der Verwendung der Docker Registry und `docker save` und `docker load`?
{% solution %}  
	 	Registry ist in der Cloud und Images sind für alle sichtbar, save und load passiert lokal mit Dateien
{% endexercise %}

{% exercise %}
* Was ist der Unterschied zwischen `docker save`/`docker load` und `docker export`/`docker import`?
{% solution %}  
	 	save/load ist für Images, export/import für Container
{% endexercise %}

{% exercise %}
* Was ist bei einer eigenen Registry zu beachten?
{% solution %}  
	 	Sicherheit, bzw. das mögliche Fehlen davon
{% endexercise %}

{% exercise %}
* Warum sollten Versionen `tag` von Images immer angegeben werden?
{% solution %}  
	 	Ansonsten wird `latest` verwendet und so nicht sicher ist welche Version wirklich verwendet wird.
{% endexercise %}

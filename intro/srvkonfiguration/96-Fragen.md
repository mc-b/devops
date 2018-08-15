### Fragen

{% exercise %}
* Was ist der Unterschied zwischen `cron` und `Anacron`?
{% solution %}
	 cronjobs laufen zu fixen Zeiten, was bei Ausgeschalteter Maschine dazu führen kann,
	 dass sie nicht ausgeführt werden.	
{% endexercise %}

{% exercise %}
* Wo sind die Konfigurationsdateien von `cron`?
{% solution %}
	 	/etc/crontab, /var/spool/cron/crontabs/
{% endexercise %}


{% exercise %}
* Was ist der Unterschied zwischen SysVinit und systemd?
{% solution %}
	 	SysVinit läuft sequentiel ab, systemd nach Möglichkeit - parallel
{% endexercise %}

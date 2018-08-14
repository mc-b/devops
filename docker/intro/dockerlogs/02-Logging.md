Logging
-------

Wenn Sie keine besonderen Argumente angeben und keine Logging-Software installiert haben, protokolliert Docker alles, was an STDOUT
oder STDERR geschickt wird. 

Die Logs können dann über den Befehl `docker logs` abgerufen werden. 

Es gibt eine Reihe Logging-Methoden, die Sie über das Argument `--log-driver` von `docker run` auswählen können.

Mögliche Werte sind u.a.:

- **json-file** - das Standard-Logging
- **syslog** - der syslog-Treiber des Hosts
- **none** - schaltet das Protokollieren ab 

### Logging mittels Standard-Logging von Docker

Einfache Ausgaben abholen

	docker run --name logtest ubuntu bash -c 'echo "stdout"; echo "stderr" >>2'
	
	docker logs logtest
	
	docker rm logtest
	
Laufende Ausgaben anzeigen

	docker run -d --name streamtest ubuntu bash -c 'while true; do echo "tick"; sleep 1; done;'
	
	docker logs streamtest 
	
	docker logs streamtest | wc -l
	
	docker rm streamtest
	
### Logging mittels System Log
	
Protokollierung in das System Log des Hosts

	docker run -d --log-driver=syslog ubuntu bash -c 'i=0; while true; do i=$((i+1)); echo "docker $i"; sleep 1; done;'

	tail -f /var/log/syslog
	
### Links

* [Configure logging drivers](https://docs.docker.com/engine/admin/logging/overview/)
Docker in Docker
----------------

Docker kann in einem Docker Container ausgeführt werden. Das hat den Vorteil, dass weitere Container gestartet werden können, z.B. um Programme zu compilieren, durchführen von Unit-Tests etc.

	cd /tmp
	apt-get update
	apt-get install -y curl
	curl https://download.docker.com/linux/static/stable/x86_64/docker-18.03.0-ce.tgz -o docker.tgz
	tar xvzf docker.tgz
	mv docker/docker /usr/local/bin
	


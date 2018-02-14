#
#	Einfache MySQL Umgebung
#
FROM debian:jessie
MAINTAINER Marcel Bernet <marcel.bernet@ch-open.ch>

# Installation
RUN apt-get update && apt-get install -y mysql-client git

COPY loaddata.sh /usr/local/bin

ENTRYPOINT bash -x /usr/local/bin/loaddata.sh

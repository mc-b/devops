Big Data
--------

Der Begriff Big Data bezeichnet Datenmengen, welche zu gross, zu komplex, zu schnelllebig oder zu schwach strukturiert sind, um sie mit manuellen und herkömmlichen Methoden der Datenverarbeitung auszuwerten.

### Neo4J

Graphen Datenbanken sind die speziellste Form von NoSQL Datenbanken.
Sie haben ein anderes Datenspeicherkonzept als andere NoSQL Datenbanken, meistens verschachtelte Listen.

Neo4J ist eine Graph Datenbank.

Neo4J Starten

	kubectl create -f neo4j.yaml
	minikube service neo4j

#### Links

* [Homepage](https://neo4j.com/)
* [Einleitung aus dem Big Data Projekt](https://github.com/mc-b/bigdata/tree/master/neo4j)

### Apache Zeppelin

Apache Zeppelin ist ein Frontend welche mit mehreren Systemen zusammenarbeiten kann.

Aktuell unterstützt Apache Zeppelin Systeme wie Apache Spark, Python, JDBC, Markdown and Shell.

Apache Zeppelin Starten

	kubectl create -f zeppelin.yaml
	minikube service zeppelin

#### Links

* [Homepage](http://zeppelin.apache.org/)
* [Einleitung aus dem Big Data Projekt](https://github.com/mc-b/bigdata/tree/master/zeppelin)

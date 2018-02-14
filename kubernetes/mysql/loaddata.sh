#!/bin/bash
#
#	Datenbank mit Daten fuellen
#

# Datenbank und User fuer IoT Daten anlegen 
mysql -hmysql -utest -psecret <<%EOF%
	use test;
	create table data ( seq INT PRIMARY KEY AUTO_INCREMENT, poti FLOAT, light FLOAT, hall FLOAT, temp FLOAT, created TIMESTAMP DEFAULT CURRENT_TIMESTAMP );
	insert into data(poti, light, hall, temp) values ( 0.9, 0.8, 0.49, 25.2 );
	insert into data(poti, light, hall, temp) values ( 0.8, 0.7, 0.48, 25.1 );
%EOF%

exit 0

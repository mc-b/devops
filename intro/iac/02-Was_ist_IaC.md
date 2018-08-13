Was ist "Infrastructure as Code"?
---------------------------------

	Vagrant.configure(2) do |config|
	  config.vm.box = "ubuntu/trusty64"
	  config.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true
	  config.vm.synced_folder ".", "/var/www/html"  
	 config.vm.provider "virtualbox" do |vb|
	  vb.memory = "512"  
	 end
	  config.vm.provision "shell", inline: <<-SHELL 
	    sudo apt-get update
	    sudo apt-get -y install apache2
	  SHELL
	end

Vagrant Definitionsdatei

- - - 

"Infrastructure as Code" ist ein [Paradigma](https://de.wikipedia.org/wiki/Paradigma) zur Infrastruktur-Automation basierend auf Best Practices von der Softwareentwicklung. 

Im Vordergrund stehen konsistente und wiederholbare Definitionen für die Bereitstellung
von Systemen und deren Konfiguration.

Die Definitionen werden in Dateien zusammengefasst, gründlich Überprüft und automatisch ausgerollt.

Dabei kommen, von der Softwareentwicklung bekannte, Best Practices wie:
- Versionsverwaltung - [version control systems (VCS)](https://de.wikipedia.org/wiki/Versionsverwaltung)
- Testgetriebene Entwicklung - [testdriven development (TDD)](https://de.wikipedia.org/wiki/Testgetriebene_Entwicklung)
- Kontinuierliche Integration - [continuous integration (CI)](https://de.wikipedia.org/wiki/Kontinuierliche_Integration)
- Kontinuierliche Verteilung - [continuous delivery (CD)](https://de.wikipedia.org/wiki/Continuous_Delivery)

zum Einsatz.


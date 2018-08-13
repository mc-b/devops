Gemeinsame Ordner (Synced Folders)
---------------------------------

![](../../images/DynamicInfrastructure.png)

<p style="font-size: 0.5em">Quelle: Infrastructure as Code, By Kief Morris, Publisher: O'Reilly Media</p>

- - - 

Synchronisierte Ordner ermöglichen es der Virtuellen Maschine auf Ordner des Host Computers zuzugreifen.

	Vagrant.configure(2) do |config|
	  config.vm.synced_folder ".", "/var/www/html"  
	end

**Standardmässig wird das aktuelle Vagrant Verzeichnis in der Virtuellen Maschine unter /vagrant gemountet.**

Weitere Informationen: [Vagrant Synced folders](https://www.vagrantup.com/docs/synced-folders/)
	
# README

## PanadeEdu Tutorial-VM
Diese VM dient zum Aufsetzen einer Entwicklungsumgebung.
PanadeEdu ist ein Tutorial Kanal auf YouTube. 
Diese Virtuelle Maschiene soll das Verfolgen und Nachspielen der Tutorials vereinfachen.

Die Konfiguration entspricht den Anforderungen der Tutorials,
für Sicherheitskonfigurationen müssen extra Anpassungen vorgenommen werden.
Für eine einfache und automatische Installation werden für diese VM Standard-Passwörter
verwendet, daher ist die Anwendung nicht für Produktiv-Systeme geeignet.

Die Ausführung einer Virtuellen Maschiene erfolgt auf eigene Gefahr,
PanadeEdu kann nicht Haftbar für entstehende Schäden gemacht werden.

## Was ist Vagrant
Vagrant ist ein Wrapper für Virtualisierungs Software wie Oracles VirtualBox.
Dadurch können Virtuelle Maschienen automatisch heruntergeladen, konfiguriert und 
installiert werden.

Die Bedienung erfolgt über die Windows Kommandozeile, in diesem Paket befindet sich jedoch
auch ein Startscript (batch datei) welches die Bedienung vereinfacht.
Ein Beispiel für ein Vagrant Command ist: 

	vagrant up

Vagrant erwartet dabei in dem Ordner, in dem der Kommando ausgeführt wird,
eine Vagrant Konfigurationsdatei. 

In diesem Paket liegt diese im Unterordner "vagrant" mit dem Namen "Vagrantfile".
In dieser Datei sind alle Vagrantinformationen vorkonfiguriert.
Nachdem die Vagrant VM gestartet wurde wird beim ersten mal eine Bash-Script Datei aufgerufen, 
welche im Vagrantfile konfiguriert wurde.

Die Datei bootstrap.sh beinhaltet die Vorkonfiguration des Servers. Die meisten Anpassungen,
können hier vorgenommen werden. Hier werden hauptsächlich Installationen, Symlinks und User angelegt.
Im Kapitel Automatische Konfiguration, werden diese bestandteile etwas näher erklärt.

Für allgemeine Informationen zu Vagrant:
  http://www.vagrantup.com/

## Verwendung
### Installation
**Vorraussetzungen**

- Installiertes VirtualBox (von oracle)
	- VirtualBox wird benötigt um die VM aufzusetzen.
	- http://www.virtualbox.org/
- Installiertes Cygwin (optional)
	- Cygwin stellt ein Linux-Artiges Terminal in Windows bereit.
	- Bei der Installation müssten Pakete wie rsync Explizit ausgewählt werden.
	- http://www.cygwin.com/
- Installiertes Vagrant
	- Vagrant greift auf Virtualbox zu.
	- Wird benötigt für das Skript
	- http://www.vagrantup.com/

**Ordnerstruktur**
Ihr könnt dieses Paket überall auf eurem System entpacken.
Wichtig ist nur, dass innerhalb des entpackten Ordners alles korrekt ist.
Sollte eure Ordnerstruktur so aussehen, müsste alles in Ordnung sein.

- vagrant/
	- vhosts/
		- tutorial
	- www/
		- index.html
	- bootstrap.sh
	- after-boot.sh
	- Vagrantfile
- README.md
- startscript.bat

**Installation Startscript**

1. Doppelklick auf startscript.bin
3. Wählt Option 1 -> Start Vagrant VM 
4. Warten bis der Optionsscreen wieder kommt.

Die Option "Start Vagrant VM" downloaded und installiert die VM, solange noch keine besteht.

**Installation CMD**

1. Klickt den Windows Start-Button
2. Suchen im Suchfeld: cmd
3. Rechtsklick auf cmd.exe
4. Klickt "als Administrator ausführen" oder "run as administrator"
5. Tippe: cd [Pfad Zu eurem vagrant Ordner] (beispiel: C:\Users\Panade\tutorial_vm\vagrant)
6. Tippe: vagrant up
7. Warten bis Installation abgeschlossen

### Verwendung

Wenn ihr Vagrant Installiert habt ist die Anwendung relativ einfach.
Wie schon bei der Installation habt ihr 2 Optionen, startscript.bat oder selbst über die CMD.

#### Methode mit: startscript.bat

	1: Start Vagrant VM

Startet die VM, oder Installiert sie erneut (wenn sie nicht bereits installiert ist)

--------------------------------------------------------------------------------
	
	2: Reload Vagrant VM  

Führt einen sanften Reload/Restart durch.

--------------------------------------------------------------------------------

	3: Shutdown Vagrant VM  

Fährt die VM herunter, ihre Daten bleiben aber bestehen.

--------------------------------------------------------------------------------

	4: Suspend Vagrant VM  

Versetzt die VM in einen Suspend-Modus. Ihre Daten im RAM bleiben erhalten.

--------------------------------------------------------------------------------

	5: Destroy Vagrant VM  

Deinstalliert die VM (aber nicht die Daten im vagrant ordner).
Diese Funktion ist Sinnvoll wenn man Speicherplatz sparen möchte oder einen Fehler bei der
Konfiguration vorgenommen hat.  
**WICHTIG:** Hierbei gehen alle Konfigurationen verloren die nicht im /vagrant ordner enthalten sind!  
**WICHTIG:** Hierbei gehen auch alle MySQL Daten verloren. Es empfiehlt sich vorher einen Dump vorzunehmen.

--------------------------------------------------------------------------------

	6: Command Line  

Vagrant besitzt noch weitere Commands, zur einfachen handhabung von Fällen die nicht im Skript abgedeckt sind,
kann man Command Line wählen und selbst einen Command eingeben.

--------------------------------------------------------------------------------

	7: Exit  

Schließt das startscript.bat Fenster.
Solange kein Command läuft, kann man das Fenster jederzeit schließen.

#### Methode mit: CMD

1. Klickt den Windows Start-Button
2. Suchen im Suchfeld: cmd
3. Rechtsklick auf cmd.exe
4. Klickt "als Administrator ausführen" oder "run as administrator"
5. Tippe: cd [Pfad Zu eurem vagrant Ordner] (beispiel: C:\Users\Panade\tutorial_vm\vagrant)

Von hier aus lassen sich alle "vagrant" Kommandos ausführen:  
  

	vagrant up

Startet die VM, oder Installiert sie erneut (wenn sie nicht bereits installiert ist)

--------------------------------------------------------------------------------

	vagrant reload

Führt einen sanften Reload/Restart durch.

--------------------------------------------------------------------------------

	vagrant halt

Fährt die VM herunter, ihre Daten bleiben aber bestehen.

--------------------------------------------------------------------------------

	vagrant suspend

Versetzt die VM in einen Suspend-Modus. Ihre Daten im RAM bleiben erhalten.

--------------------------------------------------------------------------------

	vagrant destroy

Deinstalliert die VM (aber nicht die Daten im vagrant ordner).
Diese Funktion ist Sinnvoll wenn man Speicherplatz sparen möchte oder einen Fehler bei der
Konfiguration vorgenommen hat.  
**WICHTIG:** Hierbei gehen alle Konfigurationen verloren die nicht im /vagrant ordner enthalten sind!  
**WICHTIG:** Hierbei gehen auch alle MySQL Daten verloren. Es empfiehlt sich vorher einen Dump vorzunehmen.

### Zugangsdaten

**SSH**

Es sind 2 Linux Benutzer verfügbar:

Vagrant
Benutzername: vagrant
Passwort: vagrant

Dev
Benutzername: dev
Passwort: dev

**Logindaten für: MySQL & PhpMyAdmin**

Benutzername: root
Passwort: root

## Automatische Konfiguration

### Vagrantfile
Das Vagrant File steuert die Einrichtung und die Konfiguration der VM selbst.
Vagrant konfiguriert im Grund eine VirtualBox anhand der Parameter die wir ihm übergeben.
Diese Konfiguration in diesem Paket wird hier beschrieben.

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

	# -*- mode: ruby -*-
	# vi: set ft=ruby :
	
	# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
	VAGRANTFILE_API_VERSION = "2"
	
	Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

Hier wird die Konfiguration gestartet, alle Konfigurationen geschehen nun in einer Einrückung von 2 Leerzeichen.
Die API Version sollte dabei zur aktuellen Vagrant Version passen.

--------------------------------------------------------------------------------

	  config.vm.box = "hashicorp/precise32"

Hier wird die zu Verwendende Box ausgewählt.
Vagrant stellt in seiner Cloud bereits einige VirtualBoxen zur Verfügung.
Dabei ist hashicorp/precise32 ein Ubuntu 12.04 32Bit Linux System.

--------------------------------------------------------------------------------

	  config.vm.provision :shell, path: "bootstrap.sh" 
	  config.vm.provision "shell", path: "after-boot.sh", run: "always"
	  
Hier wird die Provision eingestellt. 
Eine Provision ist bei Vagrant die Option bestimmte Dinge bei der Installation und beim Booten auszuführen.
Bei jedem 1. Ausführen von "vagrant up" wird dabei ein Provisioning durchgeführt.
In diesem Fall startet das Provisioning nachdem die VM das erste Mal installiert wurde das Shell Script "bootstrap.sh".

Die Zweite Zeile ist ein Workaround, da unsere Shared Folder nach dem Apache2 gestartet werden, sind die Vhosts nicht geladen.
Dies erzeugt einen Fehler und man müsste den Apache bei jedem Booten manuell starten.
Um dies zu umgehen, gibt es die Datei "after-boot.sh". Sie startet lediglich den Apache2 bei jedem Boot.
Da Vagrant normalerweise nur bei der Installation (und wenn man es erzwingt" ein Provisioning durchführt, 
verwenden wir hier den Parameter "run". Der Wert Always lässt Vagrant diese Datei bei jedem Boot ausführen.

--------------------------------------------------------------------------------

	  config.vm.network :forwarded_port, host: 80, guest: 80
	  config.vm.network :private_network, ip: '192.168.50.50'
	  
Hier werden Netzwerkkonfigurationen der VM eingestellt.
Es kann sein, das bei manchen Windows Systemen der Port 80 schon durch ein anderes Programm belegt ist. (beispielsweise Skype)
Die forwarded_port Funktion erlaubt es einen Port der auf der VM (guest) als 80 herauskommt, auf einen beliebigen Port für Windows zu mappen.
Beispiel: Gebe ich bei Host den Port 1337 an, könnte ich die Webseite auf Windows im Browser nun mit 127.0.0.1:1337 aufrufen. 

Die Funktion private_network erlaubt es noch eine Lokale IP für die VM zu bestimmen.
Wir vergeben hier beispielhaft noch die IP 192.168.50.50, womit ebenfalls auf den Server zugegriffen werden kann.

--------------------------------------------------------------------------------

	  config.vm.provider "virtualbox" do |v|
		  v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
		  v.customize ["modifyvm", :id, "--memory", 2048]
		  v.customize ["modifyvm", :id, "--cpus", 2]
	  end
	  
Hier wird die VirtualBox konfiguriert.
Dabei ist die option setextradata dafür zuständig Symlinks im Shared Ordner zu erlauben.
Die modifyvm Optionen konfigurieren mit --memory den RAM und mit --cpus die verfügbaren CPU Kerne der VM.
Der Ram ist hier auf 2048 MB Eingestellt.
Die CPU Einstellung stellt der VM 2 Kerne zur Verfügung.

--------------------------------------------------------------------------------

	  config.vm.synced_folder "vhosts/", "/etc/apache2/sites-available",
	    owner: "root", group: "root"
	  config.vm.synced_folder "www/", "/var/www",
	    owner: "www-data", group: "www-data"
		
Hier werden die Shared Ordner konfiguriert.
Vagrant kann automatisch Shared Ordner mit Windows konfigurieren.
Dabei ist ein Ordner im Linux auch in Windows verfügbar.
Der Vorteil dabei ist der Lokale zugriff auf die Dateien.
So können die verwendeten Entwicklungsumgebungen (IDE's) auf Windows direkt auf die Dateien in der VM zugreifen.

In der ersten Option wird der Ordner vhosts mit dem Linux Ordner "/etc/apache2/sites-available" verknüpft.
Dabei wird der owner und die group auf root gesetzt.
In der zweiten Konfiguration wird der Ordner www mit dem Linux Ordner "/var/www" verknüpft.
Dabei wird der owner und die group auf www-data gesetzt.

### bootstrap.sh
Die Datei bootstrap.sh ist ein Linux Bash Script. 
Es wird direkt bei der Installation durch Vagrant ausgeführt und Installiert die gewünschten Module.
Dabei muss alles Automatisch passieren, da wir keine Rückmeldungen für Eingaben bekommen.

Sollten weitere Pakete für Linux gewünscht sein, kann man diese hier mit Einbinden.

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

	apt-get update

Updatet die Ubuntu Repositorys.
Somit werden die neuesten Versionen aller Programme installiert.

--------------------------------------------------------------------------------

	apt-get install -y apache2
	
Installiert den Apache2 Webserver.

--------------------------------------------------------------------------------

	a2ensite default
	a2ensite default-ssl
	a2ensite tutorial
	apache2ctl restart
	
Aktiviert die Virtual Hosts: default, default-ssl und tutorial.
Startet den Apache2 neu.

--------------------------------------------------------------------------------

	export DEBIAN_FRONTEND=noninteractive
	apt-get install -q -y mysql-server
	mysqladmin -u root password root

Setzt den noninteractive Modus, um keine Abfragen für das Passwort zu erhalten.
Installiert den mysql-server.
Konfiguriert das passwort für den MySQL User root zu root.

--------------------------------------------------------------------------------

	echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/app-password-confirm password root' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/mysql/admin-pass password root' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/mysql/app-pass password root' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
	apt-get install -q -y phpmyadmin

Konfiguriert zuerst mit debconf-set-selections die Installation von phpmyadmin.
Dabei wird mit echo die Konfiguration beschrieben und dann mit einer Pipe (Dieses Symbol: |) in die debconf geschrieben.
Anschließend wird phpmyadmin Installiert.
PhpMyAdmin kann später mit "127.0.0.1/phpmyadmin" aufgerufen werden.

--------------------------------------------------------------------------------

	apt-get install -y php5
	apt-get install -y php-pear php-apc
	
Installiert PHP5 und die zwei PHP Module php-pear und php-apc.
php-apc ist ein Caching System, das die Performance von PHP Applikationen beschleunigt.

--------------------------------------------------------------------------------

	apt-get install -y graphicsmagick
	
Installation von Graphicsmagick.
Dieses Paket wird für TYPO3 benötigt um automatische Grafikbearbeitung in PHP vorzunehmen.

--------------------------------------------------------------------------------

	apt-get install -y git

Installiert Git, welches wir in den Tutorials oft verwenden.

--------------------------------------------------------------------------------

	useradd -G vagrant,admin -m -s /bin/bash dev
	echo "dev:dev" | chpasswd
	ln -fs /vagrant /home/dev/vagrant-folder
	
Fügt einen Benutzer "dev" hinzu.
Dieser Benutzer ist in der Gruppe "vagrant" und "admin".
Es wird diesem Benutzer das Passwort "dev" zugewiesen.
Es wird ein Symlink zum Linux Ordner /vagrant angelegt. Der Symlink befindet sich im Home Verzeichniss von dev.

### after-boot.sh
Die Datei after-boot.sh ist ein Linux Bash Script.
Sie wird bei jedem Bootvorgang ausgeführt (nach den init scripts).
In ihr kann man im Vorraus schon gewisse aktionen durchführen,
wie beispielsweise ein MySQL Dump bei jedem Booten.

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

	apache2ctl start

Führt einen apache2 Start aus.
Dies ist ein Workaround!

Problem: 
Apache2 wird automatisch mit einem Init Script bei Systemstart geladen. In dieser Vagrant Konfiguration verwenden wir jedoch die verfügbaren Virtual Hosts in einem Shared Ordner.
Wenn Apache2 Bootet, ist der Shared Ordner noch nicht geladen und die Dateien nicht verfügbar. Das sorgt dafür das Apache2 nicht korrekt startet.
Lösung:
In diesem Skript führen wir einfach einen erneuten Start aus, da dieses Script nach allen Init Skripten ausgeführt wird.
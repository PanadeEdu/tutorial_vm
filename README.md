# README

## PanadeEdu Tutorial-VM
Diese VM dient zum Aufsetzen einer Entwicklungsumgebung.
PanadeEdu ist ein Tutorial Kanal auf YouTube, diese Virtuelle Maschiene
soll das Verfolgen und Nachspielen der Tutorials vereinfachen.

Die Konfiguration entspricht den Anforderungen der Tutorials,
für Sicherheitskonfigurationen müssen extra Anpassungen vorgenommen werden.
Für eine einfache und automatische Installation werden für diese VM Standard-Passwörter
verwendet, daher ist die Anwendung nicht für Produktiv-Systeme geeignet.

Die Ausführung einer Virtuellen Maschiene erfolgt auf eigene Gefahr,
PanadeEdu kann nicht Haftbar für entstehende Schäden gemacht werden.

## Was ist Vagrant
Vagrant ist ein Wrapper für Virtualisierungs Software wie Oracles VirtualBox.
Dadurch können Virtuelle Maschinen automatisch heruntergeladen, konfiguriert und 
installiert werden.

Die Bedienung erfolgt über die Windows Kommandozeile, in diesem Paket befindet sich jedoch
auch ein Startscript (batch datei) welches die Bedienung vereinfacht.
Ein Beispiel für ein Vagrant Command ist: vagrant up
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
	- Cygwin ist eine Bibliothek aus mehreren Tools wie rsync. 
	- http://www.cygwin.com/
- Installiertes Vagrant
	- Vagrant greift auf Virtualbox (und einige cygwin tools) zu.
	- Wird benötigt für das Skript
	- http://www.vagrantup.com/

**Ordnerstruktur**
Sollte eure Ordnerstruktur so aussehen, müsste alles in Ordnung sein.

- vagrant/
	- vhosts/
		- default
		- default-ssl
		- tutorial
	- www/
		- index.html
	- bootstrap.bat
	- Vagrantfile
- startscript.bat

**Installation Startscript**

1. Rechtsklickt auf startscript.bin
2. Wählt "Als Administrator ausführen" oder "run as administrator"
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

**startscript.bat**

1: Start Vagrant VM  
Startet die VM, oder Installiert sei erneut (wenn die nicht installiert ist)

2: Reload Vagrant VM  
Führt einen sanften Reload/Restart durch.

3: Shutdown Vagrant VM  
Fährt die VM herunter, ihre Daten bleiben aber bestehen.

4: Suspend Vagrant VM  
Versetzt die VM in einen Suspend-Modus. Ihre Daten im RAM bleiben erhalten.

5: Destroy Vagrant VM  
Deinstalliert die VM (aber nicht die Daten im vagrant ordner).
Diese Funktion ist Sinnvoll wenn man Speicherplatz sparen möchte oder einen Fehler bei der
Konfiguration vorgenommen hat.  
**WICHTIG:** Hierbei gehen alle Konfigurationen verloren die nicht im /vagrant ordner enthalten sind!  
**WICHTIG:** Hierbei gehen auch alle MySQL Daten verloren. Es empfiehlt sich vorher einen Dump vorzunehmen.

6: Command Line  
Vagrant besitzt noch weitere Commands, zur einfachen handhabung von Fällen die nicht im Skript abgedeckt sind,
kann man Command Line wählen und selbst einen Command eingeben.

7: Exit  
Schließt das startscript.bat Fenster.
Solange kein Command läuft, kann man das Fenster jederzeit schließen.

**Über CMD**

1. Klickt den Windows Start-Button
2. Suchen im Suchfeld: cmd
3. Rechtsklick auf cmd.exe
4. Klickt "als Administrator ausführen" oder "run as administrator"
5. Tippe: cd [Pfad Zu eurem vagrant Ordner] (beispiel: C:\Users\Panade\tutorial_vm\vagrant)

Von hier aus lassen sich alle "vagrant" Kommandos ausführen:

	vagrant up

Startet die VM, oder Installiert sei erneut (wenn die nicht installiert ist)

	vagrant reload

Führt einen sanften Reload/Restart durch.

	vagrant halt

Fährt die VM herunter, ihre Daten bleiben aber bestehen.

	vagrant suspend

Versetzt die VM in einen Suspend-Modus. Ihre Daten im RAM bleiben erhalten.

	vagrant destroy

Deinstalliert die VM (aber nicht die Daten im vagrant ordner).
Diese Funktion ist Sinnvoll wenn man Speicherplatz sparen möchte oder einen Fehler bei der
Konfiguration vorgenommen hat.  
**WICHTIG:** Hierbei gehen alle Konfigurationen verloren die nicht im /vagrant ordner enthalten sind!  
**WICHTIG:** Hierbei gehen auch alle MySQL Daten verloren. Es empfiehlt sich vorher einen Dump vorzunehmen.

### Zugangsdaten

**SSH**

Es sind 2 Benutzer verfügbar:

Vagrant
Benutzername: vagrant
Passwort: vagrant

Dev
Benutzername: dev
Passwort: dev

**MySQL & PhpMyAdmin**

Benutzername: root
Passwort: root

## Automatische Konfiguration

### Vagrantfile

**VM Image**

Dieses Script richtet mithilfe der Software Vagrant ein Ubuntu-Server 12.04 VM ein.
Das Image wird automatisch von der Vagrant-Cloud heruntergeladen.

	config.vm.box = "hashicorp/precise32"

**SSH**

Der SSH Zugriff erfolgt über folgende Konfiguration:
Ip: 127.0.0.1 (oder localhost)
Port: 2222

**Shared Ordner**

Vagrant richtet automatisch einen Shared Ordner ein. 
Windows: vagrant (selber oder in dem auch Vagrantfile liegt)
Linux-VM: /vagrant

**Linux Install Script**

Bei der ersten Installation wird das Bash-Script bootstrap.sh ausgeführt.
Es installiert und konfiguriert das Linux.

	config.vm.provision :shell, path: "bootstrap.sh" 

**Ports Foward**

Ports können umgeleitet werden, in diesem Fall wird der Port 80 auf dem Gast-System (das linux)
zum Port 80 auf dem Host-System (windows) umgeleitet.

	config.vm.network :forwarded_port, host: 80, guest: 80
	
**VM Spezialkonfiguration**

VirtualBox erlaubt es aus Sicherheitsgründen per default nicht, symlinks in einem Shared Ordner anzulegen.
Um dies zu umgehen muss folgende Konfiguration gelten:

	config.vm.provider "virtualbox" do |v|
		v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
	end

Zusätzlich muss das startscript.bat oder die Kommandozeile als Administrator ausgeführt werden!
	
### bootstrap.sh

**apache2**

Apache2 wird einfach Installiert, es werden jedoch einige Pfade angepasst um den Zugiff über
den Shared Ordner "/vagrant" zu ermöglichen.

"/var/www" wird umgeleitet zu "/vagrant/www"
Dies ermöglicht uns alle Webseiten im www Ordner abzulegen.
Vorsicht: Die default index.html wird bei der Installation überschrieben.

	cp -R /var/www/* /vagrant/www/
	rm -rf /var/www
	ln -fs /vagrant/www /var/www

"/etc/apache2/sites-available" wird umgeleitet zu "/vagrant/vhosts"
Dies ermöglicht uns, beliebige vhosts unabhängig von der VM zu definieren.
Vorsicht: Die vhosts default und default-ssl werden bei der Installation überschrieben.

	cp -R /etc/apache2/sites-available/* /vagrant/vhosts/
	rm -rf /etc/apache2/sites-available
	ln -fs /vagrant/vhosts /etc/apache2/sites-available

	
**mysql-server**

Der mysql-server wird im noninteractive Modus installiert. 
Zugangsdaten werden mit defaultwerten gefüllt.
Für mehr Sicherheit müssen diese Dinge angepasst werden.
Hier die automatisch Konfigurierten Zugänge:

	Username: root
	Passwort: root

**phpmyadmin**

PhpMyAdmin wird ebenfalls im noninteractive Modus installiert.
Mithilfe von debconf-set-selections werden die Passwörter gesetzt.
Für mehr Sicherheit sollten nachträglich die Passwörter angepasst werden.

	echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/app-password-confirm password root' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/mysql/admin-pass password root' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/mysql/app-pass password root' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections

Die Passwörter sind immer gleich: 
Passwort: root

**php5, graphicsmagick, git**

Einfache apt-get Installationen.

**User dev**

Es wird ein User dev hinzugefügt und der Gruppe
vagrant zugeteilt. Zusätzlich hat er wie Vagrant einen
sudo Zugriff ohne passwort!

	useradd -G vagrant -m -s /bin/bash dev
	echo "dev:dev" | chpasswd
	ln -fs /vagrant /home/dev/vagrant-folder
	printf "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

Userdaten:
Username: dev
Passwort: dev
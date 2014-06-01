#!/usr/bin/env bash

# Updates the Ubuntu Repositorys
apt-get update

# Installs Apache2
apt-get install -y apache2

# Redirects the /var/www to the /vagrant/www directory, which is shared
cp -R /var/www/* /vagrant/www/
rm -rf /var/www
ln -fs /vagrant/www /var/www

# Redirects /etc/apache2/sites-available to /vagrant/vhosts
cp -R /etc/apache2/sites-available/* /vagrant/vhosts/
rm -rf /etc/apache2/sites-available
ln -fs /vagrant/vhosts /etc/apache2/sites-available

# Enables the Tutorial vhost with domain tutorial.loc and www.tutorial.loc.
# It is Recommendet to adjust the Windows Host file. 
a2ensite tutorial
apache2ctl restart

# Installs the MySQL Server noninteractive and sets the root Password to "root"
# Change the password in the mysqladmin line like "mysqladmin -u root password [mypassword]" 
# Changing Data-Folder to Shared Folder
export DEBIAN_FRONTEND=noninteractive
apt-get install -q -y mysql-server
mysqladmin -u root password root

# Installing PhpMyAdmin for inbuild MySQL Overview
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password root' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password root' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password root' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
apt-get install -q -y phpmyadmin

# Installs PHP5 on the Server
apt-get install -y php5

# Installs the Graphicsmagick Lib's for use in TYPO3
apt-get install -y graphicsmagick

# Installs Git
apt-get install -y git

# Adding User dev with password dev
useradd -G vagrant -m -s /bin/bash dev
echo "dev:dev" | chpasswd
ln -fs /vagrant /home/dev/vagrant-folder
printf "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


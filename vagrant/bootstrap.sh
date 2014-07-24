#!/usr/bin/env bash

# Updates the Ubuntu Repositorys
apt-get update

###########################################################
################ Apache2 Config ###########################
###########################################################

# Installs Apache2
apt-get install -y apache2

# Obsolete creating Symlinks (left as comment for example usage)
#cp -R /var/www/* /vagrant/www/
#rm -rf /var/www
#ln -fs /vagrant/www /var/www

# Enabling Virtual Hosts
#
# Enabled default and default-ssl Vhost
# Enables the Tutorial vhost with domain tutorial.loc and www.tutorial.loc.
# It is Recommendet to adjust the Windows Host file > C:\Windows\System32\drivers\etc\hosts
# Edit it with an Editor, executed as Administrator and add:
# 127.0.0.1 tutorial.loc
# 127.0.0.1 www.tutorial.loc
a2ensite default
a2ensite default-ssl
a2ensite tutorial
apache2ctl restart

###########################################################
################ MySQL Config #############################
###########################################################

# MySQL Installation
#
# Setting the noninteractive Mode
# Installs MySQL in noninteractive Mode 
# Set Password for user "root" to root
export DEBIAN_FRONTEND=noninteractive
apt-get install -q -y mysql-server
mysqladmin -u root password root

# PhpMyAdmin Installation
#
# Configure the Settings with debconf-set-selections
# Install phpmyadmin with noninteractive mode (it will use the set settings)
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password root' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password root' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password root' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
apt-get install -q -y phpmyadmin

###########################################################
################ Additional Installs ######################
###########################################################

# Installs PHP5 on the Server
apt-get install -y php5
apt-get install -y php-pear php-apc

# Installs the Graphicsmagick Lib's for use in TYPO3
apt-get install -y graphicsmagick

# Installs Git
apt-get install -y git

###########################################################
################ User Config ##############################
###########################################################

# Setting New User
#
# Adding User dev and make him member of the Groups vagrant and admin
# change password of user dev to dev
# Create symlink to /vagrant in home dir of dev
useradd -G vagrant,admin -m -s /bin/bash dev
echo "dev:dev" | chpasswd
ln -fs /vagrant /home/dev/vagrant-folder

chown -R www-data:www-data /var/www
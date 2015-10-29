#!/usr/bin/env bash

# Use single quotes instead of double quotes to make it work with special-character passwords
PASSWORD='XXXXXXXXXXXX'
TLD = 'dev'

# create project folder
sudo mkdir "/var/www/vhosts" -m 775

# update / upgrade
sudo apt-get update
sudo apt-get -y upgrade

# install apache 2.5 and php 5.5
sudo apt-get install -y apache2
sudo apt-get install -y php5
sudo apt-get install -y php5-curl
sudo apt-get install -y php5-mcrypt

# install mysql and give password to installer
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo apt-get -y install mysql-server
sudo apt-get install php5-mysql

VHOST=$(cat <<EOF
ServerName srv.$TLD
<VirtualHost *:80>
    UseCanonicalName Off

    ServerAlias *.$TLD
    VirtualDocumentRoot /var/www/vhosts/%1/httpdocs
    <Directory /var/www/vhosts/%1>
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf

# enable mod_rewrite
sudo a2enmod rewrite
sudo a2enmod vhost_alias

# restart apache
service apache2 restart

# install git
sudo apt-get -y install git

# install Composer
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

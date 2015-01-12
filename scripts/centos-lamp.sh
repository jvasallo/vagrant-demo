#!/bin/bash

# general update the OS with latest patches
yum update -y --exclude=kernel

# General tools
yum install -y vim git unzip screen

# Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

# Download starter content
cd /vagrant
sudo -u vagrant -q https://raw.githubusercontent.com/jvasallo/vagrant/master/files/index.html
sudo -u vagrant -q https://raw.githubusercontent.com/jvasallo/vagrant/master/files/info.php

service httpd restart

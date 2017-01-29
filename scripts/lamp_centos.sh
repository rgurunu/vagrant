#!/bin/bash

yum update -y --exclude=kernel
yum install -y nano git unzip screen
yum install -y httpd httpd-devel httpd-tools
#chkconfig --add httpd
#chkconfig httpd on
systemctl enable httpd
service stop httpd
rm -rf /var/www/html
ln -s /vagrant /var/www/html

#service httpd start
systemctl start httpd

yum install -y php php-cli php-devel php-common php-mysql
yum install -y mysql mysql-server mysql-devel
#chkconfig --add mysqld
#chkconfig mysqld on
systemctl enable mysqld
#service mysqld start
systemctl start mysqld

mysql -u root -e "SHOW DATABASES";


#Download starter content
mkdir vagrant
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/rgurunu/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/rgurunu/vagrant/master/files/info.php

systemctl restart httpd
#service httpd restart

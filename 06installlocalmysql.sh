#!/bin/bash


   wget http://repo.mysql.com//mysql57-community-release-el6-7.noarch.rpm
   yum -y reinstall mysql57-community-release-el6-7.noarch.rpm
   

   yum-config-manager --disable mysql57-community
   yum-config-manager --enable mysql56-community
   yum -y install mysql-community-server
   chkconfig --add mysqld; service mysqld stop

     cp ./cfg/quickstart-my.cnf /etc/my.cnf

      mkdir -p /var/lib/mysql /var/log /var/run/mysqld
      chown -R mysql /var/lib/mysql;chown -R mysql /var/run/mysqld
        

     service mysqld start

      
    /usr/bin/mysqladmin -u root password 'cloudera'


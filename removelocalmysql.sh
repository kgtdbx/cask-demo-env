#!/bin/bash

service mysqld stop;
yum -y remove mysql-community*; rm -R -f /var/lib/mysql;
unalias rm; rm -R /var/lib/mysql; rm /etc/yum.repos.d/mysql-community*; 
rm ./mysql57-community-release-el6-7.noarch.rpm

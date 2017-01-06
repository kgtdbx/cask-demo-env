#!/bin/bash

            mkdir -p /usr/share/java ;
            wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.38.tar.gz;
            tar -xvf *.gz ; cp ./mysql-connector-java-5.1.38/mysql-connector-java-5.1.38-bin.jar /usr/share/java/mysql-connector-java.jar;
            rm -f -R mysql-connector-java-5.1.38*

#!/bin/bash

source setuser.sh

while read node
do
   echo BEGIN $node

   #commands go here
      
     echo begin | ssh $LOGIN@$node "sudo wget -np -P /opt/cloudera/csd/ http://repository.cask.co/downloads/cdap-csd/CDAP-3.5.0.jar"
     echo begin | ssh $LOGIN@$node "sudo wget -np -P /opt/cloudera/csd/ http://repository.cask.co/downloads/cdap-csd/CDAP-3.5.1.jar"
     echo begin | ssh $LOGIN@$node "sudo wget -np -P /opt/cloudera/csd/ http://repository.cask.co/downloads/cdap-csd/CDAP-3.6.0.jar" 
     echo begin | ssh $LOGIN@$node "sudo wget -np -P /opt/cloudera/csd/ http://repository.cask.co/downloads/cdap-csd/CDAP-4.0.0.jar"
     
     echo begin | ssh $LOGIN@$node "sudo chown cloudera-scm:cloudera-scm /opt/cloudera/csd/*; sudo chmod -R 644 /opt/cloudera/csd/*"    
     echo begin | ssh $LOGIN@$node "sudo /sbin/service cloudera-scm-server restart; sudo tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log"
   echo END $node

done < nodes

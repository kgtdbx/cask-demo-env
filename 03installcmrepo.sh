#!/bin/bash

if [ -f /etc/yum.repos.d/cloudera-manager.repo ]; then
               echo "Cloudera Manager repo already exists"
            else
               echo "Fetching new Cloudera Manager repo" 
               timeout 6 wget -P /etc/yum.repos.d/ http://archive.cloudera.com/cm5/redhat/6/x86_64/cm/cloudera-manager.repo
            fi

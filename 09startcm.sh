#!/bin/bash

if [ $# -eq 0 ]; then
   echo "USING REMOVE DATABASE"
   /usr/share/cmf/schema/scm_prepare_database.sh --host db mysql cm cm cm
else
   echo "USING LOCAL DATABASE"
   /usr/share/cmf/schema/scm_prepare_database.sh mysql cm cm cm
fi 

service cloudera-scm-server start

tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log

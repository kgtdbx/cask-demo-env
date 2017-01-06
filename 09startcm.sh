#!/bin/bash

if [ $# -eq 0 ]; then
   /usr/share/cmf/schema/scm_prepare_database.sh --host db mysql cm cm cm
else
   /usr/share/cmf/schema/scm_prepare_database.sh db mysql cm cm cm
fi 

service cloudera-scm-server start

tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log

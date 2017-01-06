#!/bin/bash

# installs Cloudera Manager

./03installcmrepo.sh
./04installjdk.sh
./05installjdbc.sh

if [ $# -eq 0 ]; then
   ./06installlocalmysql.sh
else
   echo "Using Remove MySQL Database on db.demo.cask.co"
fi

./08installcm.sh
./09startcm.sh

# python cm api cluster install

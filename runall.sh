#!/bin/bash

# installs Cloudera Manager

./03installcmrepo.sh $1
./04installjdk.sh $1
./05installjdbc.sh $1

if [ $# -eq 0 ]; then
   echo "Using Remote Database"
else
   ./06installlocalmysql.sh $1
   ./07createdbusers.sh $1
fi

./08installcm.sh $1
./09startcm.sh $1

# python cm api cluster install

#!/bin/bash

# installs Cloudera Manager

./03installcmrepo.sh
./04installjdk.sh
./05installjdbc.sh

if [ $# -eq 0 ]; then
   echo "USING REMOVE MYSQL DATABASE ON db.demo.cask.co"
else
	./06installlocalmysql.sh
fi

./08installcm.sh
./09startcm.sh

# python cm api cluster install

#!/bin/bash

./removecm.sh

rm -f /usr/shared/java/*

yum -y remove oracle-j2sdk1.7

rm -f /etc/yum.repo.d/cloudera*

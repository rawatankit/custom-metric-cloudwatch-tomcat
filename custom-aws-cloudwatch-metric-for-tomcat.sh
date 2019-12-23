#!/bin/bash
#instanceid='curl --silent http://169.254.169.254/latest/meta-data/instance-id'
#instanceid='curl --silent http://169.254.169.254/latest/meta-data/public-ipv4'

SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export PATH=$JAVA_HOME/bin:$PATH
TOMCAT_HOME=/Opt/apache-tomcat-8.5.16/
#JAVA_HOME=/usr/lib/jvm/java-8-oracle
#PATH=/root/.local/bin/aws


instanceid=`curl --silent http://169.254.169.254/latest/meta-data/public-ipv4`


SERVICE=java;

#if ps axu | grep -v grep | grep $SERVICE > /dev/null
if ps -eaf | grep -v grep | grep $SERVICE > /dev/null
then
    value="0"
else
  #  echo "$SERVICE is not running"
    value="1"
fi

aws cloudwatch put-metric-data --metric-name "$instanceid" --namespace "TomcatsWithPublicIP" --value "$value"  --region us-east-1

#!/bin/bash
HERE=$(cd $(dirname $0);pwd)
cd $HERE


for container_name in   mysftp_01 mysql_01 tomcat_01 mysmtp_01
do

echo -e "\n### remove container : ${container_name} ###"
docker stop $container_name
docker rm   $container_name

done

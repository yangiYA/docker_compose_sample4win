#!/bin/sh

HERE=$(cd $(dirname $0);pwd)

cd $HERE


echo -e "\n"
echo -e "****************************************************"
echo -e "docker network ls"
echo -e "****************************************************"
docker network ls

echo -e "\n"
echo -e "****************************************************"
echo -e "docker network inspect project01_default"
echo -e "****************************************************"
docker network inspect project01_default

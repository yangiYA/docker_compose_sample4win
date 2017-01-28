#!/bin/sh

HERE=$(cd $(dirname $0);pwd)

cd $HERE



#export BASE_DIR=/c/Users/${USERNAME}/wksp/docker4win_sample/apsv_db_smtp_java
export BASE_DIR=.

export SFTP_USER=sftpuser
export HOST_SFTP_PORT=10022

#. ./init.txt


#for Windows setting mapping C:\Users ==> /c/Users
export COMPOSE_CONVERT_WINDOWS_PATHS=1

#docker-compose --project-name project01  up -d  --no-recreate --build
#docker-compose --project-name project01  up -d  --force-recreate --build
docker-compose --project-name project01  up -d  --build

echo -e "\n****************************************************"

docker ps -a

echo -e "\n"
echo -e "\n****************************************************"
echo -e "* IP of Linux VM(for docker containers)"
docker-machine ip default
echo -e "****************************************************"
echo -e "\n"

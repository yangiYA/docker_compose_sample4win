#!/bin/sh

HERE=$(cd $(dirname $0);pwd)
cd $HERE

CONTAINER_NAME=mysql_01

ARGS=$@
if [ "$1" = "" ]; then
  ARGS=--tail 100
fi

docker logs ${CONTAINER_NAME} ${ARGS} 

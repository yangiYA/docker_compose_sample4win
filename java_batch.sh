#!/bin/sh

HERE=$(cd $(dirname $0);pwd)
cd $HERE

CONTAINER_NAME=java_01
docker exec -it ${CONTAINER_NAME} sh

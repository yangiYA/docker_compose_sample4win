#!/bin/bash
HERE=$(cd $(dirname $0);pwd)

WORK_DIR=${HERE}/$1
shift
ARGS=$@

DOCKER_IMAGE=openjdk:8-jdk-alpine
DCOKER_NAME=docker-java
DOCKER_WORK_DIR=/usr/src/myapp

echo -e "\n"
echo -e "****************************************************************************"
echo -e "WORK_DIR      =${WORK_DIR}"
echo -e "ARGS          =${ARGS}"
echo -e "DOCKER_IMAGE  =${DOCKER_IMAGE}"
echo -e "****************************************************************************"
echo -e "\n"

docker run -it --rm --name ${DCOKER_NAME} \
           -v ${WORK_DIR}:${DOCKER_WORK_DIR} \-w ${DOCKER_WORK_DIR} \
           ${DOCKER_IMAGE} \
       $ARGS

#!/bin/bash
HERE=$(cd $(dirname $0);pwd)

MVN_M2_DIR=${HERE}/root.m2
WORK_DIR=${HERE}/$1
shift
ARGS=$@

# DOCKER_IMAGE=maven:3-jdk-8

DOCKER_IMAGE=maven:3.3.9-jdk-8
DCOKER_NAME=docker-mavne
DOCKER_WORK_DIR=/usr/src/mymaven

echo -e "\n"
echo -e "****************************************************************************"
echo -e "WORK_DIR        =${WORK_DIR}"
echo -e "DOCKER_WORK_DIR =${DOCKER_WORK_DIR}"
echo -e "ARGS            =${ARGS}"
echo -e "DOCKER_IMAGE    =${DOCKER_IMAGE}"
echo -e "****************************************************************************"
echo -e "\n"

docker run -it --rm --name ${DCOKER_NAME} \
           -v ${WORK_DIR}:${DOCKER_WORK_DIR} -v ${MVN_M2_DIR}:/root/.m2 -w ${DOCKER_WORK_DIR} \
           ${DOCKER_IMAGE} \
       mvn $ARGS

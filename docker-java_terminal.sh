#!/bin/bash
HERE=$(cd $(dirname $0);pwd)

WORK_DIR=${HERE}/myjava01/home/batchuser/bin

LOG_DIR=${HERE}/myjava01/var_log/batchuser
SSH_FILE=${HERE}/mysftp/sshkeys/id_rsa

DOCKER_IMAGE=openjdk:8-jdk-alpine
DCOKER_NAME=docker-java
DOCKER_WORK_DIR=/home/batchuser/bin

DOCKER_LOG_DIR=/var/log/batchuser

echo -e "\n"
echo -e "****************************************************************************"
echo -e "DOCKER_IMAGE    =${DOCKER_IMAGE}"
echo -e ""
echo -e "WORK_DIR        =${WORK_DIR}"
echo -e "LOG_DIR         =${LOG_DIR}"
echo -e "DOCKER_WORK_DIR =${DOCKER_WORK_DIR}"
echo -e "DOCKER_LOG_DIR  =${DOCKER_LOG_DIR}"
echo -e "****************************************************************************"
echo -e "\n"

docker run -it --rm --name ${DCOKER_NAME} \
           -v ${WORK_DIR}:${DOCKER_WORK_DIR} \
           -v ${LOG_DIR}:${DOCKER_LOG_DIR} \
           -v ${SSH_FILE}:/home/batchuser/.ssh/id_rsa \
           -e "LANG=ja_JP.UTF-8"      \
           -e "TZ=JST-9"   \
           -w ${DOCKER_WORK_DIR} \
           --link mysftp_01:sftp01  \
           --link mysmtp_01:smtp01  \
           --link mysql_01:dbserver01  \
           ${DOCKER_IMAGE} \
       /bin/sh

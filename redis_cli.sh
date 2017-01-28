#!/bin/sh

HERE=$(cd $(dirname $0);pwd)
cd $HERE

CONTAINER_NAME=myredis_01
REDIS_PORT=6379

echo -e "### redis connect command ###"
echo -e "  redis-cli -h ${CONTAINER_NAME}  -p ${REDIS_PORT} \n"

docker exec -it ${CONTAINER_NAME} /bin/sh

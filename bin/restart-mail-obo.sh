#!/bin/sh
RUN_DIR=`pwd`
cd ../email/mail-obo
docker-compose down
docker system prune -f
sleep 1
docker-compose up -d
docker-compose logs -f
cd $RUN_DIR

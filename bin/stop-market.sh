#!/bin/sh
RUN_DIR=`pwd`
cd ../appserver/market
docker-compose down
docker system prune -f
cd $RUN_DIR

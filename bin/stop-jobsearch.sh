#!/bin/sh
RUN_DIR=`pwd`
cd ..
BASE_DIR=`pwd`

cd $BASE_DIR/web/jobsearch && docker-compose down

cd $RUN_DIR

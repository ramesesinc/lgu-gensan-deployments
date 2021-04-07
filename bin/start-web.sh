#!/bin/sh
RUN_DIR=`pwd`
cd ..
BASE_DIR=`pwd`

cd $BASE_DIR/system/etracs-web && docker-compose up -d

cd $BASE_DIR/web/jobsearch && docker-compose up -d

cd $RUN_DIR

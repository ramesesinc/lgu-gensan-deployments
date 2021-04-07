#!/bin/sh
RUN_DIR=`pwd`
cd ..
BASE_DIR=`pwd`

cd $BASE_DIR/web/jobsearch && docker-compose down

cd $BASE_DIR/web/jobsearch && docker-compose up -d

cd $BASE_DIR/web/jobsearch && docker-compose logs -f

cd $RUN_DIR

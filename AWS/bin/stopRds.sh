#!/bin/bash

if [ "$1" == "" ] ; then
  BASENAME=`basename $0`
  echo "Usage: $BASENAME <FILTER>"
  exit 1
fi

FILTER=$1
DATE=`date +%Y%m%d`
BASE_DIR=~/data/nuclias/1.0
DB_INSTANCES_FILE=$BASE_DIR/describe-db-instances-$DATE.json

if [ ! -d $BASE_DIR ]; then
  mkdir -p $BASE_DIR
fi

if [ ! -e $DB_INSTANCES_FILE ]; then
  aws --profile nuclias --region ap-northeast-1 rds describe-db-instances > $DB_INSTANCES_FILE
fi

TARGET_DB_INSTANCES=`cat $DB_INSTANCES_FILE | jq '.DBInstances[].DBInstanceIdentifier' | grep $FILTER`

for db_instance in $TARGET_DB_INSTANCES; do
  name=`echo $db_instance | sed 's/"//g'`
  aws --profile nuclias --region ap-northeast-1 rds stop-db-instance --db-instance-identifier $name
done



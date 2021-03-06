#!/bin/bash

if [ "$1" == "" ] ; then
  BASENAME=`basename $0`
  echo "Usage: $BASENAME <FILTER>"
  exit 1
fi

FILTER=$1
DATE=`date +%Y%m%d`
BASE_DIR=~/data/nuclias/1.0
AUTOSCALING_GROUP_NAME_FILE=$BASE_DIR/AutoScalingGroupName-$DATE.json

if [ ! -d $BASE_DIR ]; then
  mkdir -p $BASE_DIR
fi

if [ ! -e $AUTOSCALING_GROUP_NAME_FILE ]; then
  aws --profile nuclias --region ap-northeast-1 autoscaling describe-auto-scaling-groups > $AUTOSCALING_GROUP_NAME_FILE
fi

TARGET_GROUP_NAMES=`cat $AUTOSCALING_GROUP_NAME_FILE | jq '.AutoScalingGroups[].AutoScalingGroupName' | grep $FILTER`

for group_name in $TARGET_GROUP_NAMES; do
  name=`echo $group_name | sed 's/"//g'`
  aws --profile nuclias --region ap-northeast-1 autoscaling update-auto-scaling-group --auto-scaling-group-name $name --max-size 0
done


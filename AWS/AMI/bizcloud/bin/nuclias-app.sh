#!/bin/bash

DATE=`date +%Y%m%d`
SOURCE_PATH=~/bizcloud
BUILD_PATH=$SOURCE_PATH/manager/build/nodeapp/build
TARGET_FOLDER=public
STAGE_PATH=$BUILD_PATH/$TARGET_FOLDER
DAILY_PATH=$STAGE_PATH-$DATE
LOG_PATH=~/log/nuclias.app
DAILY_DIFF=$LOG_PATH/$DATE.diff
DAILY_DIFFER=$LOG_PATH/$DATE.differ
DAILY_ONLY_IN=$LOG_PATH/$DATE.only_in
DAILY_NEW_FILE=$LOG_PATH/$DATE.new
DAILY_DEL_FILE=$LOG_PATH/$DATE.del
DAILY_EN_DICT=$LOG_PATH/$DATE.en_dict
DAILY_PUT=$LOG_PATH/$DATE.put
DAILY_RM=$LOG_PATH/$DATE.rm


if [ -d $BUILD_PATH ]; then
  if [ ! -d $DAILY_PATH ]; then
    LAST_BUILD=`(cd $BUILD_PATH;ls | grep $TARGET_FOLDER- | tail -1)`
    echo $LAST_BUILD
    ( cd $BUILD_PATH; diff -qr $TARGET_FOLDER $LAST_BUILD | grep -v ".gz " ) > $DAILY_DIFF
    cat $DAILY_DIFF | grep " differ" > $DAILY_DIFFER
    cat $DAILY_DIFF | grep "Only in " > $DAILY_ONLY_IN
    cat $DAILY_ONLY_IN | grep " $TARGET_FOLDER/" > $DAILY_NEW_FILE
    cat $DAILY_ONLY_IN | grep " $LAST_BUILD/" > $DAILY_DEL_FILE
    cat $DAILY_DIFFER | awk '{ print $2; }' | grep en/dict.js > $DAILY_EN_DICT
    cat $DAILY_DIFFER | awk '{ print $2; }' | grep -v dict.js > $DAILY_PUT
    cat $DAILY_EN_DICT >> $DAILY_PUT
    cat $DAILY_NEW_FILE | awk -F'[ :]' '{ print $3 "/" $5 }' >> $DAILY_PUT
    cat $DAILY_DEL_FILE | awk -F'[ :]' '{ print $3 "/" $5 }' >> $DAILY_RM
    # cp -a $BUILD_PATH $DAILY_PATH
  fi
fi
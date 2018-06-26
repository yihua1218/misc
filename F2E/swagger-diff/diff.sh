#!/bin/bash

DATA_PATH=~/data/nuclias/
PREFIX=restful-api-

cd $DATA_PATH

FILES=`ls $PREFIX*`

LAST_FILE=""
for file in $FILES; do
  if [ "$LAST_FILE" != "" ]; then
    DATE=`echo $file | gawk 'match($0, /.*([0-9]{8}).*/, matched) { print matched[1] }'`
    echo $DATE
    if [ ! -e $DATA_PATH/json-diff-$DATE.html ]; then
      json-diff $LAST_FILE $file -C > /tmp/json-diff.result
      RESULT=$?
      if [ $RESULT -eq 1 ]; then
        json-diff $LAST_FILE $file -C | aha -b > $DATA_PATH/json-diff-$DATE.html
      fi
    fi
  fi
  LAST_FILE=$file
done

node ~/bin/diff.js > /dev/null

DATE=`date +%Y%m%d`

FILES="$DATA_PATH/restful-api-$DATE.json $DATA_PATH/json-diff-$DATE.html $DATA_PATH/restful-api-diff.json"

for file in $FILES; do
  if [ -e $file ]; then
    BASENAME=`basename $file`
    aws s3 cp --profile yihua --acl public-read $file s3://nuclias.app/data/$BASENAME
  fi
done

#!/bin/bash

SITE=dev
CONFIGS="awsConfig.json databaseConfig.json licenseServerConfig.json"

if [ "$1" == "" ]; then
  REPO_PATH=~/bizcloud
else
  REPO_PATH=$1
fi
CONFIG_PATH=$REPO_PATH/manager/build/nodeapp/build/js/config

for config in $CONFIGS; do
  echo cp $CONFIG_PATH/$config.default $CONFIG_PATH/$config
  cp $CONFIG_PATH/$config.default $CONFIG_PATH/$config
done

echo cp $CONFIG_PATH/config.json.$SITE $CONFIG_PATH/config.json
cp $CONFIG_PATH/config.json.$SITE $CONFIG_PATH/config.json



#!/bin/bash

CA_FILE=$1
PKEY_FILE=$2
CERT_FILE=$3
NAME=$4

if [ "$4" == "" ]; then
  BASENAME=`basename $0`
  echo "Usage: $BASENAME <ca_bundle_filename> <private_key_filename> <certificate_filename> <name>"
  exit 1 
fi

(cat $CA_FILE ; echo ; cat $PKEY_FILE ; echo ; cat $CERT_FILE ) > $NAME.pem

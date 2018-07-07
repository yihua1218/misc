#!/bin/bash

HOST=device-cloudmgt.nuclias.com
PORT=443

if [ "$1" != "" ]; then
  HOST=$1
fi

openssl s_client -connect ${HOST}:${PORT} -showcerts 2>/dev/null </dev/null | awk '/^.*'"${HOST}"'/,/-----END CERTIFICATE-----/{next;}/-----BEGIN/,/-----END CERTIFICATE-----/{print}'
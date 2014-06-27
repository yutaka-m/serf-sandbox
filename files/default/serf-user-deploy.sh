#!/bin/bash

echo
echo "node deploy: ${SERF_EVENT}."

curl -F rid=$RID -F text=":${SERF_EVENT} -- ${SERF_SELF_NAME}にデプロイしてください。" $URL


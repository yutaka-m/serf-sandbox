#!/bin/bash

echo
echo "node leave: ${SERF_EVENT}."

curl -F rid=$RID -F text=":${SERF_EVENT} -- ${SERF_SELF_NAME}:Nodeが削除されました。" $URL


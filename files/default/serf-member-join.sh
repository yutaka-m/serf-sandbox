#!/bin/bash

echo
echo "New node join: ${SERF_EVENT}."

curl -F rid=$RID -F text=":${SERF_EVENT} -- ${SERF_SELF_NAME}:新しいNodeが追加されました。" $URL


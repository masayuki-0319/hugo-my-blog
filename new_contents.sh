#!/bin/bash -eu

if [[ $# -lt 2 ]] ; then
  echo "第一引数として「記事のタイプ」、第二引数として「記事の名称」を入力すること"
  exit 1
fi

CONTENT_TYPE=$1
NEW_FILE_NAME=$2

hugo new "${CONTENT_TYPE}/${NEW_FILE_NAME}"

open "content/${CONTENT_TYPE}/${NEW_FILE_NAME}" -a /Applications/Visual\ Studio\ Code.app

exit 0

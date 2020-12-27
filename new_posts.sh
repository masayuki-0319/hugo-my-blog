#!/bin/bash -eu

if [[ $# -lt 1 ]] ; then
  echo "引数として、新規登録したい記事のファイル名を入力してください"
  exit 1
fi

NEW_FILE_NAME=$1

hugo new "posts/${NEW_FILE_NAME}"

open ${COPY_FILE_PATH} -a /Applications/Visual\ Studio\ Code.app

exit 0

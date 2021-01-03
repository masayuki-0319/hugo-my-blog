#!/bin/bash -eu

if [[ $# -lt 2 ]] ; then
  echo "第一引数として「記事の種類」、第二引数として「記事の名称」を入力すること"
  exit 1
fi

content_type=$1
new_file_name="$2.md"

ALLOW_CONTENT_TYPE=("posts" "memo")
if ! `echo ${ALLOW_CONTENT_TYPE[@]} | grep -qE "( |^)${content_type}( |$)"` ; then
    echo "記事の種類は [${ALLOW_CONTENT_TYPE[@]}] のいずれかを入力すること"
    exit 1
fi

create_date=`date +"%Y%m%d"`
file_path="${content_type}/${create_date}-${new_file_name}"

hugo new $file_path
open "content/${file_path}" -a /Applications/Visual\ Studio\ Code.app

exit 0

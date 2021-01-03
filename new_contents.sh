#!/bin/bash -eu

# 初期設定
cd `dirname $0`
set -e

# 引数チェック
content_type=$1
new_file_name="$2.md"

if [[ $# -lt 2 ]] ; then
  echo "第一引数として「記事の種類」、第二引数として「記事の名称」を入力すること"
  exit 1
fi

ALLOW_CONTENT_TYPE=("posts" "memo")
if ! `echo ${ALLOW_CONTENT_TYPE[@]} | grep -qE "( |^)${content_type}( |$)"` ; then
  echo "記事の種類は [${ALLOW_CONTENT_TYPE[@]}] のいずれかを入力すること"
  exit 1
fi

# 新記事の生成
create_date=`date +"%Y%m%d"`
file_path="${content_type}/${create_date}-${new_file_name}"
hugo new $file_path

# 新記事を開く
open "./content/${file_path}" -a /Applications/Visual\ Studio\ Code.app

exit 0

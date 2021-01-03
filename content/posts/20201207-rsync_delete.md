---
title: "rsyncでサーバ壊滅"
date: 2020-12-07
description: "rsync --delte でサーバを壊した時の原因"
draft: false
hideToc: false
enableToc: true
enableTocContent: false
tocFolding: false
tocPosition: inner
tocLevels: ["h2", "h3", "h4"]
tags:
- rsync
- linux
categories:
- error
---

## 概要
rsync --delete をシェルスクリプトに仕込んでサーバ壊滅した。

## 事象

bashCMS2 中の ./deploy コマンド実行で、サーバを吹っ飛ばした。

原因は、コード入力中に不可視文字が入り込んだようで、 bin/conf ファイルを読み込めてなかったこと。

./deploy 中の rsync は、bin/conf ファイルで設定された変数を元にして、実行される。
そのため、引数が空になって、残った `/` が指定されてしまい、サーバを吹っ飛ばした。

## 対策

今から思えば、VSCode で ./deploy を開いていた時、txt ファイルのシンタックスカラーだったので、そこで違和感を持つべきだった。

本番稼働をするなら、仮想環境で試験実行するだろうから、気付くだろうけど。。

rsync --delete 使用時は、引数に特に気をつけるべき教訓。

- 参考 URL
    - [ryuichiueda/bashcms2: a little CMS system written with bash](https://github.com/ryuichiueda/bashcms2)

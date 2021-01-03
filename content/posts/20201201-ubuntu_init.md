---
title: "ubuntuの初期設定"
date: 2020-12-01
description: Ubuntu導入時の手順メモ
draft: false
hideToc: false
enableToc: true
enableTocContent: false
tocFolding: false
tocPosition: inner
tocLevels: ["h2", "h3", "h4"]
tags:
- linux
- ubuntu
categories:
- linux
---

## 概要

Ubuntu を使用したサーバ構築の手順。

## OS セットアップ

### Set up users and passwords

Question | Answer
---|---
Full name for the new user | Onishi Masayuki
Username for  your account | onishi
Choose a password for the new user | ${パスワード入力}
Re-enter password to verify | ${パスワード再入力}


### Partiton disks

Question | Answer
---|---
Partitioning method | Guided - use entire disk
Select disk to partition | Virtual disk 1 (vda)
Write the changes to disks? | Yes

### Finish the installation

- `Continue` 選択
    - 再起動後に再接続


## 好みのサーバ設定

```bash
# 好みのテキストエディタ
$ sudo apt install vim

# 日本語設定
$ sudo apt install manpages-ja manpages-ja-dev language-pack-ja
$ sudo update-locale LANG=ja_JP.UTF-8
```

## SSH認証設定

SSHの設定手順について、他にも id_rsa が存在する人向けの手順としている。

初めての人なら、`ssh-keygen` のみでも問題無し。

```bash
# ローカル
## 新サーバ用の SSH Key を生成
$ cd ~/.ssh/
$ ssh-keygen -t rsa -b 4096 -f id_rsa_${別名用の suffix}
  > 全部リターン

## 公開鍵を新サーバに送信
$ scp ./id_rsa_${別名用の suffix}.pub ${ユーザ名}@${IPアドレス}:~/
```

```bash
# リモートサーバ
## SSH接続元に対して接続を許可する公開鍵を設置する `.ssh/authorized_keys` 設定
$ mkdir .ssh
$ mv ${公開鍵} ./.ssh
$ chmod 700 .ssh/
$ cat ${公開鍵} >> .ssh/authorized_keys
$ chmod 600 .ssh/authorized_keys
$ rm ${公開鍵}
```

### SSH接続時の設定ファイル

ここまでの設定では、SSH接続時に `ssh ${ユーザ名}@${IPアドレス}:~/ -i ${秘密鍵のファイル名}` と入力する必要がある。

そのため、~/.ssh/config を設定することにより、入力を省略可能にする。

```bash
$ vim .ssh/config
```

```txt
# ~/.ssh/config

Host ${ssh コマンドで使用する任意のサーバ名}
  User ${接続先のユーザ名}
  Hostname ${接続先のIPアドレス}
  IdentityFile ~/.ssh/${生成した秘密鍵名}
```

- 参考URL
    - [ssh\-keygenでファイル名を指定して鍵を生成する \- Qiita](https://qiita.com/goldbook@github/items/575981f3ec0bc582ea24)
    - [SSH で複数の秘密鍵を使い分けるいくつかの方法 \- Ellinikonblue\.com Weblog](http://www.ellinikonblue.com/blosxom/UNIX/20150721SSH.html)
    - [インフラエンジニアじゃなくても押さえておきたいSSHの基礎知識 \- Qiita](https://qiita.com/tag1216/items/5d06bad7468f731f590e)
    - [~/\.ssh/configについて \- Qiita](https://qiita.com/passol78/items/2ad123e39efeb1a5286b)


### パスワードログインを無効化

```bash
$ sudo vim /etc/ssh/sshd_config
```

```diff
# /etc/ssh/sshd_config

- #PasswordAuthentication yes
+ PasswordAuthentication no
```

```bash
$ sudo service ssh restart
```

## 断念したこと
### メモ: IP 制限 ( 対応見送り )

固定 IP が必要になるが、家庭用回線において、基本的に別途オプションが必要である。

nuro 光の場合は、ビジネス契約が必要になるから、設定不可だった。

- 参考 URL
    - [さくらのVPS パケットフィルタで「許可する送信元IPアドレス」設定追加のお知らせ – さくらのVPSニュース](https://vps.sakura.ad.jp/news/vps-pf-ph3/)
    - [NURO 光で固定IPアドレスを使う方法を解説！変動型との違いは？ \| NURO 光](https://www.nuro.jp/article/koteigata-ip/)

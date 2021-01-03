---
title: "ドメインの初期設定とHTTPS化"
date: 2020-12-07
description: さくらのVPS利用時におけるドメイン設定
draft: false
hideToc: false
enableToc: true
enableTocContent: false
tocFolding: false
tocPosition: inner
tocLevels: ["h2", "h3", "h4"]
tags:
- domain
- https
categories:
- linux
---

## 概要
ドメイン初期設定と HTTPS 化 ( さくらの VPS　× Let's Encrypt )

## サーバの IP を確認

さくらの VPS は、デフォルトでドメインが割り当てられている。

そのため、デフォルト値を使用する。

なお、ドメインは、以下 URL の管理画面における `ホスト名` の箇所で確認できる。

https://secure.sakura.ad.jp/vps-beta/servers/:id/info

## サーバのドメイン設定

```bash
$ echo ${ホスト名} | sudo tee /etc/hostname
$ sudo reboot
```

## HTTPS 化 ( Let's Encrypt )

### 設定ファイルの調整

```bash
$ cd /etc/apache2/sites-available/
$ sudo cp 000-default.conf ${新設定ファイル}.conf
$ vim ${新設定ファイル}.conf
```

```diff
# ${新設定ファイル}.conf

- <VirtualHost *:80>
+ <VirtualHost ${ドメイン名}:80>
```

```bash
$ cd /etc/apache2/sites-enabled
$ sudo rm 000-default.conf
$ sudo ln -s ../sites-available/${新設定ファイル}.conf ./
$ sudo service apache2 restart
```

### Let's Encrypt のインストール

```bash
$ sudo apt install letsencrypt python-certbot-apache
```

### サーバ証明書を取得

```bash
$ sudo letsencrypt --apache
```

Question | Answer
---|---
Enter email address | 自分のメールアドレス ( 証明書更新時期に連絡あるかも？ )
Please read the Terms ... | 規約に同意できる場合は、Agree
Would you be willing to share your email address... | 任意
Which names would you like to activate https for ? | HTTPS 化したいドメインを選択
Please choose whether or not to redirect HTTP traffic to HTTPS | 2\. Redirect

### 終了

Let's Encrypt におけるサーバ証明書の有効期限は、`90 日間` である。

証明書の更新時は、以下のコマンドを実行すること。

```bash
sudo letsencrypt renew
```

- 参考 URL
    - [よくある質問 \(FAQ\) \- Let's Encrypt \- フリーな SSL/TLS 証明書](https://letsencrypt.org/ja/docs/faq/#:~:text=Let's%20Encrypt%20%E3%81%AE%E8%A8%BC%E6%98%8E%E6%9B%B8%E3%81%AE%E6%9C%9F%E9%99%90%E3%81%AF%E3%81%A9%E3%81%AE%E3%81%8F%E3%82%89%E3%81%84%E3%81%A7%E3%81%99,%E6%9C%9F%E9%99%90%E3%81%AF%2090%20%E6%97%A5%E9%96%93%E3%81%A7%E3%81%99%E3%80%82)


## 余談: 無料ドメインの取得

使用期限が 1 年未満となるが、無料ドメインの選択肢が存在する。

- 参考 URL
    - [Freenom](https://my.freenom.com/clientarea.php)
    - [freenomで無料ドメインを取得する｜ふじい｜note](https://note.com/dafujii/n/n406f385651e2)
    - [よくある質問 \- KAGOYA Internet Routing サポートサイト \- DNS設定が反映したか確認したい](https://support.kagoya.jp/kir/faq/index.php?action=artikel&cat=22&id=377&artlang=ja)

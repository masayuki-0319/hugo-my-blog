---
title: Udmey:【業務自動化をゼロからマスター】Google Apps Scriptの仕事効率化・自動化をプログラミングで実現
date: 2020-12-26
description: Udemy で GoogleAppsScript に触れてみた。
draft: false
hideToc: false
enableToc: true
enableTocContent: false
tocFolding: false
tocPosition: inner
tocLevels: ["h2", "h3", "h4"]
tags:
- study
- memo
- udemy
categories:
- google_apps_script
---

## 概要

下記 Udemy のコースを元に学習した。

javascript に知見がある場合、言語仕様を飛ばしつつ、短時間で GAS の仕組みを概観できる。

プログラミング未経験者でも、言語の書き方から丁寧に説明されているため、不安なく受講できるかと考える。

GSuite 導入企業の事務担当者に受講させると、とても効果的かも。

- 参考 URL
  - [【業務自動化をゼロからマスター】Google Apps Scriptの仕事効率化・自動化をプログラミングで実現 \| Udemy](https://www.udemy.com/course/gasmore1/)
  - [Apps Script  \|  Google Developers](https://developers.google.com/apps-script)
  - [Google Apps Script でよく使うスニペット集 30 選 \- Qiita](https://qiita.com/tanabee/items/5de3e8715be759ce1c7f)

## Google Apps Script を使用した業務の自動化

### Google Form 送信時における自動メール通知

1. Google Drive から、Google Form を生成
2. 適当に入力フォームを追加
3. `回答`タブから、`回答をスプレッドシートに表示` を押下
4. `ツール`タブから、`スクリプトエディタ`を起動
5. ヘッダー中段の時計アイコンである`現在のプロジェクトのトリガー`を押下
6. FloatingActionButton を押下し、トリガーを生成
7. エディタで、`フォーム送信時`に発火するトリガーを元に起動する function を定義
8. フォームで、右上のプレビュー機能を使用して、フォームを送信
9. 入力したメールアドレスに以下の文面が届いたら成功

```js
// https://developers.google.com/apps-script/reference/gmail
function autoReply(event) {
  const [timeStamp, companyName, name, email] = event.values;
  const subject = `『${name}様』 お問い合わせありがとうございます`;
  const body = `
  お名前 ${name} 様

  お問い合わせありがとうございます
  以下の内容で、お問い合わせを承りました。

  会社名: ${companyName}
  お名前： ${name}
  メールアドレス: ${email}
  `;

  GmailApp.sendEmail(email, subject, body);
}
```

### Google Form 送信時における Slack 自動通知

1. 自分用の workspace を用意
2. 通知したい channel を用意
3. `Setting and Adnimistration`から、`Manage App` を押下して、Webページへ
4. `Incoming Webhook` を探し、対象の workspace に導入すると、設定画面に移動
5. Webhook 用の URL をコピーしておき、下部で設定を保存する
6. 以下の通りコードを用意


```js
// https://developers.google.com/apps-script/reference/gmail

function autoReply(event) {
  const [timeStamp, companyName, name, email] = event.values;
  const subject = `『${name}様』 お問い合わせありがとうございます`;
  const body = `
  お名前 ${name} 様

  お問い合わせありがとうございます
  以下の内容で、お問い合わせを承りました。

  会社名: ${companyName}
  お名前： ${name}
  メールアドレス: ${email}
  `;
  const slackMessage = `
  お名前 ${name} 様

  以下の内容で、お問い合わせを承りました。

  会社名: ${companyName}
  お名前： ${name}
  メールアドレス: ${email}
  `;

  GmailApp.sendEmail(email, subject, body);
  notifySlack(slackMessage);
}

function notifySlack(message) {
  const WEBHOOK_URL = `${slack の web ページでコピーした URL}`;
  const userName = "gasBot";

  const payloadObj = {
    username: userName,
    text: message
  };
  const payloadJson = JSON.stringify(payloadObj);
  const options = {
    method: "post",
    contentType: "application/json",
    payload: payloadJson,
  };

  UrlFetchApp.fetch(WEBHOOK_URL, options);
}
```


### 顧客リストを元に一斉メール送信

```js
//https://developers.google.com/apps-script/reference/gmail/gmail-app#sendEmail(String,String,String,Object)

function sendAll() {
  const ss = SpreadsheetApp.getActiveSheet();
  const range = ss.getDataRange().getValues();

  const file = DriveApp.getFilesByName("Google Driveのマイドライブに存在するファイル名").next();

  for(var i = 1; i < range.length; i++){
    var title = `【${range[i][2]} 様】新商品のお知らせです`;
    var body = `
    ${range[i][1]}
    ${range[i][2]} 様

    新商品のお知らせです。
    `;
    var email = range[i][3];
    var cc = range[i][4];
    var options = {
      attachments: [file],
      cc: cc
    };

    GmailApp.sendEmail(email, title, body, options);
  }
}
```

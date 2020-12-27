---
title: Hugo の初期設定
date: 2020-12-26
description: "Hugoインストールから、最低限の見た目を整えるところまで"
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
categories:
- hugo
---

## Hugo インストール

- [Install Hugo \| Hugo](https://gohugo.io/getting-started/installing/)

## 使いたいテーマを選択

Wordpress のテーマ選択と同じ趣旨。

気に入ったテーマを探す。

[Complete List \| Hugo Themes](https://themes.gohugo.io/)


## 選択テーマの指示通りにプロジェクトを生成

以下のテーマを選択した。

[Hugo Clarity \| Hugo Themes](https://themes.gohugo.io/hugo-clarity/)

- ※ clarity 使用事例
    - [Funky Cloud Medina](https://www.funkycloudmedina.com/)
    - [Neon Mirrors](https://neonmirrors.net/)
    - [Clarity Themeへ切り替え \| らいふろぐ](https://lifelog.gozapon.net/post/clarity/)

## GitHub Pages により公開

- [Host on GitHub \| Hugo](https://gohugo.io/hosting-and-deployment/hosting-on-github/)

## ロゴ設定

### 新規作成

温泉マークでは味気ないため、自分用のロゴと置換する。

Shopify なら、適当な属性を選択すると、自動でサジェストしてくれるので、とても楽。

- 参考 URL
    - [ロゴメーカー＆ロゴクリエーター \- 無料のオンラインロゴジェネレーター](https://hatchful.shopify.com/ja/)
    - [ロゴメーカー \| 【商用利用OK】無料で誰でも簡単に自分のショップのロゴが作れる](https://logo-maker.stores.jp/)


### 調整

Clarity の仕様上、上記で作成したロゴを使用すると、ヘッダーが画像の height 分伸びる問題が存在する。

そのため、Mac なら画像開いた時のマークアップなどで、高さ等を調整する。

### ディレクトリ設定

favicon と footer のロゴは、`./static/icons/` に次の命名規則で配置すると、設定完了である。
Clarity のデフォルト設定を上書きするイメージ。

header のロゴは、`./static/icons/` に配置するが、config.toml の設定が必要のため、後述する。

```bash
$ tree static
static
├── icons
│   ├── apple-touch-icon.png
│   └── favicon-32x32.png
...
└── logos
    ...
    ├── logo_transparent_snip.png
    ...
```

### config.toml に設定

既存のロゴと差し替える。

```diff
[params]
- logo = "logos/logo.png"
+ logo = "logos/logo_transparent_snip.png"
```

## サイト管理者の情報を設定

`config.toml` で設定可能である。

以下の key を自分用に設定すると、ある程度の見た目が整う。

```toml:config.toml
copyright = ""
title = ""
author = ""

[params]
author = ""
twitter = ""
introDescription = ""
```

`config/_default/languages.toml` の title にも、自分のサイト名を記述する。

```
[en]
  title = "${Your Site Title}"
  LanguageName = "English"
  weight = 1
```

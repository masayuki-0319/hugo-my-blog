---
title: Hugoで記事作成の環境を整える
date: 2020-12-26
description: "Hugo では、記事作成時のフォーマットが存在するため、その設定を行う。"
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

## 概要

Hugo は、以下のコマンドで記事のテンプレートを記事ディレクトリに生成する。

テンプレートファイルは、`./archetypes/post.md` に存在するため、好みのテンプレートを作成する。

```bash
$ hugo new post/${記事名}.md
```

- 参考 URL
    - [Archetypes \| Hugo](https://gohugo.io/content-management/archetypes/)
    - [Hugoで新規記事を作成するときのTips的なメモ \- Qiita](https://qiita.com/n0bisuke/items/4701481c3bca4df81b0b)

## テンプレート設定

Clarity では、次の設定さえあれば充足する。

```md
+++
author = "${自分の名前}"
date = "YYYY-mm-dd"
title = "Use meta title"
description = "Use meta description"
Summary = "Use index page by article summary"
featured = false
tags = [
    "",
]
categories = [
    "",
]
+++

## 概要

## 〜〜
```

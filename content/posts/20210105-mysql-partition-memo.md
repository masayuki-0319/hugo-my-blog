---
title: "ERROR: Table has no partition for value from ..."
date: 2021-01-05T15:49:48+09:00
description: レンジパーティションのエラー
draft: false
hideToc: false
enableToc: true
enableTocContent: false
tocFolding: false
tocPosition: inner
tocLevels: ["h2", "h3", "h4"]
tags:
- mysql
categories:
- error
---

テーブルにレンジパーティションを貼る時、終端まで定義しないと、最後のレンジを超えた時に insert できなくてエラー発生する。

そのため、「キャッチオール」を定義して、パーティションの終端を用意すること。

```sql
PARTITION pmax VALUES LESS THAN MAXVALUE
```

- 参考URL
    - [mysql \- ERROR 1526 \(HY000\): Table has no partition for value 1426566990 \- Stack Overflow](https://stackoverflow.com/questions/29694539/error-1526-hy000-table-has-no-partition-for-value-1426566990/29695312)
    - [MySQLのパーティショニング \- 祈れ、そして働け ～ Ora et labora](https://tetsuyai.hatenablog.com/entry/20110308/1299569576)
    - [MySQL : 第15章 パーティショニング \- LANDHERE](https://landhere.jp/docs/manual/mysql/partitioning.html#partitioning-range)
    - [MySQL :: MySQL 5\.6 リファレンスマニュアル :: 19\.2\.1 RANGE パーティショニング](https://dev.mysql.com/doc/refman/5.6/ja/partitioning-range.html)
    - [pdf | 実践！パーティションの基本から実装例まで](https://www.oracle.com/technetwork/jp/ondemand/database/db-technique/d-12-disk-1484778-ja.pdf)

---
title: DX の導入学習
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
- dx
---

## 概要

- 参考 URL
  - [DXレポート ～ITシステム「2025年の崖」克服とDXの本格的な展開～（METI/経済産業省）](https://www.meti.go.jp/shingikai/mono_info_service/digital_transformation/20180907_report.html)

## DX の考え方

データとデジタル技術を活用して、既存の製品及びサービスを変革すること。

- まだ、デジタル化されていない、又は最近デジタル化された情報は何か？
  - 既にデータ化されている場合は、やり尽くされているかも
- その情報をデータ化すると、どんなことが起きるか？
  - ユーザに何を提供できるか
  - 自社にどんな価値が生まれるか

## DX が目指す Society5.0

経済発展と、社会課題の解決を図る。

- 参考 URL
  - [デジタル経営改革のための評価指標（「DX推進指標」）を取りまとめました （METI/経済産業省）](https://www.meti.go.jp/press/2019/07/20190731003/20190731003.html)
  - [Society 5\.0 \- 科学技術政策 \- 内閣府](https://www8.cao.go.jp/cstp/society5_0/)
  - [DX Criteriaとは \- DX Criteria v201912\- 「２つのDX」とデジタル経営のガイドライン](https://cto-a.github.io/dxcriteria/about.html)

## DX を支える技術

- 4つの DX をもって DX が初めて推進される
  - IT 基盤の DX
  - 業務オペレーションの DX
  - 顧客視点の DX
  - 人材・文化の DX


### IT 基盤の DX

- クラウド技術
  - gradescope knewton volley atama+ qubena
- カンのデジタル化
  - 人の経験により判断が行われていることは何か
  - それを ML でデジタル化するため、どのようなインプットデータが必要か
  - 必要なインプットデータのうち、まだデジタル化されていない情報は何か
  - データを収集するため、どのような仕組みが必要か
- BI 導入の可能性
  - 定常的に出力しているレポートはあるか
  - レポートがリアルタイム参照可能になると、どのようなメリットがあるか


### 業務オペレーションの DX

- iPaaS
  - システム間における統合フローの開発、実行、管理
  - レガシーシステム、新システムの統合を目指す
- RPA
  - システム操作の自動化
  - レガシーシステムでも対応可能へ

### 顧客視点の DX

- オムニチャネル
  - 顧客の行動履歴を蓄積
  - 店舗及び Web ページにおける蓄積データの統合
- Data Management Platform 間の連携
  - データの収集、統合、管理に強み
  - プライベート DMB ( 自社 Web サイト、自社店舗、CRM )
  - パブリック DMP ( 連携会社 )
- Marketing Automation
  - チャネルの自動操作する強み
  - 「クライアント」と「サーバ」の間に入り、パーソナライズされた情報を出し分け
  - クライアントをセグメントに分割して、出し分け

- 参考 URL
  - [ユーザー分析DMP Juicer｜ユーザー分析やA/Bテスト、NPSが無料で](https://juicer.cc/)

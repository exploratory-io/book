---
title: "Exploratory MCP: Server"
sidebarTitle: "Server"
---

AI ツールから、exploratory.io に公開されたノート、ダッシュボード、チャート、アナリティクス、データを読み取ります。AI ツールとは、Claude Code のように、AI に作業を依頼するアプリケーションです。MCP（Model Context Protocol）は、AI ツールが外部のサービスに接続して、その機能を使用するための共通の規格です。

<a id="readonly"></a>

## 主に読み取りです

> **主に読み取り**
>
> この MCP サーバーは、公開済みの内容のうち、あなたが閲覧できるものを読みます。書き込むのはページ（HTML ページ）だけです。自分のアカウントに非公開のページを作り、自分またはチームのページを更新・削除できます。ページを作れるか、何件まで作れるかは、プランによります。ノート、ダッシュボード、チャート、アナリティクス、データの作成・編集・公開・削除はできません。dataframe_export は、ダウンロードリンク（既定で 15 分間有効）を作ります。

<a id="cannot"></a>

## できないこと

- 自分またはチームのページ以外のコンテンツの作成、編集、公開、削除
- 公開されたときと違うパラメータの値での、チャートやアナリティクスの再計算
- Exploratory Server に公開されていないものの読み取り。Exploratory Desktop の中だけにあるプロジェクトなどです。これらには、別の [Desktop の MCP](/ja/mcp/desktop) を使います。

<a id="url"></a>

## サーバー URL

どの AI ツールでも、つなぐ先は同じです。

```text
https://exploratory.io/mcp
```

つなぐときは、Exploratory にサインインして、アクセスを許可します。ブラウザを開けないときは、API キーで接続します（[認証と API キー](/ja/mcp/server/auth)を参照）。

<a id="scope"></a>

## 読み進めるには

- [はじめる](/ja/mcp/server/get-started) - AI ツールにつないで、最初の依頼まで進めます。AI ツールごとの追加手順は、[AI ツールから追加する](/ja/mcp/server/clients/apps)にあります。
- [使い方](/ja/mcp/server/use) - AI に頼めることの例です。
- [リファレンス](/ja/mcp/server/reference) - 使える道具、制限とエラー、データと権限を調べます。
- [トラブルシューティング](/ja/mcp/server/troubleshooting) - 症状から対処を探します。

あなたのコンピューターの Exploratory Desktop でプロジェクトを作り、編集するときは、[Desktop の MCP](/ja/mcp/desktop) を使います。ターミナルやスクリプトから使うときは、[Exploratory CLI](/ja/cli/server) を参照してください。

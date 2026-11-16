# Exploratory MCP: Server

AI ツールから、exploratory.io に公開されたノート、ダッシュボード、チャート、アナリティクス、データを読み取ります。AI ツールとは、Claude Code のように、AI に作業を依頼するアプリケーションです。MCP（Model Context Protocol）は、AI ツールが外部のサービスに接続して、その機能を使用するための共通の規格です。

<a id="readonly"></a>

## 読み取り専用です

> **読み取り専用**
>
> この MCP サーバーは、コンテンツの作成・編集・公開・削除ができません。ただし dataframe_export は、15 分間有効なダウンロードリンクを作ります。

公開済みの内容のうち、あなたが閲覧できるものを読みます。

<a id="cannot"></a>

## できないこと

- コンテンツの作成、編集、公開、削除
- 公開されたときと違うパラメータの値での、チャートやアナリティクスの再計算
- Exploratory Server に公開されていないものの読み取り。Exploratory Desktop の中だけにあるプロジェクトなどです。これらには、別の [Desktop の MCP](../desktop/desktop_ja.md) を使います。

<a id="url"></a>

## サーバー URL

どの AI ツールでも、つなぐ先は同じです。

```text
https://exploratory.io/mcp
```

つなぐときは、Exploratory にサインインして、アクセスを許可します。ブラウザを開けないときは、API キーで接続します（[認証と API キー](auth_ja.md)を参照）。

<a id="scope"></a>

## 読み進めるには

- [はじめる](get-started_ja.md) - AI ツールにつないで、最初の 1 回まで進めます。AI ツールごとの追加手順は、[AI ツールから追加する](clients/apps_ja.md)にあります。
- [使い方](use_ja.md) - AI に頼めることの例です。
- [リファレンス](reference_ja.md) - 使える道具、制限とエラー、データと権限を調べます。
- [トラブルシューティング](troubleshooting_ja.md) - 症状から対処を探します。

あなたのコンピューターの Exploratory Desktop でプロジェクトを作り、編集するときは、[Desktop の MCP](../desktop/desktop_ja.md) を使います。ターミナルやスクリプトから使うときは、[Exploratory CLI](../../cli/server/server_ja.md) を参照してください。

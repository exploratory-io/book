---
title: "Exploratory MCP: Desktop"
sidebarTitle: "Desktop"
---

AI ツールから、あなたのコンピューターの Exploratory Desktop で、プロジェクトを作り、編集します。手元のプロジェクトが対象で、公開していない変更も扱えます。AI ツールとは、Claude Code のように、AI に作業を依頼するアプリケーションです。

<a id="scope"></a>

## できること

扱えるものは次のとおりです。

- データフレーム、加工のステップ、ブランチ、パラメーター、接続
- チャートとアナリティクス
- ノートとダッシュボード

> **変更や削除もできます**
>
> 削除、ノート・ダッシュボード・データフレーム・プロジェクトの公開、ノート・ダッシュボード・プロジェクトの公開の取り消し、R コードの実行を行う道具があります。AI が書き込む前に、提案を確認してください。

お使いのコンピューターのアプリを通して、アプリにサインインしている人として動きます。exploratory.io に公開した内容を読む Server の MCP とは、別のものです。

<a id="need"></a>

## 必要なもの

- Exploratory Desktop v17 以降。サインインして、起動しておきます
- PATH にある exploratory-mcp コマンド。プラグインが、このコマンドを起動します。Desktop の起動時に、自動で使える場所（PATH）に入ります。操作は要りません
- macOS では、ディスクイメージから開いたままだとコマンドが自動で入りません。Desktop を /Applications か \~/Applications に移して起動します
- Claude Code で使う場合は、PATH にある node。プラグインのレビューのフックが使います
- AI ツール: Claude Code、Codex、Cursor、Antigravity

<a id="more"></a>

## 読み進めるには

- [はじめる](/ja/mcp/desktop/get-started) - プラグインを入れ、MCP をオンにして、最初の依頼まで進めます。手順は、[プラグインのインストール](/ja/mcp/desktop/install)と[許可の範囲と設定](/ja/mcp/desktop/permissions)にもあります。
- [使い方](/ja/mcp/desktop/use) - AI に頼めることの例です。
- [リファレンス](/ja/mcp/desktop/reference) - 使える道具、制限とエラー、データと権限を調べます。
- [トラブルシューティング](/ja/mcp/desktop/troubleshooting) - 表示されたメッセージから対処を探します。

exploratory.io に公開された内容を読むときは、[Server の MCP](/ja/mcp/server) を使います。

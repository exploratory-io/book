# 概要と必要なもの

AI クライアントから、あなたのコンピューターの Exploratory Desktop で、プロジェクトを作り、編集します。

<a id="scope"></a>

## できること

Exploratory Desktop の MCP を使うと、AI クライアントが、あなたのコンピューターの Exploratory Desktop で、プロジェクトを作ったり編集したりできます。扱えるものは次のとおりです。

- データフレーム、加工のステップ、ブランチ、パラメーター、接続
- チャートとアナリティクス
- ノートとダッシュボード

> **変更や削除もできます**
>
> 削除、ノート・ダッシュボード・データフレームの公開と公開の取り消し、R コードの実行を行うツールがあります。AI が書き込む前に、提案を確認してください。

お使いのコンピューターのアプリを通して、アプリにサインインしている人として動きます。exploratory.io に公開した内容を読む Server の MCP とは、別のものです。

<a id="need"></a>

## 必要なもの

- Exploratory Desktop v17 以降。サインインして、起動しておきます
- PATH にある exploratory-mcp コマンド。プラグインが、このコマンドを起動します。Desktop の起動時に、自動で使える場所（PATH）に入ります。操作は要りません
- macOS では、ディスクイメージから開いたままだとコマンドが自動で入りません。Desktop を /Applications か ~/Applications に移して起動します
- Claude Code で使う場合は、PATH に node。プラグインのレビューのフックが使います
- AI クライアント: Claude Code、Codex、Cursor、Antigravity

<a id="more"></a>

## あわせて読む

- [プラグインのインストール](install_ja.md) - システム設定から、AI ツールにプラグインを入れます。
- [許可の範囲と設定](limits_ja.md) - Desktop で決める設定と、送られる情報です。
- [使い方](examples_ja.md) - AI に頼めることの例です。
- [使える道具](tools_ja.md) - 目的から、AI にできることを確認します。
- [トラブルシューティング](troubleshooting_ja.md) - 表示されたメッセージから対処を探します。
- [Server の MCP](../server/server_ja.md) - exploratory.io に公開されたコンテンツを読みます。

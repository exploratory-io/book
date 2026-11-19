---
title: "はじめる"
---

Exploratory Server を AI ツールにつなぎ、サインインして、AI に公開されたノートを読ませます。手順は 3 つです。手順 1 と 2 は、使う AI ツールのページで進めます。サインインまで済んだら、このページに戻って手順 3 に進んでください。

<a id="steps"></a>

## 手順

### 1. AI ツールに接続先を追加する

どの AI ツールも、同じ接続先につなぎます。

```text
https://exploratory.io/mcp
```

使っている AI ツールのページを開いて、手順に従ってください。[Claude アプリ](/ja/mcp/server/clients/claude)、[ChatGPT アプリ](/ja/mcp/server/clients/chatgpt)、[Antigravity](/ja/mcp/server/clients/antigravity)、[Grok Bot](/ja/mcp/server/clients/grok-bot)、[Claude Code](/ja/mcp/server/clients/claude-code)、[Codex](/ja/mcp/server/clients/codex)、[Cursor](/ja/mcp/server/clients/cursor)、[そのほかのアプリ](/ja/mcp/server/clients/other)があります。[AI ツールから追加する](/ja/mcp/server/clients/apps)にも、一覧があります。

### 2. サインインする

最初につなぐときに、ブラウザが開きます。Exploratory にサインインして、アクセスを許可します。サインインのコマンドや Authenticate のボタンが必要な AI ツールもあります。その場合は、AI ツールのページの手順に従ってください。

サーバーや定期ジョブなど、ブラウザを開けない環境では、代わりに API キーでつなぎます。[認証と API キー](/ja/mcp/server/auth#apikey)を参照してください。

### 3. AI に公開されたノートを読ませる

AI ツールで、次のように頼みます。ノートの名前は、自分が見られるものに置き換えてください。

```text
Exploratory の「Sales Orders Report」のノートを読んで、要点を教えて
```

AI は、search でノートを探し、fetch で読んで、内容をもとに答えます。ノートが見つからないときは、正確な名前を伝えるか、先にデータを探すよう頼みます。たとえば「Exploratory にある「Sales Orders」のデータを探して」です。

接続できたかだけを確かめるときは、次のように頼みます。

```text
接続した Exploratory Server で、閲覧できるコンテンツを最大 3 件、URL 付きで一覧して。見つからなければ、その旨を教えて。
```

コンテンツが URL 付きで表示されていれば、接続できています。結果が 0 件でも、認証や接続に失敗したとは限りません。エラーが表示されたときは、[制限とエラー](/ja/mcp/server/limits)で、そのメッセージの対処を確認してください。

<a id="trouble"></a>

## うまくいかないとき

- もう一度サインインを求められる、または API キーが拒否される: [サインインを求められる](/ja/mcp/server/troubleshooting#signin)と[API キーが拒否される](/ja/mcp/server/troubleshooting#apikey)を参照してください。
- AI が自分のコンテンツを見つけられない: [トラブルシューティング](/ja/mcp/server/troubleshooting#zero)の「自分のコンテンツが出ない」を参照してください。
- 呼び出しがエラーや上限で止まる: [制限とエラー](/ja/mcp/server/limits)を参照してください。

<a id="next"></a>

## 次に読むもの

- [使い方](/ja/mcp/server/use) - そのまま使える依頼文と、AI が使う道具です。
- [データと権限](/ja/mcp/server/data) - 誰の権限で動くか、Exploratory が何を記録するかです。

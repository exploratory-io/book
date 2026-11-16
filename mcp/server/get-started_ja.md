# はじめる

Exploratory Server を AI ツールにつなぎ、サインインして、AI に公開されたノートを読ませます。手順は 3 つで、このページ 1 つで進められます。

<a id="steps"></a>

## 手順

### 1. AI ツールに接続先を追加する

どの AI ツールも、同じ接続先につなぎます。

```text
https://exploratory.io/mcp
```

使っているツールのページを開いて、手順に従ってください。[Claude アプリ](clients/claude_ja.md)、[ChatGPT アプリ](clients/chatgpt_ja.md)、[Antigravity](clients/antigravity_ja.md)、[Grok Bot](clients/grok-bot_ja.md)、[Claude Code](clients/claude-code_ja.md)、[Codex](clients/codex_ja.md)、[Cursor](clients/cursor_ja.md)、[そのほかのアプリ](clients/other_ja.md)があります。[AI ツールから追加する](clients/apps_ja.md)にも、一覧があります。

### 2. サインインする

最初につなぐときに、ブラウザが開きます。Exploratory にサインインして、アクセスを許可します。

サーバーや定期ジョブなど、ブラウザを開けない環境では、代わりに API キーでつなぎます。[認証と API キー](auth_ja.md#apikey)を参照してください。

### 3. AI に公開されたノートを読ませる

AI ツールで、次のように頼みます。ノートの名前は、自分が見られるものに置き換えてください。

```text
Exploratory の「Sales Orders Report」のノートを読んで、要点を教えて
```

AI は、search でノートを探し、fetch で読んで、内容をもとに答えます。ノートが見つからないときは、正確な名前を伝えるか、先にデータを探すよう頼みます。たとえば「Exploratory にある「Sales Orders」のデータを探して」です。

<a id="trouble"></a>

## うまくいかないとき

- もう一度サインインを求められる、または API キーが拒否される: [トラブルシューティング](troubleshooting_ja.md)を参照してください。
- AI が自分のコンテンツを見つけられない: [トラブルシューティング](troubleshooting_ja.md)の「自分のコンテンツが出ない」を参照してください。
- 呼び出しがエラーや上限で止まる: [制限とエラー](limits_ja.md)を参照してください。

<a id="next"></a>

## 次に読むもの

- [使い方](examples_ja.md) - そのまま使える依頼文と、AI が使う道具です。
- [データと権限](data_ja.md) - 誰の権限で動くか、Exploratory が何を記録するかです。

# expl server desktop mcp-setup-guide

Exploratory Desktop に AI クライアントをつなぐための、手順とリンクを返します。

<a id="examples"></a>

## 例

### 手順を取得する

**ターミナル**

```sh
expl server desktop mcp-setup-guide --json
```

長い出力は省略しています。結果には、使うための条件、クライアントごとのインストールのコマンド、Grok Bot の手順が含まれます。ここでは先頭のクライアントだけを載せています。

**実行結果**

```text
{
  "summary": "Install the Exploratory Desktop plugin (exploratory@exploratory) from our GitHub marketplace (exploratory-io/exploratory). It registers exploratory-desktop for local projects on the user's computer. Exploratory Desktop v17 or later must be running for every De…",
  "links": {
    "plugin": "https://github.com/exploratory-io/exploratory",
    "install": "https://github.com/exploratory-io/exploratory#install"
  },
  "install": [
    {
      "client": "Claude Code",
      "installs": "The exploratory-desktop MCP server, Desktop skills and Claude-only hooks from our GitHub marketplace.",
      "commands": [
        "claude plugin marketplace add exploratory-io/exploratory",
        "claude plugin install exploratory@exploratory"
      ],
      "after": "Start a new session and check exploratory-desktop in /mcp. Server sign-in is not needed for Desktop."
    }
  ]
}
```

<a id="usage"></a>

## 書式

```text
expl server desktop mcp-setup-guide [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="flags"></a>

## 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--client` | 文字列 |  | 使っている MCP クライアントです。省くと、すべてのクライアントの手順が返ります。 値: `claude_code`, `codex`, `cursor`, `antigravity` |

<a id="paging"></a>

## 続きを取得する

ページ送りはありません。

<a id="output"></a>

## 出力

手順とリンクを返すだけです。何もインストールも実行もしません。Desktop も操作しません。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| Run "expl server login". | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

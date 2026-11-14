# expl server desktop mcp-setup-guide

Exploratory Desktop に AI クライアントをつなぐための、手順とリンクを返します。

<a id="examples"></a>

## 例

### 手順を取得する

**ターミナル**

```sh
expl server desktop mcp-setup-guide --json
```

> TODO: S6: 出典と実際の結果を確認して、公開前にこの説明を完成させてください。

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

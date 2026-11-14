# expl server dataframe preview

データの行を、offset と limit でページに分けて取得します。

<a id="examples"></a>

## 例

### 先頭の 3 行を表示する

**ターミナル**

```sh
expl server dataframe preview <id> --limit 3 --json
```

\<id\> は、データの id に置き換えます。

> TODO: S6: 出典と実際の結果を確認して、公開前にこの説明を完成させてください。

### 101〜200行目を取得する

**ターミナル**

```sh
expl server dataframe preview <id> --offset 100 --limit 100 --json
```

> TODO: S6: 出典と実際の結果を確認して、公開前にこの説明を完成させてください。

<a id="usage"></a>

## 書式

```text
expl server dataframe preview <id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="flags"></a>

## 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 | 必須 | データの id です。検索結果などに出ます。コマンドのすぐあとに書くか、--id で渡します。 |
| `--offset` | 整数 |  | 読み飛ばす行数です。0 から数えます。 |
| `--limit` | 整数 |  | 返す行数です。100 までです。 |

<a id="paging"></a>

## 続きを取得する

offset に、すでに読んだ行数を渡すと、続きを読めます。1 回に取得できるのは 100 行までです。

<a id="output"></a>

## 出力

公開した人がすべてのデータを含めて公開したときは、すべての行を読めます。そうでないときは、公開したときに保存したサンプルの行です。is_sample と row_count で確かめます。合計や絞り込みが目的なら、すべてのページを読まずに dataset query を使います。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| DATA_EGRESS_LIMIT | 公開した人が、このデータの行を共有していません。チャート、アナリティクス、要約を使います。 |
| Run "expl server login". | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

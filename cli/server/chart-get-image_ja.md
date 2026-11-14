# expl server chart get-image

チャートの画像（PNG）を取得します。形、傾向、配置を確認するための機能です。

<a id="examples"></a>

## 例

### チャートの画像を取得する

**ターミナル**

```sh
expl server chart get-image <id> --chart <chart> --json
```

\<id\> はノートなどの id、\<chart\> は fetch の結果にあるチャートの名前に置き換えます。

> TODO: S6: 出典と実際の結果を確認して、公開前にこの説明を完成させてください。

<a id="usage"></a>

## 書式

```text
expl server chart get-image <id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="flags"></a>

## 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 | 必須 | チャートを含むノート、ダッシュボード、スライドの id です。チャート単体で公開したものは、その id です。コマンドのすぐあとに書くか、--id で渡します。 |
| `--chart` | 文字列 |  | ノート、ダッシュボード、スライドの中のチャートの名前です。fetch の結果の metadata.charts\[\].name にあります。 |

<a id="paging"></a>

## 続きを取得する

ページ送りはありません。

<a id="output"></a>

## 出力

画像は、公開したときに保存されたもので、描き直されません。そのため、データより古いことがあります。結果の result.image.may_be_stale で確かめます。画像は、expl を動かしているコンピューターの一時フォルダなどに保存され、結果の image_path がその場所を示します。保存先は --output で指定できます。正確な数値は、画像ではなく chart get-data で読みます。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| may_be_stale の警告が出る | 画像が、データの更新より古い可能性があります。最新の数値は chart get-data で確認します。警告は標準エラーに出ます。 |
| Run "expl server login". | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

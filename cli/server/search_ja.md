# expl server search

閲覧できるコンテンツを、タイトル、説明、タグで探します。検索語がなければ、新しい順に一覧します。

<a id="examples"></a>

## 例

### 言葉で探す

**ターミナル**

```sh
expl server search "sales"
```

> TODO: S6: 出典と実際の結果を確認して、公開前にこの説明を完成させてください。

### 自分のコンテンツを一覧する

**ターミナル**

```sh
expl server search "" --scope mine --limit 50 --json
```

自分のコンテンツを、新しい順に最大 50 件出します。

> TODO: S6: 出典と実際の結果を確認して、公開前にこの説明を完成させてください。

<a id="usage"></a>

## 書式

```text
expl server search [<query>] [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="flags"></a>

## 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--query` | 文字列 |  | 検索語です。コマンドのすぐあとに書くか、--query で渡します。タイトル、説明、タグに一致します。空（または \*）にすると、条件に合うものを新しい順に一覧します。続きがある場合は、ページを分けて取得します。 |
| `--type` | 文字列 |  | 探すコンテンツの種類です。 値: `all`, `note`, `dashboard`, `slide`, `chart`, `analytics`, `data` |
| `--scope` | 文字列 |  | all: 閲覧できるものすべて。mine: 自分のもの。shared: 自分に共有されたもの。team: 1 つのチームのもの。 値: `all`, `mine`, `shared`, `team` |
| `--team` | 文字列 | --scope team のときは必須 | チームの名前です。 |
| `--semantic` | 有効 / 無効 |  | キーワードの一致ではなく、意味が近いものを探します。 |
| `--limit` | 整数 |  | 返す件数の上限です。50 までです。 |
| `--offset` | 整数 |  | 読み飛ばす件数です。続きを取得するときに使います。 |

<a id="paging"></a>

## 続きを取得する

結果の has_more が true のときは、next_offset の値を --offset に渡すと、次のページを取得できます。

<a id="output"></a>

## 出力

結果には、コンテンツの id と URL が入ります。id は、fetch などほかのコマンドに渡します。データのコンテンツには、列の名前と型、行数も入ります。既定では人が読みやすい形で、--json を付けると JSON になります。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| Too big: expected number to be \<=50 at limit | --limit を 50 以下にします。 |
| Run "expl server login". | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

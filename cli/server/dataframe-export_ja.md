# expl server dataframe export

データへの問い合わせの結果を、CSV か Parquet のファイルにして、ダウンロードリンクを返します。

<a id="examples"></a>

## 例

### 行をファイルにする

**ターミナル**

```sh
expl server dataframe export <dataset_id> --mode rows --limit 5 --json
```

\<dataset_id\> は、データの id に置き換えます。公開した人がファイルとしての取得を許していないデータでは、DATA_EGRESS_LIMIT で失敗します。

実行結果は、データ Sales Orders（id が llS6nQK3aH）で実行したものです。download_url はファイルへのリンクです（ここでは省略しています）。expires_at の時刻に無効になります。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "llS6nQK3aH",
    "type": "data",
    "title": "Sales Orders"
  },
  "summary": "Saved 5 rows (0.0 MB, CSV). The link expires at 2026-11-15T06:59:47.779Z.",
  "result": {
    "format": "csv",
    "rows": 5,
    "bytes": 687,
    "source": "full",
    "dataset_version": "20261112T092646Z-72836d02",
    "data_as_of": "2026-11-12T08:12:13.528Z",
    "expires_at": "2026-11-15T06:59:47.779Z",
    "download_url": "https://exploratory.io/mcp/exports/…",
    "query": {
      "mode": "rows",
      "limit": 5
    }
  },
  "warnings": [],
  "url": "https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH"
}
```

<a id="usage"></a>

## 書式

```text
expl server dataframe export <dataset_id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="flags"></a>

## 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--dataset-id` | 文字列 | 必須 | データの id です。検索結果などに出ます。コマンドのすぐあとに書くか、--dataset-id で渡します。 |
| `--format` | 文字列 |  | ファイルの形式です。既定は csv です（UTF-8 の BOM つきで、Excel で正しく開けます）。 値: `csv`, `parquet` |
| `--mode` | 文字列 | 必須 | rows: 条件に合う行を書き出します。aggregate: dimensions でグループに分けて、metrics を計算した結果を書き出します。 値: `rows`, `aggregate` |
| `--columns` | 値の配列 |  | rows だけで使います。書き出す列の名前を、1〜50 個、重ならないように指定します。省くと、すべての列を書き出します。 |
| `--filters` | JSON |  | 絞り込みの条件です。条件 1 つか、{ "and": \[...\] } か { "or": \[...\] }（各 2 つ以上）で書きます。入れ子は 3 段まで、条件は全体で 20 個までです。 |
| `--dimensions` | JSON |  | aggregate だけで使います。グループに分ける列を、0〜5 個指定します。 |
| `--metrics` | JSON | aggregate のときは必須 | aggregate だけで使い、必須です。計算を 1〜10 個指定します。 |
| `--sort` | JSON |  | 並べ替えです。3 つまで指定します。 |
| `--limit` | 整数 |  | 書き出す行数の上限です。 |

<a id="json-arguments"></a>

## JSON の引数

filters、metrics、sort の JSON の形は dataset query の説明を参照してください。

- [JSON の書き方](dataset-query_ja.md#json-arguments) - 入力のキーと置き換える値を確認します。

<a id="paging"></a>

## 続きを取得する

ページ送りはありません。結果が大きすぎて dataset query で読めないときに、このコマンドを使います。

<a id="output"></a>

## 出力

15 分で切れるダウンロードリンクが返ります。リンクを使えるのは、同じサインインした本人だけです。ファイルの保存先は --output で指定できます。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| DATA_EGRESS_LIMIT | 公開した人が、このデータをファイルとしてダウンロードすることを許していません。fetch か dataframe get-schema で、公開した人が共有している内容を読みます。URL をブラウザで開く方法もあります。 |
| SERVER_BUSY | ほかの書き出しが実行中か、1 時間あたりの書き出しの上限に達しています。1 人のユーザーが同時に実行できる書き出しは 1 つです。数秒おいてから再度実行し、上限に達した場合は最大 1 時間待ちます。 |
| Run "expl server login". | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

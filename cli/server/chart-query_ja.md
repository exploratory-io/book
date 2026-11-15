# expl server chart query

ノート、ダッシュボード、スライドに含まれるチャートのデータを、サーバーで絞り込み、集計して、結果だけを返します。

<a id="examples"></a>

## 例

### チャートのデータを集計する

**ターミナル**

```sh
expl server chart query --id <id> --chart <chart> --mode aggregate --dimensions '[{"column":"<column>"}]' --metrics '[{"function":"count_rows","alias":"n"}]' --json
```

\<id\> はノートなどの id、\<chart\> はチャートの名前、\<column\> は chart get-data の結果の query.columns にある列の名前に置き換えます。書式は dataset query と同じです。

実行結果は、ダッシュボード Sales Orders Dashboard（id が pQ9rS0tU1v）のチャート kL8mN9oP（Sales by Region）で実行したものです。このチャートは地域が 8 つあるため、どの地域も 1 行と数えられます。長い出力は省略しています。

**実行結果**

```text
{
  "query_id": "cq_ba198537",
  "chart": {
    "item_id": "pQ9rS0tU1v",
    "item_title": "Sales Orders Dashboard",
    "item_type": "dashboard",
    "name": "kL8mN9oP",
    "title": "Sales by Region",
    "type": "bar",
    "data_granularity": "aggregated",
    "url": "https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v",
    "version": "20261112T092937Z-3fc872d2",
    "encoding": [
      {
        "role": "x",
        "column": "region",
        "label": "region",
        "csv_column": "region"
      },
      {
        "role": "y",
        "column": "sales",
        "label": "sales",
        "aggregation": "sum",
        "csv_column": "sales"
      }
    ],
    "filters": [],
    "filter_logic": "and"
  },
  "context": {
    "publication_version": "2026-11-12T09:29:37.157Z",
    "data_as_of": "2026-11-12T08:13:36.612Z",
    "parameters": null,
    "dashboard_filters": "none",
    "chart_parameters": [],
    "data": {
      "scope": "A",
      "data_frame": "Sales Orders",
      "step": null,
      "period": null,
      "row_filters": []
    }
  },
  "columns": [
    {
      "name": "region",
      "type": "string",
      "role": "x"
    },
    {
      "name": "n",
      "type": "integer",
      "source": {
        "function": "count_rows",
        "column": null
      }
    }
  ],
  "rows": [
    [
      "Kinki",
      1
    ],
    [
      "Kyushu-Okinawa",
      1
    ],
    [
      "Shikoku",
      1
    ]
  ],
  "result": {
    "row_count": 8,
    "has_more": false,
    "source_row_count": 8
  },
  "warnings": []
}
```

<a id="usage"></a>

## 書式

```text
expl server chart query [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="flags"></a>

## 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 |  | チャートを含むノート、ダッシュボード、スライドの id です。検索結果や fetch の結果に出ます。 |
| `--chart` | 文字列 |  | チャートの名前です。fetch の結果の metadata.charts\[\].name にあります（英数字、_、-）。 |
| `--mode` | 文字列 | queries を使うとき以外は必須 | rows: 条件に合う行を取得します。aggregate: dimensions でグループに分けて、metrics を計算します。 値: `rows`, `aggregate` |
| `--columns` | 値の配列 |  | rows だけで使います。返す列の名前を、1〜50 個、重ならないように指定します。 |
| `--filters` | JSON |  | 絞り込みの条件です。条件 1 つか、{ "and": \[...\] } か { "or": \[...\] }（各 2 つ以上）で書きます。入れ子は 3 段まで、条件は全体で 20 個までです。 |
| `--dimensions` | JSON |  | aggregate だけで使います。グループに分ける列を、0〜5 個指定します。保存されている値のまま分けるので、日付から月や年を取り出してグループ化する指定はありません。指定しないと、全体で 1 行になります。 |
| `--metrics` | JSON | aggregate のときは必須 | aggregate だけで使い、必須です。計算を 1〜10 個指定します。 |
| `--sort` | JSON |  | 並べ替えです。3 つまで指定します。 |
| `--limit` | 整数 |  | 返す行数の上限です。rows は既定 100、最大 1,000。aggregate は既定 100、最大 500 です。続きを取得する指定はありません。 |
| `--queries` | JSON |  | 独立した問い合わせを、1 回の呼び出しにまとめます。10 件までです。各問い合わせは、id、chart と、単独の問い合わせと同じ項目を持ちます。 |

<a id="json-arguments"></a>

## JSON の引数

filters、metrics、sort の JSON の形は dataset query の説明を参照してください。チャートの問い合わせでは結合の指定は使いません。

- [JSON の書き方](dataset-query_ja.md#json-arguments) - 入力のキーと置き換える値を確認します。

<a id="paging"></a>

## 続きを取得する

ページ送りはありません。結果の has_more が true のときは、絞り込むか、集計します。

<a id="output"></a>

## 出力

対象は、公開されたとおりのチャートの表です。チャートがすでに集計した値が入っています。総計や小計の行は表に入らず、result.excluded_totals に入ります。全体の値がほしいときは、行を足し合わせず、excluded_totals を使います。すでに平均、重複を除いた件数、比率にした列を足し合わせたり平均したりすると、警告 CHART_REAGGREGATION が付きます。そのときは、警告を伝えるか、excluded_totals を使います。数値を伝えるときは、チャートの集計方法、chart.filters、context.parameters、context.data_as_of もいっしょに伝えます。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| CHART_REAGGREGATION | チャートがすでに集計した列を、さらに集計しています。警告を伝えるか、result.excluded_totals を使います。 |
| Run "expl server login". | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

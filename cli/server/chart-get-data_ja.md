# expl server chart get-data

チャートのデータを、数値の意味とあわせて取得します。

<a id="examples"></a>

## 例

### チャートの先頭の 5 行を取得する

**ターミナル**

```sh
expl server chart get-data <id> --chart <chart> --limit 5 --json
```

\<id\> はノートなどの id、\<chart\> は fetch の結果にあるチャートの名前に置き換えます。

実行結果は、ダッシュボード Sales Orders Dashboard（id が pQ9rS0tU1v）のチャート kL8mN9oP（Sales by Region）で実行したものです。長い出力は省略しています。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "pQ9rS0tU1v",
    "type": "dashboard",
    "title": "Sales Orders Dashboard"
  },
  "summary": "Returned 5 of 8 rows of chart \"Sales by Region\". To aggregate instead of paging, use chart_query with the same id and chart.",
  "result": {
    "chart": {
      "name": "kL8mN9oP",
      "title": "Sales by Region",
      "type": "bar",
      "data_granularity": "aggregated",
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
      "filter_logic": "and",
      "unsupported": []
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
    "data_shared": true,
    "columns": [
      "region",
      "sales"
    ],
    "rows": [
      [
        "Kanto",
        148695040
      ],
      [
        "Kinki",
        74050840
      ],
      [
        "Chubu",
        72023380
      ]
    ],
    "offset": 0,
    "returned": 5,
    "has_more": true,
    "row_count": 8,
    "query": {
      "available": true,
      "reason": null,
      "columns": [
        {
          "name": "region",
          "type": "string"
        },
        {
          "name": "sales",
          "type": "integer"
        }
      ],
      "total_rows": {
        "excluded": 0,
        "detection": "not_applicable"
      }
    }
  },
  "warnings": [],
  "url": "https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v"
}
```

<a id="usage"></a>

## 書式

```text
expl server chart get-data <id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="flags"></a>

## 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 | 必須 | チャートを含むノート、ダッシュボード、スライドの id です。チャート単体で公開したものは、その id です。コマンドのすぐあとに書くか、--id で渡します。 |
| `--chart` | 文字列 |  | ノート、ダッシュボード、スライドの中のチャートの名前です。fetch の結果の metadata.charts\[\].name にあります。 |
| `--offset` | 整数 |  | 読み飛ばす行数です。0 から数えます。 |
| `--limit` | 整数 |  | 返す行数です。100 までです。 |

<a id="paging"></a>

## 続きを取得する

offset に、すでに読んだ行数を渡すと、続きを読めます。1 回に取得できるのは 100 行までです。

<a id="output"></a>

## 出力

チャートの行に加えて、数値の意味が付きます。chart.encoding（棚ごとの列、集計方法、数値の形式）、chart.filters、chart.data_granularity（集計済みか、行ごとか）、chart.unsupported（返せないもの）、context（公開時点、データの時点、パラメータの値）です。数値は公開されたときの値で、ブラウザでパラメータを変えた結果は取れません。チャート単体で公開したものは、集計値ではなく、描画に使った行のサンプル（最大 1 万行）なので、足し合わせて合計にしないでください。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| 合計、並べ替え、絞り込みをしたい | chart query を使います。 |
| DATA_EGRESS_LIMIT | 公開した人が、このデータの行を共有していません。チャート、アナリティクス、要約を使います。 |
| Run "expl server login". | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

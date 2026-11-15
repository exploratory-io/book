# 使い方の例

AI への依頼文の例です。AI が使用するツールと、依頼するときのポイントもあわせて説明します。

<a id="find"></a>

## データを探す

```text
Exploratory にある「Sales Orders」のデータを探して
```

AI は、search を scope: "all" で呼び出し、該当するデータを URL 付きで表示します。内容を読む場合は、id を指定して fetch を呼び出します。

**CLI で同じ操作を実行した結果**

```sh
expl server search "Sales Orders" --scope all --type data --limit 3 --json
```

--json を付けると、search ツールが返した結果をそのまま出力します。長い出力は省略しています。

**実行結果**

```text
{
  "results": [
    {
      "id": "llS6nQK3aH",
      "title": "Sales Orders",
      "url": "https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH",
      "type": "data",
      "description": "One row is one order line item (an order can have several lines, line_no 1-3). Period: order_date from 2025-01-01 to 2026-10-31. Columns: order_id (order ID), line_no (line number within the order), order_date, ship_date (shipping date; can be later than the order date, up to 2026-11-04), custome...",
      "author": "山田 花子",
      "team": null,
      "updated_at": "2026-11-12T09:26:51.086Z",
      "refreshed_at": "2026-11-12T08:12:13.528Z",
      "tags": [
        "sales",
        "orders"
      ],
      "publication_version": "2026-11-12T09:26:51.086Z",
      "data_as_of": "2026-11-12T08:12:13.528Z",
      "columns": [
        {
          "name": "order_id",
          "type": "character",
          "description": "",
          "missing_count": 0
        },
        {
          "name": "line_no",
          "type": "numeric",
          "description": "",
          "missing_count": 0
        }
… (trimmed)
      ],
      "column_count": 14,
      "row_count": 23131
    }
  ],
  "has_more": false,
  "next_offset": null
}
```

<a id="data"></a>

## データを集計する

```text
Exploratory の「Sales Orders」データにはどんな列がある？ 売上が一番大きい地域の上位 5 つも教えて
```

AI は、次の順で進めます。

- search で、データを探します。
- dataframe_get_schema で、列と、承認された意味（1 行の意味、集計のルール）を読みます。
- query_dataset で集計し、数値と、何を計算したか（集計方法、絞り込み、データの時点）を伝えます。

**CLI で同じ操作を実行した結果**

```sh
expl server dataset query <dataset_id> --mode aggregate --dimensions '[{"column":"region"}]' --metrics '[{"function":"sum","column":"sales","alias":"sales"}]' --sort '[{"field":"sales","direction":"desc"}]' --limit 5 --json
```

実行結果は、データ Sales Orders（id は llS6nQK3aH）で、地域ごとの売上を合計したものです。

**実行結果**

```text
{
  "query_id": "qry_2a25c1716e94b226",
  "dataset": {
    "id": "llS6nQK3aH",
    "name": "Sales Orders",
    "version": "20261112T081211Z-72836d02",
    "updated_at": "2026-11-12T08:12:11.243Z",
    "url": "https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH"
  },
  "columns": [
    {
      "name": "region",
      "type": "string"
    },
    {
      "name": "sales",
      "type": "float"
    }
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
    ],
    [
      "Kyushu-Okinawa",
      45545510
    ],
    [
      "Tohoku",
      30228840
    ]
  ],
  "result": {
    "row_count": 5,
    "has_more": true
  },
  "warnings": [
    {
      "code": "RESULT_TRUNCATED",
      "message": "Additional rows exist. Refine the query."
    }
  ]
}
```

<a id="chart"></a>

## チャートの数値を取得する

```text
「Sales Orders Dashboard」のダッシュボードにある「Monthly Sales Trend」のチャートの数値を教えて
```

AI は、fetch で、ノートの中のチャートの名前（metadata.charts）を調べ、chart_get_data で数値を取得します。絞り込みや集計が必要なときは、chart_query を使います。数値は、公開されたときの値です。

**CLI で同じ操作を実行した結果**

```sh
expl server chart get-data <id> --chart <chart> --limit 5 --json
```

実行結果は、ダッシュボード（id は sjO4NsW7kb）のチャート dkc1UUY6（Monthly Sales Trend）のものです。長い出力は省略しています。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "sjO4NsW7kb",
    "type": "dashboard",
    "title": "Sales Orders Dashboard"
  },
  "summary": "Returned 5 of 22 rows of chart \"Monthly Sales Trend\".",
  "result": {
    "chart": {
      "name": "dkc1UUY6",
      "title": "Monthly Sales Trend",
      "type": "line",
      "data_granularity": "aggregated",
      "encoding": [
        {
          "role": "x",
          "column": "order_date",
          "label": "order_date",
          "aggregation": "monthname_with_year",
          "csv_column": "order_date"
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
      "publication_version": "2026-11-12T08:22:40.602Z",
      "data_as_of": "2026-11-12T08:13:36.612Z",
      "parameters": null,
      "dashboard_filters": "none"
    },
    "data_shared": true,
    "columns": [
      "order_date",
      "sales"
    ],
    "rows": [
      [
        "2025-01",
        17994220
      ],
      [
        "2025-02",
        14191900
      ],
      [
        "2025-03",
        20790580
      ],
      [
        "2025-04",
        20476270
      ],
      [
        "2025-05",
        16507690
      ]
    ],
    "offset": 0,
    "returned": 5,
    "has_more": true,
    "row_count": 22
… (trimmed)
```

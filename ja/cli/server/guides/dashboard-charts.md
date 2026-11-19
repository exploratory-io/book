---
title: "チャートの数値を取得する"
---

公開されたダッシュボードやノートに含まれるチャートについて、数値の取得、サーバーでの集計、画像の取得を行います。

<a id="steps"></a>

## 2 つの手順

### 1. チャートの名前を確認する

ダッシュボードまたはノートの id を指定して、fetch を実行します。結果の metadata.charts に、チャートごとの名前（name）、集計方法（values）、フィルタ（filters）が含まれます。

```sh
expl server fetch <id> --json
```

\<id\> は、検索結果に表示された id に置き換えます。実行結果は、ダッシュボード Sales Orders Dashboard（id は pQ9rS0tU1v）で実行したものです。長い出力は省略しています。

**実行結果**

```text
{
  "id": "pQ9rS0tU1v",
  "title": "Sales Orders Dashboard",
  "text": "# Sales Orders Dashboard\n\n### Total Sales\n\n**Chart: Total Sales** (chart: `cD4eF5gH`, type: singlevalue)\n\nValues: sum of sales\n\n| sales |\n| --- |\n| 440826130 |…,
  "url": "https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v",
  "metadata": {
    … (trimmed),
    "charts": [
      {
        "name": "cD4eF5gH",
        "title": "Total Sales",
        "type": "singlevalue",
        "values": [
          {
            "column": "sales",
            "label": "sales",
            "aggregation": "sum"
          }
        ],
        "row_count": 1,
        "queryable": true
      },
      {
        "name": "qR0sT1uV",
        "title": "Monthly Sales Trend",
        "type": "line",
        "values": [
          {
            "column": "sales",
            "label": "sales",
            "aggregation": "sum"
          }
        ],
        "row_count": 22,
        "queryable": true
      },
      … (trimmed)
    ],
    "context": {
      "publication_version": "2026-11-12T08:22:40.602Z",
      "data_as_of": "2026-11-12T08:13:36.612Z",
      "parameters": null,
      "dashboard_filters": "none"
    },
    "type": "dashboard",
    "author": "山田 花子",
    "team": null,
    "created_at": "2026-11-12T08:13:36.316Z",
    "updated_at": "2026-11-12T08:22:40.602Z",
    "refreshed_at": "2026-11-12T08:13:36.612Z",
    "tags": [],
    … (trimmed)
  }
}
```

> metadata.charts にチャートの name が表示されていれば、チャートの名前を確認できています。

### 2. 数値を取得する

確認した name を `--chart` に指定して、chart get-data を実行します。

```sh
expl server chart get-data <id> --chart <chart> --limit 5 --json
```

\<id\> はダッシュボードなどの id、\<chart\> はチャートの name に置き換えます。実行結果は、ダッシュボード（id は pQ9rS0tU1v）のチャート qR0sT1uV（Monthly Sales Trend）のものです。長い出力は省略しています。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "pQ9rS0tU1v",
    "type": "dashboard",
    "title": "Sales Orders Dashboard"
  },
  "summary": "Returned 5 of 22 rows of chart \"Monthly Sales Trend\".",
  "result": {
    "chart": {
      "name": "qR0sT1uV",
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

rows に数値が、chart.encoding に各軸の列と集計方法が表示されます。context には、公開時点、データの時点、パラメーターの値が含まれます。数値は、公開されたときの値です。

has_more が true の場合は、続きがあります。取得済みの行数を `--offset` に指定すると、続きを取得できます。1 回の呼び出しで取得できる行数は、最大 100 行です。

> rows に先頭 5 行が表示されていれば、数値を取得できています。

<a id="aggregate"></a>

## 集計する（任意）

合計、順位付け、条件に合う行の抽出が必要な場合は、chart query を使用します。指定方法は dataset query と同じです。

```sh
expl server chart query --id <id> --chart <chart> --mode aggregate --dimensions '[{"column":"region"}]' --metrics '[{"function":"sum","column":"sales","alias":"sales"}]' --sort '[{"field":"sales","direction":"desc"}]' --limit 3 --json
```

\<id\> と \<chart\> は、ダッシュボードなどの id とチャートの name に置き換えます。列の名前は、chart get-data の結果の query.columns で確認します。実行結果は、チャートが kL8mN9oP（Sales by Region）のものです。上位 3 つの地域は、チャートの先頭の 3 行と一致します。

**実行結果**

```text
{
  "query_id": "cq_d16081f8",
  "chart": {
    "item_id": "pQ9rS0tU1v",
    "item_title": "Sales Orders Dashboard",
    "item_type": "dashboard",
    "name": "kL8mN9oP",
    "title": "Sales by Region",
    "type": "bar",
    "data_granularity": "aggregated",
    "url": "https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v",
    "version": "20261112T082240Z-3fc872d2",
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
    "publication_version": "2026-11-12T08:22:40.602Z",
    "data_as_of": "2026-11-12T08:13:36.612Z",
    "parameters": null,
    "dashboard_filters": "none"
  },
  "columns": [
    {
      "name": "region",
      "type": "string",
      "role": "x"
    },
    {
      "name": "sales",
      "type": "integer",
      "source": {
        "function": "sum",
        "column": "sales"
      }
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
    ]
  ],
  "result": {
    "row_count": 3,
    "has_more": true,
    "source_row_count": 8
  },
  "warnings": [
    {
      "code": "RESULT_TRUNCATED",
      "message": "Additional rows exist. Refine the query."
    }
  ]
}
```

集計の対象は、チャートが公開時に集計した表です。すでに平均、重複を除いた件数、比率などで集計された列をさらに合計または平均すると、警告 CHART_REAGGREGATION が表示されます。その場合は、警告を添えて結果を伝えるか、result.excluded_totals を使用します。

result.has_more が true の場合は、結果に含まれていない行があります。続きを取得する指定はないため、条件を絞り込むか、集計します。上の結果の警告 RESULT_TRUNCATED は、この状態を示しています。

> rows に集計結果が表示されていれば、集計できています。

<a id="image"></a>

## チャートの形を確認する（任意）

チャートの傾向や配置を確認する場合は、画像を取得します。

```sh
expl server chart get-image <id> --chart <chart> --json
```

出力の形を示す例で、値は説明用です。チャートは qR0sT1uV（Monthly Sales Trend）です。image_path（画像の保存先）の行は省略しているので、次の JSON は抜粋で、完全な JSON ではありません。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "pQ9rS0tU1v",
    "type": "dashboard",
    "title": "Sales Orders Dashboard"
  },
  "summary": "Returned the image of chart \"Monthly Sales Trend\" (600x400).",
  "result": {
    "chart": {
      "name": "qR0sT1uV",
      "title": "Monthly Sales Trend",
      "type": "line"
    },
    "data_shared": true,
    "image": {
      "mime_type": "image/png",
      "width": 600,
      "height": 400,
      "original_width": 600,
      "original_height": 400,
      "bytes": 41970,
      "resized": false,
      "captured_at": "2026-11-12T09:26:51.086Z",
      "may_be_stale": true
    },
    "context": {
      "publication_version": "2026-11-12T09:26:51.086Z",
      "data_as_of": "2026-11-14T22:02:56.899Z",
      "parameters": {
        "applied": true,
        "values": [
          {
            "name": "Start_Date",
            "display_name": "Start_Date",
            "value": [
              "2017-01-01"
            ]
          },
          {
            "name": "End_Date",
            "display_name": "End_Date",
            "value": [
              "2020-12-31"
            ]
          },
          {
            "name": "Market",
            "display_name": "Market",
            "value": []
          }
        ],
        "note": "Values as published. A viewer who changes the parameters in the browser sees different results."
      },
      "dashboard_filters": "none"
    }
  },
  "warnings": [
    "The image is the chart as saved when it was published. Read exact numbers with chart_get_data, not from the image.",
    "The data was refreshed at 2026-11-14T22:02:56.899Z, after this image was captured at 2026-11-12T09:26:51.086Z. The image may not show the current numbers; use chart_get_data for them."
  ],
  "url": "https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v",
…（中略）
}
```

画像は、公開したときに保存されたもので、データより古い場合があります。result.image.may_be_stale で確認します。画像は expl を実行しているコンピューターに保存され、保存先は image_path に表示されます。`--output` で保存先を指定することもできます。正確な数値は、画像ではなく chart get-data で取得します。

> result.image に画像の情報が表示されていれば、取得できています。

<a id="trouble"></a>

## トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| 合計、並べ替え、絞り込みが必要 | chart query を使用します。 |
| DATA_EGRESS_LIMIT | 公開した人が、このデータの行を共有していません。チャート、アナリティクス、要約を使用します。 |
| `Run "expl server login".` | サインインしていないか、保存したログイン情報または API キーが拒否されています。expl server login を実行します。 |

すべてのフラグは[chart get-data](/ja/cli/server/commands#chart-get-data)、集計の指定方法は[chart query](/ja/cli/server/commands#chart-query)、画像の取得は[chart get-image](/ja/cli/server/commands#chart-get-image)で説明しています。

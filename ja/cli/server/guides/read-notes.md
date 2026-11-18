---
title: "ノートを読む"
---

公開されたノートを探し、本文を読み、チャートの数値を取得します。

<a id="search"></a>

## 探す

検索語を、コマンドのすぐあとに書きます。結果は、人が読みやすい表で出ます。`--json` を付けると、JSON になります。

```sh
expl server search "sales" --limit 3 --json
```

`--limit` は、返す件数の上限です。50 までです。

自分のコンテンツを一覧したいときは、検索語を空にして、`--scope` mine を付けます。

```sh
expl server search "" --scope mine --limit 50 --json
```

結果の has_more が true のときは、まだ続きがあります。next_offset の値を `--offset` に渡すと、次のページを取得できます。

<a id="id"></a>

## id を見つける

検索結果の各項目に、id と URL が出ます。id は、fetch など、次のコマンドに渡す値です。URL は、人にコンテンツを伝えるときに使います。

<a id="read"></a>

## 本文を読む

```sh
expl server fetch <id> --json
```

\<id\> は、検索結果に表示された id に置き換えます。実行結果は、ダッシュボード Sales Orders Dashboard（id は pQ9rS0tU1v）で実行したものです。Total Sales（440,826,130）は、Number チャート Total Sales の値です。長い出力は省略しています。

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

ノート、ダッシュボード、スライドは、本文と、埋め込まれた各チャートの先頭の行、各アナリティクスの説明が返ります。見出しの一覧は、返せるだけの長さがあるノートでは、metadata.toc にあります。

<a id="long"></a>

## 長いノートを読む

長いノートは、全部を読まずに、必要なところだけを読めます。見出しを 1 つ指定するときは、metadata.toc にある見出しの id を `--section` に渡します。

```sh
expl server fetch <id> --section s2 --json
```

s2 は、metadata.toc にある見出しの id に置き換えます。metadata.toc が返らないときは、`--include-toc` を付けるか、先に `--query` で検索し、結果に表示された見出しの id を使います。

話題から探すときは、`--query` に言葉を渡します。スペースで区切った言葉のどれかを含む段落を、見出しの経路つきで返します。

```sh
expl server fetch <id> --query "sales forecast" --json
```

長くて途中で切れたときは、metadata.range.next_cursor の値を `--cursor` に渡して、続きを読みます。

<a id="charts"></a>

## 中のチャートの数値を取得する

ノートやダッシュボードに含まれるチャートの名前は、fetch の結果の metadata.charts にあります。その名前を `--chart` に渡すと、チャートの数値を取得できます。

```sh
expl server chart get-data <id> --chart <chart> --limit 5 --json
```

\<id\> はノートなどの id、\<chart\> はチャートの名前に置き換えます。実行結果は、ダッシュボード（id は pQ9rS0tU1v）のチャート qR0sT1uV（Monthly Sales Trend）のものです。長い出力は省略しています。

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

結果には、数値の意味（集計方法、フィルタ、パラメーターの値、データの時点）が含まれます。数値を人に伝えるときは、これもあわせて伝えてください。

チャートの形を見たいときは、画像を取得します。画像は公開したときのもので、データより古いことがあります。正確な数値は、画像ではなく chart get-data で読みます。

```sh
expl server chart get-image <id> --chart <chart> --json
```

アナリティクスの結果は、fetch の結果の metadata.blocks にある名前を `--analytics` に渡して取得します。

```sh
expl server analytics get-result <id> --analytics <analytics> --limit 3 --json
```

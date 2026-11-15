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

実行結果は、データ Sales Orders（id が llS6nQK3aH）で実行したものです。長い出力は省略しています。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "llS6nQK3aH",
    "type": "data",
    "title": "Sales Orders"
  },
  "summary": "Returned 3 of 23131 rows from offset 0.",
  "result": {
    "columns": [
      "order_id",
      "line_no",
      "order_date"
    ],
    "rows": [
      [
        "SO-250101-00001",
        1,
        "2025-01-01"
      ],
      [
        "SO-250101-00002",
        1,
        "2025-01-01"
      ],
      [
        "SO-250101-00002",
        2,
        "2025-01-01"
      ]
    ],
    "offset": 0,
    "returned": 3,
    "has_more": true,
    "sample_row_count": 23131,
    "row_count": 23131,
    "is_sample": false,
    "source": "full",
    "context": {
      "publication_version": "2026-11-12T09:26:51.086Z",
      "data_as_of": "2026-11-12T08:12:13.528Z",
      "parameters": null,
      "dashboard_filters": "none"
    }
  },
  "warnings": [],
  "url": "https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH"
}
```

### 101〜200行目を取得する

**ターミナル**

```sh
expl server dataframe preview <id> --offset 100 --limit 100 --json
```

結果は、100 行のうち先頭の 2 行に省略しています。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "llS6nQK3aH",
    "type": "data",
    "title": "Sales Orders"
  },
  "summary": "Returned 100 of 23131 rows from offset 100.",
  "result": {
    "columns": [
      "order_id",
      "line_no"
    ],
    "rows": [
      [
        "SO-250104-00073",
        1
      ],
      [
        "SO-250104-00074",
        1
      ]
    ],
    "offset": 100,
    "returned": 100,
    "has_more": true,
    "sample_row_count": 23131,
    "row_count": 23131,
    "is_sample": false,
    "source": "full",
    "context": {
      "publication_version": "2026-11-12T09:26:51.086Z",
      "data_as_of": "2026-11-12T08:12:13.528Z",
      "parameters": null,
      "dashboard_filters": "none"
    }
  },
  "warnings": [],
  "url": "https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH"
}
```

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

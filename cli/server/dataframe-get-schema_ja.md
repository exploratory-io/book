# expl server dataframe get-schema

データの列の名前と型、公開した人が書いた説明、行数を調べます。

<a id="examples"></a>

## 例

### 列の名前と型だけを調べる

**ターミナル**

```sh
expl server dataframe get-schema <id> --detail light --json
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
  "summary": "14 columns, 23131 rows.",
  "result": {
    "row_count": 23131,
    "columns": [
      {
        "name": "order_id",
        "data_type": "character"
      },
      {
        "name": "line_no",
        "data_type": "numeric"
      },
      {
        "name": "order_date",
        "data_type": "Date"
      }
    ],
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

### 詳しく調べる

**ターミナル**

```sh
expl server dataframe get-schema <id> --json
```

同じデータで実行した結果です。統計、意味づけ、クエリで使える演算子の一覧は省略しています。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "llS6nQK3aH",
    "type": "data",
    "title": "Sales Orders"
  },
  "summary": "14 columns, 23131 rows.",
  "result": {
    "row_count": 23131,
    "data_source": {
      "type": "parquet"
    },
    "update_status": {
      "freshness": "not_scheduled",
      "last_refreshed_at": "2026-11-12T08:12:13.528Z",
      "last_published_at": "2026-11-12T09:26:51.086Z",
      "schedule": null,
      "last_run_status": "idle",
      "last_failure_at": null,
      "consecutive_failures": 0
    },
    "language": "en",
    "base_language": "en",
    "columns": [
      {
        "name": "order_id",
        "data_type": "character",
        "description": "",
        "missing_count": 0,
        "unique_count": 15970,
        "sample_values": [
          "SO-250101-00001",
          "SO-250101-00002"
        ],
        "query_type": "string"
      },
      {
        "name": "line_no",
        "data_type": "numeric",
        "description": "",
        "missing_count": 0,
        "min": 1,
        "max": 3,
        "query_type": "float"
      }
    ],
    "query": {
      "available": true,
      "source": "full",
      "export_available": true,
      "dataset": {
        "version": "20261112T092646Z-72836d02",
        "updated_at": "2026-11-12T09:26:46.214Z"
      }
    },
    "context": {
      "publication_version": "2026-11-12T09:26:51.086Z",
      "data_as_of": "2026-11-12T08:12:13.528Z",
      "parameters": null,
      "dashboard_filters": "none"
    }
  },
  "warnings": [
    "Semantics: 1 approved."
  ],
  "url": "https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH"
}
```

<a id="usage"></a>

## 書式

```text
expl server dataframe get-schema <id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="flags"></a>

## 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 | 必須 | データの id です。検索結果などに出ます。コマンドのすぐあとに書くか、--id で渡します。 |
| `--detail` | 文字列 |  | full: 説明、統計量、セマンティクス（行の意味や集計のルール）、dataset query で使える条件まで返します。light: 列の名前と型、行数だけを、小さく速く返します。 値: `full`, `light` |
| `--language` | 文字列 |  | 説明と定義を読む言語です。指定しないと、データの元の言語になります。その言語の文がないときは、もう一方の言語で返り、language_fallback が含まれます。 値: `ja`, `en` |
| `--include-unapproved` | 有効 / 無効 |  | 所有者がまだ承認していない定義（下書きと AI の提案）も返します。データの所有者だけが使えます。公式の定義ではなく、ヒントです。 |

<a id="paging"></a>

## 続きを取得する

続きを取得する指定はありません。

<a id="output"></a>

## 出力

列の名前、型、行数が入ります。full では、公開した人が書いた説明、欠損値と固有値の数、最小値と最大値、よく出る値、更新状況（最後に更新された時刻と、新しいかどうか）も入ります。所有者が承認していれば、セマンティクス（1 行の意味、列の役割、既定の集計方法、集計のルール）も入ります。セマンティクスは公式の定義なので、集計の前に読んでください。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| dataset query が DATASET_UNAVAILABLE で失敗する | --detail full で、結果の query.available を確認します。false のデータは、サーバーでは問い合わせできません。 |
| Run "expl server login". | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

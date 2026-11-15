# クイックスタート

expl をインストールしてサインインし、パブリッシュされたノートを検索して読み、データを集計するまでを 5 段階で説明します。

<a id="steps"></a>

## 5 つの手順

### 1. インストールする

Exploratory Desktop をお使いの場合は、expl が同梱されているため、インストールは不要です。次のコマンドで、バージョンを確認します。Desktop を使用しない場合は、インストールのページを参照してください。

```sh
expl --version
```

> 1 行目に expl \<バージョン\> と表示されていれば、インストールは完了しています。

### 2. サインインする

```sh
expl server login
```

ブラウザが開きます。Exploratory にサインインして、アクセスを許可してください。

> 「Logged in to exploratory.io as …」と表示されていれば、サインインは完了しています。

状態は expl server status で確認します。ブラウザを開けない環境では、サインインのページ（--no-browser、または API キーでのサインイン）と、API キーのページを参照してください。

### 3. 探す

検索語を、コマンドのすぐあとに書きます。このように、フラグの名前を付けずに書く値を位置引数と呼びます。

```sh
expl server search "Sales Orders" --scope all --type data
```

--scope all は、自分のコンテンツに加えて、ほかの人が公開したコンテンツも検索します。--type data は、結果をデータだけに絞り込みます。

**実行結果**

```text
ID          TITLE         URL                                                TYPE  DESCRIPTION                                                                                                                                                                                                                                                                                                   AUTHOR
hI6jK7lM8n  Sales Orders  https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n  data  One row is one order line item (an order can have several lines, line_no 1-3). Period: order_date from 2025-01-01 to 2026-10-31. Columns: order_id (order ID), line_no (line number within the order), order_date, ship_date (shipping date; can be later than the order date, up to 2026-11-04), custome...  山田 花子
```

> コンテンツの id と URL が並んだ結果が表示されていれば、検索できています。

### 4. 読む

```sh
expl server fetch <id> --json
```

\<id\> は、検索結果に表示された id に置き換えます。--json を付けると、サーバーの結果を JSON のまま出力します。実行結果の ID・URL・人名は、説明用に置き換えています。長い出力は省略しています。

**実行結果**

```text
{
  "id": "hI6jK7lM8n",
  "title": "Sales Orders",
  "text": "# Sales Orders\n\nRows (total): 23,131\n\n## Columns\n\n| name | type | description |\n| --- | --- | --- |\n| order_id…,
  "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n",
  "metadata": {
    "update_status": {
      "freshness": "not_scheduled",
      "last_refreshed_at": "2026-11-12T08:12:13.528Z",
      "last_published_at": "2026-11-12T08:12:13.447Z",
      "schedule": null,
      "last_run_status": "idle",
      "last_failure_at": null,
      "consecutive_failures": 0
    },
    "language": "en",
    "base_language": "en",
    "context": {
      "publication_version": "2026-11-12T08:12:13.447Z",
      "data_as_of": "2026-11-12T08:12:13.528Z",
      "parameters": null,
      "dashboard_filters": "none"
    },
    "type": "data",
    "author": "山田 花子",
    "team": null,
    "created_at": "2026-11-12T08:12:13.447Z",
    "updated_at": "2026-11-12T08:12:13.447Z",
    "refreshed_at": "2026-11-12T08:12:13.528Z",
    "tags": [
      "sales",
      "orders"
    ]
  }
}
```

結果には、本文が含まれます。ノート、ダッシュボード、スライドでは、長さや指定によって、見出しの一覧（metadata.toc）も含まれます。ない場合は、--query で見出しの id を調べます。

### 5. 集計する

データのコンテンツで、まず列の名前と型を確認します。

```sh
expl server dataframe get-schema <id> --detail light --json
```

\<id\> は、データの id に置き換えます。実行結果の ID・URL・人名は、説明用に置き換えています。長い出力は省略しています。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "hI6jK7lM8n",
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
      },
… (trimmed)
```

列の名前がわかったら、集計します。次の例は、region 列の値ごとに sales 列の合計を求め、大きい順に並べます。

```sh
expl server dataset query <dataset_id> --mode aggregate --dimensions '[{"column":"region"}]' --metrics '[{"function":"sum","column":"sales","alias":"sales"}]' --sort '[{"field":"sales","direction":"desc"}]' --limit 5 --json
```

\<dataset_id\> はデータの id、region は実際の列の名前に置き換えます。JSON は、全体を単引用符（'）で囲みます。実行結果の ID・URL・人名は、説明用に置き換えています。結果は、Sales Orders データで地域ごとの売上（sales）を合計したものです。値は、Sales Orders Dashboard の Sales by Region と一致します。

**実行結果**

```text
{
  "query_id": "qry_2a25c1716e94b226",
  "dataset": {
    "id": "hI6jK7lM8n",
    "name": "Sales Orders",
    "version": "20261112T081211Z-72836d02",
    "updated_at": "2026-11-12T08:12:11.243Z",
    "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n"
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

結果には、データのバージョンと更新時刻が含まれます。いつのデータで集計したかも、あわせて確認してください。

<a id="next"></a>

## 次に読むもの

- [ノートを読む](guides/read-notes_ja.md) - 長いノートの読み方と、チャートの数値の取り方です。
- [データを集計する](guides/query-data_ja.md) - JSON で渡す引数の書き方です。
- [自動処理](guides/automation_ja.md) - トークンを作成し、CI で実行します。
- [トラブルシューティング](troubleshooting_ja.md) - 症状から対処を探します。

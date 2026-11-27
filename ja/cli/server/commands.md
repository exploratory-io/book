---
title: "コマンド一覧"
---

目的からコマンドを選びます。名前を選ぶと、引数と例を確認できます。

書式の読み方: \<値\> は自分の値に置き換えます。\[ \] で囲んだ項目は省略できます。真偽値は `--flag` または `--no-flag` で指定します。値の配列は、`--tables` summary `--tables` table のように、フラグを繰り返して渡します。JSON の例は bash 向けの書き方です。Windows では、JSON ファイルを `--input` で渡すこともできます。

サインインや接続に関するコマンドは、それぞれのページにあります。[サインイン](/ja/cli/server/login)（login、logout、status）、[API キー](/ja/cli/server/token)（token）、このページの[コマンドを調べる](#inspect-commands)（tools list、tools describe）です。expl server skill は、AI エージェント向けの説明を SKILL.md の形で出力します。

<a id="syntax-index"></a>

## 書式とフラグの一覧

| コマンド | 書式 | フラグ |
| --- | --- | --- |
| [expl server search](#search) | `expl server search [<query>] [flags]` | `--query` `--type` `--scope` `--team` `--semantic` `--limit` `--offset` |
| [expl server fetch](#fetch) | `expl server fetch <id> [flags]` | `--id` `--language` `--section` `--cursor` `--query` `--include-toc` |
| [expl server dataframe get-schema](#dataframe-get-schema) | `expl server dataframe get-schema <id> [flags]` | `--id` `--detail` `--language` `--include-unapproved` |
| [expl server dataframe preview](#dataframe-preview) | `expl server dataframe preview <id> [flags]` | `--id` `--offset` `--limit` |
| [expl server dataset query](#dataset-query) | `expl server dataset query [<dataset_id>] [flags]` | `--dataset-id` `--mode` `--columns` `--filters` `--dimensions` `--metrics` `--sort` `--limit` `--datasets` `--root-alias` `--joins` `--source-filters` `--allow-many-to-many` `--queries` |
| [expl server dataframe export](#dataframe-export) | `expl server dataframe export <dataset_id> [flags]` | `--dataset-id` `--format` `--mode` `--columns` `--filters` `--dimensions` `--metrics` `--sort` `--limit` |
| [expl server dataframe get-wrangling](#dataframe-get-wrangling) | `expl server dataframe get-wrangling <id> [flags]` | `--id` `--steps` `--column` `--include-scripts` `--cursor` `--language` |
| [expl server chart get-data](#chart-get-data) | `expl server chart get-data <id> [flags]` | `--id` `--chart` `--offset` `--limit` |
| [expl server chart get-image](#chart-get-image) | `expl server chart get-image <id> [flags]` | `--id` `--chart` |
| [expl server analytics get-result](#analytics-get-result) | `expl server analytics get-result <id> [flags]` | `--id` `--analytics` `--tables` `--limit` |
| [expl server chart query](#chart-query) | `expl server chart query [flags]` | `--id` `--chart` `--mode` `--columns` `--filters` `--dimensions` `--metrics` `--sort` `--limit` `--queries` |
| [expl server desktop mcp-setup-guide](#desktop-mcp-setup-guide) | `expl server desktop mcp-setup-guide [flags]` | `--client` |

<a id="commands-search"></a>

## 探す・読む

| コマンド | できること |
| --- | --- |
| [expl server search](#search) | 閲覧できるコンテンツを、タイトル、説明、タグで探します。検索語がなければ、新しい順に一覧します。 |
| [expl server fetch](#fetch) | id を指定して、ノート、ダッシュボード、スライド、データを 1 件読みます。 |

<a id="commands-dataframe-preview"></a>

## データ

| コマンド | できること |
| --- | --- |
| [expl server dataframe get-schema](#dataframe-get-schema) | データの列を、型と一緒に取得します。 |
| [expl server dataframe preview](#dataframe-preview) | データの行を、offset と limit でページに分けて取得します。 |
| [expl server dataset query](#dataset-query) | サーバーでデータを絞り込み、集計して、結果だけを返します。 |
| [expl server dataframe export](#dataframe-export) | データへの問い合わせの結果を、CSV か Parquet のファイルにして、ダウンロードリンクを返します。 |
| [expl server dataframe get-wrangling](#dataframe-get-wrangling) | データがどのように作られたかを、データ加工のステップを順に並べて取得します。 |

<a id="commands-chart-get-data"></a>

## チャートとアナリティクス

| コマンド | できること |
| --- | --- |
| [expl server chart get-data](#chart-get-data) | チャートのデータを、数値の意味とあわせて取得します。 |
| [expl server chart get-image](#chart-get-image) | チャートの画像（PNG）を取得します。形、傾向、配置を確認するための機能です。 |
| [expl server analytics get-result](#analytics-get-result) | アナリティクス（回帰、相関、カイ二乗検定など）の結果を、プログラムで扱える形式のデータで取得します。 |
| [expl server chart query](#chart-query) | ノート、ダッシュボード、スライドに含まれるチャートのデータを、サーバーで絞り込み、集計して、結果だけを返します。 |

<a id="commands-desktop-mcp-setup-guide"></a>

## 接続と管理

| コマンド | できること |
| --- | --- |
| [expl server desktop mcp-setup-guide](#desktop-mcp-setup-guide) | Exploratory Desktop に AI ツールをつなぐための、手順とリンクを返します。 |

<a id="inspect-commands"></a>

## コマンドを調べる

サーバーが提供しているコマンドと、そのフラグを調べます。

<a id="inspect-list"></a>

### 一覧を表示する

```sh
expl server tools list
```

コマンドの一覧は、そのつどサーバーから取得します。サーバーに新しい操作が増えても、expl の新しいバージョンは要りません。サーバーに接続できないときや、サインインしていないときは、前回保存した一覧を表示します。保存がないときは、空の一覧になります。

tools list が終了コード 0 で終わっても、接続できているとは限りません。接続は、expl server status で確認します。

<a id="inspect-describe"></a>

### 1 つのコマンドを調べる

```sh
expl server tools describe <command>
```

\<command\> は、一覧に出たコマンドの名前に置き換えます。2 語のコマンドは、`expl server tools describe "chart get-data"` のように引用符で囲みます。`chart_get_data` のような道具名でも指定できます。

コマンドの説明と、使えるフラグが表示されます。コマンド名を推測せず、ここで確認してください。

<a id="inspect-form"></a>

### コマンドの形

search と fetch には、動詞を付けません。expl server search \<query\>、expl server fetch \<id\> の形で使用します。ほかのコマンドは、expl server dataset query のように、名詞と動詞を続けます。

それぞれのコマンドには、その裏にある道具の名前があります。MCP クライアントから見える名前です。expl server call \<tool_name\> は、その名前でコマンドを実行します。例: expl server call dataframe_preview \<id\>

全コマンドの書式とフラグは、[書式とフラグの一覧](#syntax-index)を参照してください。

<a id="search"></a>

## expl server search

閲覧できるコンテンツを、タイトル、説明、タグで探します。検索語がなければ、新しい順に一覧します。

<a id="search-usage"></a>

### 書式

```text
expl server search [<query>] [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="search-flags"></a>

### 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--query` | 文字列 |  | 検索語です。コマンドのすぐあとに書くか、`--query` で渡します。タイトル、説明、タグに一致します。空（または \*）にすると、条件に合うものを新しい順に一覧します。 |
| `--type` | 文字列 |  | 探すコンテンツの種類です。既定は `all` です。値: `all`, `note`, `dashboard`, `slide`, `chart`, `analytics`, `data` |
| `--scope` | 文字列 |  | all: 閲覧できるものすべて。mine: 自分のもの。shared: 自分に共有されたもの。team: 1 つのチームのもの。既定は `all` です。値: `all`, `mine`, `shared`, `team` |
| `--team` | 文字列 | `--scope` team のときは必須 | チームの名前です。 |
| `--semantic` | 真偽値 |  | キーワードの一致ではなく、意味が近いものを探します。 |
| `--limit` | 整数 |  | 返す件数の上限です。50 までです。既定は 20 です。 |
| `--offset` | 整数 |  | 読み飛ばす件数です。続きを取得するときに使います。 |

<a id="search-examples"></a>

### 例

#### 言葉で探す

**ターミナル**

```sh
expl server search "sales"
```

結果の先頭の数行です。説明は省略しています。

**実行結果**

```text
ID  TITLE  URL  TYPE  DESCRIPTION  AUTHOR
pQ9rS0tU1v  Sales Orders Dashboard  https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v  dashboard  山田 花子
hI6jK7lM8n  Sales Orders  https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n  data  One row is one order line item (an order can have several lines, line_no 1-3). P…  山田 花子
wX2yZ3aB4c  Sales Orders Overview  https://exploratory.io/note/aB3cD4eF5g/wX2yZ3aB4c  note  山田 花子
```

#### 自分のコンテンツを一覧する

**ターミナル**

```sh
expl server search "" --scope mine --limit 50 --json
```

自分のコンテンツを、新しい順に最大 50 件出します。

結果は先頭の 2 件に省略しています。

**実行結果**

```text
{
  "results": [
    {
      "id": "Customer-Usage-Monitoring-uV9wX0yZ1a",
      "title": "Customer_Usage_Monitoring",
      "url": "https://exploratory.io/dashboard/aB3cD4eF5g/Customer-Usage-Monitoring-uV9wX0yZ1a",
      "type": "dashboard",
      "description": "",
      "author": "山田 花子",
      "team": null,
      "updated_at": "2026-11-14T22:03:01.394Z",
      "refreshed_at": "2026-11-14T22:03:01.894Z",
      "tags": [
        "operation"
      ],
      "publication_version": "2021-05-26T02:29:48.269Z",
      "data_as_of": "2026-11-14T22:03:01.894Z"
    },
    {
      "id": "hI6jK7lM8n",
      "title": "Sales Orders",
      "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n",
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
          "name": "order_date",
          "type": "Date",
          "description": "",
          "missing_count": 0
        }
      ],
      "column_count": 14,
      "row_count": 23131
    }
  ],
  "has_more": true,
  "next_offset": 50,
  "hint": "To read a dashboard or note: fetch it, then use chart_query for totals, rankings and comparisons."
}
```

<a id="search-output"></a>
<a id="search-paging"></a>

### 出力と上限

結果には、コンテンツの id と URL が入ります。id は、fetch などほかのコマンドに渡します。データのコンテンツには、列の名前と型、行数も入ります。既定では人が読みやすい形で、`--json` を付けると JSON になります。

結果の has_more が true のときは、next_offset の値を `--offset` に渡すと、次のページを取得できます。

<a id="search-trouble"></a>

### トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| Too big: expected number to be \<=50 at limit | `--limit` を 50 以下にします。 |
| `Run "expl server login".` | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

関連: [expl server fetch](#fetch)、[expl server dataframe get-schema](#dataframe-get-schema)

<a id="fetch"></a>

## expl server fetch

id を指定して、ノート、ダッシュボード、スライド、データを 1 件読みます。

<a id="fetch-usage"></a>

### 書式

```text
expl server fetch <id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="fetch-flags"></a>

### 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 | 必須 | コンテンツの id です。検索結果などに出ます。コマンドのすぐあとに書くか、`--id` で渡します。 |
| `--language` | 文字列 |  | データの概要と列の説明を読む言語です。指定しないと、データの元の言語になります。その言語の文がないときは、もう一方の言語で返り、language_fallback が含まれます。値: `ja`, `en` |
| `--section` | 文字列 |  | 見出しの id（s12 など）か、metadata.toc にある見出しの文字そのものです。ノート、ダッシュボード、スライドだけで使えます。 |
| `--cursor` | 文字列 |  | 長いノートの続きを読むための印です。前の結果の metadata.range.next_cursor の値を渡します。 |
| `--query` | 文字列 |  | ノートの中から探す言葉です。スペースで区切り、10 語までです。どれかに一致した段落を、一致する語が多い順に、見出しの経路つきで返します。語句は "..." で囲みます。著者が書いた本文だけが対象で、チャートの行やアナリティクスの表は含みません。 |
| `--include-toc` | 真偽値 |  | 見出しの一覧（metadata.toc）を返します。section、cursor、query のどれも指定しないときだけ、既定で返ります。ノート、ダッシュボード、スライドだけで使えます。 |

<a id="fetch-examples"></a>

### 例

#### ノートを読む

**ターミナル**

```sh
expl server fetch <id> --json
```

\<id\> は、検索結果に表示された id に置き換えます。

実行結果は、id が wX2yZ3aB4c のノート（Sales Orders Overview）で実行したものです。長い出力は省略しています。

**実行結果**

```text
{
  "id": "wX2yZ3aB4c",
  "title": "Sales Orders Overview",
  "text": "# Sales Orders Overview\n\n# Sales Orders Overview\n\nThis note summarizes the Sales Orders data. One row is one order line item (order_id + line_no). The data covers orders from 2025-01-01 to 2026-10-31 (23,131 line items, total sales of about 440.8 million).\n\n## Sales by region\n\n**Chart: Sales by Regi…",
  "url": "https://exploratory.io/note/aB3cD4eF5g/wX2yZ3aB4c",
  "metadata": {
    "scopes": {
      "A": "…"
    },
    "charts": [
      "…",
      "…"
    ],
    "context": {
      "publication_version": "2026-11-12T08:13:18.971Z",
      "data_as_of": "2026-11-12T08:13:19.186Z",
      "parameters": null,
      "dashboard_filters": "none"
    },
    "type": "note",
    "author": "山田 花子",
    "team": null,
    "created_at": "2026-11-12T08:13:18.971Z",
    "updated_at": "2026-11-12T08:13:18.971Z",
    "refreshed_at": "2026-11-12T08:13:19.186Z",
    "tags": []
  }
}
```

#### 見出しを 1 つだけ読む

**ターミナル**

```sh
expl server fetch <id> --section s2 --json
```

s2 は、metadata.toc にある見出しの id に置き換えます。

同じノートの見出し s2（Sales by region）だけを返した結果です。このノートは短いため metadata.toc が返らず、見出し id の s2 は、下の `--query` の結果から取りました。

**実行結果**

```text
{
  "id": "wX2yZ3aB4c",
  "title": "Sales Orders Overview",
  "text": "# Sales Orders Overview > Sales by region\n\n## Sales by region\n\n**Chart: Sales by Region** (chart: `kL8mN9oP`, type: bar)\n\nValues: sum of sales\n\n> [Computed summary]\n>\n> 8 region values (all rows). Total of sales: 440,826,130. Top: Kanto (148,695,040 33.7%), Kinki (74,050,840 16.8%), Chubu (72,023,380 16.3%). Bottom: Shikoku (19,857,430 4.5%), Chugoku (24,926,920 5.7%), Hokkaido (25,498,170 5.8%).\n\n| region | sales |\n…",
  "url": "https://exploratory.io/note/aB3cD4eF5g/wX2yZ3aB4c",
  "metadata": {
    "scopes": "…",
    "charts": "…",
    "context": "…",
    "type": "note",
    "author": "山田 花子",
    "team": null,
    "created_at": "2026-11-12T08:13:18.971Z",
    "updated_at": "2026-11-12T08:13:18.971Z",
    "refreshed_at": "2026-11-12T08:13:19.186Z",
    "tags": "…",
    "range": "…"
  }
}
```

#### 話題を探す

**ターミナル**

```sh
expl server fetch <id> --query "region" --json
```

どれかの語を含む段落を返します。

同じノートに `--query "region"` を付けて実行した結果です。条件に合う段落が、角かっこの中の見出しの id と見出しの経路とともに返ります。

**実行結果**

```text
{
  "id": "wX2yZ3aB4c",
  "title": "Sales Orders Overview",
  "text": "# Sales Orders Overview\n\n[s2 Sales Orders Overview > Sales by region]\n## Sales by region\n\n**Chart: Sales by Region** (chart: `kL8mN9oP`, type: bar)\n\nValues: sum of sales\n\n> [Computed summary]\n>\n> 8 region values (all rows). Total of sales: 440,826,130. Top: Kanto (148,695,040 33.7%), Kinki (74,050,840 16.8%), Chubu (72,023,380 16.3%). Bottom: Shikoku (19,857,430 4.5%), Chugoku (24,926,920 5.7%), Hokkaido (25,498,170 …",
  "url": "https://exploratory.io/note/aB3cD4eF5g/wX2yZ3aB4c",
  "metadata": {
    "scopes": "…",
    "charts": "…",
    "context": "…",
    "type": "note",
    "author": "山田 花子",
    "team": null,
    "created_at": "2026-11-12T08:13:18.971Z",
    "updated_at": "2026-11-12T08:13:18.971Z",
    "refreshed_at": "2026-11-12T08:13:19.186Z",
    "tags": "…",
    "matches": "…"
  }
}
```

<a id="fetch-output"></a>
<a id="fetch-paging"></a>

### 出力と上限

ノート、ダッシュボード、スライドは、本文、埋め込まれた各チャートの先頭の行、各アナリティクスの説明を Markdown で返します。metadata.charts と metadata.blocks に、チャートやアナリティクスの名前が入ります。データは、列、行数、サンプルの行、更新状況が入ります。

長いノートは、`--query` で話題を探すか、`--section` で見出しを 1 つ指定して読みます。続きがあるときは、metadata.range.next_cursor の値を `--cursor` に渡します。metadata.truncated は、続きがあるときだけ含まれます。

<a id="fetch-trouble"></a>

### トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| 本文が長くて、必要な部分が見つからない | `--query` で話題を探すか、metadata.toc の見出しを `--section` で指定します。 |
| チャートやアナリティクスの名前が分からない | 結果の metadata.charts と metadata.blocks を確認します。 |
| `Run "expl server login".` | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

関連: [expl server search](#search)、[expl server chart get-data](#chart-get-data)、[expl server analytics get-result](#analytics-get-result)

<a id="dataframe-get-schema"></a>

## expl server dataframe get-schema

データの列の名前と型、公開した人が書いた説明、行数を調べます。

<a id="dataframe-get-schema-usage"></a>

### 書式

```text
expl server dataframe get-schema <id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="dataframe-get-schema-flags"></a>

### 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 | 必須 | データの id です。検索結果などに出ます。コマンドのすぐあとに書くか、`--id` で渡します。 |
| `--detail` | 文字列 |  | full: 説明、統計量、セマンティクス（行の意味や集計のルール）、dataset query で使える条件まで返します。light: 列の名前と型、行数だけを、小さく速く返します。値: `full`, `light` |
| `--language` | 文字列 |  | 説明と定義を読む言語です。指定しないと、データの元の言語になります。その言語の文がないときは、もう一方の言語で返り、language_fallback が含まれます。値: `ja`, `en` |
| `--include-unapproved` | 真偽値 |  | 所有者がまだ承認していない定義（下書きと AI の提案）も返します。データの所有者だけが使えます。公式の定義ではなく、ヒントです。 |

<a id="dataframe-get-schema-examples"></a>

### 例

#### 列の名前と型だけを調べる

**ターミナル**

```sh
expl server dataframe get-schema <id> --detail light --json
```

\<id\> は、データの id に置き換えます。

実行結果は、データ Sales Orders（id が hI6jK7lM8n）で実行したものです。長い出力は省略しています。

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
  "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n"
}
```

#### 詳しく調べる

**ターミナル**

```sh
expl server dataframe get-schema <id> --json
```

同じデータで実行した結果です。統計量、セマンティクス、クエリで使える演算子の一覧は省略しています。

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
  "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n"
}
```

<a id="dataframe-get-schema-output"></a>
<a id="dataframe-get-schema-paging"></a>

### 出力と上限

列の名前、型、行数が入ります。full では、公開した人が書いた説明、欠損値と固有値の数、最小値と最大値、よく出る値、更新状況（最後に更新された時刻と、新しいかどうか）も入ります。所有者が承認していれば、セマンティクス（1 行の意味、列の役割、既定の集計方法、集計のルール）も入ります。セマンティクスは公式の定義なので、集計の前に読んでください。

ページ送りはありません。

<a id="dataframe-get-schema-trouble"></a>

### トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| dataset query が DATASET_UNAVAILABLE で失敗する | `--detail` full で、結果の query.available を確認します。false のデータは、サーバーでは問い合わせできません。 |
| `Run "expl server login".` | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

関連: [expl server dataframe preview](#dataframe-preview)、[expl server dataset query](#dataset-query)

<a id="dataframe-preview"></a>

## expl server dataframe preview

データの行を、offset と limit でページに分けて取得します。

<a id="dataframe-preview-usage"></a>

### 書式

```text
expl server dataframe preview <id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="dataframe-preview-flags"></a>

### 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 | 必須 | データの id です。検索結果などに出ます。コマンドのすぐあとに書くか、`--id` で渡します。 |
| `--offset` | 整数 |  | 読み飛ばす行数です。0 から数えます。 |
| `--limit` | 整数 |  | 返す行数です。100 までです。 |

<a id="dataframe-preview-examples"></a>

### 例

#### 先頭の 3 行を表示する

**ターミナル**

```sh
expl server dataframe preview <id> --limit 3 --json
```

\<id\> は、データの id に置き換えます。

実行結果は、データ Sales Orders（id が hI6jK7lM8n）で実行したものです。長い出力は省略しています。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "hI6jK7lM8n",
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
  "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n"
}
```

#### 101〜200行目を取得する

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
    "id": "hI6jK7lM8n",
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
  "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n"
}
```

<a id="dataframe-preview-output"></a>
<a id="dataframe-preview-paging"></a>

### 出力と上限

公開した人がすべてのデータを含めて公開したときは、すべての行を読めます。そうでないときは、公開したときに保存したサンプルの行です。is_sample と row_count で確かめます。合計や絞り込みが目的なら、すべてのページを読まずに dataset query を使います。

offset に、すでに読んだ行数を渡すと、続きを読めます。1 回に取得できるのは 100 行までです。

<a id="dataframe-preview-trouble"></a>

### トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| DATA_EGRESS_LIMIT | 公開した人が、このデータの行を共有していません。チャート、アナリティクス、要約を使います。 |
| `Run "expl server login".` | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

関連: [expl server dataframe get-schema](#dataframe-get-schema)、[expl server dataset query](#dataset-query)

<a id="dataset-query"></a>

## expl server dataset query

データをサーバーで絞り込み、集計して、結果だけを返します。列の名前は、search か dataframe get-schema で確認します。

<a id="dataset-query-usage"></a>

### 書式

```text
expl server dataset query [<dataset_id>] [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="dataset-query-flags"></a>

### 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--dataset-id` | 文字列 | queries か datasets を使うとき以外は必須 | データの id です。検索結果などに出ます。コマンドのすぐあとに書くか、`--dataset-id` で渡します。 |
| `--mode` | 文字列 | queries を使わないときは必須 | rows: 条件に合う行を取得します。aggregate: dimensions でグループに分けて、metrics を計算します。値: `rows`, `aggregate` |
| `--columns` | JSON | rows モードでは必須（結合のときは省略可） | rows だけで使います。返す列の名前を、1〜50 個、重ならないように指定します。結合するときは alias と column で書きます。結合のときに省くと、全部の列が返ります。 |
| `--filters` | JSON |  | 絞り込みの条件です。条件 1 つか、`{ "and": [...] }` か `{ "or": [...] }`（各 2 つ以上）で書きます。入れ子は 3 段まで、条件は全体で 20 個までです。結合するときは、結合のあとに適用されます。 |
| `--dimensions` | JSON |  | aggregate だけで使います。グループに分ける列を、0〜5 個指定します。`{ "column": "列の名前" }` の形で書きます。保存されている値のまま分けるので、日付から月や年を取り出してグループ化する指定はありません。指定しないと、全体で 1 行になります。 |
| `--metrics` | JSON | aggregate のときは必須 | aggregate だけで使い、必須です。計算を 1〜10 個指定します。function（count_rows、count、count_distinct、sum、avg、min、max）と、結果の名前になる alias を書きます。count_rows 以外は、column も指定します。 |
| `--sort` | JSON |  | 並べ替えです。3 つまで指定します。出力の列の名前を field、向きを direction で書きます。 |
| `--limit` | 整数 |  | 返す行数の上限です。rows は既定 100、最大 1,000。aggregate は既定 100、最大 500 です。ページ送りはありません。残りがあるときは、絞り込みます。 |
| `--datasets` | JSON |  | 結合するデータと、それぞれの alias です。dataset_id の代わりに使います。2〜5 件。`{ "id": ..., "alias": ... }` の配列で書きます。 |
| `--root-alias` | 文字列 |  | 結合の出発点にするデータの alias です。省略すると、datasets の最初のデータです。 |
| `--joins` | JSON | datasets を使うときは必須 | 結合の種類（inner、left、right、full）、左右の alias、キーにする列を書きます。2 つ目以降のデータごとに、1 つずつ必要です。 |
| `--source-filters` | JSON |  | 結合の前に、データごとに行を絞ります。alias ごとに、そのデータの列名で条件を書きます。left join で、行を落としたくない側の条件に使います。 |
| `--allow-many-to-many` | 真偽値 |  | 結合のキーが両側で重複し、行が増えることを承知しているときだけ、有効にします。 |
| `--queries` | JSON |  | 独立した問い合わせを、1 回の呼び出しにまとめます。5 件までで、サーバー上で並行して実行されます。各問い合わせは、dataset_id（結合する場合は datasets）と、単独の問い合わせと同じ項目を持ちます。 |

<a id="dataset-query-json-arguments"></a>

### JSON の引数の書き方

以下は JSON の入力書式です。\< \> の部分をデータの id、列名、値に置き換えます。実行結果ではありません。コマンドの単引用符を使う例は bash 形式です。PowerShell や cmd では、引用符の書き方が bash と異なり、単引用符を使う例はそのまま動かないことがあります。その場合は、JSON をファイルに保存して、`--input` で渡してください。

#### 条件を指定する: filters

**JSON**

```text
{
  "column": "<column>",
  "operator": "eq",
  "value": "<value>"
}
```

column は列名、operator は比較方法、value は比較する値です。結合後の列は column に alias と column を持つオブジェクトで指定します。

#### 結合するデータ: datasets

**JSON**

```text
[
  {
    "id": "<left_id>",
    "alias": "<left_alias>"
  },
  {
    "id": "<right_id>",
    "alias": "<right_alias>"
  }
]
```

#### 結合条件: joins

**JSON**

```text
[
  {
    "type": "left",
    "left_alias": "<left_alias>",
    "right_alias": "<right_alias>",
    "on": [
      {
        "left_column": "<left_column>",
        "right_column": "<right_column>"
      }
    ]
  }
]
```

結合では dataset_id の代わりに datasets を渡します。左右の alias は datasets の指定と合わせ、on には対応する列名を指定します。キーが両側で重複すると行が増えるため、集計前にキーを確認してください。

<a id="dataset-query-examples"></a>

### 例

#### 地域ごとの行数を数える

**ターミナル**

```sh
expl server dataset query <dataset_id> --mode aggregate --dimensions '[{"column":"region"}]' --metrics '[{"function":"count_rows","alias":"n"}]' --sort '[{"field":"n","direction":"desc"}]' --limit 5 --json
```

\<dataset_id\> は対象のデータの id、region は実際の列の名前に置き換えます。JSON は、全体を単引用符（'）で囲みます。

**実行結果**

Sales Orders のデータ（id: hI6jK7lM8n）で実行した結果です。長い項目は省略して、見やすく整えています。

```text
{
  "dataset": { "id": "hI6jK7lM8n", "name": "Sales Orders", "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n" },
  "columns": [ { "name": "region", "type": "string" }, { "name": "n", "type": "integer" } ],
  "rows": [ ["Kanto", 7814], ["Kinki", 3890], ["Chubu", 3779], ["Kyushu-Okinawa", 2418], ["Tohoku", 1592] ],
  "result": { "row_count": 5, "has_more": true },
  "warnings": [ { "code": "RESULT_TRUNCATED", "message": "Additional rows exist. Refine the query." } ]
}
```

件数の多い順に 5 地域が返りました。上限（`--limit` 5）で切ったので、result.has_more が true になり、RESULT_TRUNCATED の警告が付いています。残りの地域も見るときは、`--limit` を増やすか、条件で絞り込みます。

#### 全体の行数を数える

**ターミナル**

```sh
expl server dataset query <dataset_id> --mode aggregate --metrics '[{"function":"count_rows","alias":"n"}]' --json
```

dimensions を省くと、全体の 1 行が返ります。

**実行結果**

Sales Orders のデータ（id: hI6jK7lM8n）で実行した結果です。長い項目は省略して、見やすく整えています。

```text
{
  "dataset": { "id": "hI6jK7lM8n", "name": "Sales Orders", "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n" },
  "columns": [ { "name": "n", "type": "integer" } ],
  "rows": [ [23131] ],
  "result": { "row_count": 1, "has_more": false },
  "warnings": []
}
```

全体の行数は 23,131 行でした。

<a id="dataset-query-output"></a>
<a id="dataset-query-paging"></a>

### 出力と上限

結果は正確で、データのバージョン（dataset.version）と更新時刻（dataset.updated_at）が付きます。どのバージョンのデータで計算したかを、数値といっしょに伝えてください。結合したときは、元のデータ、出力の列の出どころ、結合の前後の行数も付きます。

ページ送りはありません。結果の has_more が true のときは、絞り込むか、集計します。多くの行がほしいときは、dataframe export でファイルにします。

<a id="dataset-query-trouble"></a>

### トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| Each dimension must be an object like `{ "column": "region" }`. (INVALID_QUERY) | dimensions は、`{ "column": "列の名前" }` の形のオブジェクトの配列にします。 |
| columns is required in rows mode. (INVALID_QUERY) | rows モードでは、返す列を `--columns` で指定します。 |
| Unknown property "aggregation" in a metric. (INVALID_AGGREGATION) | metrics では、function と alias を指定します。count_rows 以外は column も指定します。 |
| alias is required: letters, digits and underscores, not starting with a digit, at most 64 characters. (INVALID_AGGREGATION) | alias は必須です。英字、数字、_ だけで、数字で始めず、64 文字までにします。 |
| Unknown property "by" in a sort entry. (INVALID_SORT) | sort の項目では、出力の列の名前を field で指定します。column、by、alias、name、metric は使えません。 |
| DATASET_UNAVAILABLE | このデータは、全データを含めずに公開されているため、サーバーでは問い合わせできません。公開した人が、最新のバージョンの Exploratory Desktop でデータを公開し直す必要があります。 |
| `Run "expl server login".` | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

関連: [expl server dataframe get-schema](#dataframe-get-schema)、[expl server dataframe export](#dataframe-export)

<a id="dataframe-export"></a>

## expl server dataframe export

データへの問い合わせの結果を、CSV か Parquet のファイルにして、ダウンロードリンクを返します。

<a id="dataframe-export-usage"></a>

### 書式

```text
expl server dataframe export <dataset_id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="dataframe-export-flags"></a>

### 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--dataset-id` | 文字列 | 必須 | データの id です。検索結果などに出ます。コマンドのすぐあとに書くか、`--dataset-id` で渡します。 |
| `--format` | 文字列 |  | ファイルの形式です。既定は csv です（UTF-8 の BOM つきで、Excel で正しく開けます）。値: `csv`, `parquet` |
| `--mode` | 文字列 | 必須 | rows: 条件に合う行を書き出します。aggregate: dimensions でグループに分けて、metrics を計算した結果を書き出します。値: `rows`, `aggregate` |
| `--columns` | 値の配列 |  | rows だけで使います。書き出す列の名前を、1〜50 個、重ならないように指定します。省くと、すべての列を書き出します。 |
| `--filters` | JSON |  | 絞り込みの条件です。条件 1 つか、`{ "and": [...] }` か `{ "or": [...] }`（各 2 つ以上）で書きます。入れ子は 3 段まで、条件は全体で 20 個までです。 |
| `--dimensions` | JSON |  | aggregate だけで使います。グループに分ける列を、0〜5 個指定します。 |
| `--metrics` | JSON | aggregate のときは必須 | aggregate だけで使い、必須です。計算を 1〜10 個指定します。 |
| `--sort` | JSON |  | 並べ替えです。3 つまで指定します。 |
| `--limit` | 整数 |  | 書き出す行数の上限です。 |

<a id="dataframe-export-json-arguments"></a>

### JSON の引数

filters、metrics、sort の JSON の形は、[dataset query の説明](#dataset-query-json-arguments)を参照してください。

<a id="dataframe-export-examples"></a>

### 例

#### 行をファイルにする

**ターミナル**

```sh
expl server dataframe export <dataset_id> --mode rows --limit 5 --json
```

\<dataset_id\> は、データの id に置き換えます。公開した人がファイルとしての取得を許していないデータでは、DATA_EGRESS_LIMIT で失敗します。

実行結果は、データ Sales Orders（id が hI6jK7lM8n）で実行したものです。download_url はファイルへのリンクです（ここでは省略しています）。expires_at の時刻に無効になります。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "hI6jK7lM8n",
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
  "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n"
}
```

<a id="dataframe-export-output"></a>
<a id="dataframe-export-paging"></a>

### 出力と上限

15 分で切れるダウンロードリンクが返ります。リンクを使えるのは、サインインしている本人だけです。ファイルの保存先は `--output` で指定できます。

ページ送りはありません。結果が大きすぎて dataset query で読めないときに、このコマンドを使います。

<a id="dataframe-export-trouble"></a>

### トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| DATA_EGRESS_LIMIT | 公開した人が、このデータをファイルとしてダウンロードすることを許していません。fetch か dataframe get-schema で、公開した人が共有している内容を読みます。URL をブラウザで開く方法もあります。 |
| SERVER_BUSY | ほかの書き出しが実行中か、1 時間あたりの書き出しの上限に達しています。1 人のユーザーが同時に実行できる書き出しは 1 つです。数秒おいてから再度実行し、上限に達した場合は最大 1 時間待ちます。 |
| `Run "expl server login".` | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

関連: [expl server dataset query](#dataset-query)、[expl server dataframe preview](#dataframe-preview)

<a id="dataframe-get-wrangling"></a>

## expl server dataframe get-wrangling

公開されたデータがどのように作られたかを調べます。データ加工のステップを順番に、読み込んだデータと結合したデータ、列ごとにどのステップが作ったか、変えたかを返します。

<a id="dataframe-get-wrangling-usage"></a>

### 書式

```text
expl server dataframe get-wrangling <id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="dataframe-get-wrangling-flags"></a>

### 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 | 必須 | データの id です。検索結果などに出ます。コマンドのすぐあとに書くか、`--id` で渡します。 |
| `--steps` | 値の配列 |  | 詳しく返すステップの ref（概要に出る s3 など）です。1〜20 個で、重ならないように指定します。`--column` とは一緒に使えません。 |
| `--column` | 文字列 |  | 最終的なデータのこの列を作ったステップ、変えたステップだけを、詳しく返します。列の名前は正確に書きます。`--steps` とは一緒に使えません。 |
| `--include-scripts` | 真偽値 | `--steps` か `--column` のときだけ | ステップの R のコードも返します。行の共有が許されているデータだけです。 |
| `--cursor` | 文字列 | `--steps`、`--column` とは一緒に使えません | 1 回の結果に収まらなかった概要の続きを取得するときに、前の結果の range.next_cursor を渡します。 |
| `--language` | 文字列 |  | 説明と定義を読む言語です。指定しないと、データの元の言語になります。値: `ja`, `en` |

<a id="dataframe-get-wrangling-examples"></a>

### 例

#### 概要を見る

**ターミナル**

```sh
expl server dataframe get-wrangling <id> --json
```

\<id\> は、データの id に置き換えます。

#### 1 つの列を作ったステップを見る

**ターミナル**

```sh
expl server dataframe get-wrangling <id> --column "order_date" --json
```

order_date は、最終的なデータの列の名前に置き換えます。

<a id="dataframe-get-wrangling-output"></a>
<a id="dataframe-get-wrangling-paging"></a>

### 出力と上限

`--steps` も `--column` も付けないと、結果は概要です。概要には、全体の説明、すべてのステップを順に 1 行ずつ（種類、ラベル、何をするか）、読み込んだデータと結合したデータ、列ごとにどのステップが作ったか、変えたかの索引が入ります。ステップを詳しく見るには（完全な説明、式、フィルターの条件や結合のキーなどの設定）、`--steps`（概要に出る ref）か `--column` を付けて、もう一度実行します。ref は、データの今のバージョンでだけ有効です。

全体の説明は AI が書いたもので、人は確認していません。引用するときは、そのことを伝えてください。所有者が承認した加工の説明は、dataframe get-schema のセマンティクスで読みます。

1 回の結果に収まらない概要は、`--cursor` で続きを取得します。ステップを読めないときは、結果にその理由が入ります。データを公開したときに記録されていなかった、所有者が共有していない、公開した人がデータの行を共有していない、のいずれかです。

<a id="dataframe-get-wrangling-trouble"></a>

### トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| Use either steps or column, not both. (INVALID_PARAMETER) | `--steps` と `--column` は、どちらか一方だけを渡します。 |
| include_scripts works only together with steps or column. (INVALID_PARAMETER) | `--include-scripts` を使うときは、`--steps` か `--column` も付けます。 |
| cursor belongs to an older version of this data. Call again without cursor. (INVALID_PARAMETER) | データが公開し直されています。`--cursor` を付けずに、もう一度実行します。 |
| `Run "expl server login".` | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

関連: [expl server dataframe get-schema](#dataframe-get-schema)、[expl server dataset query](#dataset-query)

<a id="chart-get-data"></a>

## expl server chart get-data

チャートのデータを、数値の意味とあわせて取得します。

<a id="chart-get-data-usage"></a>

### 書式

```text
expl server chart get-data <id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="chart-get-data-flags"></a>

### 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 | 必須 | チャートを含むノート、ダッシュボード、スライドの id です。チャート単体で公開したものは、その id です。コマンドのすぐあとに書くか、`--id` で渡します。 |
| `--chart` | 文字列 | ノート、ダッシュボード、スライドの中のものを取るときは必須 | ノート、ダッシュボード、スライドの中のチャートの名前です。fetch の結果の metadata.charts\[\].name にあります。 |
| `--offset` | 整数 |  | 読み飛ばす行数です。0 から数えます。 |
| `--limit` | 整数 |  | 返す行数です。100 までです。 |

<a id="chart-get-data-examples"></a>

### 例

#### チャートの先頭の 5 行を取得する

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

<a id="chart-get-data-output"></a>
<a id="chart-get-data-paging"></a>

### 出力と上限

チャートの行に加えて、数値の意味が付きます。chart.encoding（棚ごとの列、集計方法、数値の形式）、chart.filters、chart.data_granularity（集計済みか、行ごとか）、chart.unsupported（返せないもの）、context（公開時点、データの時点、パラメーターの値）です。数値は公開されたときの値で、ブラウザでパラメーターを変えた結果は取れません。チャート単体で公開したものは、集計値でもチャート全体の値でもなく、描画に使った行のサンプル（最大 1 万行）なので、足し合わせて合計にしないでください。

offset に、すでに読んだ行数を渡すと、続きを読めます。1 回に取得できるのは 100 行までです。

<a id="chart-get-data-trouble"></a>

### トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| 合計、並べ替え、絞り込みをしたい | chart query を使います。 |
| DATA_EGRESS_LIMIT | 公開した人が、このデータの行を共有していません。チャート、アナリティクス、要約を使います。 |
| `Run "expl server login".` | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

関連: [expl server chart query](#chart-query)、[expl server chart get-image](#chart-get-image)

<a id="chart-get-image"></a>

## expl server chart get-image

チャートの画像（PNG）を取得します。形、傾向、配置を確認するための機能です。

<a id="chart-get-image-usage"></a>

### 書式

```text
expl server chart get-image <id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="chart-get-image-flags"></a>

### 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 | 必須 | チャートを含むノート、ダッシュボード、スライドの id です。チャート単体で公開したものは、その id です。コマンドのすぐあとに書くか、`--id` で渡します。 |
| `--chart` | 文字列 | ノート、ダッシュボード、スライドの中のものを取るときは必須 | ノート、ダッシュボード、スライドの中のチャートの名前です。fetch の結果の metadata.charts\[\].name にあります。 |

<a id="chart-get-image-examples"></a>

### 例

#### チャートの画像を取得する

**ターミナル**

```sh
expl server chart get-image <id> --chart <chart> --json
```

\<id\> はノートなどの id、\<chart\> は fetch の結果にあるチャートの名前に置き換えます。

出力の形を示す例で、値は説明用です。ダッシュボード pQ9rS0tU1v のチャート qR0sT1uV（Monthly Sales Trend）の例です。画像の保存先を示す image_path の行は省略しています。公開時に画像が保存されていないチャートは、NOT_FOUND（"This chart has no stored image"）になります。その場合は chart get-data を使います。

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
      "data_as_of": "2026-11-14T22:02:21.534Z",
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
    "The data was refreshed at 2026-11-14T22:02:21.534Z, after this image was captured at 2026-11-12T09:26:51.086Z. The image may not show the current numbers; use chart_get_d…"
  ],
  "url": "https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v"
}
```

<a id="chart-get-image-output"></a>
<a id="chart-get-image-paging"></a>

### 出力と上限

画像は、公開したときに保存されたもので、描き直されません。そのため、データより古いことがあります。結果の result.image.may_be_stale で確かめます。画像は、expl を動かしているコンピューターに保存され、結果の image_path がその場所を示します。保存先は `--output` で指定できます。正確な数値は、画像ではなく chart get-data で読みます。

ページ送りはありません。

<a id="chart-get-image-trouble"></a>

### トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| may_be_stale の警告が出る | 画像が、データの更新より古い可能性があります。最新の数値は chart get-data で確認します。警告は標準エラーに出ます。 |
| `Run "expl server login".` | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

関連: [expl server chart get-data](#chart-get-data)

<a id="analytics-get-result"></a>

## expl server analytics get-result

アナリティクス（回帰、相関、カイ二乗検定など）の結果を、プログラムで扱える形式のデータで取得します。

<a id="analytics-get-result-usage"></a>

### 書式

```text
expl server analytics get-result <id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="analytics-get-result-flags"></a>

### 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 | 必須 | アナリティクスを含むノート、ダッシュボード、スライドの id です。アナリティクス単体で公開したものは、その id です。コマンドのすぐあとに書くか、`--id` で渡します。 |
| `--analytics` | 文字列 | ノート、ダッシュボード、スライドの中のものを取るときは必須 | ノート、ダッシュボード、スライドの中のアナリティクスの名前です。fetch の結果の metadata.blocks\[\].name にあります。 |
| `--tables` | 値の配列 |  | 返す表の id のリストです（available_tables\[\].id）。指定しないと、分析の答えになる表を返します。 |
| `--limit` | 整数 |  | 表ごとの行数の上限です。100 までです。 |

<a id="analytics-get-result-examples"></a>

### 例

#### アナリティクスの結果を取得する

**ターミナル**

```sh
expl server analytics get-result <id> --analytics <analytics> --limit 3 --json
```

\<id\> はノートなどの id、\<analytics\> は fetch の結果にあるアナリティクスの名前に置き換えます。

実行結果は、単独で公開されているアナリティクス Analytics 1 - Correlations（id が Analytics-1-Correlations-aB1cD2eF）で実行したものです。単独で公開されているため、`--analytics` は指定していません。長い出力は省略しています。この例では、説明文は空にしています。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "Analytics-1-Correlations-aB1cD2eF",
    "type": "analytics",
    "title": "Analytics 1 - Correlations"
  },
  "summary": "Result of do_cor \"Analytics 1\": 1 table(s) (heatmap).",
  "result": {
    "analytics_id": "uV0wX1yZ",
    "analysis_type": "do_cor",
    "has_result": true,
    "model_definition": {
      "target": null,
      "predictors": [],
      "columns": [
        "Sales",
        "Quantity",
        "Discount"
      ],
      "n": null
    },
    "tables": {
      "heatmap": {
        "name": "Correlations",
        "headers": [
          "pair.name.x",
          "pair.name.y",
          "correlation"
        ],
        "columns": [
          {
            "id": "pair.name.x",
            "label": "pair.name.x"
          },
          {
            "id": "pair.name.y",
            "label": "pair.name.y"
          },
          {
            "id": "correlation",
            "label": "correlation"
          }
        ],
        "split_column": null,
        "rows": [
          [
            "Sales",
            "Sales",
            1
          ],
          [
            "Sales",
            "Sales Comp",
            0.76782797841
          ],
          [
            "Sales",
            "Marketing",
            0.75210090599
          ]
        ],
        "total_row_count": 25,
        "rows_truncated": true,
        "row_level": false
      }
    },
    "row_level": false,
    "summary_fields": {
      "baseline_p": 0.05,
      "baseline_p_pct": 5
    },
    "available_tables": [
      {
        "id": "heatmap",
        "name": "Correlations",
        "marker": "heatmap",
        "included": true,
        "row_level": false
      },
      {
        "id": "significance",
        "name": "Significance",
        "marker": "scatter",
        "included": false,
        "row_level": true
      },
      {
        "id": "scattermatrix",
        "name": "Scatter Matrix",
        "marker": "scattermatrix",
        "included": false,
        "row_level": true
      }
    ],
    "precision": "as_displayed",
    "title": "Analytics 1",
    "settings": {
      "target": null,
      "predictors": [],
      "params": {
        "columns": [
          "Sales",
          "Quantity",
          "Discount"
        ],
        "method": "pearson",
        "variable_order": "correlation",
        "distinct": "FALSE",
        "diag": "TRUE",
        "distinct_p_value": "TRUE",
        "diag_p_value": "FALSE"
      },
      "source": {
        "step": "MariaDB_MySQL_Source1"
      },
      "filters": []
    },
    "texts": [],
    "unsupported": [],
    "context": {
      "publication_version": "2025-06-05T12:17:37.781Z",
      "data_as_of": "2026-11-14T15:01:23.274Z",
      "parameters": {
        "applied": true,
        "values": [
          {
            "name": "Shipmodes",
            "display_name": "Shipmodes（This will not affect SQL）",
            "value": [
              "Same Day",
              "Second Class",
              "Standard Class"
            ]
          }
        ],
        "note": "Values as published. A viewer who changes the parameters in the browser sees different results."
      },
      "dashboard_filters": "none"
    }
  },
  "warnings": [],
  "url": "https://exploratory.io/viz/exploratory/Analytics-1-Correlations-aB1cD2eF"
}
```

<a id="analytics-get-result-output"></a>
<a id="analytics-get-result-paging"></a>

### 出力と上限

モデルの定義（目的変数、説明変数、N）、安定した列 id を持つ結果の表、学習用とテスト用に分けた主要な統計量、実行したときの設定、説明の文が入ります。説明の文には、数値から作ったものか、AI が作ったものかの印が付きます。数値は表示されたとおりの桁で、係数は標準化されていません。

表ごとの行数を `--limit` で絞れます。ページ送りはありません。

<a id="analytics-get-result-trouble"></a>

### トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| アナリティクスの名前が分からない | fetch の結果の metadata.blocks を確認します。 |
| `Run "expl server login".` | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

関連: [expl server fetch](#fetch)

<a id="chart-query"></a>

## expl server chart query

ノート、ダッシュボード、スライドに含まれるチャートのデータを、サーバーで絞り込み、集計して、結果だけを返します。

<a id="chart-query-usage"></a>

### 書式

```text
expl server chart query [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="chart-query-flags"></a>

### 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 | queries を使わないときは必須 | チャートを含むノート、ダッシュボード、スライドの id です。検索結果や fetch の結果に出ます。 |
| `--chart` | 文字列 | queries を使わないときは必須 | チャートの名前です。fetch の結果の metadata.charts\[\].name にあります（英数字、_、-）。 |
| `--mode` | 文字列 | queries を使わないときは必須 | rows: 条件に合う行を取得します。aggregate: dimensions でグループに分けて、metrics を計算します。値: `rows`, `aggregate` |
| `--columns` | 値の配列 |  | rows だけで使います。返す列の名前を、1〜50 個、重ならないように指定します。 |
| `--filters` | JSON |  | 絞り込みの条件です。条件 1 つか、`{ "and": [...] }` か `{ "or": [...] }`（各 2 つ以上）で書きます。入れ子は 3 段まで、条件は全体で 20 個までです。 |
| `--dimensions` | JSON |  | aggregate だけで使います。グループに分ける列を、0〜5 個指定します。保存されている値のまま分けるので、日付から月や年を取り出してグループ化する指定はありません。指定しないと、全体で 1 行になります。 |
| `--metrics` | JSON | aggregate のときは必須 | aggregate だけで使い、必須です。計算を 1〜10 個指定します。 |
| `--sort` | JSON |  | 並べ替えです。3 つまで指定します。 |
| `--limit` | 整数 |  | 返す行数の上限です。rows は既定 100、最大 1,000。aggregate は既定 100、最大 500 です。ページ送りはありません。 |
| `--queries` | JSON |  | 独立した問い合わせを、1 回の呼び出しにまとめます。10 件までです。各問い合わせは、id、chart と、単独の問い合わせと同じ項目を持ちます。 |

<a id="chart-query-json-arguments"></a>

### JSON の引数

filters、metrics、sort の JSON の形は、[dataset query の説明](#dataset-query-json-arguments)を参照してください。チャートの問い合わせでは結合の指定は使いません。

<a id="chart-query-examples"></a>

### 例

#### チャートのデータを集計する

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

<a id="chart-query-output"></a>
<a id="chart-query-paging"></a>

### 出力と上限

対象は、公開されたとおりのチャートの表です。チャートがすでに集計した値が入っています。総計や小計の行は表に入らず、result.excluded_totals に入ります。全体の値がほしいときは、行を足し合わせず、excluded_totals を使います。すでに平均、重複を除いた件数、比率にした列を足し合わせたり平均したりすると、警告 CHART_REAGGREGATION が付きます。そのときは、警告を伝えるか、excluded_totals を使います。数値を伝えるときは、チャートの集計方法、chart.filters、context.parameters、context.data_as_of もいっしょに伝えます。

ページ送りはありません。結果の has_more が true のときは、絞り込むか、集計します。

<a id="chart-query-trouble"></a>

### トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| CHART_REAGGREGATION | チャートがすでに集計した列を、さらに集計しています。警告を伝えるか、result.excluded_totals を使います。 |
| `Run "expl server login".` | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

関連: [expl server chart get-data](#chart-get-data)、[expl server chart get-image](#chart-get-image)

<a id="desktop-mcp-setup-guide"></a>

## expl server desktop mcp-setup-guide

Exploratory Desktop に AI ツールをつなぐための、手順とリンクを返します。

<a id="desktop-mcp-setup-guide-usage"></a>

### 書式

```text
expl server desktop mcp-setup-guide [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="desktop-mcp-setup-guide-flags"></a>

### 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--client` | 文字列 |  | 使っている MCP クライアントです。省くと、すべてのクライアントの手順が返ります。値: `claude_code`, `codex`, `cursor`, `antigravity` |

<a id="desktop-mcp-setup-guide-examples"></a>

### 例

#### 手順を取得する

**ターミナル**

```sh
expl server desktop mcp-setup-guide --json
```

長い出力は省略しています。結果には、使うための条件、クライアントごとのインストールのコマンド、Grok Bot の手順が含まれます。ここでは先頭のクライアントだけを載せています。

**実行結果**

```text
{
  "summary": "Install the Exploratory Desktop plugin (exploratory@exploratory) from our GitHub marketplace (exploratory-io/exploratory). It registers exploratory-desktop for local projects on the user's computer. Exploratory Desktop v17 or later must be running for every De…",
  "links": {
    "plugin": "https://github.com/exploratory-io/exploratory",
    "install": "https://github.com/exploratory-io/exploratory#install"
  },
  "install": [
    {
      "client": "Claude Code",
      "installs": "The exploratory-desktop MCP server, Desktop skills and Claude-only hooks from our GitHub marketplace.",
      "commands": [
        "claude plugin marketplace add exploratory-io/exploratory",
        "claude plugin install exploratory@exploratory"
      ],
      "after": "Start a new session and check exploratory-desktop in /mcp. Server sign-in is not needed for Desktop."
    }
  ]
}
```

<a id="desktop-mcp-setup-guide-output"></a>
<a id="desktop-mcp-setup-guide-paging"></a>

### 出力と上限

手順とリンクを返すだけです。インストールも実行もしません。Desktop も操作しません。

ページ送りはありません。

<a id="desktop-mcp-setup-guide-trouble"></a>

### トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| `Run "expl server login".` | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

関連: [サインイン](/ja/cli/server/login)

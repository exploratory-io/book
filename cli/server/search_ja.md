# expl server search

閲覧できるコンテンツを、タイトル、説明、タグで探します。検索語がなければ、新しい順に一覧します。

<a id="examples"></a>

## 例

### 言葉で探す

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

### 自分のコンテンツを一覧する

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
      "id": "COVID-19-Infected-Cases-Death-Data-Worldwide-nO6pQ7rS8t",
      "title": "World Wide COVID-19 Data by Johns Hopkins (JHU CCSE)",
      "url": "https://exploratory.io/data/aB3cD4eF5g/COVID-19-Infected-Cases-Death-Data-Worldwide-nO6pQ7rS8t",
      "type": "data",
      "description": "#### English This data is about the COVID-19 infection and death numbers for all the countries around the world. it is originally published and shared by Johns Hopkins Un…",
      "author": "山田 花子",
      "team": null,
      "updated_at": "2026-11-14T15:13:52.790Z",
      "refreshed_at": "2026-11-14T15:13:53.053Z",
      "tags": [
        "covid19",
        "covid-19"
      ],
      "publication_version": "2021-04-08T00:30:28.931Z",
      "data_as_of": "2026-11-14T15:13:53.053Z",
      "columns": [
        {
          "name": "Country/Region",
          "type": "character",
          "description": "国/地域",
          "missing_count": 0
        },
        {
          "name": "Date",
          "type": "Date",
          "description": "日付",
          "missing_count": 0
        }
      ],
      "column_count": 5,
      "row_count": 229743
    }
  ],
  "has_more": true,
  "next_offset": 50,
  "hint": "To read a dashboard or note: fetch it, then use chart_query for totals, rankings and comparisons."
}
```

<a id="usage"></a>

## 書式

```text
expl server search [<query>] [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="flags"></a>

## 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--query` | 文字列 |  | 検索語です。コマンドのすぐあとに書くか、--query で渡します。タイトル、説明、タグに一致します。空（または \*）にすると、条件に合うものを新しい順に一覧します。続きがある場合は、ページを分けて取得します。 |
| `--type` | 文字列 |  | 探すコンテンツの種類です。 値: `all`, `note`, `dashboard`, `slide`, `chart`, `analytics`, `data` |
| `--scope` | 文字列 |  | all: 閲覧できるものすべて。mine: 自分のもの。shared: 自分に共有されたもの。team: 1 つのチームのもの。 値: `all`, `mine`, `shared`, `team` |
| `--team` | 文字列 | --scope team のときは必須 | チームの名前です。 |
| `--semantic` | 有効 / 無効 |  | キーワードの一致ではなく、意味が近いものを探します。 |
| `--limit` | 整数 |  | 返す件数の上限です。50 までです。 |
| `--offset` | 整数 |  | 読み飛ばす件数です。続きを取得するときに使います。 |

<a id="paging"></a>

## 続きを取得する

結果の has_more が true のときは、next_offset の値を --offset に渡すと、次のページを取得できます。

<a id="output"></a>

## 出力

結果には、コンテンツの id と URL が入ります。id は、fetch などほかのコマンドに渡します。データのコンテンツには、列の名前と型、行数も入ります。既定では人が読みやすい形で、--json を付けると JSON になります。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| Too big: expected number to be \<=50 at limit | --limit を 50 以下にします。 |
| Run "expl server login". | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

---
title: "データを集計する"
---

公開されたデータの列を確認し、サーバーで絞り込み、集計します。

<a id="pick"></a>

## データを選ぶ

データのコンテンツは、`--type` data で探します。結果には、列の名前と型、行数も出ます。

```sh
expl server search "sales" --type data --json
```

結果に出た id を控えます。以降のコマンドで使います。

<a id="schema"></a>

## 列を確認する

集計の前に、列の名前と型を確認します。名前は、1 文字も違わずに書く必要があります。

```sh
expl server dataframe get-schema <id> --detail light --json
```

\<id\> は、データの id に置き換えます。`--detail` light は、列の名前と型、行数だけを返します。

行の中身を見たいときは、先頭の数行を取得します。

```sh
expl server dataframe preview <id> --limit 3 --json
```

公開した人が全データを含めていないときは、返る行は公開時に保存したサンプルです。合計や絞り込みは、サンプルではなく、次の dataset query で行います。

<a id="query"></a>

## 絞り込みと集計

次の例は、region 列の値ごとに sales 列の合計を求め、大きい順に 5 件を返します。

```sh
expl server dataset query <dataset_id> --mode aggregate --dimensions '[{"column":"region"}]' --metrics '[{"function":"sum","column":"sales","alias":"sales"}]' --sort '[{"field":"sales","direction":"desc"}]' --limit 5 --json
```

\<dataset_id\> はデータの id、region は実際の列の名前に置き換えます。実行結果は、id が hI6jK7lM8n のデータ（Sales Orders）で、地域ごとの売上を合計したものです。

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

- `--mode` aggregate は、`--dimensions` でグループに分け、`--metrics` を計算します。
- `--mode` rows は、条件に合う行を取得します。`--columns` で返す列を指定します。
- rows は最大 1,000 行、aggregate は最大 500 行です。続きを取得する指定はありません。結果の has_more が true なら、絞り込むか、集計します。
- 結果には、データのバージョンと更新時刻が含まれます。数値を人に伝えるときは、いつのデータで計算したかも伝えます。

条件に合う行を取得するときは、`--mode` rows を使います。`--columns` が必要で、`--filters` で行を絞り込みます。次の例は、region が Kanto の行について、2 つの列を返します。

```sh
expl server dataset query <dataset_id> --mode rows --columns '["region","sales"]' --filters '{"column":"region","operator":"eq","value":"Kanto"}' --limit 10 --json
```

operator は比較の方法です。データごとに使える operator は、`expl server dataframe get-schema <id> --detail` full の結果にあります。複数の条件を組み合わせる方法は、[フィルタ条件](/ja/cli/server/commands#dataset-query-json-arguments)を参照してください。

結果が大きすぎる場合は、dataframe export で CSV または Parquet のファイルにします。複数のデータを結合する方法は、[dataset query](/ja/cli/server/commands#dataset-query) のページを参照してください。

<a id="json"></a>

## JSON で渡す引数の書き方

JSON は、データを書くための決まった形の文字列です。dimensions、metrics、sort などは、JSON で渡します。JSON 全体を単引用符（'）で囲み、中の文字列は二重引用符（"）で囲みます。

| フラグ | 形 | 意味 |
| --- | --- | --- |
| `--dimensions` | \[`{"column":"region"}`\] | region 列の値ごとにグループに分けます。 |
| `--metrics` | \[`{"function":"sum","column":"sales","alias":"sales"}`\] | sales 列の合計を求め、結果の名前を sales にします。 |
| `--sort` | \[`{"field":"sales","direction":"desc"}`\] | 出力の列 sales を、大きい順に並べます。 |

metrics の alias は必須です。英字、数字、_ だけで、数字で始めず、64 文字までです。sort では、出力の列の名前を field で指定します。

書き方を間違えたときの表示と、直し方です。

| 症状 | 対処 |
| --- | --- |
| Each dimension must be an object like `{ "column": "region" }`. (INVALID_QUERY) | dimensions は、`{ "column": "列の名前" }` の形のオブジェクトの配列にします。 |
| Unknown property "aggregation" in a metric. (INVALID_AGGREGATION) | metrics では、function と alias を指定します。 |
| alias is required: letters, digits and underscores, not starting with a digit, at most 64 characters. (INVALID_AGGREGATION) | alias を追加します。使用できる文字と長さは、上記のとおりです。 |
| Unknown property "by" in a sort entry. (INVALID_SORT) | 出力の列の名前を、field で指定します。column、by、alias、name、metric は使えません。 |

<a id="unavailable"></a>

## 問い合わせできないデータ

全データを含めずに公開されたデータは、サーバーでは問い合わせできません。dataset query は、次のエラーで失敗します。

| 症状 | 対処 |
| --- | --- |
| DATASET_UNAVAILABLE | 公開した人が、最新のバージョンの Exploratory Desktop でデータを公開し直す必要があります。 |

検索結果や `--detail` light の結果では、問い合わせできるかどうかは分かりません。`--detail` full で、結果の query.available が false になっていないかを確認します。

```sh
expl server dataframe get-schema <id> --detail full --json
```

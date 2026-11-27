---
title: "はじめる"
---

expl をインストールし、サインインして、公開されたコンテンツを検索して読みます。次の手順を順に行うと、このページ 1 つで最初の結果まで進めます。

<a id="steps"></a>

## 手順

### 1. インストールする

Exploratory Desktop をお使いの場合、expl は同梱されています。お使いでない場合は、npm でインストールします。Node.js 20 以降が必要です。

```sh
npm install -g @exploratory/cli
```

最新のバージョンがインストールされます。新しいターミナルを開いて、確認します。

```sh
expl --version
```

> 1 行目が expl \<version\> と表示されれば、インストールは完了しています。

そのほかのインストール方法や、2 つ入っているときの確認は、[インストール](/ja/cli/server/install)を参照してください。

### 2. サインインする

```sh
expl server login
```

ブラウザが開きます。Exploratory にサインインして、アクセスを許可します。

```sh
expl server status
```

サーバー、ユーザー、サインインの方法を表示します。login のあとに「Logged in to exploratory.io as …」と表示されていれば、サインインできています。

### 3. 探す

検索語を、コマンドのすぐあとに書きます。このように、フラグの名前を付けずに書く値を位置引数と呼びます。

```sh
expl server search "Sales Orders" --scope all --type data
```

`--scope` all は、自分のコンテンツに加えて、ほかの人が公開したコンテンツも検索します。`--type` data は、結果をデータだけに絞り込みます。結果が空のときは、該当するものがなかったということで、サインインのエラーではありません。ノートを探すときは、`--type` note を使います。

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

\<id\> は、検索結果に表示された id に置き換えます。`--json` を付けると、サーバーの結果を JSON のまま出力します。実行結果の ID・URL・人名は、説明用に置き換えています。長い出力は省略しているので、次の JSON は抜粋で、完全な JSON ではありません。

**実行結果**

```text
{
  "id": "hI6jK7lM8n",
  "title": "Sales Orders",
  "text": "# Sales Orders\n\nRows (total): 23,131\n\n## Columns\n\n| name | type | description |\n| --- | --- | --- |\n| order_id… (trimmed)",
  "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n",
  "metadata": { … (trimmed) }
}
```

結果には、本文が含まれます。ノート、ダッシュボード、スライドでは、長さや指定によって、見出しの一覧（metadata.toc）も含まれます。ない場合は、`--include-toc` を付けて返すか、`--query` で見出しの id を調べます。

### 5. 集計する（任意）

データのコンテンツでは、まず列の名前と型を確認します。

```sh
expl server dataframe get-schema <id> --detail light --json
```

\<id\> は、データの id に置き換えます。実行結果の ID・URL・人名は、説明用に置き換えています。長い出力は省略しています。

**実行結果**

```text
{
  "success": true,
  "item": { "id": "hI6jK7lM8n", "type": "data", "title": "Sales Orders" },
  "summary": "14 columns, 23131 rows.",
  "result": { "row_count": 23131, "columns": [ … (trimmed) ] }
}
```

列の名前がわかったら、集計します。次の例は、region 列の値ごとに sales 列の合計を求め、大きい順に並べます。

```sh
expl server dataset query <dataset_id> --mode aggregate --dimensions '[{"column":"region"}]' --metrics '[{"function":"sum","column":"sales","alias":"sales"}]' --sort '[{"field":"sales","direction":"desc"}]' --limit 5 --json
```

\<dataset_id\> はデータの id、region は実際の列の名前に置き換えます。JSON は、全体を単引用符（'）で囲みます。実行結果の ID・URL・人名は、説明用に置き換えています。結果は、Sales Orders データで地域ごとの売上（sales）を合計したものです。値は、Sales Orders Dashboard の Sales by Region と一致します。

**実行結果**

```text
{
  "dataset": { "id": "hI6jK7lM8n", "name": "Sales Orders", … (trimmed) },
  "columns": [ { "name": "region", "type": "string" }, { "name": "sales", "type": "float" } ],
  "rows": [ [ "Kanto", 148695040 ], [ "Kinki", 74050840 ], … (trimmed) ],
  "result": { "row_count": 5, "has_more": true }
}
```

結果には、データのバージョンと更新時刻が含まれます。いつのデータで集計したかも、あわせて確認してください。

<a id="trouble"></a>

## うまくいかないとき

- 検索結果が空です: 該当するものがなかったということで、サインインのエラーではありません。検索語を変えるか、`--scope` all を付けます。
- ブラウザを開けません: ブラウザのないスクリプトや CI では、代わりに API キーでサインインします（`expl server login --with-token`。[API キー](/ja/cli/server/token)を参照）。ブラウザを開けないマシンでは、[サインイン](/ja/cli/server/login#nobrowser)を参照してください。
- `Run "expl server login".` と表示されます: サインインしていないか、保存したログイン情報が拒否されています。expl server login を実行します。
- expl: command not found と表示されます: 新しいターミナルを開いて、もう一度試します。
- どの id を使えばよいか分かりません: 検索結果に表示された id を使います。
- ノートで見出しの一覧（metadata.toc）が出ません: `--include-toc` を付けるか、`--query` で見出しの id を調べます。

詳しくは[トラブルシューティング](/ja/cli/server/troubleshooting)を参照してください。

<a id="next"></a>

## 次に読むもの

- [ノートを読む](/ja/cli/server/guides/read-notes) - 長いノートの読み方と、チャートの数値の取り方です。
- [データを集計する](/ja/cli/server/guides/query-data) - JSON で渡す引数の書き方です。
- [自動処理](/ja/cli/server/guides/automation) - API キーを作成し、CI で実行します。
- [使い方](/ja/cli/server/use) - やりたいことからコマンドを探します。
- [トラブルシューティング](/ja/cli/server/troubleshooting) - 症状から対処を探します。

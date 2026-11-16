# Exploratory CLI: Server

expl server は、exploratory.io にパブリッシュされたノート、ダッシュボード、データを、ターミナルから読むコマンドです。

<a id="target"></a>

## 対象

> このページは Exploratory Server のみを対象にします。Exploratory Desktop については、[CLI Desktop](../desktop/desktop_ja.md) と [MCP Desktop](../../mcp/desktop/desktop_ja.md) を参照してください。
>
> AI アプリからつなぐなら [MCP Server](../../mcp/server/server_ja.md)。

<a id="start"></a>

## はじめる

### 1. インストールする

Exploratory Desktop をお使いの場合、expl はアプリに同梱されています。Desktop を使用しない場合は、npm（Node.js のパッケージ管理コマンド）でインストールします。

#### Desktop に同梱されているもの

```sh
expl --version
```

#### npm でインストールする

```sh
npm install -g @exploratory/cli@<version>
```

\<version\> は、使用するバージョン番号に置き換えます。Node.js 20 以上が必要です。インストール後、新しいターミナルで expl --version を実行して確認します。

#### npx で実行

```sh
npx -y @exploratory/cli --version
```

インストールせずに、expl を 1 回だけ実行します。ほかのコマンドを実行するときは、パッケージ名のあとに続けます（例: npx -y @exploratory/cli server login）。Node.js 20 以上が必要です。インストール方法は、Node.js の公式サイト（[https://nodejs.org/](https://nodejs.org/)）を参照してください。

> 1 行目に expl \<バージョン\> と表示されていれば、インストールは完了しています。

### 2. サインインする

```sh
expl server login
```

ブラウザが開きます。Exploratory にサインインして、アクセスを許可してください。このコンピューターに、トークン（あなたとして Exploratory を使うための文字列）が保存されます。

> 「Logged in to exploratory.io as …」と表示されていれば、サインインは完了しています。

ブラウザなしでサインインするときは、API キーを使います。expl server login --with-token を実行します。「API キー」のページを参照してください。

### 3. 探して読む

```sh
expl server search "Sales Orders" --scope all --type data
```

--scope all は、自分のコンテンツに加えて、ほかの人が公開したコンテンツも検索します。--type data は、結果をデータだけに絞り込みます。結果が空のときは、該当するものがなかったということで、サインインのエラーではありません。サインインしているかは、expl server status で確認できます。

**実行結果**

```text
ID          TITLE         URL                                                TYPE  DESCRIPTION                                                                                                                                                                                                                                                                                                   AUTHOR
hI6jK7lM8n  Sales Orders  https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n  data  One row is one order line item (an order can have several lines, line_no 1-3). Period: order_date from 2025-01-01 to 2026-10-31. Columns: order_id (order ID), line_no (line number within the order), order_date, ship_date (shipping date; can be later than the order date, up to 2026-11-04), custome...  山田 花子
```

```sh
expl server fetch <id>
```

\<id\> は、検索結果に表示された id に置き換えます。実行結果の ID・URL・人名は、説明用に置き換えています。長い出力は省略しています。

**実行結果**

```text
# Sales Orders

Rows (total): 23,131

## Columns

| name | type | description |
| --- | --- | --- |
| order_id | character |  |
| line_no | numeric |  |
| order_date | Date |  |
| ship_date | Date |  |
| customer_id | character |  |
| prefecture | character |  |
| channel | character |  |
| category | character |  |
| quantity | numeric |  |
| amount | numeric |  |
| sales | numeric |  |
| discount | numeric |  |
| return_flag | character |  |
| region | character |  |

## Sample rows

| order_id | line_no | order_date | ship_date | customer_id | prefecture | channel | category | quantity | amount | sales | discount | return_flag | region |
… (trimmed)
```

<a id="tasks"></a>

## やりたいことから探す

- [ノートを読む](guides/read-notes_ja.md) - 探して、本文とチャートの数値を読みます。
- [データを集計する](guides/query-data_ja.md) - 列を確認し、絞り込んで集計します。
- [チャートの数値を取得する](guides/dashboard-charts_ja.md) - ダッシュボードやノートのチャートから、数値を取得・集計します。
- [アナリティクスの結果を取得する](guides/analytics_ja.md) - 回帰などの分析の結果を、表として取得します。
- [結果をファイルに保存する](guides/export_ja.md) - データの結果を CSV か Parquet にします。
- [自動処理](guides/automation_ja.md) - 人が操作せずに、スクリプトや CI で動かします。

<a id="commands"></a>

## Server のコマンド（expl server）

よく使うコマンドです。引数と、-- で始まる追加の指定（フラグ）は、各コマンドのページにあります。

| やりたいこと | コマンド |
| --- | --- |
| 探す、一覧する | expl server search |
| ノートなどを読む | expl server fetch |
| データの列を確認する | expl server dataframe get-schema |
| データの行を表示する | expl server dataframe preview |
| データを絞り込む、集計する | expl server dataset query |
| 結果をファイルにする | expl server dataframe export |
| データの作られ方を確認する | expl server dataframe get-wrangling |
| チャートの数値を取得する | expl server chart get-data |
| チャートの画像を取得する | expl server chart get-image |
| チャートの数値を集計する | expl server chart query |
| アナリティクスの結果を取得する | expl server analytics get-result |

- [コマンド一覧](commands_ja.md) - 目的別に全コマンドを探します。

<a id="ai"></a>

## AI から使うなら

- [AI エージェント](guides/agents_ja.md) - シェルを使える AI に、expl の使い方を教えます。
- [MCP Server](../../mcp/server/server_ja.md) - AI アプリから、パブリッシュされたコンテンツを読みます。

<a id="privacy"></a>

## 送信・記録されるもの

expl 自体は、利用状況の計測を送りません。通信する相手は、お使いのコンピューターの Exploratory Desktop と、サインインした Exploratory Server だけです。

- [Exploratory Server が記録するもの](../../mcp/server/data_ja.md) - トークン、アクセスの記録、ログ、エラーです。
- [Desktop が記録するもの](../desktop/desktop_ja.md#records) - Desktop のページに書いています。

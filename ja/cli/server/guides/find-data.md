---
title: "データを探す"
---

exploratory.io に公開されたデータ、ノート、ダッシュボードを探し、id を調べ、fetch やデータのスキーマの取得に進みます。

<a id="before"></a>

## 前提

expl server login でサインインしてあります（[サインイン](/ja/cli/server/login)を参照）。検索で返るのは、自分が見られるものだけです。

<a id="steps"></a>

## 手順

### 1. 探す

検索語を、コマンドのすぐあとに書きます。`--scope` all は、自分のコンテンツに加えて、ほかの人が公開したコンテンツも検索します。`--type` data は、結果をデータだけに絞り込みます。

```sh
expl server search "Sales Orders" --scope all --type data
```

`--type` には、all、note、dashboard、slide、chart、analytics、data を指定できます。`--scope` には、all、mine、shared、team を指定できます（`--scope` team のときは、`--team <チーム名>` も付けます）。`--semantic` を付けると、キーワードでなく意味で検索します。`--json` を付けると、JSON で出力します。

結果は、id、タイトル、URL、種類、説明の表で出ます。結果が空のときは、該当するものがなかったということで、サインインのエラーではありません。

自分のコンテンツを一覧したいときは、検索語を空にして、`--scope` mine を付けます。

```sh
expl server search "" --scope mine --limit 50 --json
```

`--limit` は、返す件数の上限で、50 までです。JSON の has_more が true のときは、next_offset の値を `--offset` に渡すと、次のページを取得できます。

### 2. id を控える

結果の各項目に、id と URL が出ます。id は、次のコマンドに渡す値です。URL は、人にコンテンツを伝えるときに使います。

### 3. 読む、または列を見る

ノートやダッシュボードは、fetch で内容を読みます。

```sh
expl server fetch <id> --json
```

データは、先に列と型を見ます。

```sh
expl server dataframe get-schema <id> --json
```

\<id\> は、検索結果の id に置き換えます。fetch は、項目の本文とメタデータ（ダッシュボードやノートでは、含まれるチャートも）を返します。get-schema は、データの列名と型を返します。公開した人が承認していれば、1 行が何を表すかも返ります。

ノートやそのチャート、アナリティクスを読むときは、[ノートを読む](/ja/cli/server/guides/read-notes)を参照してください。データを集計するときは、[データを集計する](/ja/cli/server/guides/query-data)を参照してください。

<a id="trouble"></a>

## 失敗したとき

| 状況 | 対処 |
| --- | --- |
| 結果が空 | 検索語を確認し、`--scope` all で試します。短い語にするか、`--semantic` を付けます。 |
| サインインのエラー | expl server login を実行します。[サインイン](/ja/cli/server/login)を参照してください。 |
| id が見つからない | 検索結果の id をそのまま使います。似たタイトルは、同じ項目ではありません。 |

コマンドの引数は、`expl server <コマンド> --help` で確認します。

<a id="related"></a>

## 関連するページ

- [ノートを読む](/ja/cli/server/guides/read-notes)
- [データを集計する](/ja/cli/server/guides/query-data)
- [Server のコマンド](/ja/cli/server/commands#search)

同じことを MCP で行う例は、[データを探す](/ja/mcp/server/use#find)を参照してください。

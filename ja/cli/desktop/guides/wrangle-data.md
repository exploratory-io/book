---
title: "データを取り込む・加工する"
---

データをデータフレームとしてプロジェクトに取り込み、列を確認し、加工のステップを追加します。

<a id="before"></a>

## 前提

- Exploratory Desktop が起動していて、プロジェクトが開いています（[プロジェクトを選ぶ](/ja/cli/desktop/guides/projects)）。expl status で確認できます。
- 作成や変更をするコマンド（このページの create-source、apply-step など）は、システム設定 > MCP / CLI の「作成、変更、削除を許可する」がオンのときだけ使えます。
- R の実行（run-r）、ai-wrangle、ステップの削除は、実行の前に確認が出ます。ターミナルでは Continue? \[y/N\] と聞かれます。スクリプトや AI エージェントからは `--yes` を付けます。[確認と時間のかかる操作](/ja/cli/desktop/guides/confirmation)を参照してください。

<a id="steps"></a>

## 手順

### 1. ファイルを確認して取り込む

ローカルのテキストファイルは、先に先頭と形式を確認します。

```sh
expl dataframe read-file-header --file-path ./sales_orders.csv
```

`--head-bytes` で読む量を、`--encoding` で utf-8、shift_jis、auto を指定できます。

取り込むときは、名前と、データフレーム全体を返す R スクリプトを渡します。@ファイル名 と書くと、スクリプトをファイルから読みます（[引数と JSON を渡す](/ja/cli/desktop/guides/input)）。

```sh
expl dataframe create-source --data-frame-name "Sales Orders" --r-script @import.R
```

import.R は、最後の値が data.frame になるスクリプトです。たとえば `readr::read_csv("./sales_orders.csv")` です。スクリプトでなくデータソースのプラグインから取り込むときは、`--source` に、type、connection_id、params を持つ JSON を渡します。データベースの場合は、expl dataframe get-source-params で、プラグインが受け取る項目を確認します。カタログの項目を取り込むときの type は、local_catalog（params.item_id）と server_catalog（params.url）です。

### 2. データフレームを見る

```sh
expl dataframe list
expl dataframe get-schema <dataframe_id>
expl dataframe preview <dataframe_id> --limit 20
```

list は、各データフレームの id を返します。get-schema は、列名と型、加工のステップ、行数を返します。preview は、先頭の行を、最大 100 行返します。列名は、get-schema の表記のまま写します。

### 3. 加工のステップを追加する

先に、コマンドが受け取る設定を調べます。get-command が返す名前だけが有効です。

```sh
expl dataframe get-command --command filter
```

そのあと、ステップを 1 つ追加します。`--command` は操作、`--params` は、その設定をすべて入れた JSON オブジェクトです。

```sh
expl dataframe apply-step <dataframe_id> --command <command> --params @params.json
```

\<command\> は、get-command で調べたコマンド名に置き換え、params.json には、返ってきた名前で設定を書きます。ステップは、1 回に 1 つの操作ずつ追加します。R で実行できなかったステップは取り消されます。`--save-with-error` を付けると、エラーのステップとして残します。既存のステップの前後に入れるときは、`--insert-position` '`{"side":"after","stepName":"<ステップ名>"}`' を渡します。付けないと、最後に追加します。

expl dataframe preview-steps は、一時的なオブジェクトで変更を試し、保存せずに結果を表示します。引数は `expl dataframe preview-steps --help` で確認します。

### 4. 結果を確認する

```sh
expl dataframe get-schema <dataframe_id>
```

追加したステップが steps に出て、列と行数が更新されています。

依頼の内容から AI に R を書かせたいときは、`expl dataframe ai-wrangle --prompt "..."` を使います（`--run` を付けると、ステップとして追加します）。実行の前に確認が出ます。ステップダイアグラムなど、そのほかの読み取りのコマンドは、[Desktop のコマンド](/ja/cli/desktop/commands)にあります。

<a id="trouble"></a>

## 失敗したとき

| 状況 | 対処 |
| --- | --- |
| PERMISSION_DENIED | システム設定の「作成、変更、削除を許可する」をオンにします。[終了コードとエラー](/ja/cli/desktop/exit-codes)を参照してください。 |
| PROJECT_NOT_OPEN | expl project open \<id\> でプロジェクトを開きます。 |
| NO_DATA_FRAME | コマンドの引数、または `--data-frame-id` で、データフレームの id を指定します。 |
| ステップが適用されない | expl dataframe get-command で名前を確認し、列名は get-schema のものを使います。 |
| 確認が出ずに終了コード 2 | 確認が要る操作を、ターミナル以外で実行しています。内容を確認したうえで `--yes` を付けます。 |

コマンドの引数は、`expl <コマンド> --help` または `expl tools describe "<コマンド>"` で確認します。

<a id="related"></a>

## 関連するページ

- [確認と時間のかかる操作](/ja/cli/desktop/guides/confirmation)
- [引数と JSON を渡す](/ja/cli/desktop/guides/input)
- [チャートを作る](/ja/cli/desktop/guides/create-charts)
- [Desktop のコマンド](/ja/cli/desktop/commands)

同じことを MCP で行う例は、[使い方](/ja/mcp/desktop/use#examples)の「データを取り込む・加工する」を参照してください。

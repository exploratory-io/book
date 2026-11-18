---
title: "チャートを作る"
---

データフレームからチャートを作り、数値と画像を確認し、変更します。

<a id="before"></a>

## 前提

- Exploratory Desktop が起動していて、プロジェクトが開いています（[プロジェクトを選ぶ](/ja/cli/desktop/guides/projects)）。expl status で確認できます。
- データフレームの id と列名が分かっています（expl dataframe list、expl dataframe get-schema \<dataframe_id\>）。
- chart add と chart edit は、システム設定 > MCP / CLI の「作成、変更、削除を許可する」がオンのときだけ使えます。確認は出ません。チャートの削除は、確認が出ます。[確認と時間のかかる操作](/ja/cli/desktop/guides/confirmation)を参照してください。

<a id="steps"></a>

## 手順

### 1. チャートの種類の設定を調べる

`--marker` は、チャートの種類です。bar、line、area、pie、scatter、pivot、singlevalue、table などです。`--section` を付けないと、設定の目次が返ります。

```sh
expl chart list-settings --marker bar
```

`--setting <名前>` で、設定を 1 つ、名前の完全一致で引けます。`--search <名前の一部>` で、名前の一部から絞り込めます。設定の名前は推測せず、ここで返った名前だけを使います。

### 2. チャートを作る

`--marker` と `--axes` が必須です。`--axes` は、枠の名前をキーにして、列を置く JSON オブジェクトです。bar と line の枠は x、y、color、facet、ピボットテーブルの枠は rowh、colh、meas です。値は、列名か、集計を選ぶ `{"column": "...", "func": "sum"}` です。

```sh
expl chart add --data-frame-id <dataframe_id> --marker bar --axes '{"x":"order_date","y":{"column":"sales","func":"sum"}}' --title "月別の売上"
```

\<dataframe_id\> は、expl dataframe list の id に置き換え、列名は get-schema の表記のまま使います。`--settings` には、手順 1 で調べた名前の JSON オブジェクトを渡します（オンとオフの設定は、true や false でなく、文字列の "on" か "off" です）。`--filters` には、フィルタ条件の配列を渡します。条件の形は、`expl chart add --help` で確認します。

結果に、作ったチャートの id（chartId）が入ります。`--data-frame-id` を付けないと、Desktop で選択中のデータフレームを使います。選択中のものがないときは、NO_DATA_FRAME で止まります。

### 3. 数値と画像を確認する

```sh
expl chart get-result <chart_id> --limit 20
expl chart get-image <chart_id> --output chart.png
```

get-result は、チャートを実行し、集計した値を返します。正確な数値は、画像でなくこちらで読みます。get-image は、チャートの画像を PNG ファイルに保存します。あとから id を調べるときは、expl chart list \<dataframe_id\> を実行します。

### 4. 変更する

変えるものだけを渡します。渡さなかったものは、そのまま残ります。id は変わりません。

```sh
expl chart edit <chart_id> --marker line --title "月別の売上の推移"
```

`--axes`、`--settings`、`--filters` は、chart add と同じ書き方です。Auto Run がオフのチャートは、`--run` を付けると実行します。

<a id="trouble"></a>

## 失敗したとき

| 状況 | 対処 |
| --- | --- |
| PERMISSION_DENIED | システム設定の「作成、変更、削除を許可する」をオンにします。[終了コードとエラー](/ja/cli/desktop/exit-codes)を参照してください。 |
| NO_DATA_FRAME | `--data-frame-id <dataframe_id>` を付けます。 |
| INVALID_ARGUMENT | 設定の名前か値が違います。expl chart list-settings で、もう一度調べます。 |
| チャートが空、または列が違う | 列名を、expl dataframe get-schema の表記と 1 文字ずつ照らします。 |

コマンドの引数は、`expl <コマンド> --help` または `expl tools describe "<コマンド>"` で確認します。

<a id="related"></a>

## 関連するページ

- [データを取り込む・加工する](/ja/cli/desktop/guides/wrangle-data)
- [アナリティクスを作る](/ja/cli/desktop/guides/create-analytics)
- [ノートを書く](/ja/cli/desktop/guides/write-notes)
- [Desktop のコマンド](/ja/cli/desktop/commands)

同じことを MCP で行う例は、[使い方](/ja/mcp/desktop/use#examples)の「チャートを作る」を参照してください。

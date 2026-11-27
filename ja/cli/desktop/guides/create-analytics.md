---
title: "アナリティクスを作る"
---

データフレームから、アナリティクス（回帰、分類、クラスタリングなど）を作り、結果を読みます。

<a id="before"></a>

## 前提

- Exploratory Desktop が起動していて、プロジェクトが開いています（[プロジェクトを選ぶ](/ja/cli/desktop/guides/projects)）。expl status で確認できます。
- データフレームの id と列名が分かっています（expl dataframe list、expl dataframe get-schema \<dataframe_id\>）。
- analytics add と analytics edit は、システム設定 > MCP / CLI の「作成、変更、削除を許可する」がオンのときだけ使えます。確認は出ません。アナリティクスの削除は、確認が出ます。[確認と時間のかかる操作](/ja/cli/desktop/guides/confirmation)を参照してください。

<a id="steps"></a>

## 手順

### 1. アナリティクスの種類を選ぶ

```sh
expl analytics list-templates
```

結果に、アナリティクスの種類ごとに、id、ラベル、枠が並びます。ラベルと、知りたいことで選びます。id は推測しません。

### 2. 枠と設定を調べる

```sh
expl analytics get-template --analysis-type <analysis_type>
```

\<analysis_type\> は、手順 1 の id に置き換えます。結果に、その種類の枠（列を置く場所）と設定が、名前と指定できる値つきで出ます。有効なのは、この名前だけです。

### 3. 作る

`--analysis-type` と `--slots` が必須です。`--slots` は、枠の名前をキーにして、列名を入れた JSON オブジェクトです。列が 1 つの枠は文字列、複数の列の枠は配列にします。`--settings` には、手順 2 の設定の名前の JSON オブジェクトを渡します（真偽値の設定は、文字列の "TRUE" か "FALSE" です）。

```sh
expl analytics add --data-frame-id <dataframe_id> --analysis-type <analysis_type> --slots @slots.json --title "売上に効く要因"
```

slots.json は、get-template が返した枠の名前と、get-schema の列名を使って書きます。例えば相関の種類（do_cor）には、複数の列を入れる columns という枠が 1 つあります。

```json
{"columns": ["Sales", "Ad Spend", "Visitors"]}
```

設定も同じ形で settings.json に書きます。例: `{"cor_method": "spearman"}`。種類によって枠や設定の名前は違うので、get-template の結果から写します。コマンドは、アナリティクスを作って実行します。結果に、id（analyticsId）と、出力ごとの状態が入ります。

### 4. 結果を読む

```sh
expl analytics list <dataframe_id>
expl analytics get <analytics_id>
```

list は、データフレームのアナリティクスを、それぞれが持つ出力の種類（availableOutputTypes）つきで返します。get は、種類、設定、出力を、データを CSV にして返します。ほかの出力を読むときは、availableOutputTypes の値を `--output-type` に渡します。

### 5. 変更する

```sh
expl analytics edit <analytics_id> --settings @settings.json
```

変えるものだけを渡します（`--slots`、`--settings`、`--title`、`--analysis-type` など）。アナリティクスを実行し直します。実行し直しに失敗したときは、直す前の定義に戻ります。

<a id="trouble"></a>

## 失敗したとき

| 状況 | 対処 |
| --- | --- |
| PERMISSION_DENIED | システム設定の「作成、変更、削除を許可する」をオンにします。[終了コードとエラー](/ja/cli/desktop/exit-codes)を参照してください。 |
| NO_DATA_FRAME | `--data-frame-id <dataframe_id>` を付けます。 |
| 未知の名前を指定すると拒否される | 枠や設定の名前を、expl analytics get-template で、もう一度調べます。 |
| 枠が空 | 枠に列がないと、アナリティクスは作れません。 |

コマンドの引数は、`expl <コマンド> --help` または `expl tools describe "<コマンド>"` で確認します。

<a id="related"></a>

## 関連するページ

- [チャートを作る](/ja/cli/desktop/guides/create-charts)
- [ノートを書く](/ja/cli/desktop/guides/write-notes)
- [引数と JSON を渡す](/ja/cli/desktop/guides/input)
- [Desktop のコマンド](/ja/cli/desktop/commands)

同じことを MCP で行う例は、[使い方](/ja/mcp/desktop/use#examples)の「アナリティクスを作る」を参照してください。

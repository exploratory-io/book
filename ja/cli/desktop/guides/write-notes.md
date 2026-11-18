---
title: "ノートを書く"
---

チャートやアナリティクスを埋め込む Markdown のノートを書き、あとから追記し、読み返します。

<a id="before"></a>

## 前提

- Exploratory Desktop が起動していて、プロジェクトが開いています（[プロジェクトを選ぶ](/ja/cli/desktop/guides/projects)）。expl status で確認できます。
- 埋め込むチャートとアナリティクスの id が分かっています（expl chart list \<dataframe_id\>、expl analytics list \<dataframe_id\>）。
- note add と note edit は、システム設定 > MCP / CLI の「作成、変更、削除を許可する」がオンのときだけ使えます。確認は出ません。ノートの削除は、確認が出ます。[確認と時間のかかる操作](/ja/cli/desktop/guides/confirmation)を参照してください。

<a id="steps"></a>

## 手順

### 1. 本文を書く

本文は、Markdown のファイル report.md に書きます。チャートやアナリティクスを埋め込むときは、\{\{chart:\<chart_id\>\}\} のような埋め込みの記法を、1 行に 1 つだけ書き、前後を空行にします。

```text
# Sales Orders

月ごとの売上は、年を通じて増えています。

{{chart:<chart_id>}}

{{analytics:<analytics_id>|<output_type>}}
```

\<chart_id\> と \<analytics_id\> は、作ったときに得た id か、一覧のコマンドで調べた id に置き換えます。\{\{analytics:\<analytics_id\>\}\} のように出力の種類を省略できるのは、アナリティクスの出力が 1 つのときだけです。そうでないときは、availableOutputTypes の値を出力の種類に指定します。チャートのパスは、自分で書きません。行の途中や、コードブロックの中に書いた埋め込みの記法は、埋め込まれず、文字のまま残ります。図の下には、その図から読み取れることを数値つきで書きます（数値は expl chart get-result で読みます）。

### 2. ノートを作る

`--title` と `--markdown` が必須です。@ファイル名 と書くと、長い文章をファイルから読みます（[引数と JSON を渡す](/ja/cli/desktop/guides/input)）。

```sh
expl note add --title "Sales Orders のレポート" --markdown @report.md
```

結果に、ノートの id（note_id）が入ります。ノートは、Desktop で開きます。プロジェクトに同じタイトルのノートがあると、上書きせず、何も書かずに NOTE_TITLE_EXISTS で止まります。別のタイトルにしてください。`--folder` で既存のフォルダに入れられ、`--settings` には、ノートの設定（目次など）の JSON オブジェクトを渡せます。

### 3. 追記する、書き換える

```sh
expl note edit <note_id> --markdown @more.md
```

既定では、本文の末尾に追記します。`--mode` replace を付けると、本文全体を置き換えます。`--title` で、ノートの名前を変えられます。id は、expl note list で調べます。

### 4. 読み返す

```sh
expl note get <note_id>
expl note get-image <note_id>
```

get は、Markdown の本文、フォルダ、依存関係を返します。get-image は、ノートのプレビュー全体を画像で返します。expl note export-html と expl note export-pdf は、ノートをファイルに書き出します。expl note ask-ai は、ノートエディタの AI に、文章の書き直し、翻訳、要約を頼みます（ノートは変わりません）。

<a id="trouble"></a>

## 失敗したとき

| 状況 | 対処 |
| --- | --- |
| PERMISSION_DENIED | システム設定の「作成、変更、削除を許可する」をオンにします。[終了コードとエラー](/ja/cli/desktop/exit-codes)を参照してください。 |
| NOTE_TITLE_EXISTS | note add では別のタイトルにします。既存のノートを直すときは、note edit を使います。 |
| NOTE_NOT_FOUND | id が違います。expl note list から写します。 |
| 図が空白になる | 埋め込みの記法の id が違うか、記法が 1 行に 1 つだけの形になっていません。 |

コマンドの引数は、`expl <コマンド> --help` または `expl tools describe "<コマンド>"` で確認します。

<a id="related"></a>

## 関連するページ

- [チャートを作る](/ja/cli/desktop/guides/create-charts)
- [アナリティクスを作る](/ja/cli/desktop/guides/create-analytics)
- [公開する](/ja/cli/desktop/guides/publish)
- [Desktop のコマンド](/ja/cli/desktop/commands)

同じことを MCP で行う例は、[使い方](/ja/mcp/desktop/use#examples)の「ノートを書く」を参照してください。

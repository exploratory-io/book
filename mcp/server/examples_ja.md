# 使い方の例

AI への依頼文の例です。AI が使用するツールと、依頼するときのポイントもあわせて説明します。

<a id="find"></a>

## データを探す

```text
Exploratory にある「Sales Orders」のデータを探して
```

AI は、search を scope: "all" で呼び出し、該当するデータを URL 付きで表示します。内容を読む場合は、id を指定して fetch を呼び出します。

<a id="notes"></a>

## ノートを読む

```text
Exploratory の「Sales Orders Report」のノートを読んで、要点を教えて
```

AI は、search で探した id を指定して fetch を呼び出し、ノートやダッシュボードの本文を Markdown で読みます。長いノートでは、fetch の section、query で必要な部分だけを読みます。ノートの名前に加えて、知りたい話題（「予測の節だけ」など）を伝えると、速く読めます。

ターミナルから同じことをするときは、[ノートを読む](../../cli/server/guides/read-notes_ja.md)を参照してください。

<a id="data"></a>

## データを集計する

```text
Exploratory の「Sales Orders」データにはどんな列がある？ 売上が一番大きい地域の上位 5 つも教えて
```

データの名前と知りたいことを伝えます。AI は、列と集計のルールを確かめてから計算します。結果とあわせて、計算の条件（集計方法、絞り込み）とデータの時点を確認してください。

ターミナルから同じことをするときは、[データを集計する](../../cli/server/guides/query-data_ja.md)を参照してください。

<a id="chart"></a>

## チャートの数値を取得する

```text
「Sales Orders Dashboard」のダッシュボードにある「Monthly Sales Trend」のチャートの数値を教えて
```

AI は、ダッシュボードの中のチャートの名前を調べ、数値を取得します。ノート、ダッシュボード、スライド内のチャートは、chart_query で絞り込み、並べ替え、集計もできます。数値は、公開されたときの値です。


ターミナルから同じことをするときは、[チャートの数値を取得する](../../cli/server/guides/dashboard-charts_ja.md)を参照してください。

<a id="analytics"></a>

## アナリティクスの結果を取得する

```text
「Sales Orders Dashboard」にある「Monthly Sales Forecast」のアナリティクスの結果を教えて
```

AI は、fetch でダッシュボードの中のアナリティクスの名前を確かめ、analytics_get_result で結果を取得します。係数や p 値などは、表示されたとおりの値で返ります。アナリティクスの名前（タイトル）と、知りたい数値（係数、p 値など）を伝えてください。

ターミナルから同じことをするときは、[アナリティクスの結果を取得する](../../cli/server/guides/analytics_ja.md)を参照してください。

<a id="export"></a>

## 結果をファイルに保存する

```text
「Sales Orders」データの、地域ごとの売上の集計結果を CSV にして
```

AI は、query_dataset と同じ指定で絞り込みや集計をして、dataframe_export で結果を CSV か Parquet にし、ダウンロードリンクを返します。結果が大きく、画面に取得しきれないときに使います。ファイルの形式（CSV か Parquet）と、集計の条件を伝えてください。公開した人がダウンロードを許可していないデータは、保存できません。

ターミナルから同じことをするときは、[結果をファイルに保存する](../../cli/server/guides/export_ja.md)を参照してください。

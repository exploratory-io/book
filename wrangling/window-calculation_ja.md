# 表計算


データラングリングの際に、数値、日付、時間列で表計算が利用できます。


## タイプ

以下の5種類の計算が可能です。

### 累計

累計、各グループの前の値を基に現在の値を計算します。この計算タイプは、数値列でサポートされています。

値の集計には、以下のオプションがあります。

* 合計
* 平均値
* 最小値
* 最大値
* 積


### 割合（％ of）

割合 (% of)は、各グループの値の比率を計算します。この計算タイプは、数値列でサポートされています。


### 差

差は、指定した位置からの差を計算します。差を比較するためのオプションは、以下の9つです。この計算タイプは、数値列、日付列、時間列でサポートされています。

* 平均値 - 平均値との差を計算します。
* 中央値 - 中央値との差を計算します。
* 最頻値 - 最頻値との差を計算します。
* 最小値 - 最小値との差を算出します。
* 最大値 - 最大値との差を求めます。
* 最初の値 - 最初の値からの差を計算します。最初の値は常に0になります。
* 最後の値 - 最後の値からの差を計算します。最後の値は、常に0になります。
* 前の値 - 1つ前の値との差を求めます。
* 次の値 - 次の値との差を計算します。
* 特定の値 -  指定した値との差を計算します。


### 差の割合

差の割合は、指定した位置からの差の割合を計算します。以下の4つのオプションがあり、差を比較することができます。この計算タイプは、数値列でサポートされています。

* 平均値 - 平均値からの差を計算します。
* 中央値 - 中央値との差を計算します。
* 最頻値 - 最頻値との差を計算します。
* 最小値 - 最小値との差を求めます。
* 最大値 - 最大値との差を求めます。
* 最初の値 - 最初の値からの差を計算します。最初の値は常に0になります。
* 最後の値 - 最後の値からの差を計算します。最後の値は、常に0になります。
* 前の値 - 1つ前の値との差を求めます。
* 次の値 - 次の値との差を計算します。


### 移動計算

移動計算は、各データポイントを中心としたウィンドウ（範囲）内のデータポイントをまとめて値を計算するものです。この計算タイプは、Numeric Columnsでサポートされています。

以下のオプションが利用可能です。

* 集計関数 - ウィンドウ内のデータポイントに適用される計算の種類。
 * 合計値
 * 平均値
 * 中央値
 * 最小値
 * 最大値
 * 標準偏差
 * 分散
 * 積

## リンク

詳しくは、以下の記事（英語）をご覧ください。

* [5 Most Practically Useful Window (Table) Calculations in R](https://blog.exploratory.io/5-most-practically-useful-window-table-calculations-in-r-7e2c7ca431d9)

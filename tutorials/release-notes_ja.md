# リリースノート

## R 1.4.1

Released on 5/16/2016

### 新機能

- データ分析のためのbroomパッケージのtidy, glance, augment関数が導入されました。
- 自分でdo_lm, do_glm, do_kmeansのような関数を使ってモデルを作ったり、データフレームの中にそのモデルを保存できるようにするための、モデルやソースデータタイプカラムのサポートをしました。This makes it possible to call broom's tidy functions to access the models' statistical summary information or augment their scored data with the original data columns.

### 改善

- アプリケーションをインストールするときに、Gitが/usr/binか/usr/local/bin下にあるかどうかをチェックするようにしました。バージョンが2.0より古くないかぎり、インストールもアップデートもしません。RとGitの必要なバージョンの詳細は、FAQ pageで確認してください。
RのシステムにRのパッケージをRのローカルシステムにインストールする代わりに、Exploratoryのレポジトリにインストールするようになりました。
- HeatmapとContourのチャート画面で、NA値をNA値として扱うか0として扱うかのオプションを導入しました。
- チャート画面で、テキストのラベルがうまく表示されるようにX軸とY軸にmargin (space)を加えることができるようになりました。
- Linear Regression (lm)やK-means clustering (kmeans)やGeneralized Linear Regression (glm)を作る時のモデルを改善しました。
- テーブルに表示される列の個数を200, 500, 1000から選ぶことができるようになりました。デフォルトだと200になっています。
- Excelでシートの名前を入力する代わりにドロップダウンメニューからシート名を選ぶことができるようになりました。
- ".csv", ".text", ".txt", ".tsv", ".tab"のどのファイルタイプでもインポートできるようになりました。

### バグ修正

- Rスクリプトデータ - Enterをクリックして新しい線を加えることができるようになりました。
- テーブル: テーブル画面を更新しても、列のハイライト(グレー色)が変わるようになりました。
- シンタックスレコメンド: select()コマンドの中で-と入力したとき、レコメンドリストから-を選ぶ代わりに、カラムのレコメンドリストを表示できるようになりました。


## R 1.4.0

Released on 5/9/2016

### 新機能

- Rのstatsパッケージであるcor()関数に基づいたCorrelation計算のサポート

   ```
   calc_cor(ARR_DELAY, DPE_DELAY, DISTANCE)

   > This will produce correlation values for each pair.
   ```

- Text Matching関数 - str_count_all
  ただし、これは、stringrパッケージからではありません。

   ```
   str_count_all("I ate banana, apple, and peach yesterday, and banana, peach today.", patterns=c("apple", "banana"), remove.zero=TRUE)

   > Returns a list column of data frames with 'apple' and 'banana' columns.
   ```

- Twitterのデータをサポートしました。
- HeatmapとContourチャートタイプが加えられました。


### 改善

- クラスタリングの関数が改善されました。
  Rのkmeans()関数に基いて、どのカラムをクラスタリングをするために使われているかを特定できるようになりました。

   ```
   do_kmeans(ARR_DELAY, DEP_DELAY, DISTANCE, groups = 5)
   ```
- Scatter plotで円のサイズが指定されたSizeに基くようになりました。
- ローカルデータタイプは、データインポートダイアログで以前より綺麗に整理されるようになりました。
- シンタックスレコメンド時に、funs()といっしょに、mutate_eachとsummarize_each関数がサポートされました。
- シンタックスヘルプでの、ヘルプの説明文やテーブル画面が以前より公式的になりました。
- Command builder menuで、difftime, interval, time, periodがサポートされました。
- ログイン時や、新しいプロジェクトを作る際に、OKボタンをクリックする代わりにReturn (Enter)ボタンでも入力できるようになりました。
- テーブル画面で、ハイライトさせるために列をクリックできるようになりました。
- チャート画面で、LineチャートのようにY軸の最小値から始まるようになっていましたが、Barチャートのように０から始まるようになりました。

### バグ修正

- 稀に、新しいプロジェクトを作ったり、既存のプロジェクトを開けなかった問題を修正しました。
- Microsoft Rがインストールされているときに、新しいプロジェクトが作れなかった問題を修正しました。
- Throwing an error when importing data after having a problem creating projects.
- いくかのMac PCでアプリケーションを起動できない問題を修正しました。
- コマンド入力エリアでテキストを選ぶ動作の安定性が増しました。
- バッククォートを持ったカラム名もコマンド入力エリアでハイライトされるようになりました。
- Get Dataボタンは、テキストファイルを行にする代わりにテーブル画面を表示するようになりました。
- 手動で-を入力した後に、レコメンドリストが表示されるようになりました。


## R 1.3.0

Released on 5/2/2016

### 新機能

- データ分析コマンド自動生成機能が実装されました。
- MySQLデータベースをサポートしました。
- Fast Data Parsing functions (readr) をサポートしました。
- parse_time (readr) 関数によるTime dataタイプをサポートしました。
- Text clean up関数であるstr_cleanをサポートしました。

### 改善

- Google AnalyticsのView IDをドロップダウンメニューから選べるようにしました。
- Google Analyticsのアカウント切り替えをサポートしました。
- Google Spreadsheetのアカウント切り替えをサポートしました。
- Google Spreadsheetのファイルをインポートするときのパラメータを加えました。
- Google SpreadsheetのSpreadsheetの名前をドロップダウンメニューから選べるようにしました。
- ChartのMapとScatterplotのText Label fieldをサポートしました。

### バグ修正
- JSONインポート: 異なるファイルを更新してもPreview UIが変化しませんでした。


## R 1.2.2

Released on 4/26/2016

### 新機能

- Remote JSON - REST API Basic

### 改善

- Google AnalyticsのView IDのためにDynamic LOVを改善しました。

### バグ修正

- 問題: 間違ったプロジェクトを開く問題を修正しました。
- Webスクレイピング: Clicking on some tables from some web pages causes the dialog to hang
- ユーザー名ではなく、EmailアドレスでのExploratory Desktopへのログインのサポートをしました。
- 地図: 色の指定を外すとデータがmapに表示されなくなっていたのを改善しました。

## R 1.2.1

Released on 4/18/2016

### 新機能

- Webスクレイピング機能が実装されました。
- Remote JSON - REST API Basic
- Remote Data - MongoDB

### 改善

- Google AnalyticsのDimensionsとMetrics Listを改善しました。
- チャートの名前変更と削除のサポートをしました。

### バグ修正



## R 1.2.0

Released on 4/11/2016

### 新機能

- Refresh remote data
- データ分析のスクリプトをdplyrとしてダウンロードできるようになりました。
- 関数リストダイアログが実装されました。
- データソースプラグインが実装されました。

### 改善

- テーブル画面で空白と特殊文字の表示するようにしました。

### バグ修正

## R 2.2

Released on 10/10/2016

### New Features

- Small multiple(小さい多数の)チャートを作ることができるようになりました。Repeat Byに列を指定することによって、複数のチャートが繰り返されます。
- Neo4jのグラフデータベースのデータインポート機能をサポートしました。これで、Neo4JのグラフデータベースからCypherクエリを書いてデータを抽出することができるようになりました。

### Enhancements

- 右側の上のボタンを押して、チャート画面を拡大できるようになりました。
- データフレームをコピーできるようになりました。ブランチとビジュアライゼーションといっしょに既存のデータフレームをコピーできます。
- MongoDBのAuthenticationで、authSourceパラメータをサポートしました。
- フィルタリングの操作のときに、is stopwordやis alphabetが演算子に加えられました。
- 左側のデータフレームの一覧ページを隠したり、表示させたりするボタンのアイコンを変えました。
- 複数のlist列や行をを結合するために、list_concat関数を加えました。さらに、listの値をテキストに変えるには、list_to_text関数が使えます。

### Bug Fixes

- Windows用のコマンドのUIのスタイルを修正しました。




## R 2.1

Released on 9/29/2016

### Enhancements

- データベース用のデータベーステーブルの一覧を見ることができるようになりました。そして、テーブルの名前をSQLにクリックして、ペーストできるようになりました。
- Scatter、Cholopleth、Map, Heatmap,Contourのチャートタイプでも、カラー・パレットから色を選ぶことができるようになりました。また、テキスト列のときにも、カラー・パレットをカスタマイズすることができます。
- ScatterとMapのチャートタイプで、numericタイプの列をColorに指定したとき、Continuousでも扱えるように、列をAs Numericに設定することやCategoricalでも扱えるようにAs Textに設定できます。
- Association Rules(Market Basket Analysis)のUIを更新しました。
- slice関数に、IncludeとExcludeオプションを加えました。
- character列をフィルタリングするときに、"not start with"や“not end with”オプションを加えました。
- lubridateパッケージを1.6.0にアップデートしました。
   * yq関数が加わえられました。
   * リファレンスで、parse_date_timeが加えられました
   * as_datetime関数が加えられました。
   * リファレンスから、readrパッケージで、parse_datetimeやparse_dateが除去されました。
   * bimonthとhalfyearがunit引数をサポートしました。
   * quarter関数が加えられました。
   * as_datetimeが加えられました。
- 入力画面にいるときに、ショートカットキー（Cmd+ Enter）を使って、コマンドを走らせることができるようになりました。ダイアログ内では、常にEnterキーを使うことができます。

### Bug Fixes

- Non-Latin1もWindowsでうまく表示されるようになりました。また、Non-Latin1文字に対しても、 MutateやFilterのようなコマンドを使えるようになりました。
- サマリー画面で、Duration typeがサポートされました。
- sliceコマンドで、startとend関数が正確になりました。(startが2で、endがn()-1になっていました。そして、2:n()-1と1:(n()-1が等しくなっていました。しかし、今は、2:(n()-1)になっています。)
- コマンドビルダーで、“Day, Month, Year, Hour, Minute, Second”のとき、ymd_hms関数が入力されていましたが、dmy_hms関数が入力されるようになりました。)
- コマンドビルダーで、“Concatenate items"が“list_concat”を入力するようになっていたのが、“Concatenate items"や“Convert to text”が入力されるようになりました。



## R 2.0

Released on 9/21/2016

## New Features

- dplyr（文法に基づいたデータ加工・分析のコマンド群）のためのUIモードをサポートしました。
- チャートやデータをプライベートにシェアすることができるようになりました。
- arulesパッケージを使って、アソシエーション・ルール・マイニングを行うことができるようになりました。

### Enhancements

- ピボットテーブルで、Rowに指定したカラムに対して、TextかNumericを設定できるようになりました。これによりデータのソートがより適切にできるようになります。
- チャートで、Y軸に複数の列をアサインできるようになりました。
- バーチャートのソートが改善されました、どのY軸をソートするかを選べたり、ソートの順番を昇順か降順にするかを選べることができるようになりました。
- Noteに、ピボットテーブルを埋め込むことができるようになりました。
- URLデータを扱う関数が標準化され、さらに使いやすくなりました。


### Bug fixes

- Google BigQueryで、50以上のテーブルを表示できるようになりました。


## R 1.10.1

Released on 8/29/2016

### Enhancements

- MongoDBのコネクションで、SSLをサポートしました。

### Bug fixes

- MongoDBで、何も設定していないときは、ユーザネームとパスワードを入力する必要がなくなりました。

## R 1.10

Released on 8/26/2016

### New Features

- 以下のWindow関数がBar, Line, Areaチャートから直接使えるようになりました。
  - Running Total / Cumulative
  - % of Total
  - Difference from
  - % Difference from
  - Moving (Rolling) calculations - 移動平均等

### Enhancements

- Title, Margin, Legendポジションのようなチャートのレイアウトに関する設定が、レイアウトボタンからまとめてできるようになりました
- チャートのレジェンドポジションを右や、左や上や下に設定できるようになりました。
- エリアチャートがデフォルトで、より良いデータビジュアライゼーションを提供するstackedになるようになりました。
- Pivotテーブルで、データをソートするために、列をクリックできるようになりました。このソートは、exploratory.ioで公開されているPivotテーブルでもうまく動きます。

### Bug fixes

- レジェンドポジションにあるデータが、Factor列としてセットされていたときに、順番をソートできなかった問題を修正しました。

## R 1.9.0

### New Features

- Pivot Tableが使えるようになりました。Pivot Tableを使って、データを簡単に、summarizeしたり、色を使って、パターンや傾向を見つけることができます。[こちら](https://blog.exploratory.io/introducing-pivot-table-1c9c949fd2d6#.z8dwtwbx9)の方で、Pivot Tableについて詳しく解説しているので、よかったらご覧ください。

### Enhancements

- Google Analyticsの目標データをサポートしました。指標を選ぶことによって、データの目標を設定することができます。これは、コンバージョンを分析するときに便利です。
- 元のデータにジョインされたデータフレームが左側のパネルでハイライトされるようになりました。
- character型などの列がカラー軸に指定されたときに、複数のカラー・パレットから特定のカラー・パレットを選ぶことができるようになりました。
- データ・インポートのUIで、クエーリーの結果の行数が表示されるようになりました。

### Bug fixes

- Windowsで大容量のデータをインポートできるようになりました。修正される前は、Windows環境だけ2 GB以上のデータをインポートしようとするとエラーになりました。
- ブランチ名を入れる時に名前がコンフリクトした場合エラーを表示しますが、同じダイアログで名前をアップデートできるようになりました。

## R 1.8.0

Released on 7/29/2016

### New Features

- Google Big Queryのデータインポート機能をサポートしました。[こちら](https://blog.exploratory.io/clustering-r-packages-based-on-github-data-in-google-bigquery-1cadba62eb8d#.u9gdj46tr)の方で、Google Big Queryのデータインポート機能について詳しく解説しているので、よかったらご覧ください。
- Amazon Auroraのデータインポート機能をサポートしました。

### Enhancements

- do_ngram関数は、sentence idとdocument idを使います。両方とも、do_tfidf関数によって生まれます。これは、ngramのステップを作る前に、group_byを走らせる必要がないことを意味します。また、列に、ngramテキストを作ります。だから、それらをひとつの列に収めるには、gatherコマンドを使う必要があります。[こちら](https://exploratory.io/reference/#do_ngram)の方で、詳しく解説しているので、よかったら、ご覧ください。
- do_tfidf 関数は、TF-IDFを正規化できるように、引数に、normをサポートしました。デフォルトでは、L2になっています。[こちら](https://exploratory.io/reference/#do_tfidf)の方で、do_tfidfについて詳しく解説しているので、よかったらご覧ください。
- Macだと、Cmd+Enterで、Windowsだと、Control+EnterでデータインポートダイアログでSQLのクエリを走らせれるようになりました。

- MongoDBに、クエリの説明書を加えました。

### Bug fixes

- 指定したブランチでデリートアイコンをマウスオーバーしながら、データフレームを消すと、データ分析のステップも消去されるという問題を修正しました。
- EDF (Exploratory Data File)がマルチバイト文字と一緒にでもダウンロードできるようになりました。
- データフレーム名が左側で小文字と大文字が混合した状態でもソートされるようになりました。

## R 1.7.0

Released on 7/18/2016

### New Features

- データと分析ステップと一緒にチャートを公開できるようになりました。これで、他の人が作ったチャートのプロセスを理解しやすくなりました。
- 一連のパラメータを事前に定義したデータベース・コネクションを作ることができるようになりました。これで毎回コネクション情報を入力する代わりに、使いたいコネクションを選んで即座にデータベースにアクセスすることができるようになります。
- Rのカスタムの関数を定義したRスクリプトを登録することができるようになりました。これでデータ分析のステップからこのように登録されたカスタムの関数を使うことができます。これは、変数を定義するときに使うこともできます。
- プロジェクトごとに読み込むRのパッケージを選ぶことができるようになりました。
- SQLのクエリの一部として、Rスクリプトで定義されている自分の変数を使うことができるようになりました。

### Enhancements

- ヒストグラムのチャートを作るときに、データを区切る数を変更できるようになりました。
- Google Analyticsのデータを１万行以上引き出すことができるようになりました。
- データインポートダイアログをリデザインしました。SQLのクエリを入力するエリアが大きくなりました。
- Webスクレイピングの文字エンコーディングをサポートしました。

### Bug fixes


## R 1.6.1

Released on 7/5/2016

### Enhancements

- dplyrの0.5から出てきた新しい関数のシンタックスヘルプをサポートしました。

### Bug fixes

- Rスクリプトで生成されたlibPathsコマンドは、Windowsでも動くように \ がエスケープされています。
- ユーザーが足したRパッケージは、libraryコマンドといっしょに生成されたRスクリプトに加えられるようになりました。

## R 1.6.0

Released on 6/28/2016

### New Features

- 右側にあるデータ分析ステップのボタン１つで、データの公開をできることになりました。公開されたデータは、ユーザが、どうやってデータ分析がされたかを理解したり、ステップを修正したり加えたりできるように、ダウンロードや分析ステップと一緒にプロジェクトにインポートすることもできます。この機能があれば、ユーザがデータを通して、チームメンバーと共同作業をするのが簡単になります。

- リモートデータインポート機能が、データを引き出すために新しくRedshiftとPostgreSQLに対応しました。MySQLのように、この2つのデータソースからもSQLクエリを書くことができます。

- カスタムで、Rパッケージがインストールできるようになりました。ついに、Exploratoryの中に、ユーザーの好みのRパッケージをインストールできることになりました。インストールされたパッケージは、プロジェクトを開いたときに、自動的に読み込まれます。将来的には、それぞれのプロジェクトレベルで好みのパッケージのインストールができるようになります。


### Enhancements

- get_sentimentは、単語だけでなく、文章でも、sentimentを返せるように、リファクタリングされました。'get_sentiment'関数の古バージョンは、'word_to_sentiment'関数という名前になりました。

- tidyrのバージョンが0.5.1にアップグレードされました。このアップグレードによって、'separate_rows'関数が加えられました。区切られた単語を行に分けることができます。詳しくは、[こちら](https://github.com/hadley/tidyr/releases)からどうぞ

- dplyrのバージョンが、v0.5.0にアップグレードされました。今回のアップグレードでは、たくさんの改善や新しい関数が加えられました。詳しくは、[こちら](https://github.com/hadley/dplyr/releases)からどうぞ

- Rスクリプト生成機能を実装しました。生成されたRスクリプトは、すべてコアなRのパッケージと、ライブラリのパスをExploratoryレポジトリに設定するために、'.libPaths'コマンドを含んでいます。これによって、R consoleやRStudioなど、Exploratory以外のプロダクトで、データ分析ステップを再現することが簡単になりました。

### Bug fixes

- ブランチでチャートを開けなかった問題を修正しました。
- stepsチャート画面で、以前のステップでいくつかの更新があった後に、定規柱が利用できなかったときに、チャートを開けなかった問題を取得しました。
- 生成されたRスクリプトが、必要な、パッケージ名を持っていなかった問題を修正しました。

## R 1.5.2

Released on 6/20/2016

### Enhancements

- 一貫性を持たせるために、テキストマイニングや統計的な関数を含むすべての機械学習関数のスペックを更新しました。

### Bug fixes

- 無効な関数がステップで使われたとき、テーブルやチャートにエラーが反映されていなかった問題を修正しました。
- 'build_kmeans.kv'コマンドは、元のデータの上では、クラスタIDを正確に引数にとっていなかった問題を修正しました。

## R 1.5.1

Released on 6/19/2016

### Enhancements

- Scatterplotにテキストラベル表示を追加しました。

### Bug fixes

- JSONファイルが、Windowsのファイルピッカーに正確に表示されていなかった問題を修正しました。
- チャートシェア機能が、Facebookでうまくいっていなかった問題を修正しました。
- Chart埋め込みのiframeコードが適切な高さと幅を持っていなかった問題を修正しました。

## R 1.5.0

Released on 6/15/2016

### New Features

- Noteを書くことなしに、データフレームの中にあるチャートを直接シェアすることができるようになりました。シェアされたチャートは、ユニークなURLを持ち、そのURLといっしょに、あなたのWordpressなどのブログに自動的に生成されたコードとともに埋め込むことができます。また、Twitter, Facebook, Slackなどの他のメディアにもチャートのURLをシェアすることができます。チャートの画像は、自動的に表示されます。
- 素早く、異なる分析方法の差異を試すために、データフレームの中にいくつかのブランチを作ることができるようになりました。ひとつのデータフレームにある全てのブランチは、同じデータ分析ステップを共有することができます。データフレームの中で複数のブランチを作ることによって、複数のデータ分析方法を簡単にすばやく試すことができるようになることで、データを探索するときの分析の柔軟性と効率性を飛躍させるでしょう。ブランチやステップの中のデータの整合性は、ExploratoryのDAGエンジンで自動的に管理されています。
- より高度なテキスト分析ができるようになりました。'Tidy Data' (きれいに正規化されたデータ）といっしょに動くようにデザインされたテキストマイニングのための関数がいくつか加わりました。これらの関数を使うことで、テキストを素早くトークン化して、余計な文字を消去したり、n-gramsを作ったり、TF-IDFを元に文章を数値化したり、SVDを使って次元を減らすことができ、さらには、ドキュメントのクラスタリング・モデルを生成することができます。

### Enhancements

- チャートのメイン・タイトル、X軸、Y軸のタイトルに自分の好きな文字を入力できるようになりました。
- Windowsバージョンで、タッチパッドで操作するのと同様に、スクロールバーを使って、テーブル画面を縦や横にスクロールできるようになりました。
- filterなどの条件式下で使えるように、%nin% (Not IN) 演算子を加えました。


### Bug fixes

- 文章レベルでのTwitterのデータをトークン化できなかった問題を修正しました。do_tokenize(text, token="sentences”).
- たくさんのチャートやヒートマップでNoteを公開するときに生じていたエラーを修正しました。


## R 1.4.6

Released on 6/6/2016

### Enhancements

- ローカルのファイル・データの更新機能をサポートしました。今なら、ローカルファイルのデータを更新するために、Stepの上のRefreshと書かれたリンクをクリックするとデータを更新することができます。
- Windows版で、ユーザー指定の場所にインストールされているRとGitをサポートできるようになりました。
- コマンドビルダーで、テキストをトークン化して、センチメントを得ることができるようになりました。今なら、列のヘッダーのドロップダウンメニューからテキストデータをトークン化するコマンドを作れて、トークン化されたテキストの感情値を得ることができます。
- ローカルのMongodbをサポートするためにのユーザネームとパスワードを入力しないでも、データをインポートできるようになりました。

### Bug fixes

- Windowsで消したプロジェクトが、アプリケーションを再起動するまで消えなかった問題を修正しました。

## R 1.4.5

Released on 6/2/2016

### 改善

- RDSデータを取り込むときに、データフレームをドロップダウンメニューから選べるようになりました。
- ファイルを簡単にリロードできるように、JSONデータインポートダイアログにGet Dataボタンを加えました。


### バグ修正

- 同じ名前で、ローカルのデータファイルを選び直した後にデータが更新されなかったのを修正しました。
- チャート画面の色の値を重複させれるようになりました。

## R 1.4.4

### Bug fixes

- RとGitのダウンロードがWindows 7で動かなかったのを修正しました。


## R 1.4.3

Released on 5/26/2016

### 改善

- Exploratoryアプリケーションでデフォルトで必要なもの以外のRパッケージをインストールするためのカスタムフォルダーの位置をサポートしました。
- プロキシサーバーを自動的に検出できるようになりました。認証つきプロキシサーバーの場合でも、ユーザ名とパスワードを設定ファイルに記述することで利用可能です。詳しくは[FAQ](https://exploratory.io/faq) をご覧ください。
- CSV / DelimitedFilesをインポートするときに、小数点、３桁ごとのループ・セパレータといっしょに、アメリカ式ではない数字データもサポートしました。

### バグ修正

- アプリケーションを最初に起動したときに、真っ白のスクリーンのまま動かなかったり、UIをローディングしたまま動かなかった問題を修正しました。
- ホームディレクトリに空白がある時に、プロジェクトを開くことができなかったのを修正しました。
- チャート画面で、X軸、Y軸、Colorにアスキー文字以外の文字を指定できなかったのを修正しました。。
- 箱ひげ図(boxplot chart)のX軸に、NAを含むデータを割り当てた時の問題が解決されました。


## R 1.4.2

Released on 5/26/2016

### 新機能

- テキストデータ分析のためのtidytextパッケージが導入されました。これによって、テキストデータをtidyに扱うことができるようになりました。また、このtidytextパッケージの導入により、tidytextパッケージのunnest_tokens関数とpair_counts関数がデータフレームレベルの関数として、また、exploratoryパッケージからget_sentiment関数とget_stopwords関数がフィルターレベルの関数として使えるようになりました。
- rgeolocateパッケージから'ip_to_country'関数が導入されました。これによって、IPアドレスから国名への変換ができるようになりました。
- countrycodeパッケージから'countrycode'関数が導入されました。これにより、国名、2文字、3文字、または3桁の国名コード間の変換ができるようになりました。
- exploratoryパッケージから'calc_cor_cat'関数が導入されました。これにより、tidy形式になっているすべての列の値に対しての相関を計算できるようになりました。また、データフレームの指定された全ての列に対する相関を計算する'calc_cor_var'関数も同時に導入されました。
- 新たなチャートのタイプとして、世界地図およびアメリカ州地図の階級区分図(Choropleth Map)が追加されました。

### 改善

- チャートの散布図(Scatterplot)において、数値型の列を色に指定できるようになりました。
- 'R Script as Data'データソースで使われているデータ生成のためのRスクリプトの部分が、自動生成されるRスクリプトに含まれるようになりました。
- テーブル表示で100列以上のデータを表示できるようになりました。
- lm関数やglm関数の書式をサポートする機能が追加されました。

### バグ修正

- REST APIデータソースおよびJSONデータソースのインポート画面において、サブフォルダに50個以上の列が表示できるようになりました。


## R 1.4.1

Released on 5/16/2016

### 新機能

- データ分析のためのbroomパッケージのtidy, glance, augment関数が導入されました。
- 自分でdo_lm, do_glm, do_kmeansのような関数を使ってモデルを作ったり、データフレームの中にそのモデルを保存できるようにするための、モデルやソースデータタイプカラムのサポートをしました。これで、モデルの統計的なデータの概要の情報にアクセスするためにbroomの関数を呼ぶことや、元のデータカラムと共にデータを増やすこともできるようになりました。

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

- Rのstatsパッケージであるcor()関数に基づいたCorrelation計算のサポートをしました。

   ```
   calc_cor(ARR_DELAY, DPE_DELAY, DISTANCE)

   > This will produce correlation values for each pair.
   ```

- 文字列一致関数 - str_count_all
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
- プロジェクトを作っるときに問題があったあと、データをインポートしようとするとエラーが生じる問題を修正しました。
- いくかのMac PCでアプリケーションを起動できない問題を修正しました。
- コマンド入力エリアでテキストを選ぶ動作の安定性が増しました。
- バッククォートを持ったカラム名もコマンド入力エリアでハイライトされるようになりました。
- Get Dataボタンは、テキストファイルを行にする代わりにテーブル画面を表示するようになりました。
- 手動で-を入力した後に、レコメンドリストが表示されるようになりました。


## R 1.3.0

Released on 5/2/2016

### 新機能

- データ分析のためにコマンドビルダーが実装されました。
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
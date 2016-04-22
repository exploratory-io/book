###フライトのデータを分析しよう - part 1

####この章であなたが学ぶこと：

- 特定の列を選ぶ - select()
- 計算結果をもとに新しい列を作る- mutate()
- 曜日の値を抽出する - wday()
- データをグルーピングする- group_by()
- データを集計する - summarize()
- データをフィルターする - filter()

####フライトの遅延データをダウンロードしよう

この章では、3つのデータファイルを使うことになります。クリックしてダウンロードすることができます。

・[Flight delay 2016 January data](http://download.exploratory.io/data/airline_delay_2016_01.csv)

####新しいプロジェクトを作ろう

Exploratoryを開いたら、まず新しいプロジェクトを作りましょう。

![Alt text](images_ja/getting-started1_ ja.png)


####サンプルデータをインポートしよう

Data Frameの横にある＋アイコンを押すとairline_delay_part1.csvをインポートすることができます。

![Alt text](images_ja/getting-started2 _ja.png)

ファイルを開くダイアログボックスからファイルを選んだ後に、 OKボタンを押すと、あなたがインポートしたデータをこのように確認することができます。

![Alt text](images_ja/flight-data-import_ja.png)

データはうまく表示されているので、そのままImportボタンをクリックします。

####サマリーデータ画面

いったんデータをインポートすると、サマリー画面で、データの概要を見ることができます。上に25カラムと445,827行があると表示されています。また、他のカラムものぞき見することもできます。例えば、CARRIERカラムではもっとも頻繁に出てくる航空会社を見ることができます。


![Alt text](images_ja/flight-summary_ja.png)


スクロールしていくと、NA値を持ったARR_DELAYカラムを見つけることができますね。

![Alt text](images_ja/flight-summary2_ja.png)


####カラムを選ぶか取り除こう

There are many ways to select only the columns you want for your analysis. Let's try some of them.

First, let's drop 'FL_NUM' column'. Click the plus '+' icon and select 'Select' from the dropdown menu.


![Alt text](images_ja/flight-select_ja.png)

![Alt text](images_ja/flight-select-suggestion_ja.png)

![Alt text](images_ja/flight-select-suggestion2_ja.png)



![Alt text](images_ja/flight-select-run_ja.png)

![Alt text](images_ja/flight-select_ja.png)

![Alt text](images_ja/flight-select-starts-with.png)

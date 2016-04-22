###フライトのデータを分析しよう - part 1

####この章であなたが学ぶこと：

カラムを選ぶ - select()関数
新しいカラムを作る- mutate()関数
データタイプを変更する - wday()関数
データをグルーピングする- group_by()関数
データを統合する - summarize()関数
データをフィルタリングする - filter()関数

####フライトの遅延データをダウンロードしよう

この章では、3つのデータファイルを使うことになります。クリックしてダウンロードすることができます。

・[Flight delay 2016 January data](http://download.exploratory.io/data/airline_delay_2016_01.csv)

####新しいプロジェクトを作ろう

Exploratoryを開いたら、まず新しいプロジェクトを作りましょう。

![Alt text](./getting-started1_ ja.png)

####サンプルデータをインポートしよう

Data Frameの横にある＋アイコンを押すとairline_delay_part1.csvをインポートすることができます。
![Alt text](./getting-started2 _ja.png)

ファイルを開くダイアログボックスからファイルを選んだ後に、 OKボタンを押すと、あなたがインポートしたデータの10つの行をこのように確認することができます。

![Alt text](./flight-data-import_ja.png)

データはうまく表示されているので、そのままImportボタンをクリックします。

####Summary data view

![Alt text](./flight-summary_ja.png)


And, when you scroll down you can see ARR_DELAY column having NA values and its data range quickly.

![Alt text](./flight-summary2_ja.png)


####カラムを選ぶか取り除こう

There are many ways to select only the columns you want for your analysis. Let's try some of them.

First, let's drop 'FL_NUM' column'. Click the plus '+' icon and select 'Select' from the dropdown menu.


![Alt text](./flight-select_ja.png)

![Alt text](./flight-select-suggestion_ja.png)

![Alt text](./flight-select-suggestion2_ja.png)



![Alt text](./flight-select-run_ja.png)

![Alt text](./flight-select_ja.png)

![Alt text](./flight-select-starts-with.png)


book/tutorials/images/flight-select-starts-with2.png





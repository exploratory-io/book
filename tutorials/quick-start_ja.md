# スタートガイド

かかる時間(初めから終わりまで) : 約60分

これは、米国の航空機の発着遅延データの探索的なデータ分析を行うことで、Exploratory デスクトップを使いこなす方法を紹介する入門ガイドです。対象となる主な分野は次のとおりです。

* 新しいプロジェクトを作成してデータをインポートする
* 要約ビューでデータを検査する
* データの変換（データラングリング）
  * 文字データの解析と**日付への変換**
  * 日付から**曜日の情報を抽出**する
  * 複数の列に**列を分ける**
  * **欠損値**を扱う
  * 他のデータセットとの**結合**
* データの可視化
  * **ジオコードを使用した**地図
  * **パーセント合計**を使用したピボットテーブル
  * **表計算(Window Calculation)**を使用したラインチャート
  * **グループ毎のトップ100**を使用した箱ひげ図
  * **トレンドライン**を使った散布図 (線形回帰モデルと一般化加法モデル)
  * **k平均クラスタリング**
* データ操作と分析を翌月のデータで**再現する**
* **再現可能な**方法でチャートをシェアする
* インサイトをシェアするために**ノート**を作成する

ステップを進んでいる間にご質問がある場合は、チャットウィンドウからお気軽にお問い合わせください。

![](images/chat-inside-app.png)

また、support@exploratory.ioまでe-mailを送ってください。

## 航空機の離発着遅延サンプルデータのダウンロード

このチュートリアルでは、2016年8月に飛行した米国国内線すべての離発着遅延データを使用し以下の項目を確認します：

* 出発/到着遅延時間の遅れや早さ。
* どこから出発してどこに到着したのか。
* それぞれのフライトでどのくらいの距離を飛んでいたか。

サンプルデータのCSVファイルは、下のリンクからダウンロードできます。

- [Flight delay 2016 August data](http://download2.exploratory.io/data/airline_delay_2016_08.csv)

さあ始めましょう!

## 新しいプロジェクトを作成する

Exploratory デスクトップを起動し、まず新しいプロジェクトを作成します。

![](images/getting-started1.png)

プロジェクト名を入力し、[作成]ボタンをクリックします。

![](images/quick-start2.png)

##サンプルデータをインポートする

プロジェクト内で、左側のペインの 'Data Frame'テキストの隣にある '+'（プラス）ボタンをクリックし、ドロップダウンリストから 'Import File Data'を選択します。

![](images/quick-start-1.png)

ファイル 'airline_delay_2016_08'を選択すると、プレビューテーブルに表示されるファイルの最初の50行が表示されます。

![](images/quick-start-2.png)

この練習ではすべてのパラメータをそのままにして、[保存]ボタンをクリックするだけです。

インポートされたフライトデータは、以下のようなテーブルビューで表示されます。

![](images/quick-start-3.png)

上部の「サイドバーを隠す」ボタンをクリックすると、左側のセクションが非表示になり、データビュー領域が広くなります。

![](images/quick-start-4.png)

##サマリ・ビューでデータを検査する

[サマリ]タブをクリックすると、要約ビューでデータの要約情報をすばやく確認できます。たとえば、CARRIER列には12のユニークな航空会社があり、そのうち7つが最高から最低のバーチャートとしてリストされています。

![](images/quick-start-5.png)


##データの変換（データラングリング）

このデータの変換のセクションでは、以下のよく行われるデータ変換タスクについて説明します。

* 文字データを解析し、日付に変換する
* 日付からの曜日情報の抽出
* 列を複数の列に分ける
* NA（欠損値）を削除する
* 空港のロケーションデータセットに結合する

###文字データを解析して日付に変換する

以下に示すように、FL_DATEカラムには日付データが含まれているようですが、文字データ型として登録されています。

![](images/quick-start-6.png)

Exploratoryは、通常インポート時の元のデータに基づいてヒューリスティックな推測で各列のデータ型を適切に割り当てます。しかし、元のデータがフォーマットされているために意図した通りに動作しないことがあります。その場合は、インポート後にデータを簡単かつ柔軟に変換することができます。この場合、列ヘッダーメニューから「データ型の変更」→「日付/時刻への変換」→「年、月、日」を選択することができます。

![](images/quick-start-7.png)

元のデータが特定の順序でフォーマットされていたため、「年、月、日」を選択すればよかったのです。 （例えば、2016年8月5日）ここで重要なのは、日付コンポーネントの順序だけです。言い換えれば、分割された文字または月名がフルネーム（August）であっても、対短縮名（Aug）であっても問題になりません。とても簡単です！

ともあれ、次のファンクションが既に設定された状態で、[Mutate（Create Calculation）]ダイアログが開きます。
```
ymd(FL_DATE)
```

![](images/quick-start-8.png)

この 'ymd'関数は、 'lubridate'と呼ばれるRパッケージの日付/時刻解析関数の1つで、データが年、月、日の順に表示されるという前提で解析し、日付データ型に適切に変換します。

「日付」は、年、月、日などの日付情報のみを含む日付データのデータ型です。では時間、分、秒などの時間はどうでしょうか？これには'POSIXct'と呼ばれる別のデータ型があります。これは、日付と時刻の両方の情報を保持できます。

この機能の詳細は、「Docを表示（または非表示）」ボタンをクリックすると表示されます。

![](images/quick-start-9.png)

また、「Function List」ボタンをクリックすると、他のR機能がすべて表示されます。

ともあれ、[実行]ボタンをクリックしてコマンドを実行することができます。

'FL_DATE'列がDateに変換されていることが表示されるようになりました

![](images/quick-start-11.png)

これは、データがタイムラインに沿ってどのように分布しているかを視覚化するヒストグラムチャートを示しています。また、期間は2016-08-01から2016-08-31までであることがわかります。

また、上部に2つの色のついた箱（紫色と緑色）があることに気づくと思います。

![](images/quick-start-13.png)

紫色の箱は、どのコマンドが使用されたかを示します。この場合、 ``` mutate```です。 `` mutate``コマンドはExcelの式に相当し、新しい計算を作成して実行します。 'select'、 'summarize'、 'filter'などのコマンドを後で見るようになるので、ここで困惑しても心配はありません。

今、緑色のボックスには、以下が表示されます。

```
FL_DATE = ymd(FL_DATE)
```

等号 '='の左辺は列名で、右辺は以前に見た ```ymd()```関数を使った計算です。

したがって、 'mutate'コマンドは緑色の箱で定義された計算を実行します。この場合、 ``` ymd(FL_DATE)```であり、その結果を 'FL_DATE'という列名に格納します。元の列名であるため、既存の列の値が上書きされます。

最後に、右側に「Mutate」という新しいステップが追加されていることに気付くでしょう。

![](images/quick-start-12.png)

これはExploratoryデスクトップが背後で実際に実行しているRコマンドそのものです。より多くのデータ操作を実行すると、ここに「ステップ」が追加されていきます。

###日付から「曜日」を抽出する

同じ'Mutate'のステップでもう一度操作をしましょう。

FL_DATE列が 'Date'データ型であるため、 'Day of Week（日、月など）'のような日付コンポーネント情報を抽出できます。列ヘッダメニューから「抽出」 - >「曜日」を選択することができます。

![](images/quick-start-14.png)

開かれた「Mutate」ダイアログで、今回は「新規列の作成」タブが選択されていることに注目してください

![](images/quick-start-14_1.png)

これは、前回と同じように元の列を上書きするのではなく、 ```wday(FL_DATE、label = TRUE)```という計算で新しい列を作成することを意味します。

新しい列名として「day_of_week」と入力し、「実行」ボタンを押します。
![](images/quick-start-15.png)

下にスクロールすると、作成されている新しい列 'day_of_week'が表示されます。

![](images/quick-start-16.png)

ここでは、バーは最も頻度の高い値、この場合「Mon」、から開始するのではなく、「Sun」、「Mon」、「Tue」などで始まっています。これは、この列が 'factor'データ型列として作成されるためです。これは、列内に「並べ替え順」情報を埋め込むことで、カテゴリ変数（列）を扱いやすくするための特殊なデータ型です。これは実際には、曜日のような「順序」に意味のあるデータには完璧です。しかし、そのような順序を無視したい場合は、'factor'データ型列を 'character'データ型列に変換する列ヘッダーメニューから 'Change Data Type'  - > 'Convert to Character'を選択するだけです。

![](images/quick-start-16_1.png)

In this exercise, we'll keep it as is.



## Separate a column into multiple columns

Let's take a look at how you can separate a column into multiple columns.

Here, ORIGIN_CITY_NAME column contains both city names and US State names.

![](images/quick-start-17.png)

Let's say you want to see which US States the most flights departed from. You want to extract only the US State part of the text in this column.

For this, you can simply separate this column by setting a separating character, in this case that is a 'comma', into two columns, one for city names and another for US state names. To make this operation easier to see, let's go to Table view first.

Then, select 'ORIGIN_CITY_NAME column, and select 'Separate' -> 'Separate to Columns by' -> 'Comma(,)' from the column header menu.

![](images/quick-start-18.png)

In the opened 'Separate' dialog, type column names for the new columns to be created. In this case, 'city' and 'state'

![](images/quick-start-19.png)

Once the command is run, you will find two new columns being created, one has the city names and another has the US State names.

![](images/quick-start-20.png)

Also, you would notice that there is a new step just being added at the right hand side.

You can click on 'Mutate' step to see the data before this operation.

![](images/quick-start-20_1.png)

### Work with NA (Missing Values)

When you look at DEP_DELAY column in Summary view, you would notice that there is a slight red color in the green bar.

![](images/quick-start-21.png)

This red bar indicates the ratio of the data that is NA in this column. You can see that 1.32% of the data is NA. There are many ways to handle NA values, but here, let's try removing them with 'filter' command operation.

Select 'Filter' -> 'is not NA' from the column header menu.

![](images/quick-start-22.png)

This will open 'Filter' dialog with 'is not NA' operator being already selected.

![](images/quick-start-24.png)

If you are interested, you can click on the operator dropdown to see many other data type specific operators that are supported out-of-the-box. If you are familiar with R and want to customize it further, you can always go to 'Custom' tab and start typing your 'filter' conditions the way you like.

![](images/quick-start-23.png)

Anyway, you want to simply click on Run button here. You will see that NA is gone now.

![](images/quick-start-25.png)

### Join with Airport Location Data Set

Let's say we want to visualize where these airports are located on Map. We have airport codes in the data, but there is no geo location codes (longitude and latitude) associated with the airports. So, what we can do here is, first, find a mapping table that maps between the airport codes and the geo location codes.

You can find such mapping table easily on the web, but here is one we have published as EDF (Exploratory Data Format) file so that you can import to your Exploratory in a reproducible way.

* [Mapping Table for Airport Codes and Geo Location Codes](https://exploratory.io/data/kanaugust/0814311708280782)

Once you download and import it into your Exploratory, then we can use this mapping table data to assign the geo location codes for each airport code in the 'airline_delay_2016-08' data frame. Basically, it's similar to what you would do with 'vlookup' in Excel or with 'join' operation in SQL or typical BI tools.

In Exploratory, you can use one of the 'join' commands called 'left_join', which would join two data frames by adding columns from 'target' data frame by matching 'key' column values from both data frames. It looks something like below.

![](images/quick-start-join.png)


Anyway, let's go to the above linked page and download the EDF file.

![](images/quick-start-join2.png)

Then, import the EDF file into Exploratory. You can select 'Import Exploratory Data' from 'Add Data Frame' dropdown list.

![](images/quick-start-join3.png)

The data looks like below after the import.

![](images/quick-start-100.png)

Notice that there are a few steps at the right hand side. These are the steps that were used to prepare this 'us-air-port-code' data frame before. You can add more steps or delete these steps if you like, but we'll keep these as is for this exercise.

Also, you can see a column called 'Code', this is the key column we are going to use to join with 'airline_delay_2016-08' data frame.

![](images/quick-start-100_1.png)

Now, go back to 'airline_delay_2016_08' data frame.  

![](images/quick-start-100_2.png)

There is a column called 'ORIGIN', which has the airport codes for the airports from which the flights departed. And this is the column we are going to use to map with the 'us-air-port-code' data frame.

Select 'Join' from 'Add' button menu.

![](images/quick-start-100_3.png)

In the opened 'Join' dialog, select a data frame 'us-air-port-code' for Target Data Frame, and select 'ORIGIN' column for Current Column and 'Code' for Target Column as key columns to join.

![](images/quick-start-103.png)

Once the command is run, you will see new columns from the target data frame 'us-air-port-code' being added at the end.

![](images/quick-start-104.png)

In this tutorial, we have used only 'left_join', but there are other types of 'join'. If you are interested, take a look at these two post for more details.

* [Introduction to Join — Bring extra columns from the target in Exploratory](https://blog.exploratory.io/introduction-to-join-bring-extra-columns-from-the-target-in-exploratory-1ec585ec2cf1#.u003r2k1m)
* [Introduction to Join — filtering data based on the target data in Exploratory](https://blog.exploratory.io/introduction-to-join-filtering-data-based-on-the-target-data-in-exploratory-eedbd7b39d0a#.fudvfqpdm)

Anyway, we have gotten enough data by now, let's start exploring the data with visualization to understand this US flight delay data better.

## Visualize data

There are many ways to visualize data with various chart types in Exploratory. In this exercise, let's use the following chart types to explore the data.

* **Map** - Understand where the flights are leaving from.
* **Pivot Table** - Understand which state and day pairs have more flights than the others.
* **Line Chart** - Understand the trend of the departure delay times in August.
* **Boxplot Chart** - Understand how bad the flights delayed by each carrier.
* **Scatter Chart** - Understand correlations between Arrival Delay and Departure Delay times.

### Map with Geocodes (Longitude and Latitude)

First, let's take a look at where these flights departed from.

Go to Viz view, and select 'Map - Long / Lat' chart type.

![](images/quick-start-106.png)

This will automatically pick up 'Longitude' and 'Latitude' columns and show all the airport locations on the map.

![](images/quick-start-107.png)

You can assign 'Name' column to label, which will make the values of this column show up at the right hand side top of the chart when you move your mouse over on any circle.

![](images/quick-start-108.png)

You can use mouse, track pad, or the buttons at the left hand side top of the map to zoom in or pan.

You can change the background style from 'Layout Configuration' menu.

![](images/quick-start-108_1.png)

For example, you can select 'Dark' type to get black color theme.

![](images/quick-start-108_2.png)

You can change the color palette by clicking on 'Gear' icon next to 'Color'.
![](images/quick-start-108_3.png)


### Pivot Table

Let's use Pivot table to understand which state and day pairs have more flights than the others.

Select Pivot Table, and assign 'state' column to Row and 'day_of_week' column to Column. You can keep Value to the default value, which would count 'Number of Rows' for each group.

![](images/quick-start-27.png)

Notice that the column values are sorted as 'Sun', 'Mon', 'Tue', etc. by respecting the natural order of days of the week. This is because, as you have seen previously, 'day_of_week' column is 'factor' data type and has the sorting order information embedded in, and  Pivot table and other chart types respect the sorting order information when sorting the data.


You can use Color to visualize the data. Select 'All' from the dropdown.

![](images/quick-start-28.png)

You can show the values as '% of Total' instead of the raw numbers. Click on 'Gear' icon next to 'Value' and select '% of Total' from the calculation type dropdown.

![](images/quick-start-29.png)

The default setting calculates the '% of Total' as a percentage of all the values in Pivot table. But you might want to see the percentage of each US state or each Day of Week. For example, you can change the 'Direction' setting to 'Row' to make it easier to see which day of the week have more flights than the other days for each state.

![](images/quick-start-30.png)

We can see that most of the states have more flights between Monday and Wednesday. And Saturday is the lowest for most of the states.

You can click on 'Sat' to sort the data based on the values in this column. It turned out VI (US Virgin Islands) has more flights on Saturday than any other days of week, unlike any other US States. This is probably because more people go there for vacation than for business.

![](images/quick-start-31.png)

### Line Chart / Time Series

Let's take a look at the trend of the flight departure delay times during this time period of August, 2016.

Select 'Line' chart and assign 'FL_DATE' column to X-Axis. Since 'FL_DATE' column is Date data type, you can select a date level (e.g. Year, Month, Day) to aggregate the data. For example, you can set it to 'Day' to aggregate the data by day, instead of the default 'Year'.

![](images/quick-start-32.png)

Now, assign 'DEP_DELAY' column to Y-Axis to see the trend of the flight departure delay time. The default data aggregation function is set to 'Sum', but you can change this to something like 'Average'.

![](images/quick-start-33.png)

You can assign 'CARRIER' column to Color to see the trend by each airline carrier.

![](images/quick-start-34.png)

You can click on any of the values in Legend to show or hide the lines inside the chart.

![](images/quick-start-35.png)

Double click on any part on the chart area, this will re-adjust the chart scales to show the currently available values in the most effective way.

![](images/quick-start-36.png)

You can also use Drag and Drop gesture to select an area to zoom in.

![](images/quick-start-37.png)

You can double click on any part on the chart to get back to the original zoom level.

Now, let's take a look at how the departure delay times were getting accumulated by each carrier as the time progresses, by using one of the embedded Window Calculation types called 'Cumulative Sum' (or Running Total).

Click on the property icon and select Window Calculation from the list.

![](images/quick-start-38.png)

Select 'Cumulative' and 'Sum' from the lists.


![](images/quick-start-39.png)

We can see that Delta Airline (DL) has accumulated large amount of the departure delay times. It looks that something must have happened in that particular week. Well, it turned out that there was a global computer system outage for Delta on August 8th, 2016, which caused large-scale cancellations and took a few days before getting back to normal schedule. [News from CNN.](http://money.cnn.com/2016/08/08/news/companies/delta-system-outage-flights/)


Also, we can see that some airlines like Hawaiian (HA) and Alaska (AS) are consistently very low departure delay times, which means that their flights got sometimes delayed but those were rather exceptions, unlike the other carriers where the delays are observed as normal trends.

## Boxplot

Let's dig in a little bit more on the departure delay time. We can change the chart type to Boxplot, which would show the data distribution of the departure delay times for each carrier by each day.

![](images/quick-start-40.png)

You can drag the mouse to select the time range between August 7th and 14th to zoom in.

![](images/quick-start-41.png)


![](images/quick-start-42.png)

We can see that many of Delta (DL) airline flights were delayed significantly on August 8th, 9th, and 10th. As we have seen above, this is due to the Delta's computer system outage happened on August 8th. The system came back online on the same day, but we can see that it took them for a few days to get most of the flights back on schedule.

Now, we can switch X-Axis to CARRIER column and see the data distribution of the departure delay time for each carrier.

![](images/quick-start-43.png)

The default setting removes the outlier values, which are extremely high or low values compared to most of the data. You can bring them back by checking 'Include Outlier' checkbox.

![](images/quick-start-44.png)


Now, let's say we want to know how bad the delayed flights were focusing on the worst 100 flights based on the delay time for each carrier.

Click 'Add' button, and select 'Keep Only' -> 'Top N'.

![](images/quick-start-45.png)

Type 100 and select 'DEP_DELAY' column, and click 'Run' button.

![](images/quick-start-46.png)

The chart is showing the worst 100 flights now.

![](images/quick-start-47.png)

But this worst 100 flights are based on all the flights from all the carriers. This is why we don't see the carriers like HA (Hawaiian), WN (Southwest), etc.

What we wanted to see was the worst 100 flights per each carrier, not for all. We can actually achieve this easily by using 'group_by' command to group the data frame before applying the 'Top N' command.

Before adding 'group_by' step, let's click on 'Pin' button at the right hand side top of the chart area.

![](images/quick-start-48.png)

This will make the chart always reference to the data generated by this 'Top N / Bottom N' step.

Now, click on 'Filter' step right before 'Top N / Bottom N' step at the right hand side.

![](images/quick-start-49.png)

Notice that the chart is still showing the result of 'Top N', not the result of this 'Filter' step.

Select 'Group By' from 'Add' button menu.

![](images/quick-start-50.png)


Select 'CARRIER' from the column list.

![](images/quick-start-51.png)

This will automatically update the chart. It is now showing the range of the delay times for the worst 100 flights for each carrier.

![](images/quick-start-52.png)

Notice that the step that is currently selected at the right hand side is still 'Group By', but the data shown in the chart is the result that has applied 'Top N / Bottom N' step.  This is what 'Pin' button can do for you!

### Scatterplot

Now, how the departure delay time and the arrival delay time are correlated? In other words, did the flights that delayed for the departure time also delayed for the arrival time? If so, were there any correlation between those two delayed times?

To investigate such correlation, we don't need the last two steps of 'Group By' and 'Top N / Bottom N' we added previously because we would rather evaluate the entire data. So for this analysis, instead of deleting these two steps, we can create something called 'branch' data frame off from the step before 'Group By' step. This way, we can create two data frames with two different data wrangling paths while sharing the common part of the data wrangling steps.

Select 'Filter' step at the right hand side.

![](images/quick-start-57.png)

Select 'Create Branch' from the action menu.

![](images/quick-start-56.png)

Type a name for a new 'branch' data frame name, such as 'correlation', and click 'Create' button.

![](images/quick-start-58.png)

You would notice that there is a new data frame called 'correlation' created underneath the main data frame 'airline_delay-2016-08'.

![](images/quick-start-59.png)

Also, you would notice that the steps at the right hand side are grayed out.

![](images/quick-start-60.png)

These are the steps that are managed in the main data frame 'airline_delay_2016-08'. This 'correlation' data frame inherits the result of these steps from the main data frame.

Now, we can go to Viz view and select 'Scatter' as the chart type, assign 'DEP_DELAY' to X-Axis and 'ARR_DELAY' to Y-Axis.

![](images/quick-start-61.png)

There seems to be some degree of 'linear' correlation between the two measures.

We can see how the correlations look like for each carrier by assigning 'CARRIER' column to 'Repeat By'.

![](images/quick-start-64.png)

You can adjust 'Repeat By' properties to see all the charts better.

![](images/quick-start-66.png)

For example, we can select '4' for the number of the charts for each row, check 'Fit All the Charts in Viz Area' checkbox, and un-check 'Sync Scales Among Charts' to not synchronize the scales for X and Y axes among the charts.

We can see that some carriers like 'AA' and 'DL' are showing much more clear 'linear' correlations compared to others like 'F9' and 'HA'. We can see this even better by showing Trend Line.

Select 'Trend Line' from Y-Axis property menu.

![](images/quick-start-67.png)

Select 'Linear Regression' to use Linear Regression model to calculate the trend line, and select 'Data Range for Each Group' for 'Line Length' so that the trend lines will be drawn only for the data range of each carrier.

![](images/quick-start-68.png)

Again, the dots that represent the flights are nicely on the linear trend lines for some carriers like 'AA', 'NK', but not so much for 'F9', 'VX'.

### K-means Clustering

Now as you might have noticed though, most of the data are gathered around 0 for both the departure and the arrival delays. And the linear relationship between the two measures could be different depends on the range of the delay times.

So we can group the flights based on the arrival and departure delay times. If you want to group the data automatically based on the two or more measures, you can use one of the clustering algorithms called 'K-means'.

Select 'Run Analytics' -> 'Cluster with 'K-means'.

![](images/quick-start-69.png)

In the opened dialog 'Cluster with K-means', select 'DEP_DELAY' and 'ARR_DELAY' columns under 'Select Columns' section, and set '5' as the number of the clusters it will create, and click 'Run' button.

![](images/quick-start-70.png)

You can see what has just happened better in Table view. Scroll to the very right, and you will notice that there is a new column called 'cluster' which has the cluster id for each row (flight).

![](images/quick-start-72.png)

Now, go back to Viz view, and assign this 'cluster' column to Color.

![](images/quick-start-85.png)

Now, as you notice though, the clustering calculation was done against the entire data set. If you remove 'CARRIER' from Repeat By, then you can see how the 5 clustered groups look like.

![](images/quick-start-87.png)

Let's say we want to cluster the data for each carrier, meaning we want to see 5 clustered groups for each carrier. This can be done by grouping the data frame before calculating the cluster IDs. This is very similar to what you have done with 'Top N' operation before.

First, make sure that you 'Pin' the chart before going to the next step.

Then, select 'Filter' step, which is gray colored because it's coming from the main data frame.

![](images/quick-start-86.png)

Select 'Group By' from 'Add' button menu to add this grouping step.

![](images/quick-start-88.png)

And, select 'CARRIER' column.

![](images/quick-start-89.png)

This will automatically run the next step of 'K-means Clustering' because the currently displayed chart is 'Pinned' to the step.

![](images/quick-start-90.png)

Lastly, we can show Trend Line. This time, we can try 'Polynomial (GAM)' as Type and select 'Data Range for Each Group'.

![](images/quick-start-91.png)

Unlike 'Linear Regression', which is to build linear regression models assuming it can draw a linear line to express the correlation between a given pair of two measures, 'Polynomial (GAM)' is to build general additive models assuming that it can draw a smooth curve between a given pair of two measures by optimizing for the 'local fitting' or for each divided subsection of a given data.

If you are not sure about this, no worry, Think of Linear Regression is a way for drawing a linear line and Polynomial is a way for drawing a smooth line / curve.

As you can see the above, the polynomial smooth curves tend to look more like linear lines as the delay times become larger. This means that it's easier to predict how late the arrival time will be if we know how late the departure time was beforehand, although there are a few exceptions like F9, HA, etc.

## Reproduce Analysis Works

Now, let's say you have just received a new flight delay data set for the next month, September, and want to run the same data transformation and analysis you have done before. There are two simple ways to do this.

1. Duplicate Data Frame and Switch Source Data
2. Copy Steps from One Data Frame to Another

For this exercise, first, download the September data set from this link.

* [Flight delay 2016 September data](http://download2.exploratory.io/data/airline-delay-2016-09.csv)

And here's how.

### 1. Duplicate Data Frame and Switch Source Data

The simplest way to do this is to duplicate the current data frame and save it as a different name.

![](images/quick-start-rep7.png)

Check 'Include Viz' checkbox to copy all the charts along, and type a data frame name.

![](images/quick-start-rep8.png)

Once it's copied, then go to the new data frame, switch the data source by clicking on 'Gear' icon.

![](images/quick-start-rep9.png)

Click 'Change File' button and select the above CSV file 'airline_delay-2016-09.csv', and click 'Update' button at the bottom.

![](images/quick-start-rep10.png)

You will see that all the data transformation steps are automatically applied to this new data set. And when you go to Viz tab, you can see the same chart setting for September data. In this month, we can see that 'F9' is the carrier that accumulated much larger departure delay times than the others!

![](images/quick-start-rep11.png)

The advantage of this option is that you can keep not only the data wrangling steps but also all the charts inside the data frame. The downside of this option is that you end up copying all the steps and branches together, so you will need to clean up after the duplication. And this is why you might want to consider the next option.

### 2. Copy Steps from One Data Frame to Another

Import the above CSV file as a new data frame.

![](images/quick-start-rep1.png)

Go back to the original data frame 'airline_delay_2016-08', and click on 'Select' button at the top of the steps at the right hand side.

![](images/quick-start-rep2.png)

Select the steps you want to copy, in the picture below, I'm copying only from 'Mutate' step to 'Left Join' steps, but you can copy all the steps as well. And, select 'Copy Steps' from 'Action' button dropdown list.

![](images/quick-start-rep3.png)

Then, go back to the new data frame 'airline_delay_2016-09'.

![](images/quick-start-rep4.png)

And select 'Paste Steps' from the action menu at 'Source' step at the right hand side.

![](images/quick-start-rep5.png)

This will add those copied steps to this data frame so that you will end up getting the data that has all the data transformation operations applied.

![](images/quick-start-rep6.png)

Very simple!


## Share Chart

Once you find an interesting insight you might want to share it with others. With Exploratory, you can easily share not just the chart, but also the data wrangling steps along with the chart so that others will be able to reproduce your work easily.

Select 'Share Viz' under 'More' button.

![](images/quick-start-74.png)

Fill in Title and Description.

![](images/quick-start-75.png)

Select 'Private', if you like to share it privately.

And, click 'Share' button.

Once it's published, you will see 'Add or more users' link.

![](images/quick-start-76.png)

Clicking on the link will take you to the published page with 'Share' dialog opened.

![](images/quick-start-77.png)

By clicking on 'Enable' link, you can allow anyone with this uniquely generated URL to open this chart page. Note that, in case you have shared it publicly, then you can simply copy the page URL and share it with others, without needing to enable this unique URL.

![](images/quick-start-78.png)

On the published chart page, you or others you shared with can click 'Download' button and select 'Download EDF' to download the chart in a reproducible format.

![](images/quick-start-79.png)

This means, others can import the downloaded EDF file into their Exploratory and will see not only the chart but also all the data wrangling steps to produce the chart data.


## Create Note

Finally, you can create your analysis report by creating Note.

Click 'Plus' button next to 'Note'.

![](images/quick-start-80.png)

Type a name in the pop-up and click 'Create' button.

This is a Rich Text Editor, so you can write anything you like. Highlighting the text will prompt you a formatting menu.

![](images/quick-start-83.png)

Every time you hit Enter key to start a new line, you will see 'Plus' button at the beginning of the line.

![](images/quick-start-83_1.png)

By clicking on the button you will see a chart icon.

![](images/quick-start-83_2.png)

You can click this to get a Chart picker dialog. Select a data frame where the chart were created, select the chart, and click 'OK' button.

![](images/quick-start-82.png)


Once you finish writing the report, you can either publish it so that you can share by URL or save it in a HTML document.

![](images/quick-start-84.png)

Lastly, you can click Refresh button to refresh all the charts that are in the Note. This will reload the data from the underlying data sources like databases, files, etc. for each chart.

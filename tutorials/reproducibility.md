
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



## 分析作業を再現する

今度は、9月の翌月の新しい飛行遅延データセットを受け取ったばかりで、前に行ったのと同じデータ変換と解析を実行したいとします。これを行うには2つの簡単な方法があります。

1.データフレームを複製しソースデータを入れ替える

2.データフレームから別のデータフレームへステップをコピーする

この演習では、まず、このリンクから9月のデータセットをダウンロードしてください。

* [Flight delay 2016 September data](http://download2.exploratory.io/data/airline-delay-2016-09.csv)

そして以下が手順です。

### 1. データフレームを複製しソースデータを入れ替える

これを行う最も簡単な方法は、現在のデータフレームを複製し、別の名前で保存することです。

![](images/quick-start-rep7.png)

「Vizを含む」チェックボックスをオンにして、すべてのチャートをコピーし、データフレーム名を入力します。

![](images/quick-start-rep8.png)

コピーが完了したら、新しいデータフレームに移動し、「歯車」アイコンをクリックしてデータソースを切り替えます。

![](images/quick-start-rep9.png)

「ファイルの変更」ボタンをクリックし、上記のCSVファイル 「airline_delay-2016-09.csv」を選択し、下部にある[更新]ボタンをクリックします

![](images/quick-start-rep10.png)

すべてのデータ変換ステップがこの新しいデータセットに自動的に適用されることがわかります。 Vizタブに移動すると、9月のデータと同じグラフ設定が表示されます。今月は、「F9」が他のものよりもずっと大きな出発遅延時間を積み上げた航空会社であることがわかります！

![](images/quick-start-rep11.png)

このオプションの利点は、データ・ラングリングのステップだけでなく、データフレーム内のすべてのチャートも保持できることです。このオプションの欠点は、すべてのステップとブランチを一緒にコピーすることになるため、複製後にクリーンアップする必要があることです。そして、これがあなたが次の選択肢を検討したい理由です。

### 2. データフレームから別のデータフレームへステップをコピーする

上記のCSVファイルを新しいデータフレームとしてインポートします。

![](images/quick-start-rep1.png)

元のデータフレーム「airline_delay_2016-08」に戻り、右側のステップの上部にある「選択」ボタンをクリックします。

![](images/quick-start-rep2.png)

コピーするステップを選択します。下の図では、「Mutate」ステップから「Left Join」のステップまでのみコピーしていますが、すべてのステップもコピーできます。「アクション」ボタンのドロップダウンリストから「コピーステップ」を選択します。

![](images/quick-start-rep3.png)

その後、新しいデータフレーム 「airline_delay_2016-09」に戻ります。

![](images/quick-start-rep4.png)

右側の「ソース」ステップのアクションメニューから「ペーストステップ」を選択します。

![](images/quick-start-rep5.png)

これにより、これらのコピーされたステップがこのデータフレームに追加され、すべてのデータ変換操作が適用されたデータが取得されます。

![](images/quick-start-rep6.png)

とてもシンプルですね！

---
title: "Page を作る"
description: "Claude などの AI ツールに販売注文データを渡して、注文状況を確認できるダッシュボードを Exploratory Page として公開します。"
---

Exploratory Page を使うと、Claude などの AI ツールにデータと目的を伝えて、ブラウザで開けるダッシュボードや分析レポート、スライドを作れます。ここでは Claude のデスクトップアプリを例に、Exploratory に公開された「販売注文データ」から、注文状況を確認できるダッシュボードを作ります。

## AI ツールを Exploratory につなぐ

Exploratory Page は、Server MCP につないだ AI ツールから作れます。Claude のほか、ChatGPT や Cursor などでも使えます。つなぎ方は、[AI ツールから追加する](/ja/mcp/server/clients/apps)をご覧ください。この例では、Exploratory コネクタを接続済みの Claude のデスクトップアプリから始めます。

## 注文状況のダッシュボードを作る

依頼文には、使うデータの名前、ダッシュボードで見たいこと、デザインの参考にしたいページの URL を入れます。

```text
Exploratoryサーバーにある「 販売注文データ」を対象にして、注文状況をモニタリングできるインタラクティブなダッシュボードを作ってPageとして公開してください。
デザインについては、以下を参考にしてください。
https://v0.app/templates/campaignhub-marketing-campaign-management-platfo-wpeZSxe4nfK
https://v0.app/templates/uxbooster-modern-ux-analytics-dashboard-pHUEegzaKXu
```

❶ 新しいチャットを開き、上の依頼文を入力欄に貼り付けます。

![Claude の新しいチャットの入力欄](images/ja/page-01-new-chat.png)

❶ 右下の上向き矢印を押して送信します。

![Claude の入力欄の右下にある送信ボタン](images/ja/page-02-prompt.png)

Exploratory のツール（Get Data Schema や Publish a Page など）を初めて使うときに許可を求められたら、ツール名と操作内容を確認して許可します。

❶ 「進行状況」の「データを確認中」を見ます。Claude は Get Data Schema でデータの列や型を調べています。

![進行状況の「データを確認中」](images/ja/page-04-working.png)

## Claude にブラウザでの確認を許可する

Chrome の拡張機能「Claude in Chrome」を入れていると、Claude ができた Page を Chrome で開いて確かめることがあります。

❶ Claude が Chrome で「ページを開く」許可を求めたら、開こうとしている URL を確認し、「このウェブサイトを常に許可する」を選びます。

![Chrome でページを開く許可](images/ja/page-03-approve.png)

❶ 続けて「スクリーンショットを撮る」許可を求められたら、操作を確認し、「このウェブサイトを常に許可する」を選びます。

![Chrome でスクリーンショットを撮る許可](images/ja/page-03b-approve-chrome-action.png)

試したときは、「このウェブサイトを常に許可する」を選んだあと、同じチャットで同じサイトのページをもう一度開いても、「ページを開く」許可は表示されませんでした。新しいタブを開く操作では、同じチャットでも確認が出ました（下記）。新しいチャットでは、同じサイトでも最初に「ページを開く」許可をもう一度求められることがあります。

「新しいタブを開く（Tabs Create）」の確認では、許可する場合に選べるのは「1回だけ許可する」です。確認が出るたびに、このボタンを選びます。

## 完成した Page を開く

❶ ご自身で作ったダッシュボードを開くには、Claude の返事にあるリンクをクリックします。

![Claude の返事にある Page のリンク](images/ja/page-05-done.png)

❶ ダッシュボードの「注文件数」で、選んだ期間の注文が何件だったか、前の期間からどれだけ変わったかを確認できます。

![ダッシュボードの「注文件数」](images/ja/page-06-page-open.png)

❶ 下へスクロールし、「カテゴリ別売上」で「PC周辺機器」の棒をクリックすると、そのカテゴリの注文に絞り込めます。

![カテゴリ別売上の「PC周辺機器」の棒](images/ja/page-06b-page-scroll.png)

この手順で作ったダッシュボードは、次のリンクから開けます。

[この手順で作ったダッシュボードを開く](https://exploratory.io/page/GMq1Qom5tS/krz8Kyh3Uo)

## 指示と完成例を見比べる

注文状況を追うダッシュボードのほかに、分析の結果を文章で読むノートや、会議で説明するスライドも作れます。

**ダッシュボードで注文状況を見る**

上の手順とは、デザインの参考にしたページが違う依頼文で作りました。

```text
Exploratoryサーバーにある「 販売注文データ」を対象にして、注文状況をモニタリングできるインタラクティブなダッシュボードを作ってPageとして公開してください。
デザインについては、以下を参考にしてください。
https://v0.app/templates/optimus-the-ai-platform-to-build-and-ship-LHv4frpA7Us
```

![注文状況のダッシュボードの完成例](images/ja/sample-dashboard.png)

[ダッシュボードの完成例を開く](https://exploratory.io/page/GMq1Qom5tS/Zqr2rYj9uH)

**ノートでブランド A の満足度に関係する要因を読む**

```text
以下のデータを対象にブランドAの満足度に対して関係する要因をドライバー分析をして、分析レポートをPageで作成してください https://exploratory.io/data/exploratory/SKz6cZH7
```

![ブランド A の満足度を分析したノートの完成例](images/ja/sample-note-2.png)

[分析ノートの完成例を開く](https://exploratory.io/page/GMq1Qom5tS/fAr6BQN2Xh)

**スライドで経営層に分析結果を伝える**

```text
ブランドサーベイのデータがサーバーにパブリッシュされているので、それを元にブランドAの満足度に関するドライバー分析を行って、エグゼクティブ向けのスライドを作ってpageに公開してください。デザインは以下を模倣してください。page作成時の決まりの色は使用しなくてよく、以下のデザインを最大限参考にして作ってください。https://v0.app/templates/ai-product-portfolio-LFFFrvSq9Bb
```

![経営層向けスライドの完成例](images/ja/sample-slide-2.png)

[スライドの完成例を開く](https://exploratory.io/page/GMq1Qom5tS/zyH0jPM0AJ)

<Tip>
今回のダッシュボードとスライドでは、参考にしたいテンプレートの URL を添えるだけで、希望に沿った見栄えに仕上がりました。作りたい資料に近い例を探して、依頼文に加えてみてください。[v0 のテンプレート一覧](https://v0.app/templates)
</Tip>

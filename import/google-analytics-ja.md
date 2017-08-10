# Google Analytics Data

## 1. Google Analytics Dataのメニューを選択

データフレームの隣にある'+' ボタンをクリックして、クラウドアプリケーションデータをインポートをを選択。

![](images/import-cloudapps.png)

Google Analyticsをクリック

![](images/google-analytics-select.png)

## 2. OAuthの設定

[この説明](https://blog.exploratory.io/how-to-setup-oauth-cloud-apps-connections-in-exploratory-a5c20d18e7c7)にしたがってコネクションを作成

## 3. パラメタを設定

- データフレーム名を入力。
- ドロップダウンメニューからView IDを選択.
- 過去N日。デフォルトは30日です。これは過去30日分のデータを抽出することを意味します。この値は必要に応じて更新できます。
- ドロップダウンリストから、ディメンションと指標を選びます。
- もし結果が10,000行(1回あたりのAPIの限度)以上になる場合は、ページネートクエリーをYesに設定します。
- セグメント: 付録を参照

![](images/google-analytics-setting.png)

## 4. プレビューとインポート

'データの取得'ボタンをクリックして、Google Analyticsからのデータを確認します。 よければ'インポート'ボタンをクリックしてデータをExploratoryに取り込みます。


## 付録

### ディメンションと指標

ドロップダウンリストから、データを見たいディメンションと指標の一覧を選択できます。

ディメンションと指標についての詳細は、[Query Parameter reference page (英語)](https://developers.google.com/analytics/devguides/reporting/core/v3/reference)や[ディメンションと指標(日本語)](https://support.google.com/analytics/answer/1033861?hl=ja)を参照してください。また、[Google Analytics Query Explorer tool page(英語)](https://ga-dev-tools.appspot.com/query-explorer/) は、Google Analyticsがサポートする様々なパラメタを試すのに便利です。

### セグメント

#### 概要
セグメントはGoogle Analyticsのデータをフィルタして、必要なデータだけをサブセットとして取り出すのに便利です。たとえば、すべてのユーザーのうち、特定の国や都市のユーザーだけを取り出すことができます。

#### 使い方
セグメントを使用する際には、事前定義されているセグメントを、その`id`をパラメタに指定して使う方法と、定義自体をパラメタに指定して使う方法の２種類あります。

##### IDを指定して使う方法

例えば、iOSのデバイスからのアクセスだけにデータをフィルタしたい場合は、
Segmentのパラメタに`gaid::-17`と指定するとiOSのデバイスからのアクセスだけにデータをフィルタできます。

![](images/segment-ios-example.png)

Google Analyticsには以下の事前定義のセグメントが用意されています。括弧の中は各IDの説明です。

|ID         | Description                            |
|-----------|----------------------------------------|
| gaid::-1  | All Users                              |
| gaid::-2  | New Users                              |
| gaid::-3  | Returning Users                        |
| gaid::-4  | Paid Traffic                           |
| gaid::-5  | Organic Traffic                        |
| gaid::-6  | Search Traffic                         |
| gaid::-7  | Direct Traffic                         |
| gaid::-8  | Referral Traffic                       |
| gaid::-9  | Sessions with Conversions              |
| gaid::-10 | Sessions with Transactions             |
| gaid::-11 | Mobile and Tablet Traffic              |
| gaid::-12 | Non-bounce Sessions                    |
| gaid::-13 | Tablet Traffic                         |
| gaid::-14 | Mobile Traffic                         |
| gaid::-15 | Tablet and Desktop Traffic             |
| gaid::-16 | Android Traffic                        |
| gaid::-17 | iOS Traffic                            |
| gaid::-18 | Other Traffic (Neither iOS nor Android)|
| gaid::-19 | Bounced Sessions                       |
| gaid::-100| Single Session Users                   |
| gaid::-101| Multi-session Users                    |
| gaid::-102| Converters                             |
| gaid::-103| Non-Converters                         |
| gaid::-104| Made a Purchase                        |
| gaid::-105| Performed Site Search                  |
------------------------------------------------------

# リリースノート

## 6.11.2.1

2022年10月19日にリリース。

### ダウンロード

* [新規のインストールの場合](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-6.11.2.1.tar.gz)
* [アップグレードの場合](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-images-6.11.2.1.tar.gz)

### 修正された問題

* スーパーテーブル: 検索ボックスが隣のラベルに重なってしまう。

## 6.11.0.5

2022年9月28日にリリース。

### ダウンロード

* [新規のインストールの場合](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-6.11.0.5.tar.gz)
* [アップグレードの場合](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-images-6.11.0.5.tar.gz)

### 機能強化

* インサイト: 招待されたすべてのユーザーがデフォルトでパラメータを利用できるようになりました。
* パラメーター: 「データ型」にDate型やPOSIXctを選んだときに、「レンジ」のデフォルト値に「最初の日(Min)」や「最後の日(Max)」を利用できるようになりました。

### 修正された問題

* インサイト: インサイトをパブリッシュした際、「チームメンバーに通知する」設定を有効にしていても、「バージョンの履歴」から「復元」したときに通知のメールが送られない。
* インサイト: パブリッシュしたダッシュボードやノートからエクスポートしたチャートのデータをExcelで開くと日本語が文字化けする。
* インサイト: ダッシュボードやノートの「詳細情報」でデーフレームが重複して表示される。
* インサイト: 一番最初にパブリッシュをしたAuthor以外、チームでパブリッシュしたインサイトの購読をやめられない。
* パラメーター: 「今月度の処理データ行数」のカウントから、パラメーターを実行した際の処理行数を除きました。
* スケジューラー: ダッシュボードを更新したときに、チャートを描画するためのデータが0行のチャートがあると、スケジュールの実行に失敗する。

## 6.10.4.6

2022年7月18日にリリース。

### ダウンロード

* [新規のインストールの場合](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-6.10.4.6.tar.gz)
* [アップグレードの場合](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-images-6.10.4.6.tar.gz)

### 修正された問題

* スケジュール: スケジュールを設定したデータのGoogleスプレッドシートへのエクスポートが失敗する。

## 6.10.4.5

2022年7月15日にリリース。

### ダウンロード

* [新規のインストールの場合](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-6.10.4.5.tar.gz)
* [アップグレードの場合](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-images-6.10.4.5.tar.gz)

### 機能強化

* インサイト: ノートやダッシュボード内のチャートのデータや画像をダウンロードできるようになりました。
* インサイト: アナリティクスビューの「テキスト分析」で利用可能な「ストップワード」や「つなぐ単語」の辞書をパブリッシュできるようになりました。
* インサイト: プロジェクト: ディスクの利用量を節約するために、「バージョンの履歴」のダイアログから過去のバージョンの履歴を削除できるようになりました。
* パラメーター: 「パラメーターの表示設定」のダイアログから、パラメーターを常にページ上に表示させるか、ページの上に重ねて表示させるかを選択できるようになりました。
* コラボレーション: サーバーにパブリッシュしているプロジェクトをリパブリッシュするときや、サーバーにパブリッシュしているプロジェクトをExploratoryデスクトップにダウンロードして更新するときに、差分のデータのみを利用するようになりました。これによりプロジェクトのリパブリッシュやExploratoryデスクトップ上でのプロジェクトの更新の速度が速くなります。

### 修正された問題

* データ: サーバーにパブリッシュしたデータの「データ」タブにおいて、異なる列の値が表示される。
* インサイト: パブリッシュしたインサイトにコメントをするシステム(Disqus)を表示しないようにしました。
* インサイト: Date（日付）/POSIXct（日付時間）型の列にあるinf/-infという値が、サマリビューで欠損値（NA）として扱われてしまう。
* パラメーター: パブリッシュしたチャートで初めてパラメーターを表示させたときに、設定したパラメーターが表示されず、空のパラメーターペインが表示される。
* スケジュール: 購読したインサイトの通知メールに利用されているインサイトのリンクが壊れている。
* インサイトの利用状況: チームでパブリッシュしたプロジェクトのディスクの利用量が正しく表示されず、"0B（バイト）"になってしまう。

## 6.9.6.1

2022年4月19日にリリース。

### ダウンロード

* [新規のインストールの場合](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-6.9.6.1.tar.gz)
* [アップグレードの場合](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-images-6.9.6.1.tar.gz)

### 機能強化

* スケジュール: Google Sheets へのエクスポート: 「既存」のシートを選択したときに、ドライブの場所（マイドライブ, 共有ドライブ、チームドライブ）を選べるようになり、スプレッドシートを見つけやすくなりました。
* インサイト: プロジェクトやインサイトを購読すると、プロジェクトやインサイトがリパブリッシュされたときにも通知メールを受け取れるようになりました。

### 修正された問題

* 一般: コラボレーションサーバーのページフッターに、コラボレーション・サーバーのバージョンではなく、コラボレーション・サーバーからダウンロードできるExploratoryデスクトップのバージョンが表示される。
* インサイト: パブリッシュしたチャートの名前にスラッシュ("/") が含まれていると、CSVやEDFファイルをダウンロードできない。
* インサイト: スケジュールが実行されたときの通知メールが英語で届くことがある。
* パラメーター: 最初にパラメーターを変更するときに不必要な再計算が実行されていた。
* パラメーター: いくつかのエラーにおいて、エラーの詳細に関するダイアログが表示されない。
* パラメーター: 数値や文字から変換した日付のパラメーターを利用すると、パラメーターのセッションの開始に失敗する。
* パラメーター: チームとしてインサイトをパブリッシュしたユーザーの権限を、AuthorからViwerに変更すると、該当するインサイトでパラメーターが動かなくなる。
* スケジュール: チームとしてスケジュールしたインサイトをパブリッシュしたユーザーの権限を、AuthorからViwerに変更すると、該当するインサイトでスケジュールが動かなくなる。


## 6.9.5

2022年4月5日にリリース。

### ダウンロード

* [新規のインストールの場合](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-6.9.5.5.tar.gz)
* [アップグレードの場合](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-images-6.9.5.5.tar.gz)

### 機能強化

* パラメーター: 数値型のデータのパラメーターで、範囲を指定できる「スライダー（範囲）」をサポートしました。
* レポーティング：ダッシュボードとノートで特定のチャートを拡大表示できるようになりました。
* パブリッシュ: インサイトをパブリッシュ、または再パブリッシュする時に、チームメンバーに通知するかどうかを選択できるようになりました。
* インサイトページ: インサイトの検索ビューの表記が日本語になりました。
* スケジュール: 「実行環境の設定」メニューの内容を「アカウントの設定」ページに統合しました。


### 修正された問題

* データソース: SalesforceやTwitterとの接続に関するOAuthのエラー処理を改善しました。
* データソース: Google BigQuery: BigQueryをデータソースとして使用するデータ、チャート、ダッシュボードなどをサーバー上でスケジュールすると、「標準SQLの使用」によるエラーで失敗する。


* インサイト: データビュー: Numeric（数値）型の列のビジュアル・バーが表示されない。
* インサイト: データビュー: iPhone などの画面サイズの小さいデバイスで閲覧したときに、「表示する行数」を選択するドロップダウンと、列の検索ボックスが重なる。
* インサイト: サマリビュー: 数値型の列のInfや-Infの値がNAとして表示される
* インサイト: サマリビュー: Date（日付） 型の列で、NAが正しくカウントされない。
* インサイト: iPhone などの画面サイズの小さいデバイスで、「自分のインサイト」のメニューをクリックしてもページが表示されない。


* スケジュール: ノートのスケジュールを実行すると、特定の条件下で、 "Cannot read property 'forEach' of null. "というエラーが表示される。
* スケジュール: チームとして共有したダッシュボードのスケジュールを止めても、サーバーにスケジュールの設定が残り続ける。


* パラメーター: 「ワードクラウド」でパラメータの値を変更すると、"Cannot read property '0' of undefined" というエラーが表示される。
* パラメーター: ノートやダッシュボードで記述した「Rのコード」内で利用しているパラメーターを変更しても、変更結果が反映されない。


## 6.8.4

2022年1月20日にリリース。

### 概要

今回のリリースの大きな新機能として、プロジェクトレベルでのコラボレーションができるようになりました。

プロジェクトをサーバーにパブリッシュし、チームまたは他の人と共有したり、プロジェクトのバージョンを管理できるようになりました。さらに、「チーム」または「個人」としてプロジェクトをパブリッシュすることができるようになっています。

### ダウンロード

* [新規のインストールの場合](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-6.8.4.2.tar.gz)
* [アップグレードの場合](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-images-6.8.4.2.tar.gz)

### 機能強化

* バージョン履歴: 過去にスケジュールされたチャートやダッシュボードのサムネイルのイメージを見れるようになりました。
* バージョン管理: 過去にパブリッシュされたプロジェクトの全てのバージョンを確認し、任意のバージョンに復元することができます。
* パラメーター: 最後に使ったパラメーターの値が選択された状態でパラメーターの画面が開くようになりました。
* データ: パブリッシュされたデータのデータタブは数値をフォーマットした状態で表示するようになりました。
* パラメーター: ステップデータを自動的にキャッシュすることにより、サーバーでパラメーターを有効にした際のパフォーマンスが向上しています。
* Rパッケージ: jpmeshパッケージがサーバー上で利用できるようになりました。

### 修正された問題

* データソース: Google SheetsでOAuthを認証した後、ブラウザが誤ったURLにリダイレクトされエラーページが表示される。
* チャート: チャートまたはアナリティクスの名前にカンマ（ , ）がある場合、ダウンロードボタンからCSVファイルをダウンロードするとエラーが表示される。
* データ: デスクトップ上で列の数を制限してからデータをパブリッシュしても、サマリビューのタブで全ての列が表示される。
* パラメーター: SafariでダウンロードボタンからCSVファイルをダウンロードした後にパラメーターを変更するとネットワークエラーが表示される。
* パラメーター: 数値タイプのパラメーターのテキスト入力フィールドに空文字列を設定するとエラーになる。
* パラメーター: パラメーターウインドウの外側にスライダーを移動させた際に、自動実行が有効であってもパラメーターが実行されない。
* パラメーター: ノートのパラメーターの値を変更した結果データが無い場合、ワードクラウドのチャートが"error code 127"というエラーを出す。
* スケジュール: パブリッシュされたデータやインサイトのスケジュールが失敗した場合でも、タイムスタンプが更新されていました。
* スケジュール: 通知メールのテキストが長すぎると、エラーメッセージのテキストがオーバーフローしてしまう。

## 6.8.2

Released on 11/30/2021

### Enhancements

* Admin: Added the "Last Updated" column in the admin stats page.
* Insight: Added the "Last Updated" column in the stats page.
* Data Source: Supported workgroup argument for Amazon Athena connection.

### Bug Fixes

* Admin: When removing a team or a user, associated data shares, charts, analytics, notes, and dashboards were not cleanly removed for some occasions
* Data Source: SQL query failed if UseResultsetStreaming and RowsToFetchPerBlock were set for an Amazon Athena connection.
* Data Wrangling: After sorting numeric columns in descending order, all the column values became negative.
* Insight: Delete icons were missing for team-published insights in the insight search page.
* Parameter: Improved the error messages.
* Schedule: Improved the message for the scheduling failure notification email.

## 6.8.0.19

Released on 11/17/2021

### Enhancements

* Admin: Now the Scheduler UI uses the same port number as the other pages.
* Insight: Now you can assign the "Can Update Share Setting" role to people you share your Insight so that they can also invite the other people.
* Insight: Now you can see the utm_campaign and utm_media information in the Insight stats dialog.
* Parameter: Supported cache option for dynamic LOV items.
* Parameter: Supported the option to show all the available LOV items for a dynamic LOV.
* Schedule: Supported writing back the results of the scheduled job to Google Sheets.

### Bug Fixes

* General: "New Version Available" message was wrongly shown for M1 Mac version of the Exploratory Desktop logged in to the Exploratory Server.
* General: After OAuth re-authorization for a team-shared Insight, the browser was redirected to a wrong Insight URL with the user's ID instead of the team ID.
* Insight: Data Tab: Rows are not properly shown when a column name contains special characters.
* Insight: Data Tab: Table is not properly rendered for a publish data that has rownames.
* Insight: Incorrect user thumbnails showed up in the Insight History dialog if you had multiple authors for the Insight.
* Insight: The table view in the Data share showed only 200 rows even you have more rows after changing the Parameter.
* Insight: The view count in the Insight stats dialog was less than the number at the top of the main Insight view.
* Insight: When an Insight is shared with a team, it should send a notification email to all team members.
* Parameter: Prediction model with local file threw error about missing data file at rebuilding the model by updating parameter values on the server.
* Parameter: When moving a slider to the far end, the slider drag event didn't clear and it kept moving the slider even after releasing mouse.
* Parameter: When the Parameter session fails due to a data source error such as connection info is missing, it should show the error message and hint on UI.
* Schedule: If Collab Server was shut down while a scheduled job is running, the job hanged after the Collab Server is restarted #22472
* Schedule: Scheduling failure notification email should include more hint and information in addition to the error message.
* Stats: The number of views on the stats page was lower than the actual view count.
* Stats: The total disk usage on stats page was less than the sum of the usages of all the documents.
* Stats: The total number of the "Rows Processed This Month" should be included in the stats page for the Administrator.


## 6.7.0.16

Released on 8/20/2021

### Enhancements

* General: Now you can change the language setting for the notification emails at the Account Setting page.
* Insight: Now you can see the scheduling detail information in the Insight Subscription dialog.
* Insight: Now you can customize the message title and text for the Insight invitation email.
* Insight: Now you can see a thumbnail image if available in the Insight invitation email.
* Schedule: Now you can see a thumbnail image if available in the schedule notification email.
* Schedule: Now a thumbnail image is also refreshed based on the latest data when a schedule runs.

### Bug Fixes

* Schedule: When scheduling failed for a Google Drive Data source due to an OAuth error, it didn't show a re-auth link in the Error Details dialog.
* Schedule: The server instance went down if you subscribed to an Insight that had been published as a team.
* Schedule: A scheduled job runs twice once in a while.
* Schedule: When scheduling a Google Analytics data source, it didn't honor the user's timezone.
* Schedule: If the Exploratory Server was shut down while a scheduled job was running, the job hanged after the Exploratory Server was restarted.
* General: After OAuth re-authorization for a team-shared insight, the browser was redirected to a wrong insight URL with the user's ID used in place of the team ID
* General: In the insight update history page, avator picture for the login user was used instead of correct ones for the users who updated the insight.


## 6.6.2.0

Released on 6/21/2021

### Download Links

* [For New Install](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-6.6.2.0.tar.gz)
* [For Upgrade](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-images-6.6.2.0.tar.gz)

### Enhancements

* General: Supported Salesforce Data Source Scheduling and Interactive mode.
* Schedule: We now automatic retry failed schedules caused by a temporary 500/503 error from Google REST API.

### Bug Fixes

* Admin: Creating a new user failed after creating 3 new users.
* Admin: it should ask "Logout and continue?" to proceed the user activation if you are already logged in as an Admin user and clicked a user activation link.
* Admin: Translated “Are you sure?” message in Japanese.
* Chart: Published chart should use the same UI locale that the user was using when the user published the chart on the Desktop.
* Dashboard: Parameter failed to refresh a Table when you updated the paraeter and clicked the "OK" button if the Table is from Analytics Data tab.
* General: When POSIXct column name contains period(.), table didn't show the data properly.
* Insight: CSV API response missed the Content-Type HTTP header.
* Insight: A URL link to the insight in the share notification email was incorrect for insights shared as team.
* Insight: If deletion of a published data or chart was done from the server UI, the directory for the insight on the server was left, which took up disk spece unnecesarily.
* Insight: If publishing of an Insight fails, directory on the server for the insight was left in the middle of the creation, which took up disk spece unnecesarily.
* Parameter: An incorrect default value showed up in a character parameter if the parameter was originally created as a Date parameter and switched to the character type.
* Parameter: Downloading chart data by clicking download button didn't work if you started the parameter session but didn't change the parameter yet.
* Parameter: Error "error code 3" at enabling Parameters if data connections were not published together with the Insight.
* Parameter: Parameter did not always use the the same time zone that was used when the insight was created on the Desktop.
* Parameter: The "Download" button in the Parameter pane should be enabled from the beginning of the Parameter session even before clicking the "Run" button.
* Parameter: When hitting enter Key after selecting item, the parameter didn't get executed
* Schedule: Error "error code 3" at running a scheduled job if data connections were not published together with the insight.
* Schedule: The scheduled job did not always use the the same time zone that was used when the Insight was created on the Desktop.


## 6.5.0.14

Released on 4/20/2021

### Download Links

* [For New Install](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-6.5.0.14.tar.gz)
* [For Upgrade](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-images-6.5.0.14.tar.gz)

### Enhancements

* Insight: Now you can choose the "Owned by Team" scope on the Insight search page.
* Insight: Now you can receive email notifications by subscribing to Insights that are scheduled regularly.
* Insight: Now Script can be published along with Insights.
* General: Support for accessing data files on Google Drive.

### Bug Fixes

* Schedule: Running a Dashboard with many Charts or Analytics failed, and the spin icon on the Insight page kept spinning after the failure as if the scheduled job was going on.
* Server: When using relative date such as "today" as the default value of a Date or POSIXct parameter, if the relative date was outside of min and max, the Parameter was not properly rendered.
* Server: Download button was not enabled as expected after enabling Parameters.
* Server: When opening a list of values in the Parameter pane, the options were cut off at the bottom and not fully visible.
* Insight: The view stats dialog showed an error if the Insight was shared as a Team.
* Insight: The hover pop-up for the "Download" button became incorrect once you updated the share setting on the Insight page.
* Insight: Accessing the CSV API URL of the public data share returned a 500 error.
* Insight: Histogram data on the user stats page was incorrect.
* Insight: Thumbnails didn't show for Insights that were shared as a Team.
* Parameter: Turning Parameters on at an Insight page failed if a parameter with list of value that is dynamically fetched from another Data Frame had the list-of-value display name column that is same as the value column.
* Parameter: Updating the Parameter Option of a publicly shared Insight raised an error.
* Summary View: It showed 100% for NA values even if there was no NA value if you had a character column with text data starting with "NA".
* General: When the hostname or IP address of an on-premise Exploratory Server was changed, hostname/IP address of Data Catalog URL sent to Exploratory Desktop stayed old, causing error at importing data from Data Catalog.
* General: A URL link to Insight in an invitation email was incorrect if the Insight was shared as a Team.


## 6.4.5.2

Released on 2/25/2021

### Enhancements

* General: Now you can create a Team, assign members to the Team. Team members can collaboratively publish Insights as a Team.
* Admin: Now it shows Collaboration Server version Info at the bottom of the page.
* Admin: Now Collaboration Server Administrator can view the stats for all users from the Collaboration Server Administration page.
* Data Catalog: Now you can highlight a row in Super Table by clicking the row.

* Insight: Now you can download the CSV data by clicking the button or use an API to download the CSV data for Chart and Analytics.
* Insight: Now you can see the view/usage stats of your Insights from the "Stats" menu in the user dropdown menus.
* Parameter: Now you can click the "Download" button in the parameter pane to download the CSV data.

### Bug Fixes

* Admin: On Create User dialog, email validation message was not properly shown when the entered email address was in an incorrect format.
* Data Catalog: Super Table: When entering search text for a column, rows with NA values were not filtered out.
* General: "Re-auth" link didn't show up in the OAuth error messages.
* Insight: Buttons on the navigation area at the top overlapped the title text in the Insight page.
* Parameter: Analytics published from Exploratory Desktop older than 6.3 raised error when Parameter was turned on, because of lack of cached Analytics result data. With this release, such a case can be handled without resulting in an error.
* Parameter: Analytics View result was not properly updated when the Parameters it depends on were changed.
* Parameter: Changing the parameter value didn't make any changes on the Analytics chart after changing the parameter one or two times.
* Parameter: In some cases, a duplicated Run button was shown at the bottom of the parameter pane.
* Parameter: Prediction models created by Analytics View was rebuilt when Parameter was turned on. Now we make use of published cached models to avoid potentially computationally expensive model building.
* Parameter: With Dashboard, Note, or Slide, turning on the Parameters failed with a message "error code 3" if the value for a numeric text field parameter was set to an empty string.
* Parameter: Word Cloud chart didn't change even if you changed the parameter values.
* Schedule: After re-authorizing the OAuth access, it didn't return to the original Insight page where you started the re-authorization process.
* Schedule: Refreshing data did not work for the Weather Data.


## 6.3.4.0

Released on 12/30/2020

### Bug Fixes

* Analytics: Analytics that have been published with Exploratory Desktop 6.3 or older version raised errors when interacting with them with the Parameters or scheduling them.
* Analytics: The underlying logic for building the models under the Analytics View has been optimized to run it more efficiently.
* Analytics: Cached Analytics models were not properly invalidated when the Parameters it depends on were updated.
* Parameter: Existing RDS/Parquet data cache files were not cleaned up properly when they were republished.
* Insight: Invitation to an Insight using email address did not work if the specified email address had upper case letters.
* Insight: Insight Search by date range was not working.


## 6.3.1.10

Released on 12/10/2020

### Enhancements

* Parameter: Supporting the prediction feature with models created by the Analytics View in the Interactive mode.
* Scheduler: Notification emails will be sent when the scheduling jobs failed. (SMTP server configuration is required.)
* Server: Users can now set their locale related setting from the server UI (locale, first day of week). This information is used for the Scheduling and the Interactive mode.
* Insight: Supporting "Last 7 days" and "Last 30 days" options in Date Range parameter in Insight Search.

### Bug Fixes

* Parameter: When opening the Parameters pane, it was showing the "hidden" parameters.
* Parameter: Interactive Session with the database data source type published by previous versions of Exploratory Desktop raised an error.
* Server: Deletion of published Data/Chart/Analytics did not correctly recover the disk space.


## 6.2

Released on 10/16/2020

### Enhancements

* Parameter: Before this release, even when the list of values for a categorical parameter was based on unique values of a data frame column, the list of values were fetched only at the creation of the parameter, and it had fixed options of values after that. With this release, list of values for such a parameter is dynamically updated when the data frame it depends on is updated.
* Summary View: We now show percentages for character and factor columns.

### Bug Fixes

* Parameter: Display name was not used for the the 'List of Values' type parameters.
* Parameter: List of Values did not work when the referenced column name contained special characters.
* Parameter: Starting the Interactive Session failed with error "could not find function '%>%'".
* Scheduler: Refreshing the Dashboards with Wordcloud charts was not working.
* Server: The Map was shown over the parameter pane.

## 6.1

Released on 9/20/2020


### Enhancements

* Data Catalog: Support "History" tab next to the "Metadata" tab in published Data Shares.
* Insight: Data Range search option improvement to show the most viewed Insights based on the last N period in Insight view.
* Insight: Tile view support in Insight view
* Insight: Insight Search: Page loading performance improvement.
* Parameter: Partial chart refreshing support for markdown reports (Dashboard, Slides, Note)
* Parameter: Improved Parameter usability by uptaking new widgets.
* Parameter: At the begining of an Interactive Session, Collaboration Server loads the data to be used in the Insight from the Parquet or RDS files. Before this release, Collaboration Server just loaded all the data for data source steps and recalculated necessary steps from there, regardless of steps cached on the Exploratory Desktop. Now we honor steps cached on the Exploratory Desktop, and calculation on the Collaboration Server also starts from the cached step data, instead of from the data source step data, if it is available.
* Parameter: Scheduler: Data loading time performance improvement.
* Parameter: Set "Autorun" off by default.
* Parameter: Scheduler: Connection initialization performance improvement.
* Scheduler: Publish history on a shared item includes updates by the scheduler.
* General: Before this release, connection information for Data Sources, such as host name for a database server, was kept in each one of the Data Source Steps uploaded to the Collaboration Server. This meant that if a connection information changed, you had to re-upload all the Insights that used the data sources with the connection information. With this release, we store the connection information as a centralized metadata on the server. This means you need to upload only one of the Insights that uses the changed connection informatoin, and the rest of the Insights start using the new connection information uploaded with the one Insight you uploaded.

### Bug Fixes

* Data Catalog: Scheduling a shared Data, Chart or Analytics broke the connection information defined on the server.
* Data Catalog: Invalid API key is set in CSV API URL if you are not logged in.
* Data Catalog: If the Super Table has a list data type column, it failed to render the table when typing search keywords in search input field.
* Data Catalog: Super Table didn't load properly when network speed was slow.
* Parameter: When numbers were used for parameter display names, single select pulldown for Numeric column did not work.
* Parameter: Before this release, if Rserve child process, which is the R execution environment for Collaboration Server, crashed while executing, Interactive Session or Scheduled Data Refresh was kept waiting indefinitely. Now we handle such cases better, and the error is properly reported to the user.
* Scheduler: Scheduler failed at .save_remote_rds and threw "file.exists(path) is not TRUE" error.
* Scheduler: If you modified the title and description online and schedule it, it reset the modification on the title and description.
* General: Download page should not show download button for Viewer users.
* General: Empty LOV showed up if you clicked a '...' button on a Data share page that you didn't own.

## 6.0

Released on 6/12/2020

### Enhancements

* Japanese translations for more UIs including Share, Schedule, and Parameter.
* Added the Parameter support for Chart and Analytics.
* You can write a message and send it when you share the published contents with others.
* You can add a comment when you publish or republish. The comments can be viewed as 'History' by others.
* Support SMTP for sending out notification emails.

### Bug Fixes

* Changes made to a user's properties were not immediately reflected on the Admin UI.
* Set "Shared with me" as a default scope if Viewer selects "My insight" menu from the user dropdown menu.
* Schedule: After a long-running job, other jobs stayed in the queue and did not get processed.
* Certified with Exploratory Desktop 6.0.1.

## 5.5.5

Released on 3/26/2020

### Download Links

* [For New Install](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-5.5.5.0.tar.gz)
* [For Upgrade](https://exploratory-download.s3-us-west-2.amazonaws.com/collab-server/exploratory-collab-images-5.5.5.0.tar.gz)

### Bug Fixes

* The Share dialog now shows the sharing URL once the URL share is enabled.
* Bundle/host all the 3rd party libraries inside the Collaboration Server.
* Updated the link for the Getting Started guide.

## 5.5.4.2

Released on 3/11/2020

### Bug Fixes

* Added a support for the OAuth data sources including Google Sheet, Google Analytics, Google BigQuery, etc.
* Added a support for MS SQL Server data sources for scheduling and the interactive mode.
* Each author can now enable the Parameter for his/her Dashboards and other contents to those who are not logged in.
* Schedule: You can now re-authorize the expired OAuth tokens from the server UI.
* Admin UI: The User table shows the user type, either Author or Viewer for each user.
* Header menu is now translated for Japanese.
* Admin UI is also now translated for Japanese.

* The user type was shown as "Public" where it should be "Viewer" at the server UI.
* Admin UI: "Scheduler" user type was shown in the user table.
* Deleted users were displayed on the Users Administration page.


## 5.5.1.1

Released on 2/3/2020

### Bug Fixes

* Admin UI: Type of user accounts (Author/Viewer) displayed on the Users Administration page was not correct.
* Parameter: Run button flickered unnecessarily, when parameter values were changed.

## 5.5.1

Released on 1/31/2020

### Enhancements

* Certified with Exploratory Desktop 5.5.1.

### Bug Fixes

* Parameter: Minimum/maximum limit on text field numeric parameter was not correctly enforced.
* Improved response time for opening Share Dialog.

## 5.4.1

Released on 12/1/2019

### Enhancements

* The data download REST API now supports the private data access.  Also, users can directly download the privately shared data directly in Exploratory Desktop.
* Added "Liked by Me" search scope for the Insight Page.
* Partial word matching support for the Tag search for the Insight View.

### Bug Fixes

* Now "Scope" search criteria doesn't show up for the guest users (users without logging in).
* Dashboard view didn't resize properly when a user resize the browser window.
* Super Table didn't get refreshed after the Data was refreshed.

## 5.3.2

Released on 9/10/2019

### Enhancements

* Certified with Exploratory Desktop 5.3.2.

### Bug Fixes

* Timezones used for timestamps displayed in shared Dashboard/Note/Slide page was inconsistent.

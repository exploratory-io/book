---
title: "コマンド一覧"
---

よく使うコマンドを、目的ごとに並べました。ほかのコマンドも含めた一覧は、ページ後半の[すべてのコマンド](#more)にあります。

<a id="cmd-check"></a>

## 確認する

| コマンド | できること |
| --- | --- |
| expl status | Desktop のバージョンとサインイン中のユーザー（`--json` を付けると、権限や道具の情報も出ます） |
| expl tools list | 使えるコマンドの一覧（読み取り専用かどうかと、リスク） |
| expl tools describe \<command\> | 引数、型、必須か、選べる値（2 語のコマンドは引用符で囲みます。例: `expl tools describe "dashboard get"`。get_data_frame のような道具名でも指定できます） |

expl tools list が終了コード 0 で終わっても、Desktop に接続できているとは限りません。Desktop が起動していないときは、前回保存した一覧を表示し、保存がないときは空の一覧になります。接続は、expl status で確認します。

<a id="cmd-project"></a>

## プロジェクト

| コマンド | できること |
| --- | --- |
| expl project list | プロジェクトの一覧 |
| expl project use \<id\|name\> | 以後のコマンドの対象を決める |
| expl project open \<id\> | プロジェクトを開く |

<a id="cmd-data"></a>

## データ

| コマンド | できること |
| --- | --- |
| expl dataframe list | データフレームの一覧 |
| expl dataframe get-schema \<id\> | 列の名前と型（加工のステップなども返ります） |
| expl dataframe preview | 行を表示する |

<a id="cmd-chart"></a>

## チャート

| コマンド | できること |
| --- | --- |
| expl chart list \<dataframe_id\> | チャートの一覧（データフレームの id が必要です） |
| expl chart get-result \<id\> | チャートの数値 |
| `expl chart get-image <id> --output <file>` | チャートの画像を保存する |

<a id="cmd-note"></a>

## ノート

| コマンド | できること |
| --- | --- |
| expl note list | ノートの一覧 |
| expl note get \<id\> | ノートの中身 |

<a id="cmd-dashboard"></a>

## ダッシュボード

| コマンド | できること |
| --- | --- |
| expl dashboard list | ダッシュボードの一覧 |
| expl dashboard get \<id\> | ダッシュボードの定義 |
| `expl dashboard create --input <file>` | ダッシュボードを作る |
| expl dashboard publish \<id\> | 公開する（実行の前に確認が出る） |

<a id="cmd-other"></a>

## そのほか

| コマンド | できること |
| --- | --- |
| `expl execution get <execution_id> --operation-id <operation_id>` | 待たなかった操作の状態を確認する（`--no-wait` が表示した 2 つの id を指定します） |
| expl call \<tool_name\> | 道具の名前でそのまま呼ぶ |
| expl lang \[en\|ja\] | Desktop の表示言語を確認する、切り替える（切り替えると、Desktop 自体の言語も変わります。先に expl status で接続を確認してください。対象のプロジェクトを決められないときは、終了コード 2 になります。例: `expl lang --project <id>`） |
| expl skill | AI エージェント向けの説明を出力する |
| expl completion \[bash\|zsh\|powershell\] | シェルの補完のスクリプトを出力する（[共通フラグ](/ja/cli/desktop/global-flags#completion)を参照） |

<a id="more"></a>

## すべてのコマンド

コマンドは Desktop のバージョンによって増減します。お手元の正確な一覧は expl tools list で確かめてください。引数は `expl <コマンド> --help` で確認できます。

### プロジェクト

| コマンド | できること | 使える条件 |
| --- | --- | --- |
| expl project ask | 書き込みの前に、どのプロジェクトを使うかを利用者に確認します。 | いつでも |
| expl environment get | 接続している Desktop の情報（アプリのバージョン、Agent API のバージョン、OS、サインイン中のユーザー、開いているプロジェクト）を返します。 | いつでも |
| expl artifact get-lineage | チャート、アナリティクス、ノート、データフレームが、どのデータソースをもとに作られているかを返します。 | いつでも |
| expl project get | プロジェクト 1 つの名前、説明、更新日時、開いているかどうかを読み取ります。 | いつでも |
| expl project get-history | プロジェクトの変更履歴を読み取り、検索します。 | いつでも |
| expl artifact list-created | この会話で AI が作成または変更したチャート、アナリティクス、ステップ、ブランチを一覧します。 | いつでも |
| expl project list | このコンピューターのプロジェクトを、新しい順に一覧します。 | いつでも |
| expl project locate-published-source | 公開されたデータの取り込み元をたどります。 | いつでも |
| expl project open | ローカルプロジェクトをウィンドウで開きます。すでに開いていればそのウィンドウを前面に出します。 | いつでも |
| expl artifact search | 開いているプロジェクトから、名前、コメント、中身で成果物を検索します。 | いつでも |
| expl project search | 手元のすべてのプロジェクトから、データフレーム、チャート、アナリティクス、ノートなどを検索します。 | いつでも |
| expl project search-server | サインインしている Exploratory サーバーで公開されているプロジェクトを一覧します。 | いつでも |
| expl project close | 保存してから、プロジェクトのウィンドウを閉じます。 | 作成、変更、削除を許可したとき |
| expl project import | 公開されているプロジェクトをダウンロードし、新しいローカルプロジェクトとして取り込みます。 | 作成、変更、削除を許可したとき |
| expl project restore-history | プロジェクト全体を、変更履歴のある時点に戻します。 | 作成、変更、削除を許可したとき |
| expl project save | 新しいプロジェクトを作成するか、プロジェクトファイルを取り込みます。 | 作成、変更、削除を許可したとき |

### データフレーム

| コマンド | できること | 使える条件 |
| --- | --- | --- |
| expl dataframe get-schema | データフレームのステップ、列名、型、行数を読み取ります。 | いつでも |
| expl dataframe step-diagram | データフレームのステップダイアグラムを返します。 | いつでも |
| expl dataframe get-summary-view | データフレームの Summary の表を返します。 | いつでも |
| expl dataframe list | プロジェクトのデータフレームを一覧します。 | いつでも |
| expl dataframe preview | データフレームの最後のステップの先頭の行を返します。 | いつでも |
| expl dataframe profile | すべての列の型、欠損、要約統計、分布をまとめて確認します。 | いつでも |
| expl dataframe run-r | R スクリプトを実行して結果を返します。 | 作成、変更、削除を許可したとき |
| expl dataframe manage | データフレームやカタログに対する操作（名前の変更や削除など）を行います。 | 作成、変更、削除を許可したとき |
| expl dataframe save-result | チャートまたはアナリティクスの出力データを、新しいデータフレームとして保存します。 | 作成、変更、削除を許可したとき |
| expl dataframe open | 加工の対象にするデータフレームを選び、列の一覧を返します。 | 作成、変更、削除を許可したとき |

### データ加工

| コマンド | できること | 使える条件 |
| --- | --- | --- |
| expl dataframe get-command | 加工コマンドが受け付けるパラメーターを返します。 | いつでも |
| expl dataframe list-ai-proposals | プロジェクトの AI の提案と、確認の状況を一覧します。 | いつでも |
| expl dataframe ai-wrangle | 加工の依頼から AI が R スクリプトを書き、必要に応じてステップとして追加します。 | 作成、変更、削除を許可したとき |
| expl dataframe apply-preview | プレビューで試した変更を、まとめて適用します。 | 作成、変更、削除を許可したとき |
| expl dataframe copy-steps | ステップを、同じまたは別の開いているプロジェクトのデータフレームにコピーします。 | 作成、変更、削除を許可したとき |
| expl dataframe create-branch | ステップから分岐するブランチを作成します。 | 作成、変更、削除を許可したとき |
| expl dataframe apply-step | データフレームに加工ステップを 1 つ追加します。 | 作成、変更、削除を許可したとき |
| expl dataframe delete-branch | ブランチを削除します。 | 作成、変更、削除を許可したとき |
| expl dataframe delete-step | データフレームのステップを削除します。 | 作成、変更、削除を許可したとき |
| expl dataframe edit-steps | 既存のステップを、ステップのメニューと同じ方法で編集します。 | 作成、変更、削除を許可したとき |
| expl dataframe move-branch | ブランチの分岐元を、別のステップに変更します。 | 作成、変更、削除を許可したとき |
| expl dataframe preview-steps | 変更を一時的なオブジェクトで試し、保存せずに結果を確認します。 | 作成、変更、削除を許可したとき |
| expl dataframe set-step-cache | ステップのデータをキャッシュする、更新する、または解除します。 | 作成、変更、削除を許可したとき |
| expl dataframe set-step-disabled | ステップを削除せずに、無効にする、または有効に戻します。 | 作成、変更、削除を許可したとき |
| expl dataframe update-ai-proposal | 公開後に、AI の提案で直した内容が効いたかどうかを記録します。 | 作成、変更、削除を許可したとき |

### チャート

| コマンド | できること | 使える条件 |
| --- | --- | --- |
| expl chart get | チャートの定義、データ、パラメーターを読み取ります。 | いつでも |
| expl chart get-result | チャートを実行し、集計された実際の値を返します。 | いつでも |
| expl chart get-image | チャートの PNG 画像を返します。 | いつでも |
| expl chart get-summary-prompt | チャートの AI サマリを書くための、実際の値を含む参考資料を返します。 | いつでも |
| expl chart list-maps | 地図のチャートで使える地図を一覧します。 | いつでも |
| expl chart list-settings | チャートの種類ごとに使える設定と関数を返します。 | いつでも |
| expl chart list | データフレームのチャートを一覧します。 | いつでも |
| expl chart copy | チャートを複製するか、別のデータフレームに貼り付けます。 | 作成、変更、削除を許可したとき |
| expl chart add | データフレームから、編集できるチャートを作成します。 | 作成、変更、削除を許可したとき |
| expl chart delete | チャートを削除します。 | 作成、変更、削除を許可したとき |
| expl chart export-data | チャートのデータをファイルに書き出します。 | 作成、変更、削除を許可したとき |
| expl chart install-map | 地図の拡張を Exploratory のサーバーからインストールまたは更新します。 | 作成、変更、削除を許可したとき |
| expl chart open | チャートをチャートビューで開きます。 | 作成、変更、削除を許可したとき |
| expl chart save-ai-summary | 書いた解釈文を、チャートの AI サマリとして保存します。 | 作成、変更、削除を許可したとき |
| expl chart edit | チャートの種類、集計、名前などの設定を変更します。 | 作成、変更、削除を許可したとき |

### アナリティクス

| コマンド | できること | 使える条件 |
| --- | --- | --- |
| expl analytics get | アナリティクスの結果（種類、設定、出力）を読み取ります。 | いつでも |
| expl analytics get-summary-prompt | アナリティクスの AI サマリを書くための、実際の値を含む参考資料を返します。 | いつでも |
| expl analytics get-template | アナリティクスの種類ごとに、指定できる枠と設定を返します。 | いつでも |
| expl analytics list | データフレームのアナリティクスを一覧します。 | いつでも |
| expl analytics list-templates | 作成できるアナリティクスの種類を一覧します。 | いつでも |
| expl analytics add | アナリティクス（回帰、分類、クラスタリングなど）を作成して実行します。 | 作成、変更、削除を許可したとき |
| expl analytics delete | アナリティクスを削除します。 | 作成、変更、削除を許可したとき |
| expl analytics save-ai-summary | 書いた解釈文を、アナリティクスのコメントに追記して保存します。 | 作成、変更、削除を許可したとき |
| expl analytics edit | アナリティクスの列、設定、種類を変更して再実行します。 | 作成、変更、削除を許可したとき |

### ノート

| コマンド | できること | 使える条件 |
| --- | --- | --- |
| expl note get | ノート 1 つを、Markdown の本文ごと読み取ります。 | いつでも |
| expl note get-image | ノートのプレビュー全体を PNG 画像で返します。 | いつでも |
| expl note list | プロジェクトのノートを、本文なしで一覧します。 | いつでも |
| expl note ask-ai | ノートエディタの AI に、ノートの文章の書き直し、翻訳、要約を頼みます。 | 作成、変更、削除を許可したとき |
| expl note add | チャートやアナリティクスを埋め込める Markdown のノートを作成します。 | 作成、変更、削除を許可したとき |
| expl note delete | ノートを削除します。 | 作成、変更、削除を許可したとき |
| expl note export-html | ノートを HTML ファイルに書き出します。 | 作成、変更、削除を許可したとき |
| expl note export-pdf | ノートを PDF ファイルに書き出します。 | 作成、変更、削除を許可したとき |
| expl note open | ノートを画面で開きます。 | 作成、変更、削除を許可したとき |
| expl note edit | ノートの本文に追記するか、置き換えます。名前も変更できます。 | 作成、変更、削除を許可したとき |

### ダッシュボード

| コマンド | できること | 使える条件 |
| --- | --- | --- |
| expl dashboard get | ダッシュボード 1 つのページ、markdown、変数、設定を読み取ります。 | いつでも |
| expl dashboard get-image | 保存済みダッシュボードの指定ページを PNG 画像で返します。 | いつでも |
| expl dashboard list | プロジェクトのダッシュボードを一覧します。 | いつでも |
| expl dashboard validate | 保存せずに、ダッシュボードのレイアウトを検査します。 | いつでも |
| expl dashboard create | ページ、行、パネルを並べたダッシュボードを作成します。 | 作成、変更、削除を許可したとき |
| expl dashboard delete | ダッシュボードを削除します。 | 作成、変更、削除を許可したとき |
| expl dashboard export-html | ダッシュボードを HTML ファイルに書き出します。 | 作成、変更、削除を許可したとき |
| expl dashboard export-pdf | ダッシュボードの全ページを PDF ファイルに書き出します。 | 作成、変更、削除を許可したとき |
| expl dashboard edit | ダッシュボードのページ、パネル、名前、設定を変更します。 | 作成、変更、削除を許可したとき |

### データソースと接続

| コマンド | できること | 使える条件 |
| --- | --- | --- |
| expl connection get | データ接続の一覧、または接続 1 件の項目を読み取ります。 | いつでも |
| expl dataframe get-source-params | データソースの設定項目と、接続が必要かどうかを返します。 | いつでも |
| expl dataframe identify-source | 依頼されたデータの取得元を特定し、リファレンスを返します。 | いつでも |
| expl connection lookup | 選択した接続を探し、認証情報を除いたメタ情報を返します。 | いつでも |
| expl dataframe lookup-reference | データの取得元の種類に合う、AI Data のリファレンスを返します。 | いつでも |
| expl connection request-creation | 接続の作成ダイアログを開きます。 | いつでも |
| expl connection search-schema | 接続の保存済みのテーブルと列の情報を確認します。 | いつでも |
| expl connection validate | 保存済みの接続に、必須の項目がそろっているかを検証します。 | いつでも |
| expl dataframe create-source | データフレームとデータソースを保存します。 | 作成、変更、削除を許可したとき |
| expl connection delete | データ接続を削除します。 | 作成、変更、削除を許可したとき |
| expl dataframe extract-pdf-tables | PDF の表の中身を、取り込む前に確認します。 | 作成、変更、削除を許可したとき |
| expl dataframe list-pdf-tables | PDF ファイル内の表を下見します。 | 作成、変更、削除を許可したとき |
| expl connection list-schema-nodes | 階層型の接続で、指定したパスの下にあるノードを確認します。 | 作成、変更、削除を許可したとき |
| expl dataframe read-file-header | ローカルのテキストファイルの先頭と形式を確認します。 | 作成、変更、削除を許可したとき |
| expl dataframe replace-source | 既存のデータフレームの取り込み元を差し替えます。 | 作成、変更、削除を許可したとき |
| expl connection sample-collections | 接続の実際のテーブル一覧とサンプルを取得します。 | 作成、変更、削除を許可したとき |
| expl connection save | 接続の作成または設定のダイアログを開きます。項目は利用者が入力します。 | 作成、変更、削除を許可したとき |
| expl connection save-schema-info | 接続で確認したテーブルと列の情報を保存します。 | 作成、変更、削除を許可したとき |

### パラメーター

| コマンド | できること | 使える条件 |
| --- | --- | --- |
| expl parameter get | プロジェクトのパラメーターを読み取ります。 | いつでも |
| expl parameter get-session | ログイン情報から自動で定義されるセッションパラメーターの定義を読み取ります。 | いつでも |
| expl parameter delete | パラメーターを削除します。 | 作成、変更、削除を許可したとき |
| expl parameter rename | パラメーターの名前を変更します。 | 作成、変更、削除を許可したとき |
| expl parameter save | パラメーターを作成します。すでにあれば更新します。 | 作成、変更、削除を許可したとき |
| expl dashboard set-parameter-value | 表示中のダッシュボードのパラメーターの選択を変えて、表示し直します。 | 作成、変更、削除を許可したとき |

### 公開

| コマンド | できること | 使える条件 |
| --- | --- | --- |
| expl published list | プロジェクトから公開しているノート、ダッシュボード、データを一覧します。 | いつでも |
| expl team list | 所属しているチームを一覧します。 | いつでも |
| expl dashboard publish | ダッシュボードを、公開 URL でサーバーに公開します。 | 作成、変更、削除を許可したとき |
| expl dataframe publish | データフレームのステップをサーバーに公開します。 | 作成、変更、削除を許可したとき |
| expl note publish | ノートを、公開 URL でサーバーに公開します。 | 作成、変更、削除を許可したとき |
| expl project publish | プロジェクトの公開ダイアログを開きます。 | 作成、変更、削除を許可したとき |
| expl published unpublish | ノートまたはダッシュボードの公開を取り消します。 | 作成、変更、削除を許可したとき |

### 設定と共有のリソース

| コマンド | できること | 使える条件 |
| --- | --- | --- |
| expl aifunction get-presets | 列メニューにある AI 関数の、プリセットの指示文を返します。 | いつでも |
| expl aifunction get-templates | 保存されている AI 関数のテンプレートを読み取ります。 | いつでも |
| expl dictionary get | テキスト分析の辞書を読み取ります。 | いつでも |
| expl noteprompt get-templates | 保存されているノート編集用のプロンプトテンプレートを読み取ります。 | いつでも |
| expl palette get | 作成したカラーパレットを読み取ります。 | いつでも |
| expl rpackage get | プロジェクトのカスタム R パッケージを一覧します。 | いつでも |
| expl settings get | システム設定を読み取ります。秘密の値は伏せて返します。 | いつでも |
| expl rpackage add | CRAN またはローカルのファイルから、R パッケージをインストールします。 | 作成、変更、削除を許可したとき |
| expl aifunction delete-template | AI 関数のテンプレートを削除します。 | 作成、変更、削除を許可したとき |
| expl noteprompt delete-template | ノート編集用のプロンプトテンプレートを削除します。 | 作成、変更、削除を許可したとき |
| expl palette delete | カラーパレットを削除します。 | 作成、変更、削除を許可したとき |
| expl rpackage delete | カスタム R パッケージを削除します。 | 作成、変更、削除を許可したとき |
| expl aifunction save-template | 指示文を AI 関数のテンプレートとして保存します。 | 作成、変更、削除を許可したとき |
| expl dictionary save | テキスト分析の辞書を作成または更新します。 | 作成、変更、削除を許可したとき |
| expl noteprompt save-template | ノート編集用のプロンプトテンプレートを保存します。 | 作成、変更、削除を許可したとき |
| expl palette save | カラーパレットを作成または更新します。 | 作成、変更、削除を許可したとき |
| expl settings edit | システム設定のうち、変更が許されている項目を変更します。 | 作成、変更、削除を許可したとき |

### ローカルのデータカタログ

| コマンド | できること | 使える条件 |
| --- | --- | --- |
| expl catalog fetch | カタログの項目 1 つの、タイトル、説明、列などを Markdown で読み取ります。 | いつでも |
| expl catalog get-schedule | カタログの項目の更新スケジュールを取得します。 | いつでも |
| expl catalog get-schema | カタログの項目の列を、説明と要約統計つきで取得します。 | いつでも |
| expl catalog preview | カタログの項目の行を、ページ送りで取得します。 | いつでも |
| expl catalog query | カタログの項目を、絞り込み、グループ化、集計、結合します。 | いつでも |
| expl project read-catalog | プロジェクトのデータフレーム、チャート、アナリティクス、ノート、パラメーター、ダッシュボードをまとめて読み取ります。 | いつでも |
| expl catalog search | このコンピューターのデータカタログを検索します。 | いつでも |
| expl catalog delete | カタログの項目を、データ、スケジュール、アクセスログごと削除します。 | 作成、変更、削除を許可したとき |
| expl catalog set-schedule | カタログの項目の更新スケジュールを設定します。 | 作成、変更、削除を許可したとき |
| expl catalog update | カタログの項目と列の説明を変更します。 | 作成、変更、削除を許可したとき |

### そのほか

| コマンド | できること | 使える条件 |
| --- | --- | --- |
| expl execution cancel | 時間のかかる操作を止めます。 | いつでも |
| expl execution get | 時間のかかる操作の進み具合と結果を返します。 | いつでも |
| expl guide get | 道具の使い方のガイドを返します。 | いつでも |
| expl artifact rerun | 開いているプロジェクトのチャートやアナリティクスなどを再実行します。 | 作成、変更、削除を許可したとき |

組み込みのコマンド（expl status、project use、tools list、tools describe、call、lang、skill、completion）は、下ではなく、このページの上の表にあります。フラグは[共通フラグ](/ja/cli/desktop/global-flags)を参照してください。

exploratory.io のコンテンツを読むコマンドは、[Server のコマンド](/ja/cli/server/commands)を参照してください。

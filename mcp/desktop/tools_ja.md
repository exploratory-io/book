# 使える道具

Desktop MCP を使うと、AI クライアントが Exploratory Desktop で開いているプロジェクトを操作できます。目的から、できることを確認します。

<a id="overview"></a>

## ツールの範囲

次の表は、主なツールの例です。実際には、これ以外にも多くのツールがあります。表のツールは、Exploratory Desktop のプラグインが AI に使うよう案内するものです。表示されるツールは、Desktop のバージョンと、システム設定 \> MCP / CLI の設定によって変わります。「作成、変更、削除を許可する」がオフのときは、読み取りだけができます。

| 目的 | AI にできること | ツール（例） |
| --- | --- | --- |
| データフレームとデータ加工 | データフレームの読み取り、プレビュー、プロファイル。加工ステップの追加と削除、ブランチの操作、R コードの実行と結果のデータフレームへの保存。 | create_wrangling_step, ai_wrangle, preview_data_frame, profile_data_frame, create_branch, execute_r_script, save_result_as_dataframe |
| データソースと接続 | 接続の読み取りと保存、データの取り込み、データソースの作成と置き換え、PDF からの表の抽出。 | get_connections, save_connection, create_data_source, replace_data_source, extract_pdf_tables |
| チャート | チャートの作成、変更、コピー、読み取り（設定、データ、画像）、チャートのデータの書き出し。 | create_chart, update_chart, get_chart, get_chart_data, get_chart_image, copy_chart, export_chart_data |
| アナリティクス | アナリティクス（回帰、検定、クラスタなど）とテンプレートの作成、変更、読み取り。 | create_analytics, update_analytics, get_analytics, list_analytics_templates |
| ノート | ノートの作成、変更、読み取り、表示、公開、書き出し。ノートの AI への質問。 | create_note, update_note, get_note, publish_note, export_note_html, ask_note_ai |
| ダッシュボード | ダッシュボードの作成、変更、検証、公開、書き出し。パラメーターの値の設定。 | create_dashboard, update_dashboard, validate_dashboard, publish_dashboard, export_dashboard_pdf |
| パラメーター | パラメーターの作成、名前の変更、読み取り、削除。 | save_parameter, get_parameters, rename_parameter, delete_parameter |
| システム設定 | システム設定、カラーパレット、AI 関数のテンプレート、辞書の読み取りと変更。 | get_system_settings, update_system_settings, save_palette, save_dictionary |

> **変更や削除を行うツールがあります**
>
> これらのツールには、削除、公開と公開の取り消し、R コードの実行を行うものがあります。Desktop が先に確認する仕組みは、「許可の範囲と設定」で説明しています。

<a id="all-tools"></a>

## 全部の道具の一覧

全部で 146 個の道具があります（tam の master 時点）。読み取りだけの道具が 69 個、作成、変更、削除が要る道具が 77 個です。

作成、変更、削除が要る道具は、システム設定 \> MCP / CLI の「作成、変更、削除を許可する」がオンのときに使えます。

### プロジェクト（16 個）

**読み取りだけ（11 個）**

| 名前 | できること |
| --- | --- |
| ask_project | 書き込みの前に、どのプロジェクトを使うかを利用者に確認します。 |
| get_environment | 接続している Desktop の情報（アプリのバージョン、Agent API のバージョン、OS、ログイン中のユーザー、開いているプロジェクト）を返します。 |
| get_lineage | チャート、アナリティクス、ノート、データフレームが、どのデータの取り込み元の上に作られているかを返します。 |
| get_project | プロジェクト 1 つの名前、説明、更新日時、開いているかどうかを読み取ります。 |
| get_project_history | プロジェクトの変更履歴を読み取り、検索します。 |
| list_created_artifacts | この会話で AI が作成または変更したチャート、アナリティクス、ステップ、ブランチを一覧します。 |
| list_projects | この PC のプロジェクトを、新しい順に一覧します。 |
| locate_published_source | 公開されたデータの取り込み元をたどります。 |
| search_artifacts | 開いているプロジェクトから、名前、コメント、中身で成果物を検索します。 |
| search_projects | 手元のすべてのプロジェクトから、データフレーム、チャート、アナリティクス、ノートなどを検索します。 |
| search_server_projects | ログイン中の Exploratory サーバーで公開されているプロジェクトを一覧します。 |

**作成、変更、削除が要る（5 個）**

| 名前 | できること |
| --- | --- |
| close_project | 保存してから、プロジェクトのウィンドウを閉じます。 |
| import_project | 公開されているプロジェクトをダウンロードし、新しいローカルプロジェクトとして取り込みます。 |
| open_project | ローカルプロジェクトをウィンドウで開きます。すでに開いていればそのウィンドウを前面に出します。 |
| restore_project_history | プロジェクト全体を、変更履歴のある時点に戻します。 |
| save_project | 新しいプロジェクトを作成するか、プロジェクトファイルを取り込みます。 |

### データフレーム（10 個）

**読み取りだけ（5 個）**

| 名前 | できること |
| --- | --- |
| get_data_frame | データフレームのステップ、列名、型、行数を読み取ります。 |
| get_summary_view | データフレームの Summary の表を返します。 |
| list_data_frames | プロジェクトのデータフレームを一覧します。 |
| preview_data_frame | データフレームの最後のステップの先頭の行を返します。 |
| profile_data_frame | すべての列の型、欠損、要約統計、分布をまとめて確認します。 |

**作成、変更、削除が要る（5 個）**

| 名前 | できること |
| --- | --- |
| execute_r_script | R スクリプトを実行して結果を返します。 |
| get_step_diagram | データフレームのステップ図（Step Diagram）を返します。 |
| manage_data_frame | データフレームやカタログに対する操作（名前の変更や削除など）を行います。 |
| save_result_as_dataframe | チャートまたはアナリティクスの出力データを、新しいデータフレームとして保存します。 |
| select_data_frame | 加工の対象にするデータフレームを選び、列の一覧を返します。 |

### データ加工（15 個）

**読み取りだけ（2 個）**

| 名前 | できること |
| --- | --- |
| get_wrangling_command | 加工コマンドが受け付けるパラメーターを返します。 |
| list_ai_proposals | プロジェクトの AI の提案と、確認の状況を一覧します。 |

**作成、変更、削除が要る（13 個）**

| 名前 | できること |
| --- | --- |
| ai_wrangle | 加工の依頼から AI が R スクリプトを書き、必要に応じてステップとして追加します。 |
| apply_wrangling_preview | プレビューで試した変更を、まとめて適用します。 |
| copy_wrangling_steps | ステップを、同じまたは別の開いているプロジェクトのデータフレームにコピーします。 |
| create_branch | ステップから分岐するブランチを作成します。 |
| create_wrangling_step | データフレームに加工ステップを 1 つ追加します。 |
| delete_branch | ブランチを削除します。 |
| delete_wrangling_step | データフレームのステップを削除します。 |
| edit_wrangling_steps | 既存のステップを、ステップのメニューと同じ方法で編集します。 |
| move_branch | ブランチの分岐元を、別のステップに変更します。 |
| preview_wrangling_steps | 変更を一時的なオブジェクトで試し、保存せずに結果を確認します。 |
| set_step_cache | ステップのデータをキャッシュする、更新する、または解除します。 |
| set_step_disabled | ステップを削除せずに、無効にする、または有効に戻します。 |
| update_ai_proposal | 公開後に、AI の提案で直した内容が効いたかどうかを記録します。 |

### チャート（15 個）

**読み取りだけ（7 個）**

| 名前 | できること |
| --- | --- |
| get_chart | チャートの定義、データ、パラメーターを読み取ります。 |
| get_chart_data | チャートを実行し、集計された実際の値を返します。 |
| get_chart_image | チャートの PNG 画像を返します。 |
| get_chart_summary_prompt | チャートの AI サマリを書くための、実際の値を含む参考資料を返します。 |
| list_chart_maps | 地図のチャートで使える地図を一覧します。 |
| list_chart_settings | チャートの種類ごとに使える設定と関数を返します。 |
| list_charts | データフレームのチャートを一覧します。 |

**作成、変更、削除が要る（8 個）**

| 名前 | できること |
| --- | --- |
| copy_chart | チャートを複製する、または別のデータフレームに貼り付けます。 |
| create_chart | データフレームから、編集できるチャートを作成します。 |
| delete_chart | チャートを削除します。 |
| export_chart_data | チャートのデータをファイルに書き出します。 |
| install_chart_map | 地図の拡張を Exploratory のサーバーから入れる、または更新します。 |
| open_chart | チャートをチャートビューで開きます。 |
| save_chart_ai_summary | 書いた解釈文を、チャートの AI サマリとして保存します。 |
| update_chart | チャートの種類、集計、名前などの設定を変更します。 |

### アナリティクス（9 個）

**読み取りだけ（5 個）**

| 名前 | できること |
| --- | --- |
| get_analytics | アナリティクスの結果（種類、設定、出力）を読み取ります。 |
| get_analytics_summary_prompt | アナリティクスの AI サマリを書くための、実際の値を含む参考資料を返します。 |
| get_analytics_template | アナリティクスの種類ごとに、指定できる項目と設定を返します。 |
| list_analytics | データフレームのアナリティクスを一覧します。 |
| list_analytics_templates | 作成できるアナリティクスの種類を一覧します。 |

**作成、変更、削除が要る（4 個）**

| 名前 | できること |
| --- | --- |
| create_analytics | アナリティクス（回帰、分類、クラスタリングなど）を作成して実行します。 |
| delete_analytics | アナリティクスを削除します。 |
| save_analytics_ai_summary | 書いた解釈文を、アナリティクスのコメントに追記して保存します。 |
| update_analytics | アナリティクスの列、設定、種類を変更して再実行します。 |

### ノート（10 個）

**読み取りだけ（3 個）**

| 名前 | できること |
| --- | --- |
| get_note | ノート 1 つを、Markdown の本文ごと読み取ります。 |
| get_note_image | ノートのプレビュー全体を PNG 画像で返します。 |
| list_notes | プロジェクトのノートを、本文なしで一覧します。 |

**作成、変更、削除が要る（7 個）**

| 名前 | できること |
| --- | --- |
| ask_note_ai | ノートエディターの AI に、ノートの文章の書き直し、翻訳、要約を頼みます。 |
| create_note | チャートやアナリティクスを埋め込める Markdown のノートを作成します。 |
| delete_note | ノートを削除します。 |
| export_note_html | ノートを HTML ファイルに書き出します。 |
| export_note_pdf | ノートを PDF ファイルに書き出します。 |
| open_note | ノートを画面で開きます。 |
| update_note | ノートの本文に追記する、または置き換える、名前を変更します。 |

### ダッシュボード（9 個）

**読み取りだけ（4 個）**

| 名前 | できること |
| --- | --- |
| get_dashboard | ダッシュボード 1 つのページ、markdown、変数、設定を読み取ります。 |
| get_dashboard_image | 保存済みダッシュボードの指定ページを PNG 画像で返します。 |
| list_dashboards | プロジェクトのダッシュボードを一覧します。 |
| validate_dashboard | 保存せずに、ダッシュボードのレイアウトを検査します。 |

**作成、変更、削除が要る（5 個）**

| 名前 | できること |
| --- | --- |
| create_dashboard | ページ、行、パネルを並べたダッシュボードを作成します。 |
| delete_dashboard | ダッシュボードを削除します。 |
| export_dashboard_html | ダッシュボードを HTML ファイルに書き出します。 |
| export_dashboard_pdf | ダッシュボードの全ページを PDF ファイルに書き出します。 |
| update_dashboard | ダッシュボードのページ、パネル、名前、設定を変更します。 |

### データソースと接続（18 個）

**読み取りだけ（12 個）**

| 名前 | できること |
| --- | --- |
| get_connections | データ接続の一覧、または接続 1 件の項目を読み取ります。 |
| get_data_source_params | データソースの設定項目と、接続が必要かどうかを返します。 |
| identify_data_source | 依頼されたデータの取得元を特定し、リファレンスを返します。 |
| list_pdf_tables | PDF ファイル内の表を下見します。 |
| list_schema_nodes | 階層型の接続で、指定したパスの下にあるノードを確認します。 |
| lookup_connection | 選択した接続を探し、認証情報を除いたメタ情報を返します。 |
| lookup_reference | データの取得元の種類に合う、AI Data のリファレンスを返します。 |
| read_file_header | ローカルのテキストファイルの先頭と形式を確認します。 |
| request_connection_creation | 接続の作成ダイアログを開きます。 |
| sample_collections | 接続の実際のテーブル一覧とサンプルを取得します。 |
| search_schema | 接続の保存済みのテーブルと列の情報を確認します。 |
| validate_connection | 保存済みの接続に、必須の項目がそろっているかを検証します。 |

**作成、変更、削除が要る（6 個）**

| 名前 | できること |
| --- | --- |
| create_data_source | データフレームとデータソースを保存します。 |
| delete_connection | データ接続を削除します。 |
| extract_pdf_tables | PDF の表の中身を、取り込む前に確認します。 |
| replace_data_source | 既存のデータフレームの取り込み元を差し替えます。 |
| save_connection | 接続の作成または設定のダイアログを開きます。項目は利用者が入力します。 |
| save_schema_info | 接続で確認したテーブルと列の情報を保存します。 |

### パラメーター（6 個）

**読み取りだけ（2 個）**

| 名前 | できること |
| --- | --- |
| get_parameters | プロジェクトのパラメーターを読み取ります。 |
| get_session_parameters | ログイン情報から自動で定義されるセッションパラメーターの定義を読み取ります。 |

**作成、変更、削除が要る（4 個）**

| 名前 | できること |
| --- | --- |
| delete_parameter | パラメーターを削除します。 |
| rename_parameter | パラメーターの名前を変更します。 |
| save_parameter | パラメーターを作成します。すでにあれば更新します。 |
| set_dashboard_parameter_value | 表示中のダッシュボードのパラメーターの選択を変えて、表示し直します。 |

### 公開（7 個）

**読み取りだけ（2 個）**

| 名前 | できること |
| --- | --- |
| list_published | プロジェクトから公開しているノート、ダッシュボード、データを一覧します。 |
| list_teams | 所属しているチームを一覧します。 |

**作成、変更、削除が要る（5 個）**

| 名前 | できること |
| --- | --- |
| publish_dashboard | ダッシュボードを、公開 URL でサーバーに公開します。 |
| publish_data_frame | データフレームのステップをサーバーに公開します。 |
| publish_note | ノートを、公開 URL でサーバーに公開します。 |
| publish_project | プロジェクトの公開ダイアログを開きます。 |
| unpublish | ノートまたはダッシュボードの公開を取り消します。 |

### 設定と共有のリソース（17 個）

**読み取りだけ（7 個）**

| 名前 | できること |
| --- | --- |
| get_ai_function_presets | 列メニューにある AI 関数の、プリセットの指示文を返します。 |
| get_ai_function_templates | 保存されている AI 関数のテンプレートを読み取ります。 |
| get_dictionaries | テキスト分析の辞書を読み取ります。 |
| get_note_prompt_templates | 保存されているノート編集用のプロンプトテンプレートを読み取ります。 |
| get_palettes | 作成したカラーパレットを読み取ります。 |
| get_r_packages | プロジェクトのカスタム R パッケージを一覧します。 |
| get_system_settings | システム設定を読み取ります。秘密の値は伏せて返します。 |

**作成、変更、削除が要る（10 個）**

| 名前 | できること |
| --- | --- |
| add_r_package | CRAN またはローカルのファイルから、R パッケージをインストールします。 |
| delete_ai_function_template | AI 関数のテンプレートを削除します。 |
| delete_note_prompt_template | ノート編集用のプロンプトテンプレートを削除します。 |
| delete_palette | カラーパレットを削除します。 |
| delete_r_package | カスタム R パッケージを削除します。 |
| save_ai_function_template | 指示文を AI 関数のテンプレートとして保存します。 |
| save_dictionary | テキスト分析の辞書を作成または更新します。 |
| save_note_prompt_template | ノート編集用のプロンプトテンプレートを保存します。 |
| save_palette | カラーパレットを作成または更新します。 |
| update_system_settings | システム設定のうち、変更が許されている項目を変更します。 |

### ローカルのデータカタログ（10 個）

**読み取りだけ（7 個）**

| 名前 | できること |
| --- | --- |
| fetch_catalog_item | カタログの項目 1 つの、タイトル、説明、列などを読み取ります。 |
| get_catalog_schedule | カタログの項目の更新スケジュールを取得します。 |
| get_catalog_schema | カタログの項目の列を、説明と要約統計つきで取得します。 |
| preview_catalog_data | カタログの項目の行を、ページ送りで取得します。 |
| query_catalog_data | カタログの項目を、絞り込み、グループ化、集計、結合します。 |
| read_catalog | プロジェクトのデータフレーム、チャート、アナリティクス、ノート、パラメーター、ダッシュボードをまとめて読み取ります。 |
| search_catalog | この PC のデータカタログを検索します。 |

**作成、変更、削除が要る（3 個）**

| 名前 | できること |
| --- | --- |
| delete_catalog_item | カタログの項目を、データ、スケジュール、アクセスログごと削除します。 |
| set_catalog_schedule | カタログの項目の更新スケジュールを設定します。 |
| update_catalog_item | カタログの項目と列の説明を変更します。 |

### そのほか（4 個）

**読み取りだけ（2 個）**

| 名前 | できること |
| --- | --- |
| get_execution | 時間のかかる操作の進み具合と結果を返します。 |
| get_guide | 道具の使い方のガイドを返します。 |

**作成、変更、削除が要る（2 個）**

| 名前 | できること |
| --- | --- |
| cancel_execution | 時間のかかる操作を止めます。 |
| rerun_artifact | 開いているプロジェクトのチャートやアナリティクスなどを再実行します。 |


# 使える道具

Desktop MCP を使うと、AI クライアントが Exploratory Desktop で開いているプロジェクトを操作できます。目的から、できることを確認します。

<a id="overview"></a>

## ツールの範囲

次のツールは、Exploratory Desktop のプラグインが AI に使うよう案内するものです。表示されるツールは、Desktop のバージョンと、システム設定 \> MCP / CLI の設定によって変わります。「作成、変更、削除を許可する」がオフのときは、読み取りだけができます。

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

# 使い方

手元のプロジェクトでやりたいことから、使うコマンドと手順のページを探します。コンテンツの作成、変更、削除をするときは、システム設定の MCP / CLI で「作成、変更、削除を許可する」をオンにします。

| やりたいこと | 主なコマンド | 詳しいページ |
| --- | --- | --- |
| 以降のコマンドが対象にするプロジェクトを選ぶ | expl project use \<id\|name\>、expl project open \<id\> | [プロジェクトを選ぶ](guides/projects_ja.md) |
| ファイルを取り込み、データを加工する | expl dataframe read-file-header --file-path ./sales_orders.csv、expl dataframe apply-step \<dataframe_id\> --command \<command\> --params @params.json | [データを取り込む・加工する](guides/wrangle-data_ja.md) |
| チャートを作る | expl chart add --data-frame-id \<dataframe_id\> --marker bar --axes ... | [チャートを作る](guides/create-charts_ja.md) |
| アナリティクスを作る | expl analytics add --data-frame-id \<dataframe_id\> --analysis-type \<analysis_type\> | [アナリティクスを作る](guides/create-analytics_ja.md) |
| ノートを書く | expl note add --title "Sales Orders report" --markdown @report.md | [ノートを書く](guides/write-notes_ja.md) |
| ダッシュボードを作る・複製する | expl dashboard get d123 --json \> base.json、expl dashboard create --input dashboard.json | [ダッシュボードを作る・複製する](guides/duplicate-dashboard_ja.md) |
| ノートやダッシュボードを公開する | expl note publish \<note_id\>、expl dashboard publish \<dashboard_id\> | [公開する](guides/publish_ja.md) |
| AI エージェントにコマンドを実行させる | expl skill | [AI エージェントから使う](guides/agents_ja.md) |

ターミナルではなく AI ツールから同じことをするときは、MCP Desktop の[使い方](../../mcp/desktop/use_ja.md)を参照してください。

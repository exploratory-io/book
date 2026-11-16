# 使い方

公開されたコンテンツでやりたいことから、使うコマンドと手順のページを探します。

| やりたいこと | 主なコマンド | 詳しいページ |
| --- | --- | --- |
| 必要なデータやノートを探す | expl server search "Sales Orders" --scope all --type data | [データを探す](guides/find-data_ja.md) |
| 公開されたノートを読む | expl server fetch \<id\> --section \<id\>（または --query "sales forecast"） | [ノートを読む](guides/read-notes_ja.md) |
| データの列の名前と型を確認する | expl server dataframe get-schema \<id\> --detail light | [データを集計する](guides/query-data_ja.md) |
| データを絞り込み、集計する | expl server dataset query \<dataset_id\> --mode aggregate --dimensions ... --metrics ... | [データを集計する](guides/query-data_ja.md) |
| チャートの数値を取得する | expl server chart get-data \<id\> --chart \<chart\> | [チャートの数値を取得する](guides/dashboard-charts_ja.md) |
| チャートの形を見る | expl server chart get-image \<id\> --chart \<chart\> | [チャートの数値を取得する](guides/dashboard-charts_ja.md) |
| アナリティクスの結果を取得する | expl server analytics get-result \<id\> --analytics \<analytics\> | [アナリティクスの結果を取得する](guides/analytics_ja.md) |
| 結果をファイルに保存する | expl server dataframe export \<dataset_id\> --mode rows --output rows.csv | [結果をファイルに保存する](guides/export_ja.md) |
| スクリプトや CI から実行する | expl server login --with-token、expl server token create --name ci | [自動処理](guides/automation_ja.md) |
| AI エージェントにコマンドを実行させる | expl server status、expl server tools list --json | [AI エージェントから使う](guides/agents_ja.md) |

ターミナルではなく AI アプリから同じことをするときは、MCP Server の[使い方](../../mcp/server/examples_ja.md)を参照してください。

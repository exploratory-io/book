# 使い方

公開されたコンテンツでやりたいことから、使うコマンドと手順のページを探します。

| やりたいこと | 主なコマンド | 詳しいページ |
| --- | --- | --- |
| 必要なデータやノートを探す | expl server search "Sales Orders" --scope all --type data | [データを探す](guides/find-data.md) |
| 公開されたノートを読む | expl server fetch \<id\> --section \<id\>（または --query "sales forecast"） | [ノートを読む](guides/read-notes.md) |
| データの列の名前と型を確認する | expl server dataframe get-schema \<id\> --detail light | [データを集計する](guides/query-data.md) |
| データを絞り込み、集計する | expl server dataset query \<dataset_id\> --mode aggregate --dimensions ... --metrics ... | [データを集計する](guides/query-data.md) |
| チャートの数値を取得する | expl server chart get-data \<id\> --chart \<chart\> | [チャートの数値を取得する](guides/dashboard-charts.md) |
| チャートの形を見る | expl server chart get-image \<id\> --chart \<chart\> | [チャートの数値を取得する](guides/dashboard-charts.md) |
| アナリティクスの結果を取得する | expl server analytics get-result \<id\> --analytics \<analytics\> | [アナリティクスの結果を取得する](guides/analytics.md) |
| 結果をファイルに保存する | expl server dataframe export \<dataset_id\> --mode rows --output rows.csv | [結果をファイルに保存する](guides/export.md) |
| スクリプトや CI から実行する | expl server login --with-token、expl server token create --name ci | [自動処理](guides/automation.md) |
| AI エージェントにコマンドを実行させる | expl server status、expl server tools list --json | [AI エージェントから使う](guides/agents.md) |

ターミナルではなく AI ツールから同じことをするときは、MCP Server の[使い方](../../mcp/server/use.md)を参照してください。

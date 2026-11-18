---
title: "使い方"
---

手元のプロジェクトでやりたいことから、使うコマンドと手順のページを探します。コンテンツの作成、変更、削除をするときは、システム設定 > MCP / CLI で「作成、変更、削除を許可する」にチェックを入れます。

| やりたいこと | 主なコマンド | 手順のページ |
| --- | --- | --- |
| 以降のコマンドが対象にするプロジェクトを選ぶ | expl project use \<id\|name\>、expl project open \<id\> | [プロジェクトを選ぶ](/ja/cli/desktop/guides/projects) |
| ファイルを取り込み、データを加工する | `expl dataframe read-file-header --file-path` ./sales_orders.csv、`expl dataframe apply-step <dataframe_id> --command <command>` `--params @params.json` | [データを取り込む・加工する](/ja/cli/desktop/guides/wrangle-data) |
| チャートを作る | `expl chart add --data-frame-id <dataframe_id>` `--marker` bar `--axes` ... | [チャートを作る](/ja/cli/desktop/guides/create-charts) |
| アナリティクスを作る | `expl analytics add --data-frame-id <dataframe_id>` `--analysis-type <analysis_type>` | [アナリティクスを作る](/ja/cli/desktop/guides/create-analytics) |
| ノートを書く | `expl note add --title "Sales Orders report" --markdown` @report.md | [ノートを書く](/ja/cli/desktop/guides/write-notes) |
| ダッシュボードを複製する | `expl dashboard get d123 --json` \> base.json、`expl dashboard create --input` dashboard.json | [ダッシュボードを複製する](/ja/cli/desktop/guides/duplicate-dashboard) |
| ノートやダッシュボードを公開する | expl note publish \<note_id\>、expl dashboard publish \<dashboard_id\> | [公開する](/ja/cli/desktop/guides/publish) |
| AI エージェントにコマンドを実行させる | expl skill | [AI エージェントから使う](/ja/cli/desktop/guides/agents) |

ターミナルではなく AI ツールから同じことをするときは、MCP Desktop の[使い方](/ja/mcp/desktop/use)を参照してください。

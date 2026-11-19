---
title: "AI エージェントから使う"
---

AI エージェントが expl server を実行する前に知っておくことです。シェルのコマンドを実行できる AI エージェントは、expl をそのまま使えます。MCP の設定は必要ありません。

<a id="use"></a>

## expl の使い方

1. 最初に、接続を確かめます。expl server status を実行します。expl server tools list が終了コード 0 で終わっても、接続できているとは限りません。
2. コマンド名を推測せず、`expl server tools list --json` で探します。1 つのコマンドの引数は、expl server tools describe \<tool_name\> で確認します。
3. `--json` を付けて、結果を標準出力から読みます。進捗と警告は標準エラーに出るので、JSON は壊れません。
4. 終了コードを確認します。3 はサーバーにつながらない、4 は認証または権限の問題です。
5. ターミナル以外では、取り消しにくい操作は `--yes` がないと何も実行されず、終了コード 2 で終了します。`--yes` を付ける前に利用者に確認し、利用者が実行すると決めた操作にのみ付けます。ただし expl server token revoke は例外で、`--yes` の有無にかかわらず確認なしで取り消しを送ります。実行する前に、取り消す API キーと、取り消す意思を利用者に確認します。
6. CI では、環境変数 EXPL_SERVER_TOKEN の API キーでサインインします。
7. エラーのメッセージに chart_query のような道具名が出たら、expl server tools describe \<tool_name\> で、その道具に当たるコマンドを確認します。

コマンドの一覧と説明は[コマンドを調べる](/ja/cli/server/commands#inspect-commands)、終了コードの一覧は[終了コードとエラー](/ja/cli/server/exit-codes)、CI での API キーの使い方は[自動処理](/ja/cli/server/guides/automation)を参照してください。

<a id="choose"></a>

## expl と MCP Server の選び方

MCP は、AI ツールが外部のサービスに接続するための共通の規格です。どちらの方法でも、AI から Exploratory を利用できます。

| やりたいこと | 使うもの |
| --- | --- |
| スクリプト、CI、シェルで実行されるエージェント | expl |
| MCP を使用するエージェント | MCP Server（AI ツールにサーバー URL を登録して使います） |

AI ツールから、公開されたコンテンツを読む場合は[MCP Server](/ja/mcp/server)を、Exploratory Desktop のプロジェクトを扱う場合は[Desktop で使う](/ja/cli/desktop/guides/agents)を参照してください。

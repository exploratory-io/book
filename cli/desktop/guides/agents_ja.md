# AI エージェントから使う

AI エージェントが expl を実行する前に知っておくことです。シェルのコマンドを実行できる AI エージェントは、expl をそのまま使えます。MCP の登録は必要ありません。

<a id="use"></a>

## expl の使い方

1. 最初に、接続を確かめます。expl status を実行します。expl tools list が終了コード 0 で終わっても、Desktop に接続できているとは限りません。
2. コマンド名を推測せず、expl tools list --json で探します。1 つのコマンドの引数は、expl tools describe \<tool_name\> で確認します。
3. --json を付けて、結果を標準出力から読みます。進捗、警告、確認は標準エラーに出るので、JSON は壊れません。
4. 終了コードを確認します。3 は Desktop につながらない、4 は認証、承認、権限の問題です。
5. ターミナル以外では、取り消しにくい操作は --yes がないと何も実行されず、終了コード 2 で終了します。--yes を付ける前に利用者に確認し、利用者が実行すると決めた操作にのみ付けます。
6. エラーのメッセージに get_data_frame のようなツール名が出たら、expl tools describe \<tool_name\> で、そのツールに当たるコマンドを確認します。

終了コードの一覧は[終了コード](../exit-codes_ja.md)、--yes の働きは[確認と時間のかかる操作](confirmation_ja.md)を参照してください。

<a id="other"></a>

## ほかの方法

- [MCP の Desktop](../../../mcp/desktop/desktop_ja.md) - AI アプリから Desktop のプロジェクトを扱います。
- [MCP の Server](../../../mcp/server/server_ja.md) - AI アプリから直接つなぎます。
- [Server で使う](../../server/guides/agents_ja.md) - exploratory.io のコンテンツを読む場合です。

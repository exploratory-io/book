# AI エージェント

シェルのコマンドを実行できる AI エージェントは、expl をそのまま使えます。MCP の設定は必要ありません。

<a id="choose"></a>

## expl と MCP Server の選び方

MCP は、AI アプリが外部のサービスに接続するための共通の規格です。どちらの方法でも、AI から Exploratory を利用できます。

| やりたいこと | 使うもの |
| --- | --- |
| スクリプト、CI、シェルで実行されるエージェント | expl |
| MCP を使用するエージェント | MCP Server（Exploratory のプラグイン） |

- [MCP Server](../../../mcp/server/server_ja.md) - AI アプリから、パブリッシュされたコンテンツを読みます。

<a id="skill"></a>

## スキルで教える

スキルは任意です。expl はスキルがなくても使えます。使い方は、expl server --help と expl server tools describe で確認できます。スキルは、AI エージェントに道具の使い方を教える説明ファイル（SKILL.md）で、expl server skill が Exploratory Server 向けのものを出力します。保存の手順は、スキルのページにあります。Desktop 向けのスキルは、Desktop のページで説明しています。

- [スキル](../skill_ja.md) - スキルの保存を説明しています。
- [Desktop で使う](../../desktop/guides/agents_ja.md) - expl skill の保存を説明しています。

<a id="tips"></a>

## エージェント向けのヒント

- --json を付けて、終了コードを確認します。
- ターミナル以外では、取り消しにくい操作は --yes がないと何も実行されず、終了コード 2 で終了します。--yes は、実行すると決めた操作にのみ付けます。
- コマンド名を推測せず、expl server tools list で、使えるものを確認します。

- [終了コード](../exit-codes_ja.md) - 終了コードの一覧です。

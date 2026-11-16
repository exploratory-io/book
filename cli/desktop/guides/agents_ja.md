# AI エージェントから使う

シェルのコマンドを実行できる AI エージェントは、expl をそのまま使えます。MCP の登録は必要ありません。

<a id="skill"></a>

## スキルで教える

スキルは任意です。expl はスキルがなくても使えます。使い方は、expl --help と expl tools describe で確認できます。

スキルは、AI エージェントに道具の使い方を教える説明ファイル（SKILL.md）です。expl skill は、Desktop 向けのスキルを出力します。Claude Code の場合は、次のとおりです。

```sh
mkdir -p ~/.claude/skills/exploratory-expl
```

```sh
expl skill > ~/.claude/skills/exploratory-expl/SKILL.md
```

<a id="tips"></a>

## エージェント向けのヒント

- --json を付けて、終了コードを確認します。
- ターミナル以外では、取り消しにくい操作は --yes がないと何も実行されず、終了コード 2 で終了します。--yes は、実行すると決めた操作にのみ付けます。
- コマンド名を推測せず、expl tools list で、使えるものを確認します。

<a id="other"></a>

## ほかの方法

- [MCP Server](../../../mcp/server/server_ja.md) - AI アプリから直接つなぎます。
- [Server で使う](../../server/guides/agents_ja.md) - exploratory.io のコンテンツを読む場合です。

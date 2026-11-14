# スキル

AI エージェントに expl の使い方を教える、スキルの説明ファイルを出力します。

<a id="what"></a>

## スキルとは

スキルは、AI エージェントに道具の使い方を教える説明ファイル（SKILL.md）です。エージェントは、スキルを置いた場所から読み込みます。

<a id="save"></a>

## 保存する

Claude Code の場合は、次の 2 つのコマンドで保存します。

```sh
mkdir -p ~/.claude/skills/exploratory-expl-server
```

```sh
expl server skill > ~/.claude/skills/exploratory-expl-server/SKILL.md
```

expl server skill は Exploratory Server 向けです。Exploratory Desktop 向けは expl skill です。サーバーに接続できるときは、出力に最新の案内も加わるので、コピーしたファイルよりも、このコマンドを使ってください。

- [AI エージェント](guides/agents_ja.md) - スキルのほかに、エージェントが使うときの注意があります。

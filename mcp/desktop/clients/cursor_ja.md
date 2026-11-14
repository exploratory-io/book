# Cursor（Desktop）

Cursor から Exploratory Desktop の MCP をつなぎます。

<a id="install"></a>

## 手作業でインストールする

Exploratory Desktop で「AI クライアントと接続」のカードを使う方法は、概要の「つなぐ手順」にあります。ここでは、手でインストールする方法と、更新・削除を説明します。

> 概要の手順: [Desktop の MCP をつなぐ](../desktop_ja.md#steps)

「AI クライアントと接続」のカードを使わないときの手順です。このプラグインは、公式のプラグイン一覧にはありません。リポジトリ exploratory-io/exploratory をマーケットプレイスとして足してから、プラグイン exploratory を入れます。コマンドは、ご自身でターミナルに打ってください。AI クライアントに実行させるのは避けてください。権限の設定によっては止められます。

**Cursor**

```sh
{
  "mcpServers": {
    "exploratory-desktop": {
      "command": "exploratory-mcp"
    }
  }
}
```

~/.cursor/mcp.json に追加します。スキルなしで Desktop の MCP が入ります。「AI クライアントと接続」のカードが書くのと同じ内容です。Cursor には、~/.claude から取り込んだ Claude Code のプラグインも表示されます。その場合は、先に Claude Code でプラグインを入れ、Cursor の設定で「Include Third-Party Plugins, Skills, and Other Configs」をオンにします。

<a id="update"></a>

## 更新と削除

| 更新 | 削除 |
| --- | --- |
| Claude Code でプラグインを更新します（Cursor は ~/.claude から取り込みます） | Claude Code でアンインストールします。~/.cursor/mcp.json を手で書いたときは、そこから exploratory-desktop を消します |

Desktop の MCP は、Exploratory Desktop を終了すると止まります。プラグインを削除しても、Server の MCP の接続には影響しません。

<a id="trouble"></a>

## うまくいかないとき

> [トラブルシューティング](../troubleshooting_ja.md) を参照してください。

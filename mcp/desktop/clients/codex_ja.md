# Codex（Desktop）

Codex から Exploratory Desktop の MCP をつなぎます。

<a id="install"></a>

## 手作業でインストールする

Exploratory Desktop で「AI クライアントと接続」のカードを使う方法は、概要の「つなぐ手順」にあります。ここでは、手でインストールする方法と、更新・削除を説明します。

> 概要の手順: [Desktop の MCP をつなぐ](../desktop_ja.md#steps)

「AI クライアントと接続」のカードを使わないときの手順です。このプラグインは、公式のプラグイン一覧にはありません。リポジトリ exploratory-io/exploratory をマーケットプレイスとして足してから、プラグイン exploratory を入れます。コマンドは、ご自身でターミナルに打ってください。AI クライアントに実行させるのは避けてください。権限の設定によっては止められます。

**Codex**

```sh
codex plugin marketplace add exploratory-io/exploratory
codex plugin add exploratory@exploratory
```

<a id="update"></a>

## 更新と削除

| 更新 | 削除 |
| --- | --- |
| codex plugin marketplace upgrade exploratory を実行し、続けて codex plugin remove exploratory@exploratory と codex plugin add exploratory@exploratory を実行します | codex plugin remove exploratory@exploratory |

Desktop の MCP は、Exploratory Desktop を終了すると止まります。プラグインを削除しても、Server の MCP の接続には影響しません。

<a id="trouble"></a>

## うまくいかないとき

> [トラブルシューティング](../troubleshooting_ja.md) を参照してください。

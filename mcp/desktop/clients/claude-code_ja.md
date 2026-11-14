# Claude Code（Desktop）

Claude Code から Exploratory Desktop の MCP をつなぎます。

<a id="install"></a>

## 手作業でインストールする

Exploratory Desktop で「AI クライアントと接続」のカードを使う方法は、概要の「つなぐ手順」にあります。ここでは、手でインストールする方法と、更新・削除を説明します。

> 概要の手順: [Desktop の MCP をつなぐ](../desktop_ja.md#steps)

「AI クライアントと接続」のカードを使わないときの手順です。このプラグインは、公式のプラグイン一覧にはありません。リポジトリ exploratory-io/exploratory をマーケットプレイスとして足してから、プラグイン exploratory を入れます。コマンドは、ご自身でターミナルに打ってください。AI クライアントに実行させるのは避けてください。権限の設定によっては止められます。

**Claude Code**

```sh
claude plugin marketplace add exploratory-io/exploratory
claude plugin install exploratory@exploratory
```

Claude Code で /plugin を開き、マーケットプレイス exploratory-io/exploratory を足して、exploratory を選んでも入れられます。

Claude アプリでは、設定 \> プラグインを開き、追加（Add marketplace）\> リポジトリから を選んで、exploratory-io/exploratory を入力し、exploratory を入れます。ターミナルで入れたプラグインも、そこに「ローカルにインストール済み」と表示されます。ローカルの MCP は、Cowork（このコンピューター上で動かしているとき）と Code タブで使えます。通常のチャットでは使えません。

<a id="update"></a>

## 更新と削除

| 更新 | 削除 |
| --- | --- |
| claude plugin marketplace update exploratory を実行し、続けて claude plugin update exploratory@exploratory を実行して、Claude Code を起動し直します | claude plugin uninstall exploratory@exploratory |

Desktop の MCP は、Exploratory Desktop を終了すると止まります。プラグインを削除しても、Server の MCP の接続には影響しません。

<a id="trouble"></a>

## うまくいかないとき

> [トラブルシューティング](../troubleshooting_ja.md) を参照してください。

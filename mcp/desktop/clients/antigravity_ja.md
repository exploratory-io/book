# Antigravity（Desktop）

Antigravity から Exploratory Desktop の MCP をつなぎます。

<a id="install"></a>

## 手作業でインストールする

Exploratory Desktop で「Exploratory Desktop プラグインのインストール」のカードを使う方法は、概要の「つなぐ手順」にあります。ここでは、手でインストールする方法と、更新・削除を説明します。

> 概要の手順: [Desktop の MCP をつなぐ](../desktop_ja.md#steps)

「Exploratory Desktop プラグインのインストール」のカードを使わないときの手順です。このプラグインは、公式のプラグイン一覧にはありません。リポジトリ exploratory-io/exploratory をマーケットプレイスとして足してから、プラグイン exploratory を入れます。コマンドは、ご自身でターミナルに打ってください。AI クライアントに実行させるのは避けてください。権限の設定によっては止められます。

**Antigravity**

```sh
git clone https://github.com/exploratory-io/exploratory
agy plugin install ./exploratory/plugins/exploratory-desktop
```

Git が必要です。プラグインは、Antigravity のアプリの Customizations \> Installed に表示されます。

<a id="update"></a>

## 更新と削除

| 更新 | 削除 |
| --- | --- |
| クローンしたフォルダで git pull を実行し、もう一度 agy plugin install を実行します | Antigravity のプラグインの設定で、プラグインを削除します |

Desktop の MCP は、Exploratory Desktop を終了すると止まります。プラグインを削除しても、Server の MCP の接続には影響しません。

<a id="trouble"></a>

## うまくいかないとき

> [トラブルシューティング](../troubleshooting_ja.md) を参照してください。

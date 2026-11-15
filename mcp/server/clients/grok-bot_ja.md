# Grok Bot につなぐ

Grok Bot のチャットで、Exploratory のサーバーを追加します。Grok Bot は、チャットで MCP サーバーを追加するクライアントです。

<a id="need"></a>

## 必要なもの

- Exploratory のアカウント
- Grok Bot
- API キーとクライアント ID は必要ありません。

<a id="steps"></a>

## 手順

### 1. 追加する

Grok Bot のチャットで、次のように送信します。この方法で追加されるのは MCP サーバーのみで、スキルは含まれません。

```text
次のリモート MCP サーバーを追加して。名前: exploratory-server、URL: https://exploratory.io/mcp
```

![チャットで MCP サーバーの追加を頼む](images/ja/grok-bot-01-add.png)

画像の 1 は、入力した追加の依頼です。

### 2. サインインする

exploratory-server のカードが表示されます。カードから Exploratory にサインインします。カードが「接続済み」になったら、次の手順で確認します。

<!-- image: images/ja/grok-bot-02-card.png (exploratory-server のカード) -->

### 3. 試す

```text
Exploratory にある「Sales Orders」のデータを探して
```

> Sales Orders のデータが URL 付きで表示されていれば、接続できています。

![チャットで確かめる](images/ja/grok-bot-03-try.png)

画像の 1 は、検索結果の「Sales Orders」のリンクです。

スキルは、AI に操作の進め方を教える説明です。MCP の接続設定とは別のものです。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| サインインを求められる | 接続を解除してから、もう一度追加し直します。 |

- [トラブルシューティング](../troubleshooting_ja.md) - MCP Server 全体の、症状ごとの対処です。

<a id="remove"></a>

## 接続を解除する

Grok Bot の接続の一覧から、exploratory-server を削除します。

登録を解除しても、アクセスの許可は残ります。許可も取り消すには、exploratory.io のアカウント設定の「接続中のAIアプリ」から、クライアントを解除します。

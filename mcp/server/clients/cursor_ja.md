# Cursor につなぐ

Cursor のエージェントに Exploratory のサーバーを登録し、ブラウザでサインインします。Grok を含め、Cursor で選んだモデルで使えます。かかる時間は 5 分ほどです。

<a id="need"></a>

## 必要なもの

- Exploratory のアカウント
- Cursor（エージェントは agent か cursor-agent）
- API キーとクライアント ID は必要ありません。

<a id="steps"></a>

## 手順

### 登録する

Exploratory Server が公式のプラグイン一覧に掲載されるまでは、サーバーのみを手動で追加します。スキルは含まれません。~/.cursor/mcp.json（プロジェクト単位の場合は .cursor/mcp.json）に、次の内容を記述します。

**mcp.json**

```text
{
  "mcpServers": {
    "exploratory-server": {
      "type": "http",
      "url": "https://exploratory.io/mcp"
    }
  }
}
```

Cursor のアプリでは、サイドバーの「Customize」を選ぶと、追加した MCP サーバーを確かめられます。

1. 「MCPs」を選びます。
2. exploratory-server の行を確かめます。サインインの前は、「Needs Authentication in Local」と表示されます。
3. 行の右の「Authenticate」で、サインインできます。

![「Customize」の「MCPs」にある exploratory-server の行（英語の画面）](images/en/cursor-01-customize.png)

### サインインする

```sh
agent mcp login exploratory-server
```

ブラウザが開きます。Exploratory にサインインして、アクセスを許可してください。アプリの「Authenticate」を選んでも、同じブラウザの画面が開きます。

1. 「許可する」を選びます。

![ブラウザの許可の画面](images/ja/cursor-02-sign-in.png)

サインインできると、exploratory-server は、「MCPs」の「Connected」の一覧に移ります。

1. 「MCPs」です。
2. 「Connected」の一覧の exploratory-server の行です。

![「Connected」の一覧にある exploratory-server の行（英語の画面）](images/en/cursor-01-connected.png)

### 試す

```text
Exploratory にある「Sales Orders」のデータを探して
```

> Sales Orders のデータが URL 付きで表示されていれば、接続できています。

1. 検索結果の「Sales Orders」のリンクです。

![チャットで確かめる（英語の画面）](images/en/cursor-03-try.png)

スキルは、AI に操作の進め方を教える説明です。MCP の接続設定とは別のものです。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| サインインを求められる | agent mcp login exploratory-server を実行して、もう一度サインインします。 |
| Desktop のプラグインをインストールしたが、Server のツールが表示されない | Desktop のプラグインには、Server は含まれません。上の JSON で、Server を追加します。 |

- [トラブルシューティング](../troubleshooting_ja.md) - MCP Server 全体の、症状ごとの対処です。

<a id="remove"></a>

## 接続を解除する

mcp.json に追加した exploratory-server の部分を削除します。

登録を解除しても、アクセスの許可は残ります。許可も取り消すには、exploratory.io のアカウント設定の「接続中のAIアプリ」から、クライアントを解除します。

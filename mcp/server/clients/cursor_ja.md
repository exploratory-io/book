# Cursor につなぐ

Cursor のエージェントに Exploratory のサーバーを登録し、ブラウザでサインインします。Grok を含め、Cursor で選んだモデルで使えます。

<a id="need"></a>

## 必要なもの

- Exploratory のアカウント
- Cursor（エージェントは agent か cursor-agent）
- API キーとクライアント ID は必要ありません。

<a id="steps"></a>

## 手順

### 1. 登録する

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

Cursor のアプリでは、サイドバーの「Customize」で、追加した MCP サーバーを確かめられます。サーバーごとに、有効と無効を切り替えられます。

<!-- image: images/ja/cursor-01-customize.png (サイドバーの「Customize」にある exploratory-server) -->

### 2. サインインする

```sh
agent mcp login exploratory-server
```

ブラウザが開きます。Exploratory にサインインして、アクセスを許可してください。

<!-- image: images/ja/cursor-02-sign-in.png (ブラウザでのサインインと許可) -->

### 3. 試す

```text
Exploratory にある「Sales Orders」のデータを探して
```

> Sales Orders のデータが URL 付きで表示されていれば、接続できています。

<!-- image: images/ja/cursor-03-try.png (チャットで確かめる) -->

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

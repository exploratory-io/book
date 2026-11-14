# Antigravity につなぐ

Antigravity に Exploratory のサーバーを登録し、ブラウザでサインインします。

<a id="need"></a>

## 必要なもの

- Exploratory のアカウント
- Antigravity
- API キーとクライアント ID は必要ありません。

<a id="steps"></a>

## 手順

### 1. 登録する

サーバーだけを登録するときは、~/.gemini/config/mcp_config.json に、次を書きます。

**mcp_config.json**

```text
{
  "mcpServers": {
    "exploratory-server": {
      "serverUrl": "https://exploratory.io/mcp"
    }
  }
}
```

Server が公式のプラグイン一覧に掲載された場合は、そこからインストールすることもできます。

### 2. サインインする

| 順 | 操作 |
| --- | --- |
| 1 | agy を起動します。 |
| 2 | /plugin を実行します。 |
| 3 | exploratory-server の接続を開きます（Desktop プラグインの exploratory とは別です）。 |
| 4 | Sign in を選びます。 |
| 5 | Exploratory の同意画面で許可します。 |
| 6 | ブラウザに表示された認可コードを、agy に貼り付けます。 |

Antigravity のアプリでは、エージェントの設定の Customizations で、サーバーの横の Authenticate を選びます。

### 3. 試す

```text
Exploratory にある「Sales Orders」のデータを探して
```

> Sales Orders のデータが URL 付きで表示されていれば、接続できています。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| サインインを求められる | 上のサインインの手順を、もう一度行います。 |
| Desktop のプラグインをインストールしたが、Server のツールが表示されない | Desktop のプラグイン exploratory は、Server とは別です。上の設定で、Server を登録します。 |

- [トラブルシューティング](../troubleshooting_ja.md) - MCP Server 全体の、症状ごとの対処です。

<a id="remove"></a>

## 接続を解除する

mcp_config.json に追加した exploratory-server の部分を削除します。

登録を解除しても、アクセスの許可は残ります。許可も取り消すには、exploratory.io のアカウント設定の「接続中のAIアプリ」から、クライアントを解除します。

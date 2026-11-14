# Antigravity につなぐ

Antigravity に Exploratory のサーバーを登録し、ブラウザでサインインします。

<a id="need"></a>

## 必要なもの

- Exploratory のアカウント
- Antigravity
- API キーとクライアント ID は必要ありません。

<a id="steps"></a>

## 手順

### 1. 設定ファイルの場所を調べる

Antigravity のアプリで、サイドバーの「Customizations」を選び、「Installed」を選びます。

「MCP Servers」の見出しにある「Copy Config File Path」を選ぶと、設定ファイル（mcp_config.json）の場所をコピーできます。

<!-- image: images/ja/antigravity-01-customizations.png (「Customizations」の「Installed」にある、「MCP Servers」の「Copy Config File Path」) -->

### 2. サーバーを登録する

mcp_config.json を開き、次の内容を書き足します。リモートのサーバーは、「serverUrl」に URL を書きます。

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

コマンドラインの agy で使うときは、~/.gemini/config/mcp_config.json に、同じ内容を書きます。

### 3. 「Authenticate」を選ぶ

「MCP Servers」で、exploratory-server の横にある「Authenticate」を選びます。

<!-- image: images/ja/antigravity-02-authenticate.png (exploratory-server の横の「Authenticate」) -->

### 4. ブラウザでサインインして許可する

ブラウザが開きます。Exploratory にサインインして、アクセスを許可します。

### 5. 認可コードをコピーする

ブラウザに表示された認可コードをコピーします。

### 6. 認可コードを貼り付けて送る

「Enter authorization code」の欄に認可コードを貼り付けて、「Submit」を選びます。

<!-- image: images/ja/antigravity-03-authorization-code.png (「Enter authorization code」の欄) -->

サーバーは、自動でつなぎ直されます。サインインできたサーバーには、「Sign out」のボタンが表示されます。

agy で使うときは、次の順で行います。

| 順 | 操作 |
| --- | --- |
| 1 | agy を起動します。 |
| 2 | /plugin を実行します。 |
| 3 | exploratory-server の接続を開きます（Desktop プラグインの exploratory とは別です）。 |
| 4 | Sign in を選びます。 |
| 5 | Exploratory の同意画面で許可します。 |
| 6 | ブラウザに表示された認可コードを、agy に貼り付けます。 |

### 7. 試す

新しいチャットで、次のように送信します。

```text
Exploratory にある「Sales Orders」のデータを探して
```

Sales Orders のデータが URL つきで表示されれば、接続できています。

<!-- image: images/ja/antigravity-04-try.png (チャットで確かめる) -->

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| サインインを求められる | 上のサインインの手順を、もう一度行います。 |
| Desktop のプラグインをインストールしたが、Server のツールが表示されない | Desktop のプラグイン exploratory は、Server とは別です。上の設定で、Server を登録します。 |

- [トラブルシューティング](../troubleshooting_ja.md) - MCP Server 全体の、症状ごとの対処です。

<a id="remove"></a>

## 接続を解除する

アプリでは、exploratory-server の横の「More actions」（⋮）を選び、「Delete」を選びます。一時的に止めるだけなら、「Disable」を選びます。mcp_config.json に追加した exploratory-server の部分を削除しても、解除できます。

登録を解除しても、アクセスの許可は残ります。許可も取り消すには、exploratory.io のアカウント設定の「接続中のAIアプリ」から、クライアントを解除します。

# そのほかのクライアントにつなぐ

Streamable HTTP と OAuth に対応した MCP クライアントなら、サーバー URL を登録してつなげます。かかる時間は 5 分ほどです（クライアントによります）。

<a id="need"></a>

## 必要なもの

- Exploratory のアカウント
- Streamable HTTP（HTTP で MCP をやり取りする方式）と、OAuth（ブラウザでサインインして許可する仕組み）に対応した MCP クライアント
- クライアント ID と API キーは必要ありません。クライアントが自分で登録します。

<a id="steps"></a>

## 手順

### 登録する

クライアントの MCP サーバーの設定に、次のサーバー URL を登録します。設定の場所と書き方は、クライアントの説明を参照してください。



```text
https://exploratory.io/mcp
```

### サインインする

クライアントの案内に従って、ブラウザで Exploratory にサインインし、アクセスを許可します。

### 試す

```text
Exploratory にある「Sales Orders」のデータを探して
```

> Sales Orders のデータが URL 付きで表示されていれば、接続できています。

<a id="trouble"></a>

## トラブルシューティング

有効なトークンがない要求には、HTTP 401 が返ります。クライアントの手順で、サインインし直してください。

- [データと権限](../data_ja.md#auth) - 認証の仕組みとメタデータの URL です。

- [トラブルシューティング](../troubleshooting_ja.md) - MCP Server 全体の、症状ごとの対処です。

<a id="remove"></a>

## 接続を解除する

クライアントの設定から、exploratory-server を削除します。

登録を解除しても、アクセスの許可は残ります。許可も取り消すには、exploratory.io のアカウント設定の「接続中のAIアプリ」から、クライアントを解除します。

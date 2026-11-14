# ChatGPT アプリにつなぐ

ChatGPT のデスクトップアプリに、Exploratory のサーバーを「MCP サーバー」として追加します。MCP サーバーとは、AI アプリが外部のサービスのデータや機能を使うための接続先です。

<a id="need"></a>

## 必要なもの

- Exploratory のアカウント
- ChatGPT のデスクトップアプリ

API キーやクライアント ID は要りません。

<a id="steps"></a>

## 手順

### 1. プラグインの設定を開く

ChatGPT のアプリで、設定を開き、「プラグイン」を選びます。画面の上にある「MCP」のタブを選びます。

<!-- image: images/ja/chatgpt-01-settings.png (設定の「プラグイン」で「MCP」のタブを選ぶ) -->

### 2. カスタム MCP の画面を開く

画面の右上にある「追加」を選び、「カスタム MCP に接続する」の画面を開きます。

<!-- image: images/ja/chatgpt-02-add-menu.png (「追加」のメニュー) -->

### 3. 名前と URL を入力する

「名前」に、一覧に表示する名前（例: exploratory-server）を入力します。

「タイプ」は、「ストリーミング可能な HTTP」を選びます。

「URL」に、次の URL を入力します。

```text
https://exploratory.io/mcp
```

「Bearer トークン環境変数」と「ヘッダー」は、空のままにします。入力できたら、「保存する」を選びます。

<!-- image: images/ja/chatgpt-03-add-server.png (名前、タイプ、URL を入力する) -->

<a id="remove"></a>

## 接続を解除する

追加した MCP サーバーを ChatGPT のアプリで削除したあと、exploratory.io の「アカウント設定」を開き、「接続中のAIアプリ」から、接続したアプリを解除します。アプリで削除しただけでは、Exploratory 側のアクセスの許可は残ります。

ほかの症状は、[トラブルシューティング](../troubleshooting_ja.md) を参照してください。

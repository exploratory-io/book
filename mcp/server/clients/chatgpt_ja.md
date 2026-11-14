# ChatGPT アプリにつなぐ（デスクトップ・Web 共通）

ChatGPT に、Exploratory のサーバーを「カスタム MCP サーバー」として追加します。MCP サーバーとは、AI アプリが外部のサービスのデータや機能を使うための接続先です。追加したあと、Exploratory に接続して許可すると、ChatGPT から、Exploratory に公開されたノートやデータを読めるようになります。

ChatGPT のデスクトップアプリでも、Web 版でも、同じ設定ができます。ここでは、英語の画面の文言を「」で引き、括弧で意味を添えます。

<a id="need"></a>

## 必要なもの

- Exploratory のアカウント
- ChatGPT のデスクトップアプリ、または Web 版

API キーやクライアント ID は要りません。

<a id="steps"></a>

## 手順

### 1. プラグインの設定を開く

ChatGPT で設定（「Settings」）を開き、「Plugins」（プラグイン）を選びます。

<!-- image: images/en/chatgpt-01-plugins.png (設定の「Plugins」) -->

### 2. プラグインの一覧を開く

「Browse directory」（ディレクトリを参照）を選びます。「Customize」の「Plugins」の画面が開きます。

<!-- image: images/en/chatgpt-02-plugin-directory.png (「Customize」の「Plugins」の画面と、右上の「Add」) -->

### 3. カスタム MCP サーバーの追加を開く

右上の「Add」（追加）を選び、「Add custom MCP server」（カスタム MCP サーバーを追加）を選びます。

<!-- image: images/en/chatgpt-03-add-menu.png (「Add」のメニュー) -->

### 4. 名前を入力する

「Name」（名前）に、一覧に表示する名前（例: Exploratory）を入力します。

<!-- image: images/en/chatgpt-04-custom-mcp-empty.png (「Add custom MCP server」の画面) -->

### 5. URL を入力する

「Connection」（接続）は、「Server URL」を選んだままにします。URL の欄に、次の URL を入力します。

```text
https://exploratory.io/mcp
```

### 6. 認証を確かめる

「Authentication」（認証）が「OAuth」になっていることを確かめます。変えるところはありません。

### 7. 注意を確かめて、チェックを入れる

「Custom MCP servers introduce risk.」（カスタム MCP サーバーにはリスクがあります）と表示されます。接続先を信頼できることを確かめて、「I understand and want to continue」（理解したうえで続ける）にチェックを入れます。

<!-- image: images/en/chatgpt-05-custom-mcp-filled.png (名前、URL、OAuth、チェックを入力した画面) -->

### 8. 作成する

「Create as a plugin」（プラグインとして作成）を選びます。

### 9. Exploratory に接続する

「Connect Exploratory」（Exploratory に接続）の画面が開きます。「Connect Exploratory」のボタンを選びます。

<!-- image: images/en/chatgpt-06-connect-dialog.png (「Connect Exploratory」の画面) -->

### 10. 許可する

ブラウザで exploratory.io が開きます。サインインしていないときは、先にサインインします。ChatGPT がアクセスを求めている画面で、許可します（日本語の画面では「許可する」、英語の画面では「Allow」）。

<!-- image: images/en/chatgpt-07-sign-in.png (exploratory.io の許可の画面) -->

### 11. 接続されたことを確かめる

ChatGPT に戻ると、「Customize」の左の「Installed」（インストール済み）に「Exploratory」が表示されます。「Exploratory」を開くと、バージョン（「Version」）などの情報と、「Try in chat」（チャットで試す）のボタンが表示されます。

<!-- image: images/en/chatgpt-08-connected.png (「Exploratory」の詳細画面) -->

### 12. 試す

「Try in chat」を選んで、チャットを開きます。次のように送信します。

```text
Exploratory にある「Sales Orders」のデータを探して
```

Sales Orders のデータが URL つきで表示されれば、使えています。

<a id="trouble"></a>

## うまくいかないとき

ほかの症状は、[トラブルシューティング](../troubleshooting_ja.md) を参照してください。

<a id="remove"></a>

## 接続を解除する

ChatGPT のプラグインの一覧で、追加した「Exploratory」を削除します。そのあと、exploratory.io の「アカウント設定」を開き、「接続中のAIアプリ」から、接続したアプリを解除します。ChatGPT で削除しただけでは、Exploratory 側のアクセスの許可は残ります。

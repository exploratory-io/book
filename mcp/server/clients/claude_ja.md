# Claude アプリにつなぐ

Claude のデスクトップアプリに、Exploratory のサーバーを「カスタムコネクタ」として追加します。コネクタとは、Claude が外部のサービスのデータや機能を使うための接続です。追加したあと、ブラウザで Exploratory にサインインして許可すると、Claude のチャットから、Exploratory に公開されたノートやデータを読めるようになります。

<a id="need"></a>

## 必要なもの

- Exploratory のアカウント
- Claude のデスクトップアプリ

API キーやクライアント ID は要りません。

<a id="steps"></a>

## 手順

### 1. 設定を開く

Claude のアプリで、設定を開きます。

### 2. コネクタの画面を開く

設定の左のメニューで、「カスタマイズ」の中にある「コネクタ」を選びます。

<!-- image: images/ja/claude-01-settings.png (設定の左メニューで「コネクタ」を選ぶ) -->

### 3. カスタムコネクタを追加する

コネクタの画面の右上にある「追加」を選び、「カスタムコネクタを追加」を選びます。

<!-- image: images/ja/claude-03-add-menu.png (「追加」のメニュー) -->

「カスタムコネクタを追加」の画面が開きます。「名前」に、一覧に表示する名前（例: Exploratory）を入力します。

「MCP サーバー URL」に、次の URL を入力します。

```text
https://exploratory.io/mcp
```

入力できたら、「続ける」を選びます。

<!-- image: images/ja/claude-04-custom-connector.png (名前と MCP サーバー URL を入力する) -->

### 4. サインインして許可する

ブラウザが開きます。Exploratory にサインインして、アクセスを許可します。

<!-- image: images/ja/claude-05-sign-in.png (サインインと許可) -->

コネクタの一覧に、追加した「Exploratory」が表示され、右側に「接続済み」と出れば、接続できています。

<!-- image: images/ja/claude-02-connectors.png (一覧に「接続済み」と表示される) -->

### 5. 試す

新しいチャットを開いて、次のように送信します。

```text
Exploratory にある「Sales Orders」のデータを探して
```

Sales Orders のデータが URL つきで表示されれば、使えています。

<!-- image: images/ja/claude-06-try.png (チャットで確かめる) -->

<a id="permissions"></a>

## ツールの実行を確認する

追加した「Exploratory」を一覧で開くと、「ツールの権限」の画面が開きます。Exploratory のコネクタが使うツールは、「読み取り専用ツール」にまとまっています。ツールごとに、実行のタイミングを選べます。この設定は、手動モードで Claude がツールを使えるタイミングを決めるものです。自動モードでは、自動チェックがリスクがあると判断した操作はブロックされます。それ以外の操作は、「承認が必要」に設定したツールでも、Claude が確認なしで実行することがあります。

<!-- image: images/ja/claude-07-tool-permissions.png (「ツールの権限」の画面) -->

<a id="trouble"></a>

## うまくいかないとき

| 表示される内容 | 対処 |
| --- | --- |
| 「このURLのコネクタはすでに組織内に存在します」と表示される | 組織（チーム）で、すでにコネクタが追加されています。新しく追加せず、コネクタの一覧にある既存のコネクタを使います。 |
| サインインを求められる | コネクタの一覧で「Exploratory」を開き、もう一度サインインします。 |

ほかの症状は、[トラブルシューティング](../troubleshooting_ja.md) を参照してください。

<a id="remove"></a>

## 接続を解除する

コネクタの一覧で「Exploratory」を開き、右上の「切断する」を選びます。

「切断する」を選んでも、Exploratory 側のアクセスの許可は残ります。許可も取り消すには、exploratory.io の「アカウント設定」を開き、「接続中のAIアプリ」から Claude を解除します。

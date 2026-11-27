---
title: "Cursor につなぐ"
---

接続すると、AI から Exploratory に公開されたノートやデータを読めるようになります。ページ（HTML ページ）も作れます。Cursor のエージェントに Exploratory のサーバーを登録し、ブラウザでサインインします。Grok を含め、Cursor で選んだモデルで使えます。
かかる時間は 5 分ほどです。Exploratory のアカウントと、Cursor を用意してください。

<a id="need"></a>

## 必要なもの

- Exploratory のアカウント
- Cursor（コマンドラインのエージェントは `agent` か `cursor-agent`）
- API キーとクライアント ID は必要ありません。

<a id="steps"></a>

## 手順

### mcp.json に登録する

お使いのアプリの公式一覧に Exploratory Server が掲載されている場合は、その手順で追加します。掲載されていない場合は、次の手順で、サーバーのみを手動で追加します。スキルは含まれません。`exploratory@exploratory` は Desktop 用です。

1. \~/.cursor/mcp.json（プロジェクト単位の場合は .cursor/mcp.json）を開きます。
2. 次の `exploratory-server` の項目を追加します。ファイルにすでに `mcpServers` がある場合は、その中に `exploratory-server` の項目だけを追加し、ほかのサーバーの設定は残します。以下は、新しいファイルを作る場合の全体の例です。

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

### 「MCPs」を開く

Cursor のアプリで、追加した MCP サーバーを確かめます。

1. サイドバーの「Customize」を選びます。

続けて、「Customize」の画面で操作します。

1. 「MCPs」を選びます。
2. exploratory-server の行を確かめます。サインインの前は、「Needs Authentication in Local」と表示されます。
3. 行の右の「Authenticate」を選びます。

![「Customize」の「MCPs」にある exploratory-server の行（英語の画面）](images/en/cursor-01-customize.png)

アプリの代わりに、ターミナルでサインインを始めることもできます。

```sh
agent mcp login exploratory-server
```

### exploratory.io で許可する

ブラウザが開きます。サインインしていないときは、Exploratory にサインインします。アプリの「Authenticate」を選んでも、ターミナルのコマンドでも、同じブラウザの画面が開きます。

1. 「許可する」を選びます。

![ブラウザの許可の画面](images/ja/cursor-02-sign-in.png)

### つながったことを確かめる

サインインできると、exploratory-server は、「MCPs」の「Connected」の一覧に移ります。

1. 「MCPs」を選びます。
2. 「Connected」の一覧の exploratory-server の行を確かめます。

![「Connected」の一覧にある exploratory-server の行（英語の画面）](images/ja/cursor-01-connected.png)

続けて、新しいチャットで、次のように送信します。

```text
Exploratory にある「Sales Orders」のデータを探して
```

Sales Orders は例です。閲覧できるデータの名前に置き換えてください。結果が 0 件でも、認証や接続に失敗したとは限りません。見分け方は、[自分のコンテンツが出ない](/ja/mcp/server/troubleshooting#zero)を参照してください。

送信したあと、結果を確かめます。

1. 検索結果の「Sales Orders」のリンクを確かめます。

![チャットで確かめる（英語の画面）](images/ja/cursor-03-try.png)

Sales Orders のデータが URL 付きで表示されていれば、接続できています。

スキルは、AI に操作の進め方を教える説明です。MCP の接続設定とは別のものです。

<a id="apikey"></a>

## API キーで接続する

ブラウザを開けない環境では、サインインの代わりに API キーを使います。キーは、アカウント設定 \> API キーで作り、Cursor を起動する前に、EXPLORATORY_API_KEY という環境変数に入れます。秘密情報を管理する仕組みで設定し、シェルの設定ファイルは使わないでください。そのうえで、mcp.json から参照します。

```text
{
  "mcpServers": {
    "exploratory-server": {
      "type": "http",
      "url": "https://exploratory.io/mcp",
      "headers": {
        "Authorization": "Bearer ${env:EXPLORATORY_API_KEY}"
      }
    }
  }
}
```

キーを mcp.json にそのまま書くと、ファイルに残ります。上のサインインか、この方法か、どちらか一方だけを使います。キーで読めるものは、[API キーで接続する](/ja/mcp/server/auth#apikey)を参照してください。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| サインインを求められる | agent mcp login exploratory-server を実行して、もう一度サインインします。 |
| Desktop のプラグインをインストールしたが、Server の道具が表示されない | Desktop のプラグインには、Server は含まれません。上の JSON で、Server を追加します。 |

- [トラブルシューティング](/ja/mcp/server/troubleshooting) - Server の MCP 全体の、症状ごとの対処です。

<a id="remove"></a>

## 接続を解除する

mcp.json に追加した exploratory-server の部分を削除します。

登録を解除しても、アクセスの許可は残ります。許可も取り消すには、exploratory.io のアカウント設定の「接続中のAIアプリ」から、クライアントを解除します。

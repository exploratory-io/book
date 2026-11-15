# Codex につなぐ

Codex に Exploratory のサーバーを登録し、ブラウザでサインインします。かかる時間は 3 分ほどです。

<a id="need"></a>

## 必要なもの

- Exploratory のアカウント
- Codex
- API キーとクライアント ID は必要ありません。

<a id="steps"></a>

## 手順

### 登録する

サーバーのみを登録します。スキルは含まれません。次のいずれかの方法で登録します。

#### 設定ファイルに書く

**設定ファイルに書く**

```text
[mcp_servers.exploratory-server]
url = "https://exploratory.io/mcp"
```

~/.codex/config.toml に追加します。

#### コマンドで追加する

**コマンドで追加する**

```sh
codex mcp add exploratory-server --url https://exploratory.io/mcp
```

Codex の公式のプラグイン一覧に Exploratory Server が掲載された場合は、そこからインストールすることもできます。インストール方法は 1 つだけにしてください。Exploratory の GitHub マーケットプレイスの exploratory@exploratory は Desktop 用で、Server は含まれません。

### サインインする

```sh
codex mcp login exploratory-server
```

ブラウザが開きます。Exploratory にサインインして、アクセスを許可してください。

### 試す

```text
Exploratory にある「Sales Orders」のデータを探して
```

> Sales Orders のデータが URL 付きで表示されていれば、接続できています。

スキルは、AI に操作の進め方を教える説明です。MCP の接続設定とは別のものです。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| サインインを求められる | codex mcp login exploratory-server を実行して、もう一度サインインします。 |
| Server のツールが出ない | exploratory@exploratory は Desktop 用です。上の手順で、Server を登録します。 |

- [トラブルシューティング](../troubleshooting_ja.md) - MCP Server 全体の、症状ごとの対処です。

<a id="remove"></a>

## 接続を解除する

~/.codex/config.toml に追加した \[mcp_servers.exploratory-server\] の部分を削除します。

登録を解除しても、アクセスの許可は残ります。許可も取り消すには、exploratory.io のアカウント設定の「接続中のAIアプリ」から、クライアントを解除します。

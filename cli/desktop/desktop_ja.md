# Exploratory CLI: Desktop

expl は、このコンピューターで起動している Exploratory Desktop を、ターミナルから操作するコマンドです。

<a id="target"></a>

## 対象

> このページのコマンドは、すべて expl で始まり、このコンピューターで起動している Exploratory Desktop を対象にします。サインインの操作はありません。Desktop を起動してサインインし、システム設定 > MCP / CLI で CLI を有効にして保存していれば使えます。
>
> exploratory.io のコンテンツを読むなら [Server のコマンド](../server/server_ja.md)。AI アプリからつなぐなら [MCP Server](../../mcp/server/server_ja.md)。

<a id="start"></a>

## はじめる

### 0. CLI を有効にする

Desktop のシステム設定 > MCP / CLI で CLI を有効にして保存します。手順は[最初に CLI を有効にする](install_ja.md#enable)を参照してください。

### 1. バージョンを確認する

```sh
expl --version
```

expl は Exploratory Desktop に同梱されています。インストールされていない場合は、インストールのページを参照してください。

### 2. Desktop との接続を確認する

```sh
expl status
```

Desktop のバージョンと、サインイン中のユーザーを表示します。Desktop が起動していないと、終了コード 3 で終了します。

### 3. プロジェクトを表示する

```sh
expl project list
```

- [はじめる](quickstart_ja.md) - 最初のコマンドを順に実行します。

<a id="commands"></a>

## Desktop のコマンド（expl）

よく使うコマンドです。生成されたコマンドの引数は、expl \<コマンド\> --help で確認できます。project use など組み込みのコマンドは、この表の書き方を見てください。

| コマンド | できること |
| --- | --- |
| expl status | Desktop のバージョンとサインイン中のユーザー |
| expl tools list | 使えるコマンドの一覧（読むだけか、リスク） |
| expl tools describe \<command\> | 引数、型、必須か、選べる値（2 語のコマンドは引用符で囲みます） |
| expl project list | プロジェクトの一覧 |
| expl project use \<id\|name\> | 以後のコマンドの対象を決める |
| expl project open \<id\> | プロジェクトを開く |

- [よく使うコマンド](commands_ja.md) - データ、チャート、ノート、ダッシュボードのコマンドを含みます。

<a id="difference"></a>

## Server との違い

Server のコマンド（expl server）は、パブリッシュされたコンテンツを読むためのものです。Desktop のコマンドには、読むだけでなく、作る、変える、パブリッシュするものがあります。

取り消しにくい操作は、実行の前に確認します。

- [確認と時間のかかる操作](guides/confirmation_ja.md) - 確認のしかたと、待たずに済ませる方法です。

<a id="records"></a>

## 送信・記録されるもの

コマンドは、コンピューターの中の通信で Desktop に送られます。Desktop は道具の呼び出しごとの記録（道具の名前、引数の名前（値は含まない）、結果、処理時間）をコンピューターの中に保存し、90 日で削除します。

また、サインインしていて AI 機能がオンのときは、Desktop MCP と同じく、道具の呼び出しごとに利用記録を 1 件、サインインしている exploratory.io のサーバーへ送ります（ローカルのデータカタログの道具では送りません）。記録には、道具の名前と引数（入力した式や値が入ることがあります）、成功したかどうかとエラーの種類・メッセージ、結果の大きさ（中身は含みません）、処理時間、Desktop のバージョン、クライアントの名前とバージョン、セッションとアイテムの ID が含まれます。

expl 自体は、利用状況の計測を送りません。

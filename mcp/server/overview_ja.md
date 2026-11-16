# 概要と接続先 URL

AI クライアントから、Exploratory にパブリッシュされたノートやデータを読み取ります。AI クライアントとは、Claude Code のように、AI に作業を依頼するアプリケーションです。MCP（Model Context Protocol）は、AI アプリが外部のサービスに接続して、その機能を使用するための共通の規格です。

<a id="readonly"></a>

## 読み取り専用です

> **読み取り専用**
>
> この MCP サーバーは、コンテンツの作成・編集・公開・削除ができません。ただし dataframe_export は、15 分間有効なダウンロードリンクを作ります。

> **Server のみ**
>
> この節は Exploratory Server のみを対象にします。あなたのコンピューターの Exploratory Desktop でプロジェクトを作り、編集するときは、[Desktop の MCP](../desktop/desktop_ja.md) を使います。

ターミナルやスクリプトから使うなら [Exploratory CLI](../../cli/server/server_ja.md)。

<a id="clients"></a>

## AI ツールから追加する

お使いのアプリを、[AI ツールから追加する](clients/apps_ja.md) のページで選びます。Claude アプリ、ChatGPT アプリ、Antigravity、Grok Bot、Claude Code、Codex、Cursor、そのほかのアプリごとに、手順があります。

<a id="url"></a>

## サーバー URL

どのクライアントでも、つなぐ先は同じです。



```text
https://exploratory.io/mcp
```

<a id="steps"></a>

## つなぐ手順

### 1. 登録する

[AI ツールから追加する](clients/apps_ja.md) のページに、アプリごとの登録手順があります。サーバー URL は、すべてのアプリで共通です。

### 2. サインインして許可する

サーバーを登録したら、お使いのアプリの手順に従って認証を始めます。ログインのコマンドや Authenticate のボタンが必要なアプリもあります。ブラウザが開いたら、Exploratory にサインインして、アクセスを許可してください。この方法では API キーは不要です。クライアントがブラウザを開けないときは、代わりに API キーで接続します（[「API キーで接続する」](auth_ja.md)を参照）。

### 3. 試す

```text
接続した Exploratory Server で、閲覧できるコンテンツを最大 3 件、URL 付きで一覧して。見つからなければ、その旨を教えて。
```

> コンテンツが URL 付きで表示されていれば、接続できています。結果が 0 件でも、認証や接続に失敗したとは限りません。エラーが表示されたときは、[制限とエラー](limits_ja.md)で、そのメッセージの対処を確認してください。

ターミナルから同じ操作をするときは、[Exploratory CLI](../../cli/server/server_ja.md) を参照してください。

<a id="apikey"></a>

## API キーで接続する

クライアントがブラウザを開けないとき、またはジョブが自動で動くときは、API キーで接続します。手順、キーの形式、エラーメッセージ、通信と認証の詳細は、[認証と API キー](auth_ja.md)にあります。

<a id="examples"></a>

## AI への依頼例

```text
Exploratory の「Sales Orders」データにはどんな列がある？ 売上が一番大きい地域の上位 5 つも教えて
```

- [AI への依頼例](examples_ja.md) - ノート、データ、チャートの例です。

<a id="tools"></a>

## 使えるツール

ツールは、AI が呼び出す操作です。提供しているのは、読み取り専用のものだけです。

| 種類 | ツール | 読み取りだけ／作成・変更・削除 | 用途 |
| --- | --- | --- | --- |
| 探す・読む | search | 読み取りだけ | 公開されたコンテンツを探し、一覧します。 |
| 探す・読む | fetch | 読み取りだけ | ノート、ダッシュボード、スライドを Markdown で読みます。 |
| チャートとアナリティクス | chart_get_data | 読み取りだけ | チャートの数値を取得します。 |
| チャートとアナリティクス | chart_get_image | 読み取りだけ | チャートを画像として取得します。 |
| チャートとアナリティクス | chart_query | 読み取りだけ | ノート、ダッシュボード、スライド内のチャートのデータを、サーバーで絞り込み、集計します。 |
| チャートとアナリティクス | analytics_get_result | 読み取りだけ | 係数や p 値など、アナリティクスの結果を取得します。 |
| データ | dataframe_get_schema | 読み取りだけ | 列の名前、型、承認された意味を調べます。 |
| データ | dataframe_get_wrangling | 読み取りだけ | データがどう加工されて作られたかを、ステップごとに見ます。 |
| データ | dataframe_preview | 読み取りだけ | 行を表示します。 |
| データ | query_dataset | 読み取りだけ | サーバーで絞り込み、集計します。 |
| データ | dataframe_export | 読み取りだけ | 結果を CSV か Parquet で保存します。 |

exploratory.io では、これらのツールが使えます。オンプレミスのサーバーでは、使えるツールはサーバーの設定によって変わります。query_dataset、chart_query、dataframe_export は、管理者が有効にしたときだけ使えます。設定によっては、ほかのツールも増えます。たとえば desktop_mcp_setup_guide は、AI クライアントを Exploratory Desktop につなぐ手順を返します。お使いのサーバーにあるツールは、expl server tools list で確認できます。

- [ツール](tools_ja.md) - 入力と使い方を確認します。

<a id="scope"></a>

## データと権限

- サインインした人として動きます。その人が exploratory.io で閲覧できる範囲を超えません。
- 公開した人は、コンテンツごとに MCP からのアクセスを止められます。データの行を非公開にすることもできます。
- アカウント設定の「接続中のAIアプリ」で接続を、「API キー」で API キーを、確認・削除できます。

- [データと権限](data_ja.md) - Exploratory が記録するものも、ここに書いています。
- [制限とエラー](limits_ja.md) - 回数の上限とエラーの対処です。

<a id="cannot"></a>

## できないこと

- コンテンツの作成、編集、公開、削除
- 公開されたときと違うパラメータの値での、チャートやアナリティクスの再計算
- Exploratory Server に公開されていないものの読み取り。Exploratory Desktop の中だけにあるプロジェクトなどです。これらには、別の [Desktop の MCP](../desktop/desktop_ja.md) を使います。

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

## アプリから追加する

お使いのアプリを、[アプリから追加する](clients/apps_ja.md) のページで選びます。Claude アプリ、ChatGPT アプリ、Antigravity、Grok Bot、Claude Code、Codex、Cursor、そのほかのアプリごとに、手順があります。

<a id="url"></a>

## サーバー URL

どのクライアントでも、つなぐ先は同じです。



```text
https://exploratory.io/mcp
```

<a id="spec"></a>

## 通信と認証

| 項目 | 値 |
| --- | --- |
| サーバー URL | https://exploratory.io/mcp |
| 通信方式 | Streamable HTTP（HTTP で MCP をやり取りする方式）、ステートレス |
| 認証 | OAuth 2.1（PKCE）: 初回にブラウザでサインインします。または、Authorization: Bearer exp_pat_... で送る API キー |
| スコープ | content:read（API キーも同じスコープです） |

人がブラウザで使うときは、ブラウザでのサインインを使います。ブラウザがないとき、または自動で実行するときは、API キーを使います。

すべての呼び出しに、Authorization: Bearer \<アクセストークンまたは API キー\> が必要です。ブラウザのセッションの Cookie では、MCP の呼び出しを認証できません。同意画面、メタデータの URL、失敗した呼び出しの詳細は、[データと権限](data_ja.md#auth) にあります。

<a id="steps"></a>

## つなぐ手順

### 1. 登録する

[アプリから追加する](clients/apps_ja.md) のページに、アプリごとの登録手順があります。サーバー URL は、すべてのアプリで共通です。

### 2. サインインして許可する

サーバーを登録したら、お使いのアプリの手順に従って認証を始めます。ログインのコマンドや Authenticate のボタンが必要なアプリもあります。ブラウザが開いたら、Exploratory にサインインして、アクセスを許可してください。この方法では API キーは不要です。クライアントがブラウザを開けないときは、代わりに API キーで接続します（[「API キーで接続する」](#apikey)を参照）。

### 3. 試す

```text
接続した Exploratory Server で、閲覧できるコンテンツを最大 3 件、URL 付きで一覧して。見つからなければ、その旨を教えて。
```

> コンテンツが URL 付きで表示されていれば、接続できています。結果が 0 件でも、認証や接続に失敗したとは限りません。エラーが表示されたときは、[制限とエラー](limits_ja.md)で、そのメッセージの対処を確認してください。

ターミナルから同じ操作をするときは、[Exploratory CLI](../../cli/server/server_ja.md) を参照してください。

<a id="apikey"></a>

## API キーで接続する

ブラウザを開けない環境があります。サーバー、定期的に動くジョブ、固定のヘッダーしか設定できないクライアントなどです。その場合は、API キーで接続します。アカウント設定 \> API キーで作成して（[CLI のページの「API キー」](../../cli/server/token_ja.md)を参照）、サーバー URL への呼び出しごとに、Authorization ヘッダーで送ります。

```text
Authorization: Bearer exp_pat_...
```

exp_pat_... は、作成したキーに置き換えます。

キーは環境変数に入れて、クライアントにそこから読ませます。キーは秘密情報の管理の仕組みから EXPLORATORY_API_KEY に設定します。シェルの設定ファイルではなく、OS の資格情報の保管庫や CI のシークレットなどを使います。キーそのものをコマンドラインや設定ファイルに書かないでください。シェルの履歴やファイルに残ります。以下は、この環境変数が設定済みであることを前提にします。たとえば、固定のヘッダーを設定できる Claude Code では、.mcp.json から環境変数を参照します。

```json
{
  "mcpServers": {
    "exploratory-server": {
      "type": "http",
      "url": "https://exploratory.io/mcp",
      "headers": {
        "Authorization": "Bearer ${EXPLORATORY_API_KEY}"
      }
    }
  }
}
```

ほかのクライアントは、[Codex](clients/codex_ja.md#apikey)、[Cursor](clients/cursor_ja.md#apikey)、[その他のクライアント](clients/other_ja.md#apikey)の手順を参照してください。

- キーで読めるのは、ブラウザでのサインインと同じ、あなたが見られる内容です。読み取りのみ（content:read）です。作成できるのは Author だけです。
- キーが失敗したときは、サーバーが理由つきの 401 または 403 を返します。代わりにブラウザでのサインイン（OAuth）に切り替わることはありません。キーを直してください。
- ブラウザでのサインインが使えるときは、そちらを使います。キーは、同意の画面、SSO、MFA を通らないので、パスワードと同じように扱ってください。

| HTTP ステータス | メッセージ | 対処 |
| --- | --- | --- |
| 401 | The API key is invalid or expired. Create a new one in Account Settings \> API Keys. | 新しいキーを作って、ヘッダーのキーを入れ替えます。キーが取り消されたとき、持ち主が API キーを使えなくなったときも、同じメッセージです。 |
| 403 | API keys are disabled by your administrator. | 管理者が API キーをオフにしています。管理者に確認します。 |
| 403 | This IP address is not allowed for API keys. | 管理者が、API キーを使える IP アドレスを限定しています。許可されたアドレスから接続します。 |
| 429 | Too many failed API key attempts. Try again later. | 同じアドレスから（IPv4 は同じアドレス、IPv6 は同じ /64 の範囲で数えます）、15 分のうちに 30 回を超えて、拒否されたキーが送られました。キーを直して、しばらくしてからやり直します。 |

オンプレミス環境や Hosted 環境では、管理者が、API キーをオフにしたり、使える IP アドレスを限定したりできます。上の 403 の 2 つのメッセージが、その場合です。「データと権限」の、公開した人の設定は、キーにも同じように効きます。

- [API キー](../../cli/server/token_ja.md) - キーの作成、有効期限、取り消し、安全な扱い方です。

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

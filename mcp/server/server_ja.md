# Exploratory MCP Server

AI クライアントから、Exploratory にパブリッシュされたノートやデータを読み取ります。AI クライアントとは、Claude Code のように、AI に作業を依頼するアプリケーションです。MCP（Model Context Protocol）は、AI アプリが外部のサービスに接続して、その機能を使用するための共通の規格です。

<a id="readonly"></a>

## 読み取り専用です

> **読み取り専用**
>
> この MCP サーバーは、コンテンツの作成・編集・公開・削除ができません。ただし dataframe_export は、15 分間有効なダウンロードリンクを作ります。

> **Server のみ**
>
> このページは Exploratory Server のみを対象にします。Exploratory Desktop の MCP は、現在のバージョンではサポート対象外です。

ターミナルやスクリプトから使うなら [Exploratory CLI](../../cli/server/server_ja.md)。

<a id="clients"></a>

## クライアントを選ぶ

- [Claude Code](clients/claude-code_ja.md) - 登録手順を参照する
- [Codex](clients/codex_ja.md) - 登録手順を参照する
- [Cursor](clients/cursor_ja.md) - 登録手順を参照する
- [Grok Bot](clients/grok-bot_ja.md) - 登録手順を参照する
- [Antigravity](clients/antigravity_ja.md) - 登録手順を参照する
- [そのほか](clients/other_ja.md) - 登録手順を参照する

<a id="url"></a>

## サーバー URL

どのクライアントでも、つなぐ先は同じです。



```text
https://exploratory.io/mcp
```

<a id="steps"></a>

## つなぐ手順

### 1. 登録する

お使いのクライアントのページに、登録の手順があります。サーバー URL は、すべてのクライアントで共通です。

### 2. サインインして許可する

最初の呼び出しで、クライアントがブラウザのウィンドウを開きます。Exploratory にサインインして、アクセスを許可してください。この方法では API キーは不要です。クライアントがブラウザを開けないときは、代わりに API キーで接続します（「API キーで接続する」を参照）。

### 3. 試す

```text
Exploratory にある「Sales Orders」のデータを探して
```

> Sales Orders のデータが URL 付きで表示されていれば、接続できています。

**CLI で同じ操作を実行した結果**

```sh
expl server search "Sales Orders" --scope all --type data --limit 3 --json
```

--json を付けると、search ツールが返した結果をそのまま出力します。長い出力は省略しています。

**実行結果**

```text
{
  "results": [
    {
      "id": "llS6nQK3aH",
      "title": "Sales Orders",
      "url": "https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH",
      "type": "data",
      "description": "One row is one order line item (an order can have several lines, line_no 1-3). Period: order_date from 2025-01-01 to 2026-10-31. Columns: order_id (order ID), line_no (line number within the order), order_date, ship_date (shipping date; can be later than the order date, up to 2026-11-04), custome...",
      "author": "Takato Shiroto",
      "team": null,
      "updated_at": "2026-11-12T09:26:51.086Z",
      "refreshed_at": "2026-11-12T08:12:13.528Z",
      "tags": [
        "sales",
        "orders",
        "english"
      ],
      "publication_version": "2026-11-12T09:26:51.086Z",
      "data_as_of": "2026-11-12T08:12:13.528Z",
      "columns": [
        {
          "name": "order_id",
          "type": "character",
          "description": "",
          "missing_count": 0
        },
        {
          "name": "line_no",
          "type": "numeric",
          "description": "",
          "missing_count": 0
        }
… (trimmed)
      ],
      "column_count": 14,
      "row_count": 23131
    }
  ],
  "has_more": false,
  "next_offset": null
}
```

<a id="apikey"></a>

## API キーで接続する

ブラウザを開けない環境があります。サーバー、定期的に動くジョブ、固定のヘッダーしか設定できないクライアントなどです。その場合は、API キーで接続します。アカウント設定 \> API キーで作成して（CLI のページの「API キー」を参照）、サーバー URL への呼び出しごとに、Authorization ヘッダーで送ります。

```text
Authorization: Bearer exp_pat_...
```

exp_pat_... は、作成したキーに置き換えます。

固定のヘッダーを設定できるクライアントの例として、Claude Code では、次のように登録します。

```sh
claude mcp add --transport http exploratory-server https://exploratory.io/mcp --header "Authorization: Bearer exp_pat_..."
```

ここにキーを書くと、シェルの履歴に残ります。クライアントが、シークレットの保管場所や環境変数からヘッダーを読めるときは、そちらを使います。

- キーで読めるのは、ブラウザでのサインインと同じ、あなたが見られる内容です。読み取りのみ（content:read）です。作成できるのは Author だけです。
- キーが失敗したときは、サーバーが理由つきの 401 または 403 を返します。代わりにブラウザでのサインイン（OAuth）に切り替わることはありません。キーを直してください。
- ブラウザでのサインインが使えるときは、そちらを使います。キーは、同意の画面、SSO、MFA を通らないので、パスワードと同じように扱ってください。

| HTTP ステータス | メッセージ | 対処 |
| --- | --- | --- |
| 401 | The API key is invalid or expired. Create a new one in Account Settings \> API Keys. | 新しいキーを作って、ヘッダーのキーを入れ替えます。キーが取り消されたとき、持ち主が API キーを使えなくなったときも、同じメッセージです。 |
| 403 | API keys are disabled by your administrator. | 管理者が API キーをオフにしています。管理者に確認します。 |
| 403 | This IP address is not allowed for API keys. | 管理者が、API キーを使える IP アドレスを限定しています。許可されたアドレスから接続します。 |
| 429 | Too many failed API key attempts. Try again later. | 同じアドレスから（IPv4 は同じアドレス、IPv6 は同じ /64 の範囲で数えます）、15 分のうちに 30 回を超えて、拒否されたキーが送られました。キーを直して、しばらくしてからやり直します。 |

オンプレミス版や Hosted 版では、管理者が、API キーをオフにしたり、使える IP アドレスを限定したりできます。上の 403 の 2 つのメッセージが、その場合です。「データと権限」の、公開した人の設定は、キーにも同じように効きます。

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

| 種類 | ツール | 用途 |
| --- | --- | --- |
| 探す・読む | search | 公開されたコンテンツを探し、一覧します。 |
| 探す・読む | fetch | ノート、ダッシュボード、スライドを Markdown で読みます。 |
| チャートとアナリティクス | chart_get_data | チャートの数値を取得します。 |
| チャートとアナリティクス | chart_get_image | チャートを画像として取得します。 |
| チャートとアナリティクス | chart_query | チャートのデータを、サーバーで絞り込み、集計します。 |
| チャートとアナリティクス | analytics_get_result | 係数や p 値など、アナリティクスの結果を取得します。 |
| データ | dataframe_get_schema | 列の名前、型、承認された意味を調べます。 |
| データ | dataframe_preview | 行を表示します。 |
| データ | query_dataset | サーバーで絞り込み、集計します。 |
| データ | dataframe_export | 結果を CSV か Parquet で保存します。 |

これは、どのサーバーにもあるツールです。サーバーの設定によっては、ツールが増えます。たとえば desktop_mcp_setup_guide は、AI クライアントを Exploratory Desktop につなぐ手順を返します。お使いのサーバーにあるツールは、expl server tools list で確認できます。

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
- Exploratory Server に公開されていないものの読み取り。Exploratory Desktop の中だけにあるプロジェクトなどです。これらには、別の Desktop MCP を使います。

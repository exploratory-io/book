---
title: "認証と API キー"
---

サーバーが呼び出しをどう認証するかの説明です。ブラウザでのサインインと、ブラウザがない環境で使う API キーを扱います。

<a id="apikey"></a>

## API キーで接続する

ブラウザを開けない環境があります。サーバー、定期的に動くジョブ、固定のヘッダーしか設定できないクライアントなどです。その場合は、API キーで接続します。アカウント設定 \> API キーで作成して（[CLI のページの「API キー」](/ja/cli/server/token)を参照）、サーバー URL への呼び出しごとに、Authorization ヘッダーで送ります。

```text
Authorization: Bearer exp_pat_...
```

exp_pat_... は、作成したキーに置き換えます。

キーは環境変数に入れて、クライアントにそこから読ませます。EXPLORATORY_API_KEY は、秘密情報を管理する仕組みで設定します。シェルの設定ファイルではなく、OS の資格情報の保管庫や CI のシークレットなどを使います。キーそのものをコマンドラインや設定ファイルに書かないでください。シェルの履歴やファイルに残ります。以下は、この環境変数が設定済みであることを前提にします。たとえば、固定のヘッダーを設定できる Claude Code では、.mcp.json から環境変数を参照します。

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

ほかのクライアントは、[Codex](/ja/mcp/server/clients/codex#apikey)、[Cursor](/ja/mcp/server/clients/cursor#apikey)、[そのほかのアプリ](/ja/mcp/server/clients/other#apikey)の手順を参照してください。

- キーで読めるのは、ブラウザでのサインインと同じ、あなたが見られる内容です。読み取りのみ（content:read）です。API キーでもページを読むこと（get_page_guide・page_list・page_get）はできますが、ページの作成・更新・削除はできません。キーを作成できるのは Author だけです。
- キーが失敗したときは、サーバーが理由つきの 401 または 403 を返します。代わりにブラウザでのサインイン（OAuth）に切り替わることはありません。キーを直してください。
- ブラウザでのサインインが使えるときは、そちらを使います。キーは、同意の画面、SSO、MFA を通らないので、パスワードと同じように扱ってください。

| HTTP ステータス | メッセージ | 対処 |
| --- | --- | --- |
| 401 | The API key is invalid or expired. Create a new one in Account Settings \> API Keys. | 新しいキーを作って、ヘッダーのキーを入れ替えます。キーが取り消されたとき、持ち主が API キーを使えなくなったときも、同じメッセージです。 |
| 403 | API keys are disabled by your administrator. | 管理者が API キーをオフにしています。管理者に確認します。 |
| 403 | This IP address is not allowed for API keys. | 管理者が、API キーを使える IP アドレスを限定しています。許可されたアドレスから接続します。 |
| 429 | Too many failed API key attempts. Try again later. | 同じアドレスから（IPv4 は同じアドレス、IPv6 は同じ /64 の範囲で数えます）、15 分のうちに 30 回を超えて、拒否されたキーが送られました。キーを直して、しばらくしてからやり直します。 |

オンプレミス環境や Hosted 環境では、管理者が、API キーをオフにしたり、使える IP アドレスを限定したりできます。上の 403 の 2 つのメッセージが、その場合です。[データと権限](/ja/mcp/server/data#publisher)の、公開した人の設定は、キーにも同じように効きます。

- [API キー](/ja/cli/server/token) - キーの作成、有効期限、取り消し、安全な扱い方です。

<a id="spec"></a>

## 通信と認証

| 項目 | 値 |
| --- | --- |
| サーバー URL | https://exploratory.io/mcp |
| 通信方式 | Streamable HTTP（HTTP で MCP をやり取りする方式）、ステートレス |
| 認証 | OAuth 2.1（PKCE）: 初回にブラウザでサインインします。または、Authorization: Bearer exp_pat_... で送る API キー |
| スコープ | ブラウザでのサインインは content:read と page:write（page:write はページの作成・更新・削除に使います）。API キーは content:read だけです。ページの機能より前にサインインした接続には page:write がなく、ページを書く道具は INSUFFICIENT_SCOPE を返します。接続を外して、つなぎ直してください |

人がブラウザで使うときは、ブラウザでのサインインを使います。ブラウザがないとき、または自動で実行するときは、API キーを使います。

すべての呼び出しに、Authorization: Bearer \<アクセストークンまたは API キー\> が必要です。ブラウザのセッションの Cookie では、MCP の呼び出しを認証できません。同意画面、メタデータの URL、失敗した呼び出しの詳細は、[データと権限](/ja/mcp/server/data#auth) にあります。

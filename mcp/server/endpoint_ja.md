# エンドポイント

サーバー URL、通信の方式、認証、メタデータの URL をまとめます。クライアントを自分で作る人や、設定を確認したい人向けです。

<a id="url"></a>

## サーバー URL



```text
https://exploratory.io/mcp
```

<a id="spec"></a>

## 通信と認証

| 項目 | 値 |
| --- | --- |
| サーバー URL | https://exploratory.io/mcp |
| 通信方式 | Streamable HTTP（HTTP で MCP をやり取りする方式）、ステートレス（POST のみ。GET と DELETE は 405） |
| 認証 | OAuth 2.1（PKCE）。クライアントは Dynamic Client Registration か Client ID Metadata Document で登録（どちらも、クライアントが自分を登録する方法）。または、Authorization: Bearer exp_pat_... で送る API キー |
| スコープ | content:read（API キーも同じスコープです） |
| メタデータ | https://exploratory.io/.well-known/oauth-protected-resource/mcp、https://exploratory.io/.well-known/oauth-authorization-server |

<a id="calls"></a>

## 呼び出しの認証

すべての呼び出しに、Authorization: Bearer \<アクセストークンまたは API キー\> が必要です。ブラウザのセッションの Cookie では、MCP の呼び出しを認証できません。

有効なトークンがない呼び出しには、HTTP 401 が返り、WWW-Authenticate ヘッダーが保護リソースのメタデータを指します。クライアントはこれを参照して、サインインを開始します。

失敗したキーには、WWW-Authenticate: Bearer error="…", error_description="…" つきの 401 または 403 が返ります。上の 401 と違い、このヘッダーには resource_metadata がないので、固定のヘッダーを送るクライアントがサインインを始めることはありません。同じアドレスから（IPv4 は同じアドレス、IPv6 は同じ /64 の範囲で数えます）、15 分のうちに 30 回を超えて拒否されたキーが送られると、429 になります。

<a id="consent"></a>

## 同意と接続の管理

初回のサインインでは、同意画面が出ます。接続したクライアントは、アカウント設定の「接続中のAIアプリ」で確認・解除できます。

MCP が閲覧できる範囲は、サインインした人の閲覧権限を超えません。公開者がコンテンツへの MCP アクセスやデータの行の共有を制限している場合があります。

- [データと権限](data_ja.md) - 公開者の設定と接続の解除を確認します。

<a id="sign401"></a>

## 401 のとき

サインインし直してください。

| クライアント | サインインし直す方法 |
| --- | --- |
| Claude Code | /mcp |
| Codex | codex mcp login exploratory-server |
| Cursor | agent mcp login exploratory-server |
| Grok Bot | 接続を解除してから追加し直します。 |

API キーで接続しているときの 401 は、キーが無効、期限切れ、または取り消されたことを意味します。新しいキーを作ります（「API キーで接続する」を参照）。

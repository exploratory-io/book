---
title: "トラブルシューティング"
---

症状から、対処を探します。

<a id="check"></a>

## まず状態を確かめる

接続できているかを、[はじめる](/ja/mcp/server/get-started#steps)の手順 3 で確かめます。つながらないときは、下で、症状を探します。

<a id="contact"></a>

## 問い合わせるとき

support@exploratory.io へ、次を送ってください。接続先のサーバーの URL、AI ツールの名前とバージョン、行った操作、表示されたエラーの文です。トークンや API キーは伏せてください。

<a id="network"></a>

## 会社のネットワークでつながらないとき

IT の担当者に、exploratory.io への通信を許可してもらいます。オンプレミスの場合は、自社のサーバーの URL への通信を許可してもらいます。

<a id="signin"></a>

## サインインを求められる

有効なトークンがない要求には、HTTP 401 が返ります。次の方法で、サインインし直します。

| クライアント | サインインし直す方法 |
| --- | --- |
| Claude Code | /mcp を開く |
| Codex | codex mcp login exploratory-server |
| Cursor | agent mcp login exploratory-server |
| Claude アプリ | クライアントのページのサインインの手順を、もう一度行う |
| ChatGPT アプリ | クライアントのページのサインインの手順を、もう一度行う |
| Grok Bot | 接続を解除してから追加し直す |
| Antigravity | クライアントのページの、サインインの手順をもう一度行う |
| そのほかのアプリ | そのクライアントの資料にあるとおりにサインインし直すか、API キーで接続する |

- [AI ツールから追加する](/ja/mcp/server/clients/apps) - クライアントごとの手順です。

<a id="apikey"></a>

## API キーが拒否される

失敗したキーには、理由が応答に入ります。クライアントが、ブラウザでのサインインに切り替わることはありません。

| HTTP ステータス | メッセージ | 対処 |
| --- | --- | --- |
| 401 | The API key is invalid or expired. Create a new one in Account Settings \> API Keys. | 新しいキーを作って、ヘッダーのキーを入れ替えます。キーが取り消されたとき、持ち主が API キーを使えなくなったときも、同じメッセージです。 |
| 403 | API keys are disabled by your administrator. | 管理者が API キーをオフにしています。管理者に確認します。 |
| 403 | This IP address is not allowed for API keys. | 管理者が、API キーを使える IP アドレスを限定しています。許可されたアドレスから接続します。 |
| 429 | Too many failed API key attempts. Try again later. | 同じアドレスから（IPv4 は同じアドレス、IPv6 は同じ /64 の範囲で数えます）、15 分のうちに 30 回を超えて、拒否されたキーが送られました。キーを直して、しばらくしてからやり直します。 |

- [API キーで接続する](/ja/mcp/server/auth#apikey) - ヘッダーの書き方と、キーで読めるものです。

<a id="duplicate"></a>

## 同じ道具が 2 組出る

インストール方法は 1 つだけにしてください。公式一覧にある Exploratory Server のプラグイン（掲載されている場合）、URL の直接追加、claude.ai の Exploratory のコネクタのいずれかを使用します。claude.ai のコネクタは、同じ Claude のアカウントでサインインした Claude Code にも表示されます。

お使いのアプリの公式一覧に Exploratory Server が掲載されていて、そこからインストールする場合は、先に直接追加した分を削除します。掲載されていない場合は、直接追加した分を残します。`exploratory@exploratory` は Desktop 用のプラグインで、Server ではありません。Claude Code では、次のコマンドで、直接追加した分を削除します。`exploratory-server` は、登録した名前に置き換えてください。チャットでの追加例では `Exploratory` です。削除しないと、同じ道具が 2 組表示されます。

```sh
claude mcp remove exploratory-server
```

<a id="zero"></a>

## 自分のコンテンツが出ない

| 表示される内容 | 対処 |
| --- | --- |
| 一覧に何も出ない | サインインしたアカウントが、公開したときのアカウントと同じか確認します。Server MCP は、サインインしたユーザーとして実行されるため、そのユーザーが閲覧できるものだけが表示されます。 |
| 自分のものだけを出したい | AI に「自分の」コンテンツと頼みます。 |
| NOT_FOUND | コンテンツが存在しないか、閲覧する権限がありません。対象の URL をブラウザで開き、同じアカウントで閲覧できるか確認します。閲覧できないときは、所有者に共有設定の確認を頼みます。 |
| CHANNEL_DISABLED | 公開した人が、このコンテンツの MCP アクセスを止めています。公開した人に、コンテンツの MCP アクセスの設定の確認を頼みます。 |
| DATA_EGRESS_LIMIT | 公開した人が、このデータの行を共有していません。チャート・アナリティクス・要約を使います。 |

<a id="rate"></a>

## 回数の上限

| 表示される内容 | 対処 |
| --- | --- |
| 429 RATE_LIMITED | 1 人の利用者が 1 分間に 120 回を超えて要求しました。1 分待ちます。 |
| SERVER_BUSY | 数秒おいて再度呼び出します。2 回続いたら、時間をおきます。書き出しの上限の場合は、最大 1 時間待ちます。 |
| RATE_LIMIT_EXCEEDED / QUERY_ENGINE_UNAVAILABLE | 問い合わせが混み合っています。数秒おいて再度呼び出します。 |

- [制限とエラー](/ja/mcp/server/limits) - エラーの一覧です。

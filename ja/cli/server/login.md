---
title: "サインイン"
---

ブラウザで、または API キー（ブラウザなしで、あなたとして Exploratory を読むための文字列）でサインインして、ログイン情報をこのコンピューターに保存します。状態の確認とサインアウトも、ここで行います。

<a id="signin"></a>

## サインインする

人がブラウザを使える環境で expl を使うときは、ブラウザでサインインします。ブラウザがないとき、またはスクリプトや CI で自動実行するときは、API キーを使います。

```sh
expl server login
```

ブラウザが開きます。Exploratory にサインインして、アクセスを許可してください。対話的でないターミナルでは、ブラウザを開かずに URL を表示します。

> 「Logged in to exploratory.io as …」と表示されていれば、サインインは完了しています。

```sh
expl server status
```

サーバー、ユーザー、サインインの方法を表示します。

```sh
expl server logout
```

保存したログイン情報を削除します。環境変数 EXPL_SERVER_TOKEN で API キーを渡していない場合、次の呼び出しにはサインインが必要です。API キーでサインインしていた場合に消えるのは保存したコピーだけで、キー自体は、取り消すまで使えます。

<a id="apikey"></a>

## API キーでサインインする

API キーを使うと、ブラウザなしでサインインできます。アカウント設定 \> API キーで作成して（[API キー](/ja/cli/server/token)を参照）、次のコマンドを実行します。

```sh
expl server login --with-token
```

ターミナルでは「API key:」と聞かれます。貼り付けたキーは画面に表示されません。パイプでキーを渡すと、標準入力から読み取ります。

**実行結果**

```text
Logged in to exploratory.io as you@example.com with API key "ci-nightly".
```

```sh
expl server login --with-token < key-file
```

key-file は、キーだけを書いたファイルです。キーをコマンドラインに書かないでください。

expl はまず、サーバーでキーを確かめます。サーバーが拒否した場合は、何も保存しません。キーは exp_pat_ で始まります。`--with-token` は `--no-browser` と一緒には使えません。接続先を選ぶときは、`--url` を付けます。

キーは、ブラウザでのサインインと同じ場所に保存されます（「保存先と使われ方」を参照）。保存した API キーは更新されず、ブラウザも開きません。もう一度サインインすると、置き換わります。

保存する代わりに、環境変数 EXPL_SERVER_TOKEN に設定することもできます。保存したログイン情報より先に使われます。

| 順 | 指定 |
| --- | --- |
| 1 | EXPL_SERVER_TOKEN |
| 2 | 保存したログイン情報（ブラウザでのログイン、または `--with-token` で保存した API キー） |

環境変数のキーから保存したログイン情報に切り替えるときは、先に unset EXPL_SERVER_TOKEN を実行してください。設定されている間は、保存したログイン情報より先に使われます。

```sh
expl server status
```

サインインの方法が表示されます。EXPL_SERVER_TOKEN を使っているときは、API key "ci-nightly" from EXPL_SERVER_TOKEN, expires 2026-12-13 のように表示されます。有効期限のないキーは never expires と表示されます。ブラウザでサインインしたときは、login (refresh token saved …, access token valid until …) と表示されます。

**実行結果**

```text
Server: https://exploratory.io (Exploratory 0.17.0)
User: you@example.com
Auth: API key "ci-nightly" saved by login --with-token, expires 2026-12-13
```

キーの作り方と安全な扱い方は、[API キー](/ja/cli/server/token)を参照してください。

<a id="nobrowser"></a>

## ブラウザを開けない環境で

リモートのサーバーなど、expl がブラウザを開けない環境で使います。

```sh
expl server login --no-browser
```

### 1. URL を開く

コマンドを実行すると、https://exploratory.io/oauth/authorize? で始まる URL が表示され、入力待ちになります。その URL を、ブラウザで開きます。

### 2. 許可する

Exploratory にサインインして、アクセスを許可します。

### 3. エラーの画面を確認する

ブラウザは「このサイトにアクセスできません」のような画面に移ります。これで正しい動きです。

### 4. 移動先の URL をコピーする

そのときのアドレス欄の URL をコピーします。http://127.0.0.1/callback?code= で始まるものです。最初に表示された URL ではありません。

### 5. 貼り付ける

ターミナルに貼り付けて Enter キーを押します。

> 「Logged in to … as …」と表示されていれば、サインインは完了しています。

この URL に含まれるコードは、一度しか使用できません。ブラウザがその画面に移ってから 60 秒で無効になるため、すぐに貼り付けてください。失敗した場合は、最初からやり直します。

<a id="saved"></a>

## 保存先と使われ方

ログイン情報は、\~/.exploratory/expl/server/ に、ホストごとのファイルとして保存されます。権限は 0600（本人だけが読める）です。ブラウザでのログインも、`--with-token` で保存した API キーも、同じ場所です。Windows では %USERPROFILE%\\.exploratory\\expl\\server\\ です。

保存したログイン情報は、同じオリジン（スキーム、ホスト、ポート）でだけ使われます。標準のポートでは、同じホストへ後からサインインすると、保存内容が置き換わります。

ブラウザでのログインをサーバー側で失効させると（「接続中のAIアプリ」など）、次の呼び出しは終了コード 4 で終了し、expl server login の実行を案内します。API キーは、アカウント設定 \> API キーで取り消します。

<a id="url"></a>

## 接続先の URL

既定の接続先は https://exploratory.io です。ほかのサーバーを使うときは、`--url` か、環境変数 EXPL_SERVER_URL で指定します。優先順位は次のとおりです。

| 順 | 指定 |
| --- | --- |
| 1 | `--url` |
| 2 | EXPL_SERVER_URL |
| 3 | 保存済みのログイン情報が最新のホスト（トークンの更新でも新しくなります） |
| 4 | https://exploratory.io |

<a id="records"></a>

## サーバーが記録するもの

expl server が呼び出す操作について、Exploratory Server は次のものを記録します。AI ツールが MCP で Exploratory に接続した場合も同様です。

- トークンと API キー: 平文ではなくハッシュで保存し、作成日時、有効期限、最終使用日時を記録します。ブラウザでのログインのトークンは「接続中のAIアプリ」で、API キーはアカウント設定 \> API キーで、確認・失効できます。
- データアクセスログ: アイテム、ユーザー ID とメールアドレス、経路（cli）、サインインの方法（ブラウザまたは API キー）と API キーの名前、操作、クライアント名、IP アドレス、結果とエラーコード、処理時間。保持期間は既定で 90 日です（サーバーの設定で 1〜400 日）。
- サーバーのログ: 操作の呼び出しごとの記録（メールアドレス、クライアント、結果、行数、処理時間）と、トークンの作成・削除。
- 失敗した呼び出しのエラー: 時刻、呼び出した操作、エラーの内容を、製品の改善のために収集します。

同じ内容は、MCP Server の[データと権限](/ja/mcp/server/data)のページでも説明しています。

<a id="trouble"></a>

## トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| `Run "expl server login".` | サインインしていないか、保存したログイン情報が拒否されています。expl server login を実行します。 |
| The redirect URL has no authorization code. | `--no-browser` のとき、最初に表示された URL を貼り付けています。移動先の、http://127.0.0.1/callback?code= で始まる URL を貼り付けてください。 |
| 貼り付けたあとに失敗する | コードは一度しか使えず、60 秒で切れます。最初からやり直します。 |
| The API key is invalid or expired. Create a new one in Account Settings \> API Keys. (UNAUTHORIZED) | キーが間違っているか、期限切れか、取り消されたか、持ち主が API キーを使えなくなっています。終了コード 4 です。新しい API キーを作って、EXPL_SERVER_TOKEN に設定するか、`expl server login --with-token` を実行します。 |
| API keys are disabled by your administrator. | 管理者が API キーをオフにしています。終了コード 4 です。管理者に確認するか、expl server login でサインインします。 |
| This IP address is not allowed for API keys. | 管理者が、API キーを使える IP アドレスを限定しています。終了コード 4 です。許可されたアドレスから実行するか、管理者に確認します。 |
| Too many failed API key attempts. Try again later. | このアドレスから、拒否されたキーが短い時間に何度も送られました。キーを直して、しばらくしてからやり直します。 |
| `--token` was removed. … | 環境変数 EXPL_SERVER_TOKEN を使うか、`expl server login --with-token` を実行します。終了コード 2 です。 |
| Paste an API key (it starts with exp_pat_) when … | 渡された値が API キーではありません。アカウント設定 \> API キーで、キー全体をコピーします。終了コード 2 です。 |

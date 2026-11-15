# トラブルシューティング

症状から、対処を探します。

<a id="install"></a>

## コマンドが見つからない

| 表示される内容 | 対処 |
| --- | --- |
| expl: command not found | 新しいターミナルを開いて、もう一度実行します。Desktop の expl は、アプリを起動したときに PATH に追加されます。 |
| npm install -g が EEXIST で止まる | --force を付けて再実行しないでください。Exploratory Desktop に同梱されている expl が置き換わります。 |
| どの expl が実行されているかわからない | which -a expl（Windows は where expl）で、インストールされているものをすべて確認します。 |

- [インストール](install_ja.md) - Desktop と npm の両方にインストールしている場合の確認方法です。

<a id="signin"></a>

## サインイン

| 表示される内容 | 対処 |
| --- | --- |
| Run "expl server login". | サインインしていないか、保存したログイン情報が拒否されています。expl server login を実行します。 |
| The API key is invalid or expired. Create a new one in Account Settings \> API Keys. (UNAUTHORIZED) | キーが間違っているか、期限切れか、取り消されています。新しい API キーを作って、EXPL_SERVER_TOKEN に設定するか、expl server login --with-token を実行します。終了コード 4 です。 環境変数のキーから保存したログインに切り替えるときは、EXPL_SERVER_TOKEN が先に使われるので、先に unset EXPL_SERVER_TOKEN を実行してください。 |
| API keys are disabled by your administrator. / This IP address is not allowed for API keys. | 管理者が、API キーをオフにしているか、使える IP アドレスを限定しています。管理者に確認するか、expl server login でサインインします。終了コード 4 です。 環境変数のキーから保存したログインに切り替えるときは、EXPL_SERVER_TOKEN が先に使われるので、先に unset EXPL_SERVER_TOKEN を実行してください。 |
| --token was removed. … | EXPL_SERVER_TOKEN を設定するか、expl server login --with-token を実行します。終了コード 2 です。 環境変数のキーから保存したログインに切り替えるときは、EXPL_SERVER_TOKEN が先に使われるので、先に unset EXPL_SERVER_TOKEN を実行してください。 |
| Too many failed API key attempts. Try again later. | このアドレスから、拒否されたキーが短い時間に何度も送られました。キーを直して、しばらくしてからやり直します。 |
| The redirect URL has no authorization code. | --no-browser のとき、最初に表示された URL を貼り付けています。移動先の、http://127.0.0.1/callback?code= で始まる URL を貼り付けてください。 |
| 終了コード 4（Desktop） | Exploratory Desktop にサインインします。 |

- [API キー](token_ja.md) - API キーの作り方、渡し方、取り消し方です。

<a id="network"></a>

## 通信

| 表示される内容 | 対処 |
| --- | --- |
| 終了コード 3（Server） | サーバーに接続できていません。通信を確認して、もう一度実行します。 |
| 終了コード 3（Desktop） | Exploratory Desktop を起動して、もう一度実行します。 |
| 結果が想定と異なる | --verbose を付けて、送受信した内容を確認します。貼り付ける前に、中身を確認してください。 |

<a id="limits"></a>

## 上限

| 表示される内容 | 対処 |
| --- | --- |
| Too big: expected number to be \<=50 at limit | search の --limit を 50 以下にします。 |
| 結果の has_more が true で、全部が返っていない | search と dataframe preview は、--offset で次のページを取得します。dataset query は、絞り込むか、集計します。 |
| SERVER_BUSY | ほかの書き出しが実行中か、1 時間あたりの書き出しの上限に達しています。数秒おいてから再度実行します。上限に達した場合は、最大 1 時間待ちます。 |

<a id="data"></a>

## 問い合わせできないデータ

| 表示される内容 | 対処 |
| --- | --- |
| DATASET_UNAVAILABLE | 公開した人が、「Include all data for AI queries」を付けて公開し直す必要があります。 |
| DATA_EGRESS_LIMIT | 公開した人が、このデータの行をファイルとして取得することを許していません。fetch か dataframe get-schema で、公開した人が共有している内容を読みます。 |
| Unknown property "by" in a sort entry. (INVALID_SORT) | sort では、出力の列の名前を field で指定します。 |

- [データを集計する](guides/query-data_ja.md) - JSON で渡す引数の書き方です。

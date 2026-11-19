---
title: "共通フラグ"
---

どのコマンドにも付けられるフラグです。コマンドの前でも後ろでも指定できます。

<a id="all"></a>


| フラグ | 内容 | expl server では |
| --- | --- | --- |
| `--project <id\|name>` | 対象のプロジェクトです。 | 使えません。付けると使い方のエラーで終わります（終了コード 2）。 |
| `--json` | 道具が返した結果を JSON のまま出力します。 | 同じです。 |
| `--yes`, -y | 取り消しにくい操作の確認を省きます。 | 同じです。 |
| `--no-wait` | 時間のかかる操作を待たず、id を出力して終わります。 | 同じです。 |
| `--timeout <seconds>` | 待つ時間の上限です。指定しないと、操作の応答は最長 120 秒待ち、時間のかかる操作の完了待ちには全体の上限がありません。 | サーバーへの HTTP リクエスト 1 回の上限時間です。既定は 300 秒です。 |
| `--quiet`, -q | 進捗を出力しません。 | 同じです。 |
| `--verbose` | 送受信した内容を標準エラーに出力します。トークンは出力しません。 | 同じです。 |
| `--input <file\|->` | 入力全体を、ファイルまたは標準入力の JSON で渡します。 | 同じです。 |
| `--output <file>` | 画像の結果の保存先です。 | 下の表を参照してください。 |
| `--help`, -h | ヘルプを表示します。 | ヘルプを表示します。組み込みのコマンド（expl server login、logout、status、token、skill）でも使えます。 |
| `--version` | バージョンを表示します。 | 同じです。 |

`--verbose` の出力は、貼り付ける前に中身を確認してください。

`--json` は、expl server login、expl server logout、expl server skill、expl completion には効きません。常にテキストで出力します。組み込みコマンドのうち expl server login、logout、status、skill は、未知のフラグや余分な引数があっても知らせません。expl server token と生成されたコマンドは、エラーにします（終了コード 2）。

<a id="env"></a>

## 環境変数

| 変数 | 使いみち | 優先順位 |
| --- | --- | --- |
| EXPL_SERVER_URL | expl server が呼び出すサーバー | `--url`、EXPL_SERVER_URL、最後にサインインしたサーバー、https://exploratory.io の順です。[接続先の URL](/ja/cli/server/login#url)を参照してください。 |
| EXPL_SERVER_TOKEN | API キー | 保存したログイン情報より先に使われます。[API キー](/ja/cli/server/token)を参照してください。 |
| EXPL_PROJECT | Desktop のコマンドが作業するプロジェクト | expl server では使いません。[プロジェクトを選ぶ](/ja/cli/desktop/guides/projects)を参照してください。 |

<a id="completion"></a>

## シェルの補完

expl completion bash、expl completion zsh、expl completion powershell は、補完のスクリプトを出力します。このスクリプトを実行すると、補完が有効になります。

| シェル | 今のセッションで有効にする | 次回以降も有効にする |
| --- | --- | --- |
| bash | `eval "$(expl completion bash)"` | その行を \~/.bashrc に追加します |
| zsh | `eval "$(expl completion zsh)"` | その行を \~/.zshrc に追加します |
| PowerShell | expl completion powershell \| Out-String \| Invoke-Expression | その行を $PROFILE に追加します |

<a id="server"></a>

## expl server だけのフラグ

| フラグ | 内容 |
| --- | --- |
| `--url <url>` | 接続するサーバーです。 |
| `--with-token` | expl server login と一緒に使います。API キーを読み取って（ターミナルでは表示せずに聞き、パイプでは標準入力から読みます）保存します。`--token` は削除されました。EXPL_SERVER_TOKEN を使います。 |
| `--output <file>`, -o \<file\> | データの書き出しやチャート画像など、ファイルの結果の保存先です。`--json` と一緒に使うと、保存したファイルのパス（saved）とサイズ（bytes）を JSON で出力します。`--output` - は JSON ではなく、ファイルの中身そのものを標準出力に書きます。 |
| `--no-browser` | サインインのときに、ブラウザを開きません。 |

`--no-browser` と `--with-token` の使い方は[サインイン](/ja/cli/server/login)、API キーと EXPL_SERVER_TOKEN の使い方は[API キー](/ja/cli/server/token)を参照してください。

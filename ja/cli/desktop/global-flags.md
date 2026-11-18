---
title: "共通フラグ"
---

どのコマンドにも付けられるフラグです。コマンドの前にも後ろにも置けます。

<a id="all"></a>


| フラグ | 内容 |
| --- | --- |
| `--project <id\|name>` | 作業するプロジェクト |
| `--json` | 結果を、道具が返したままの JSON で出力します |
| `--yes`, -y | 取り消しにくい操作の確認を省きます |
| `--no-wait` | 時間のかかる操作を待たず、id を表示して終わります |
| `--timeout <seconds>` | 待つ時間の上限です。指定しない場合、応答は最長 120 秒待ち、時間のかかる操作の完了待ちには全体の上限がありません |
| `--quiet`, -q | 進捗を出力しません |
| `--verbose` | 送受信の内容を標準エラーに出力します（トークンは出力しません） |
| `--input <file\|->` | 入力全体を、ファイルまたは標準入力の JSON で渡します |
| `--output <file>` | chart get-image のような画像の結果の保存先です |
| `--help`, -h | ヘルプを表示します |
| `--version` | バージョンを表示します |

`--verbose` の出力は、どこかに貼り付ける前に確認してください。

次のコマンドには、例外があります。

- expl status は、`--input` の JSON を使いません。渡しても無視します。
- 組み込みのコマンド（expl status、expl project use、expl lang、expl skill、expl completion）でも、`--help` はヘルプを表示します。
- expl tools describe と expl call は、引数がないと、使い方のエラー（終了コード 2）になります。
- `--json` は、expl project use、expl skill、expl completion には効きません。この 3 つは、常にテキストで出力します。
- 組み込みのコマンド（expl status、expl project use、expl lang、expl skill、expl completion）は、未知のフラグや余分な引数をエラーにしません。使い方に載っているものだけを渡してください。生成されたコマンドは、これらをエラー（終了コード 2）にします。

`--timeout` は、秒数で指定します。数字でない値は、使い方のエラー（終了コード 2）になります。

<a id="env"></a>

## 環境変数

| 変数 | 使いみち | 優先順位 |
| --- | --- | --- |
| EXPL_PROJECT | Desktop のコマンドが作業するプロジェクト | `--project`、EXPL_PROJECT、expl project use で決めた既定の順です。[プロジェクトを選ぶ](/ja/cli/desktop/guides/projects)を参照してください。 |
| EXPL_SERVER_URL | expl server が呼び出すサーバー | `--url`、EXPL_SERVER_URL、最後にサインインしたサーバー、https://exploratory.io の順です。[接続先の URL](/ja/cli/server/login#url)を参照してください。 |
| EXPL_SERVER_TOKEN | expl server に使う API キー | 保存したログイン情報より先に使われます。[API キー](/ja/cli/server/token)を参照してください。 |

<a id="completion"></a>

## シェルの補完

expl completion bash、expl completion zsh、expl completion powershell は、補完のスクリプトを出力します。このスクリプトを実行すると、補完が有効になります。

| シェル | 今のセッションで有効にする | 次回以降も有効にする |
| --- | --- | --- |
| bash | `eval "$(expl completion bash)"` | その行を \~/.bashrc に追加します |
| zsh | `eval "$(expl completion zsh)"` | その行を \~/.zshrc に追加します |
| PowerShell | expl completion powershell \| Out-String \| Invoke-Expression | その行を $PROFILE に追加します |

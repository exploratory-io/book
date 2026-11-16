# 共通フラグ

どのコマンドにも付けられるフラグです。コマンドの前にも後ろにも置けます。

<a id="all"></a>

## 共通フラグ

| フラグ | 内容 |
| --- | --- |
| --project \<id\|name\> | 作業するプロジェクト |
| --json | 結果を、ツールが返したままの JSON で出す |
| --yes, -y | 取り消しにくい操作の確認を省く |
| --no-wait | 時間のかかる操作を待たず、id を表示して終わる |
| --timeout \<seconds\> | 待つ上限。指定しない場合、応答は最長 120 秒待ち、時間のかかる操作の完了待ちには全体の上限がない |
| --quiet, -q | 進捗を出さない |
| --verbose | 送受信の内容を標準エラーに出す（トークンは出しません） |
| --input \<file\|-\> | 入力全体を、ファイルまたは標準入力の JSON で渡す |
| --output \<file\> | chart get-image のような画像の結果の保存先 |
| --help, -h | ヘルプ |
| --version | バージョン |

--verbose の出力は、どこかに貼り付ける前に確認してください。

次のコマンドは、例外があります。

- expl status は、--input の JSON を使いません。渡しても無視します。
- --help は、ヘルプを表示します。組み込みのコマンド（expl status、expl project use、expl lang、expl skill、expl completion）も同じです。
- expl tools describe と expl call は、引数がないと、使い方のエラー（終了コード 2）になります。
- --json は、expl project use、expl skill、expl completion には効きません。この 3 つは、常に文字で出力します。
- 組み込みのコマンド（expl status、expl project use、expl lang、expl skill、expl completion）は、未知のフラグや余分な引数をエラーにしません。使い方に載っているものだけを渡してください。生成されたコマンドは、これらをエラー（終了コード 2）にします。

--timeout は、秒数で指定します。数字でない値は、使い方のエラー（終了コード 2）になります。

<a id="env"></a>

## 環境変数

| 変数 | 使いみち | 優先順位 |
| --- | --- | --- |
| EXPL_PROJECT | Desktop のコマンドが作業するプロジェクト | --project、EXPL_PROJECT、expl project use で決めた既定の順です。[プロジェクトを選ぶ](guides/projects_ja.md)を参照してください。 |
| EXPL_SERVER_URL | expl server が呼び出すサーバー | --url、EXPL_SERVER_URL、最後にサインインしたサーバー、https://exploratory.io の順です。[サーバーの URL](../server/login_ja.md#url)を参照してください。 |
| EXPL_SERVER_TOKEN | expl server に使う API キー | 保存したログイン情報より先に使われます。[API キー](../server/token_ja.md)を参照してください。 |

<a id="completion"></a>

## シェルの補完

expl completion bash、expl completion zsh、expl completion powershell は、補完のスクリプトを出力します。このスクリプトを実行すると、補完が有効になります。

| シェル | 今のセッションで有効にする | 次回以降も有効にする |
| --- | --- | --- |
| bash | eval "$(expl completion bash)" | その行を ~/.bashrc に追加します |
| zsh | eval "$(expl completion zsh)" | その行を ~/.zshrc に追加します |
| PowerShell | expl completion powershell \| Out-String \| Invoke-Expression | その行を $PROFILE に追加します |

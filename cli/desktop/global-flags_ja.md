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

シェルの補完は、expl completion bash、expl completion zsh、expl completion powershell が、補完のスクリプトを出力します。

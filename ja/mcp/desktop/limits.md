---
title: "制限とエラー"
---

Desktop の MCP が断る、または止めるものと、その対処です。これらの制限を決める設定は、[許可の範囲と設定](/ja/mcp/desktop/permissions)にあります。

<a id="limits"></a>

## 制限

| 表示される内容 | 対処 |
| --- | --- |
| 削除、公開、R コードの実行、AI でのデータ処理などの前に、Desktop が確認を出す | これが確認です。Desktop で承認します。確認をなくすときは、システム設定 \> MCP / CLI の該当する設定をオンにします。[Desktop で決められること](/ja/mcp/desktop/permissions#control)を参照してください |
| 新しいアプリの承認を求められる | アプリは、初めて接続するときに承認を求めます。Desktop で承認します。「承認済みのアプリ」でアプリを取り消すと、もう一度求めます。「許可しない」を選んだあと、同じアプリは 5 分間、画面が出ないまま断られます |
| MCP がオフだと表示される | システム設定 \> MCP / CLI で、「MCP」のスイッチをオンにして、システム設定の下にある「保存」を選びます |
| 作成や変更の呼び出しが PERMISSION_DENIED で断られる | 「作成、変更、削除を許可する」がオフです。システム設定 \> MCP / CLI でオンにして、下の「保存」を選びます。読み取りは、オフのままでもできます |
| Desktop の MCP の道具が、起動していないというエラーを返す | Exploratory Desktop を起動します。そのあと、同じ会話で、もう一度道具を使います |

<a id="gates"></a>

## プラグインの確認で止まるとき（Claude Code）

Exploratory Desktop のプラグインのフックが、道具の呼び出しを止めることがあります。AI はメッセージに従って直し、続けられます。プラグインの設定は、[許可の範囲と設定](/ja/mcp/desktop/permissions#plugin-settings)を参照してください。

| 表示される内容 | 対処 |
| --- | --- |
| `get_dashboard_image and get_note_image are only for when the user asks for an image. ...` | 画像の道具（get_note_image・get_dashboard_image）は、依頼の中で画像を頼んだときだけ使えます。AI は代わりに get_chart_data や get_dashboard で値を読みます。画像が必要なときは、依頼の中で「画像」や「スクリーンショット」と頼みます。`review_hook` がオンのときは止めません。 |
| `カスタム R の関所: exp_custom の式は 表 %>% 式 として実行されます。...` | `review_hook` がオンのときだけ出ます。カスタム R コマンドの式の書き始めが誤っています。AI が mutate(...)・filter(...) のように動詞から書き直します。 |
| `カスタム R の関所: この式の ... で作れます。...` | `review_hook` がオンのときだけ出ます。製品のコマンドで作れる処理を、カスタム R コマンドで書いています。AI が製品のコマンドで作り直します。止めるのは 1 つのセッションで 2 回までです。 |
| `全体画像（get_note_image / get_dashboard_image）で見ていないチャートが ... 枚あります` | `review_hook` がオンのときだけ出ます。最後の報告の前に、ノートやダッシュボードの全体画像を 1 回見て、元の成果物と見比べるよう求めています。 |

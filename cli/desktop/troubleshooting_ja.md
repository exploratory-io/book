# トラブルシューティング

症状から対処を探します。

<a id="first"></a>

## まず状態を確かめる

expl status を実行します。expl tools list が終了コード 0 で終わっても、Desktop に接続できているとは限りません（[コマンド一覧](commands_ja.md#cmd-check)を参照）。送受信の内容を見るときは、--verbose を付けます。標準エラーに出力されます。貼り付ける前に、中身を確認してください。

<a id="contact"></a>

## 問い合わせるとき

次の内容を support@exploratory.io へ送ってください。expl --version の出力、実行したコマンド、終了コード、メッセージです。トークンや API キーは伏せてください。

<a id="symptoms"></a>

## 症状と対処

| 症状 | 対処 |
| --- | --- |
| expl: command not found | 新しいターミナルを開いて、もう一度実行します。インストールのページも参照してください。 |
| Desktop が起動しているのにコマンドが拒否され、メッセージに MCP / CLI と出る | CLI は初期状態ではオフです。システム設定で MCP / CLI を選び、「CLI」のカードのスイッチをオンにして「保存」を選びます。 |
| 終了コード 3 | Exploratory Desktop を起動して、もう一度実行します。 |
| 終了コード 4 | メッセージの末尾のコード（NOT_SIGNED_IN、UNAUTHORIZED、PAIRING_REQUIRED、CHANNEL_DISABLED、PERMISSION_DENIED）を、[終了コード](exit-codes_ja.md#action)で確認します。 |
| PROJECT_NOT_OPEN | プロジェクトを開きます: expl project open \<id\> |
| メッセージに get_data_frame のような道具の名前が出る | expl tools describe \<tool_name\> で、その道具に対応するコマンドを確認します。 |
| 結果が想定と異なる | --verbose を付けて、送受信の内容を確認します。貼り付ける前に、出力の内容を確認してください。 |

<a id="windows"></a>

## Windows

Windows PowerShell 5.1 では、" と空白の両方を含む値を直接渡すと壊れます。PowerShell 5.1 自身の不具合で、ほかのコマンド（git、node など）でも同じです。そうした値は --input の JSON で渡すか、PowerShell 7.3 以降を使ってください。

Windows PowerShell 5.1 で --input - にパイプで渡すときは、先に次を実行してください。既定のままだと日本語が ? になります。

```sh
$OutputEncoding = [Text.UTF8Encoding]::new($false)
```

<a id="more"></a>

## 関連

- [終了コード](exit-codes_ja.md) - 終了コードの一覧です。

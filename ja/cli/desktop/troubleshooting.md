---
title: "トラブルシューティング"
---

症状から対処を探します。

<a id="first"></a>

## まず状態を確かめる

expl status を実行します。expl tools list が終了コード 0 で終わっても、Desktop に接続できているとは限りません（[コマンド一覧](/ja/cli/desktop/commands#cmd-check)を参照）。送受信の内容を見るときは、`--verbose` を付けます。標準エラーに出力されます。貼り付ける前に、中身を確認してください。

<a id="contact"></a>

## 問い合わせるとき

次の内容を support@exploratory.io へ送ってください。`expl --version` の出力、実行したコマンド、終了コード、メッセージです。トークンや API キーは伏せてください。

<a id="symptoms"></a>

## 症状と対処

| 症状 | 対処 |
| --- | --- |
| expl: command not found | 新しいターミナルを開いて、もう一度実行します。[インストール](/ja/cli/desktop/install)も参照してください。 |
| Desktop が起動しているのにコマンドが拒否され、メッセージに MCP / CLI と出る | CLI は初期状態ではオフです。システム設定で MCP / CLI を選び、「CLI」のカードのスイッチをオンにして「保存」を選びます。 |
| 終了コード 3 | Exploratory Desktop を起動して、もう一度実行します。 |
| 終了コード 1 で PAIRING_PENDING | Desktop の承認の画面に、2 分以内に答えませんでした。画面で答えてから、もう一度実行します（[はじめる](/ja/cli/desktop/get-started#steps)を参照）。 |
| 終了コード 4 で PAIRING_REQUIRED | 承認の画面で「許可しない」を選びました。5 分間は、もう一度実行しても画面は出ずに断られます。5 分たってからもう一度実行し、画面で許可します。 |
| 終了コード 4 | メッセージの末尾のコード（NOT_SIGNED_IN、UNAUTHORIZED、PAIRING_REQUIRED、CHANNEL_DISABLED、PERMISSION_DENIED）を、[終了コードとエラー](/ja/cli/desktop/exit-codes#action)で確認します。 |
| PROJECT_NOT_OPEN | プロジェクトを開きます: expl project open \<id\> |
| メッセージに get_data_frame のような道具の名前が出る | expl tools describe \<tool_name\> で、その道具に対応するコマンドを確認します。 |
| 結果が想定と異なる | `--verbose` を付けて、送受信の内容を確認します。貼り付ける前に、出力の内容を確認してください。 |

<a id="windows"></a>

## Windows

Windows PowerShell 5.1 では、`"` と空白の両方を含む値を直接渡すと壊れます。PowerShell 5.1 自身の不具合で、ほかのコマンド（git、node など）でも同じです。そうした値は `--input` の JSON で渡すか、PowerShell 7.3 以降を使ってください。

Windows PowerShell 5.1 で `--input` - にパイプで渡すときは、先に次を実行してください。既定のままだと日本語が ? になります。

```sh
$OutputEncoding = [Text.UTF8Encoding]::new($false)
```

<a id="more"></a>

## 関連

- [終了コードとエラー](/ja/cli/desktop/exit-codes) - 終了コードの一覧です。

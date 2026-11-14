# Desktop のコマンド（expl）

よく使うコマンドを、目的ごとに並べました。

<a id="cmd-check"></a>

## 確認する

| コマンド | できること |
| --- | --- |
| expl status | Desktop のバージョンとサインイン中のユーザー（--json を付けると、権限やツールの情報も出ます） |
| expl tools list | 使えるコマンドの一覧（読むだけか、リスク） |
| expl tools describe \<command\> | 引数、型、必須か、選べる値（2 語のコマンドは引用符で囲みます。例: expl tools describe "dashboard get"） |

<a id="cmd-project"></a>

## プロジェクト

| コマンド | できること |
| --- | --- |
| expl project list | プロジェクトの一覧 |
| expl project use \<id\|name\> | 以後のコマンドの対象を決める |
| expl project open \<id\> | プロジェクトを開く |

<a id="cmd-data"></a>

## データ

| コマンド | できること |
| --- | --- |
| expl dataframe list | データフレームの一覧 |
| expl dataframe get-schema \<id\> | 列の名前と型（加工のステップなども返ります） |
| expl dataframe preview | 行を表示する |

<a id="cmd-chart"></a>

## チャート

| コマンド | できること |
| --- | --- |
| expl chart list \<dataframe_id\> | チャートの一覧（データフレームの id が必要です） |
| expl chart get-result \<id\> | チャートの数値 |
| expl chart get-image \<id\> --output \<file\> | チャートの画像を保存する |

<a id="cmd-note"></a>

## ノート

| コマンド | できること |
| --- | --- |
| expl note list | ノートの一覧 |
| expl note get \<id\> | ノートの中身 |

<a id="cmd-dashboard"></a>

## ダッシュボード

| コマンド | できること |
| --- | --- |
| expl dashboard list | ダッシュボードの一覧 |
| expl dashboard get \<id\> | ダッシュボードの定義 |
| expl dashboard create --input \<file\> | ダッシュボードを作る |
| expl dashboard publish \<id\> | パブリッシュする（実行の前に確認が出る） |

<a id="cmd-other"></a>

## そのほか

| コマンド | できること |
| --- | --- |
| expl execution get \<execution_id\> | 待たなかった操作の状態を確認する |
| expl call \<tool_name\> | 道具の名前でそのまま呼ぶ |
| expl lang \[en\|ja\] | 表示の言語を確認する、切り替える（対象のプロジェクトを決められないときは、終了コード 2 になります。例: expl lang --project \<id\>） |
| expl skill | AI エージェント向けの説明を出力する |

<a id="more"></a>

## そのほかのコマンド

すべてのコマンドは expl tools list で確認できます。データ、チャート、ノート、ダッシュボードなど、生成されたコマンドの引数は、expl \<コマンド\> --help で確認できます。project use、tools describe、call、lang は、この表の書き方を見てください（[共通フラグ](global-flags_ja.md)）。

- [Server のコマンド](../server/commands_ja.md) - exploratory.io のコンテンツを読むコマンドです。

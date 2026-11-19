---
title: "公開する"
---

Desktop から、ノート、ダッシュボード、データフレームをサーバーに公開し、公開されているものを確認し、ノートとダッシュボードの公開を取り消します。

<a id="before"></a>

## 前提

- Exploratory Desktop が起動していて、プロジェクトが開いていて（[プロジェクトを選ぶ](/ja/cli/desktop/guides/projects)）、サインインしています（expl status で、サインイン中のユーザーが分かります）。
- 公開と取り消しは、システム設定 > MCP / CLI の「作成、変更、削除を許可する」がオンのときだけ使えます。
- 公開すると、URL を知っている人なら誰でも読めるようになります。公開の取り消しは、元に戻せません。そのため、どちらも実行の前に確認が出ます。ターミナルでは Continue? \[y/N\] と聞かれます。スクリプトや AI エージェントからは、対象を確認したうえで `--yes` を付けます。[確認と時間のかかる操作](/ja/cli/desktop/guides/confirmation)を参照してください。

<a id="steps"></a>

## 手順

### 1. 対象とチームを調べる

```sh
expl note list
expl dashboard list
expl team list
```

note list はノートの id、dashboard list はダッシュボードの id を返します。team list は、所属するチームを返します。チーム名が要るのは、チームに初めて公開するときだけです。

### 2. 公開する

```sh
expl note publish <note_id>
expl dashboard publish <dashboard_id>
```

`--tags` でタグを付けます（複数のときは、フラグを繰り返します）。`--team <チーム名>` は、初めて公開するときのチームを、`--change-description` は、公開し直すときの変更のコメントを指定します。公開し直すと、同じ URL が更新されます。

```sh
expl note publish <note_id> --tags sales --tags weekly --team <チーム名> --yes
```

データフレームを公開するときは、expl dataframe publish \<dataframe_id\> を使います。`--step-name` で公開するステップを選びます。付けないと、最後の有効なステップを公開します。

公開した URL は、expl published list の publishedUrl で分かります。結果の outputOlderThanSource が true のときは、公開した内容が、いまの本文より古いものです。

ダッシュボードは、Desktop が描画を終えているときだけ公開できます。No rendered output と出たときは、Exploratory Desktop でそのダッシュボードを 1 回開いて描画させてから、もう一度実行します。

### 3. 公開されているものを見る

```sh
expl published list
```

結果に、プロジェクトから公開されているノート、ダッシュボード、データが、id、種類、タイトル、URL、チームつきで並びます。`--verify` を付けると、それぞれがサーバーにあるかを確かめます。遅いので、必要なときだけ使います。

### 4. 公開を取り消す

```sh
expl published unpublish <id>
```

\<id\> は、expl published list の id です。公開した URL は、使えなくなります。公開したデータフレームは、このコマンドでは取り消せません。

<a id="trouble"></a>

## 失敗したとき

| 状況 | 対処 |
| --- | --- |
| PERMISSION_DENIED | システム設定の「作成、変更、削除を許可する」をオンにします。[終了コードとエラー](/ja/cli/desktop/exit-codes)を参照してください。 |
| 終了コード 2 で何も実行されない | 確認が要る操作を、ターミナル以外で実行しています。対象を確認したうえで `--yes` を付けます。 |
| Continue? で終了コード 1 | y 以外を答えています。もう一度実行して、y と答えます。 |
| No rendered output | Desktop でダッシュボードを 1 回開いてから、もう一度実行します。 |
| チームが見つからない | expl team list の名前を使います。 |

コマンドの引数は、`expl <コマンド> --help` または `expl tools describe "<コマンド>"` で確認します。

<a id="related"></a>

## 関連するページ

- [確認と時間のかかる操作](/ja/cli/desktop/guides/confirmation)
- [ノートを書く](/ja/cli/desktop/guides/write-notes)
- [ダッシュボードを複製する](/ja/cli/desktop/guides/duplicate-dashboard)
- [Desktop のコマンド](/ja/cli/desktop/commands)

同じことを MCP で行う例は、[使い方](/ja/mcp/desktop/use#examples)の「公開する」を参照してください。

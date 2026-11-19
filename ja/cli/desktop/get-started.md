---
title: "はじめる"
---

Exploratory Desktop の CLI をオンにして、expl をつなぎ、プロジェクトのデータを見ます。次の手順を順に行うと、このページ 1 つで最初の結果まで進めます。

<a id="steps"></a>

## 手順

### 1. Desktop を起動してサインインする

Exploratory Desktop を起動して、サインインします。expl は、Desktop が書いた接続先とトークンを読むので、expl 自身のサインインは必要ありません。

### 2. CLI をオンにする

expl は Exploratory Desktop に同梱されています。CLI は初期状態ではオフで、オンにするまで、Desktop は expl のコマンドを受け付けません。

Exploratory Desktop で、画面の左下にある自分の名前を選び、開いたメニューで「システム設定」を選びます。左のメニューで MCP / CLI を選び、「CLI」のカードのスイッチをオンにして、「保存」を選びます。expl でコンテンツの作成、変更、削除もしたいときは、「作成、変更、削除を許可する」にもチェックを入れます。画面の画像は[インストール](/ja/cli/desktop/install#enable)のページにあります。

### 3. バージョンと状態を確認する

新しいターミナルを開いて、expl が動くことを確かめます。

```sh
expl --version
```

```sh
expl status
```

Desktop のバージョンと、サインイン中のユーザーを表示します。

初めて使うときは、Exploratory Desktop に「expl の Exploratory への接続を許可しますか？」と聞く画面が出ます。自分で起動した expl であることを確かめて、許可します。

![「AI ツールが許可を求めています」の画面。「expl の Exploratory への接続を許可しますか？ 自分で起動したアプリだけ許可してください。」と表示され、「許可する」と「許可しない」のボタンがある](images/ja/pairing-dialog.png)

expl は答えを最大 2 分待ち、その間は標準エラーに「Exploratory で expl の承認を待っています（確認が表示されています）...」と出します。許可すると、コマンドはそのまま続きます。2 分以内に答えないと、PAIRING_PENDING で止まります（終了コード 1）。Desktop の画面で答えてから、もう一度実行します。

「許可しない」を選ぶと、コマンドは PAIRING_REQUIRED で止まります（終了コード 4）。その後 5 分間は、もう一度実行しても画面は出ずに断られます。5 分たってからもう一度実行し、画面で許可します。

### 4. プロジェクトを選ぶ

```sh
expl project list
```

プロジェクトを一覧します。

```sh
expl project use "Sales Analysis"
```

Sales Analysis は、自分のプロジェクトの名前に置き換えます。以降のコマンドは、このプロジェクトが対象になります。このコマンドは既定のプロジェクトを保存するだけで、Desktop でプロジェクトを開くことはしません。

後のコマンドが PROJECT_NOT_OPEN で止まったときは、プロジェクトが Desktop で開いていません。expl project list で見つけた id で開きます。

```sh
expl project open <project_id>
```

### 5. データを見る

```sh
expl dataframe list
```

プロジェクトのデータフレームを一覧します。1 つ選んで、id を控えます。

```sh
expl dataframe get-schema <dataframe_id>
```

列の名前と型を表示します。\<dataframe_id\> は、選んだ id に置き換えます。行を見るときは、expl dataframe preview \<dataframe_id\> を実行します。

### 6. ダッシュボードを取得する（任意）

```sh
expl dashboard list
```

一覧から、ダッシュボードの id を選びます。一覧が空のときは、そのプロジェクトにダッシュボードがまだありません。

```sh
expl dashboard get d123 --json
```

d123 は、選んだ id に置き換えます。

<a id="trouble"></a>

## うまくいかないとき

- コマンドが受け付けられません: CLI のスイッチがオンで、保存してあるか確かめます（手順 2）。
- PAIRING_PENDING で止まります: 2 分以内に答えなかったためです。Desktop の画面で答えてから、もう一度実行します（手順 3）。
- PAIRING_REQUIRED で止まります: 「許可しない」を選んだためです。5 分たってからもう一度実行し、画面で許可します（手順 3）。
- PROJECT_NOT_OPEN で止まります: expl project open \<project_id\> でプロジェクトを開きます（手順 4）。
- expl tools list は終了コード 0 で終わるのに、ほかのコマンドが動きません: 終了コード 0 は、Desktop につながっている印ではありません。expl status を実行します。
- ダッシュボードの一覧が空です: そのプロジェクトにダッシュボードがまだありません。

詳しくは[トラブルシューティング](/ja/cli/desktop/troubleshooting)を参照してください。

<a id="next"></a>

## 次に読むもの

- [プロジェクトを選ぶ](/ja/cli/desktop/guides/projects) - プロジェクトが決まる順です。
- [使い方](/ja/cli/desktop/use) - やりたいことからコマンドを探します。
- [コマンド一覧](/ja/cli/desktop/commands) - 目的からコマンドを探します。
- [トラブルシューティング](/ja/cli/desktop/troubleshooting) - 症状から対処を探します。

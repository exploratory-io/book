# はじめる

Exploratory Desktop の CLI をオンにして、expl をつなぎ、プロジェクトのデータを見ます。次の手順を順に行うと、このページ 1 つで最初の結果まで進めます。

<a id="steps"></a>

## 手順

### 1. CLI をオンにする

expl は Exploratory Desktop に同梱されています。CLI は初期状態ではオフで、オンにするまで、Desktop は expl のコマンドを受け付けません。

Exploratory Desktop で、画面の左下にある自分の名前を選び、開いたメニューで「システム設定」を選びます。左のメニューで MCP / CLI を選び、「CLI」のカードのスイッチをオンにして、「保存」を選びます。expl でコンテンツの作成、変更、削除もしたいときは、「作成、変更、削除を許可する」にもチェックを入れます。写真は[インストール](install_ja.md#enable)のページにあります。

### 2. Desktop にサインインする

Exploratory Desktop を起動して、サインインします。expl は、Desktop が書いた接続先とトークンを読むので、expl 自身のサインインは必要ありません。

新しいターミナルを開いて、expl が動くことを確かめます。

```sh
expl --version
```

### 3. 状態を確認する

```sh
expl status
```

Desktop のバージョンと、サインイン中のユーザーを表示します。

### 4. 初めてのときは、接続を許可する

初めて使うときは、Exploratory Desktop に「expl の Exploratory への接続を許可しますか？」と聞く画面が出ます。自分で起動した expl であることを確かめて、許可します。

![「AI ツールが許可を求めています」の画面。「expl の Exploratory への接続を許可しますか？ 自分で起動したアプリだけ許可してください。」と表示され、「許可する」と「許可しない」のボタンがある](images/ja/pairing-dialog.png)

expl は答えを最大 2 分待ち、その間は標準エラーに「Exploratory で expl の承認を待っています（確認が表示されています）...」と出します。許可すると、コマンドはそのまま続きます。2 分以内に答えないと、PAIRING_PENDING で止まります（終了コード 1）。Desktop の画面で答えてから、もう一度実行します。答える前にコマンドが止まったときは、expl status をもう一度実行します。

### 5. プロジェクトを選ぶ

```sh
expl project list
```

プロジェクトを一覧します。

```sh
expl project use "Sales Analysis"
```

Sales Analysis は、自分のプロジェクトの名前に置き換えます。以降のコマンドは、このプロジェクトが対象になります。

### 6. データを見る

```sh
expl dataframe list
```

プロジェクトのデータフレームを一覧します。1 つ選んで、id を控えます。

```sh
expl dataframe get-schema <dataframe_id>
```

列の名前と型を表示します。\<dataframe_id\> は、選んだ id に置き換えます。行を見るときは、expl dataframe preview \<dataframe_id\> を実行します。

### 7. ダッシュボードを取得する（任意）

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

- コマンドが受け付けられません: CLI のスイッチがオンで、保存してあるか確かめます（手順 1）。
- PAIRING_PENDING で止まります: 2 分以内に答えなかったためです。Desktop の画面で答えてから、もう一度実行します（手順 4）。
- expl tools list は終了コード 0 なのに動きません: 終了コード 0 は、Desktop につながっている印ではありません。expl status を実行します。
- ダッシュボードの一覧が空です: そのプロジェクトにダッシュボードがまだありません。

詳しくは[トラブルシューティング](troubleshooting_ja.md)を参照してください。

<a id="next"></a>

## 次に読むもの

- [プロジェクトを選ぶ](guides/projects_ja.md) - プロジェクトが決まる順です。
- [使い方](use_ja.md) - やりたいことからコマンドを探します。
- [コマンド一覧](commands_ja.md) - 目的からコマンドを探します。
- [トラブルシューティング](troubleshooting_ja.md) - 症状から対処を探します。

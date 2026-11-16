# 試してみる

Desktop を起動して、expl で状態の確認、プロジェクトの選択、ダッシュボードの取得までを行います。

<a id="steps"></a>

## 8 つの手順

### 1. Desktop を起動して、CLI が有効か確認する

Exploratory Desktop を起動します。CLI は、[インストール](install_ja.md#enable)の手順で有効にして、保存しておきます。まだのときは、先に済ませてください。

### 2. Desktop にサインインする

Exploratory Desktop にサインインします。expl は、Desktop が書いた接続先とトークンを読むので、expl 自身のサインインは必要ありません。

### 3. 状態を確認する

```sh
expl status
```

Desktop のバージョンと、サインイン中のユーザーを表示します。

### 4. 初めてのときは、接続を許可する

初めて使うときは、Exploratory Desktop に「expl の Exploratory への接続を許可しますか？」と聞く画面が出ます。自分で起動した expl であることを確かめて、許可します。

![「AI ツールが許可を求めています」の画面。「expl の Exploratory への接続を許可しますか？ 自分で起動したアプリだけ許可してください。」と表示され、「許可する」と「許可しない」のボタンがある](images/ja/pairing-dialog.png)

expl は答えを最大 2 分待ち、その間は標準エラーに「Exploratory で expl の承認を待っています（確認が表示されています）...」と出します。許可すると、コマンドはそのまま続きます。2 分以内に答えないと、PAIRING_PENDING で止まります（終了コード 1）。Desktop の画面で答えてから、もう一度実行します。

### 5. もう一度状態を確認する

答える前にコマンドが止まったときは、expl status をもう一度実行します。

### 6. プロジェクトを調べる

```sh
expl project list
```

### 7. プロジェクトを選ぶ

```sh
expl project use "Sales Analysis"
```

Sales Analysis は、自分のプロジェクトの名前に置き換えます。

### 8. ダッシュボードを取得する

```sh
expl dashboard list
```

一覧から、ダッシュボードの id を選びます。一覧が空のときは、そのプロジェクトにダッシュボードがまだありません。

```sh
expl dashboard get d123 --json
```

d123 は、選んだ id に置き換えます。

うまくいかない場合は、トラブルシューティングを参照してください。

<a id="next"></a>

## 次に

- [プロジェクトを選ぶ](guides/projects_ja.md) - プロジェクトが決まる順です。
- [コマンド一覧](commands_ja.md) - 目的からコマンドを探します。
- [トラブルシューティング](troubleshooting_ja.md) - 症状から対処を探します。

# はじめる

Desktop を起動して、expl で状態の確認、プロジェクトの選択、ダッシュボードの取得までを行います。

<a id="steps"></a>

## 8 つの手順

### 1. Desktop を起動する

Exploratory Desktop を起動します。

### 2. Desktop にサインインする

Exploratory Desktop にサインインします。expl は、Desktop が書いた接続先とトークンを読むので、expl 自身のサインインは必要ありません。

### 3. 状態を確認する

```sh
expl status
```

Desktop のバージョンと、サインイン中のユーザーを表示します。

### 4. 初めてのときは、接続を許可する

初めて使うときは、Exploratory Desktop に「expl の Exploratory への接続を許可しますか？」と聞く画面が出ます。自分で起動した expl であることを確かめて、許可します。

### 5. もう一度状態を確認する

許可したあと、もう一度 expl status を実行します。

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
expl dashboard get d123 --json
```

d123 は、ダッシュボードの id に置き換えます。

うまくいかない場合は、トラブルシューティングを参照してください。

<a id="next"></a>

## 次に

- [プロジェクトを選ぶ](guides/projects_ja.md) - プロジェクトが決まる順です。
- [よく使うコマンド](commands_ja.md) - 目的からコマンドを探します。
- [トラブルシューティング](troubleshooting_ja.md) - 症状から対処を探します。

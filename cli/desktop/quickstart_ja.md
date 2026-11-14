# はじめる

Desktop を起動して、expl で状態の確認、プロジェクトの選択、ダッシュボードの取得までを行います。

<a id="steps"></a>

## 4 つの手順

### 1. Desktop を起動してサインインする

Exploratory Desktop を起動し、サインインします。expl は、Desktop が書いた接続先とトークンを読むので、expl 自身のサインインは必要ありません。

### 2. 状態を確認する

```sh
expl status
```

Desktop のバージョン、サインイン中のユーザー、接続が有効かを表示します。

### 3. プロジェクトを選ぶ

```sh
expl project list
```

```sh
expl project use "Sales Analysis"
```

Sales Analysis は、自分のプロジェクトの名前に置き換えます。

### 4. ダッシュボードを取得する

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

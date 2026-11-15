# インストール

expl は Exploratory Desktop に同梱されています。別途インストールする必要はありません。

<a id="enable"></a>

## 最初に CLI を有効にする

Exploratory Desktop の CLI は、初期状態ではオフです。expl をインストールしていても、オンにするまで、Desktop は expl のコマンドを受け付けません。

1. Exploratory Desktop で、システム設定を開きます。
2. 左のメニューで、MCP / CLI を選びます。
3. CLI の項目で、「CLI を有効にする」をオンにします。
4. expl でコンテンツの作成、変更、削除もしたいときだけ、「作成、変更、削除を許可する」にもチェックを入れます。
5. 画面の下の「保存」を選びます。

<a id="bundled"></a>

## Exploratory Desktop に同梱されています

Exploratory Desktop を起動すると、expl が PATH（コマンドを探すフォルダの一覧）に含まれていない場合は、自動的に追加されます。新しく開いたターミナルから使用できます。Node.js のインストールは必要ありません。

macOS では、アプリが /Applications または ~/Applications にある場合に限り、追加されます。開発ビルドでは追加されません。

新しいターミナルを開いて、次を実行してください。

```sh
expl --version
```

<a id="where"></a>

## インストール先

| OS | インストール先 |
| --- | --- |
| macOS | /usr/local/bin/expl |
| Windows | \<インストール先\>\\cli をユーザーの PATH に追加します。管理者の権限は必要ありません。 |

同じコマンドが、別名 exploratory と、MCP 用の exploratory-mcp としても追加されます。その名前がすでにほかのコマンドで使用されている場合は、その名前のみ追加されません。

<a id="two"></a>

## npm でもインストールしている場合

npm でインストールした expl と Desktop の expl の両方がある場合は、どちらが実行されるかを確認します。

### macOS と Linux

**macOS と Linux**

```sh
which -a expl
```

インストールされているものを、実行される順にすべて表示します。

### Windows

**Windows**

```sh
where expl
```

<a id="remove"></a>

## アンインストール

| OS | アンインストール方法 |
| --- | --- |
| macOS | rm /usr/local/bin/expl /usr/local/bin/exploratory /usr/local/bin/exploratory-mcp（管理者の権限が必要な場合は sudo を付けます）。アプリを /Applications に置いたままにすると、次回の起動時に再び追加されます。 |
| Windows | 「システム環境変数の編集」を開き、ユーザー環境変数の Path から \<インストール先\>\\cli を削除します。次回の起動時に再び追加されます。 |

- [はじめる](quickstart_ja.md) - Desktop につなぎ、最初のコマンドを実行します。

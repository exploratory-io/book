---
title: "インストール"
---

expl のインストール方法は 2 つあります。どちらか一方を実施してください。

<a id="choose"></a>

## インストール方法を選ぶ

> **Server のみ**
>
> このページは、Exploratory Server で使う expl のインストール方法です。Desktop に同梱されている expl でも、expl server を使えます。

| 状況 | インストール方法 |
| --- | --- |
| Exploratory Desktop を使っている | Desktop に同梱されています。追加の作業は必要ありません。 |
| Desktop を使わない（Server だけ、CI、サーバー） | npm でインストールします。 |

<a id="desktop"></a>

## Desktop をお使いの場合

expl は Exploratory Desktop に同梱されています。expl server も含まれるので、追加のインストールも Node.js も必要ありません。

Exploratory Desktop を起動すると、expl が PATH（コマンドを探すフォルダの一覧）に含まれていない場合は、自動的に追加されます。macOS では、アプリが /Applications または \~/Applications にある場合に限ります。管理者の許可を求められることがあります。許可しない場合は、\~/.local/bin に追加されます。必要に応じて、そのフォルダを PATH に追加してください。

Exploratory 以外の expl がすでにある場合は、置き換えません。

新しいターミナルを開いて、次を実行してください。

```sh
expl --version
```

> 1 行目に expl \<バージョン\> と表示されていれば、インストールは完了しています。

<a id="npm"></a>

## npm でインストールする場合

Desktop を使用しない場合の方法です。Exploratory Server だけを使用する場合や、CI やサーバーで expl を実行する場合に使用します。Node.js 20 以降が必要です。Node.js のインストール方法は、[Node.js の公式サイト](https://nodejs.org/)を参照してください。npm は、Node.js に同梱されている、パッケージ管理コマンドです。

### インストールして使う

最新のバージョンを、グローバルにインストールします。

```sh
npm install -g @exploratory/cli
```

パッケージ名は @exploratory/cli で、インストールされるコマンドは expl です。名前が expl だけのパッケージはインストールしないでください。その名前は、別の開発者のものです。

### インストールせずに使う（npx）

npx を使うと、インストールせずに expl を実行できます。実行したい expl のコマンドを、パッケージ名の後ろに続けて書きます。

```sh
npx -y @exploratory/cli --version
npx -y @exploratory/cli server login
```

<a id="check"></a>

## 確認する

```sh
expl --version
```

> 1 行目に expl \<バージョン\> と表示されていれば、インストールは完了しています。

expl: command not found と表示された場合は、新しいターミナルを開いて、もう一度実行してください。

<a id="two"></a>

## Desktop と npm の両方にインストールしている場合

npm でインストールした expl と Desktop の expl の両方がある場合は、どちらが実行されるかを確認します。

### macOS と Linux

```sh
which -a expl
```

インストールされているものを、実行される順にすべて表示します。

### Windows

```sh
where expl
```

`expl --version` の 1 行目には expl \<バージョン\> と表示され、インストール方法までは表示されません。どちらの expl かは、上で表示されたパスで判別してください。先頭のパスが想定と異なる場合は、使用する方のフォルダを PATH の先頭に置くか、もう一方をアンインストールしてください。

Exploratory Desktop をお使いの場合は、npm でグローバルにインストールする必要はありません。CI で npx を使用することは、問題ありません。

> **npm install -g が EEXIST で停止する場合**
>
> nodejs.org のインストーラーで Node.js をインストールした Mac では、npm がコマンドを Desktop が通常使用する /usr/local/bin に配置しようとするため、npm install -g が EEXIST で停止します。この場合は、`--force` を付けて再実行しないでください。Exploratory Desktop に同梱されている expl が置き換わります。逆に、npm の expl がすでに /usr/local/bin にある場合、Desktop はそれを残し、自分の expl は配置しません。

<a id="update"></a>

## 更新する

npm でインストールした expl を最新のバージョンに更新するには、次のコマンドを実行して、バージョンを確認します。

```sh
npm install -g @exploratory/cli
```

```sh
expl --version
```

\<version\> は、使いたいバージョンに置き換えます。Exploratory Desktop に同梱されている expl は、Exploratory Desktop を更新すると更新されます。

バージョンごとの変更点は、[リリースノート](/ja/release-notes_ja)で確認できます。

<a id="remove"></a>

## アンインストール

npm でインストールした expl は、次のコマンドでアンインストールします。

```sh
npm uninstall -g @exploratory/cli
```

Exploratory Desktop に同梱されている expl は、Desktop のインストールのページの[アンインストール](/ja/cli/desktop/install#remove)に従います。同名のほかのコマンドを削除しないように、先に各パスを確認してください。アプリを /Applications に置いたままにすると、次回の起動時に再び追加されます。

次は、[サインイン](/ja/cli/server/login)してから、[はじめる](/ja/cli/server/get-started#steps)で最初の結果を取得します。手元の Desktop を操作する場合は[Desktop を使う](/ja/cli/desktop)を参照してください。

> 下書き・未公開

# Exploratory MCP: Desktop

AI クライアントから、あなたのコンピューターの Exploratory Desktop で、プロジェクトを作り、編集します。

<a id="scope"></a>

## できること

> TODO: （公開前に外す）: システム設定 \> MCP / CLI の「AI クライアントと接続」のカード（tam #40758、ブランチ fix/issue-40758-40761）は、まだ tam の master に入っていません。このページを公開する前に、Desktop v17 に入ることを確認してください。このページを公開するかどうかは、担当者の判断です。シートには、「MCP Desktop はサポート対象外と記載する」という案もあります。

Exploratory Desktop の MCP を使うと、AI クライアントが、あなたのコンピューターの Exploratory Desktop で、プロジェクトを作ったり編集したりできます。扱えるものは次のとおりです。

- データフレーム、加工のステップ、ブランチ、パラメーター、接続
- チャートとアナリティクス
- ノートとダッシュボード

> **変更や削除もできます**
>
> 削除、ノート・ダッシュボード・データフレームの公開と公開の取り消し、R コードの実行を行うツールがあります。AI が書き込む前に、提案を確認してください。

お使いのコンピューターのアプリを通して、アプリにサインインしている人として動きます。exploratory.io に公開した内容を読む Server の MCP とは、別のものです。

- [MCP Server](server_ja.md) - exploratory.io に公開した内容を読みます。

<a id="need"></a>

## 必要なもの

- Exploratory Desktop v17 以降。サインインして、起動しておきます
- PATH にある exploratory-mcp コマンド。プラグインが、このコマンドを起動します。Desktop が起動時に登録するか、「AI クライアントと接続」のカードで登録します
- macOS では、コマンドを登録するために、Desktop を /Applications か ~/Applications から起動します
- Claude Code で使う場合は、PATH に node。プラグインのレビューのフックが使います
- AI クライアント: Claude Code、Codex、Cursor、Antigravity

<a id="steps"></a>

## つなぐ手順

### 1. Desktop で MCP をオンにする

システム設定 \> MCP / CLI を開いて、「MCP を有効にする」をオンにします。チャートやノートなどを作成・変更する場合は、「作成、変更、削除を許可する」にもチェックを入れます。どちらも初期状態ではオフです。

### 2. 「AI クライアントと接続」からプラグインを入れる

同じタブの「AI クライアントと接続」のカードで、このコンピューターの AI クライアントとつなぎます。Claude Code、Codex、Antigravity、Cursor が並びます。使うクライアントで「インストール」を選びます。Claude Code、Codex、Antigravity では、Exploratory Desktop のプラグイン（スキルを含む）が入り、行に「インストール済み」とプラグインのバージョンが表示されます。「インストール」の代わりに「更新」と「削除」が使えます。Cursor では、~/.cursor/mcp.json に exploratory-mcp を登録するだけです。スキルは入らず、行の「インストール済み」にバージョンは表示されません。

このコンピューターにないクライアントには、「このパソコンに見つかりません」と表示されます。コマンドの行に「登録されていません」と出ているときは、「登録」を選びます。管理者のパスワードを求められることがあります。

インストールが終わったら、その AI クライアントを起動し直します。

### 3. 接続を許可して試す

クライアントが初めて接続すると、Desktop が許可するかどうかを聞きます。自分で起動したアプリだけ許可してください。そのあと、Exploratory Desktop でプロジェクトを開いて、次のように頼みます。

```text
開いている Exploratory のプロジェクトで、売上データから月別の棒グラフを作って
```

Claude Code では、/mcp を開いて、exploratory-desktop が接続されていることを確認します。Codex では、codex mcp list を実行して、exploratory-desktop が並んでいることを確認します。MCP がオフだと表示されたときは、手順 1 に戻ります。

<a id="manual"></a>

## 手作業でインストールする

「AI クライアントと接続」のカードを使わないときの手順です。このプラグインは、公式のプラグイン一覧にはありません。リポジトリ exploratory-io/exploratory をマーケットプレイスとして足してから、プラグイン exploratory を入れます。コマンドは、ご自身でターミナルに打ってください。AI クライアントに実行させるのは避けてください。権限の設定によっては止められます。

### Claude Code

**Claude Code**

```sh
claude plugin marketplace add exploratory-io/exploratory
claude plugin install exploratory@exploratory
```

Claude Code で /plugin を開き、マーケットプレイス exploratory-io/exploratory を足して、exploratory を選んでも入れられます。

### Codex

**Codex**

```sh
codex plugin marketplace add exploratory-io/exploratory
codex plugin add exploratory@exploratory
```

### Cursor

**Cursor**

```sh
{
  "mcpServers": {
    "exploratory-desktop": {
      "command": "exploratory-mcp"
    }
  }
}
```

~/.cursor/mcp.json に追加します。スキルなしで Desktop の MCP が入ります。「AI クライアントと接続」のカードが書くのと同じ内容です。Cursor には、~/.claude から取り込んだ Claude Code のプラグインも表示されます。その場合は、先に Claude Code でプラグインを入れ、Cursor の設定で「Include Third-Party Plugins, Skills, and Other Configs」をオンにします。

### Antigravity

**Antigravity**

```sh
git clone https://github.com/exploratory-io/exploratory
agy plugin install ./exploratory/plugins/exploratory-desktop
```

Git が必要です。プラグインは、Antigravity のアプリの Customizations \> Installed に表示されます。

Claude アプリでは、設定 \> プラグインを開き、追加（Add marketplace）\> リポジトリから を選んで、exploratory-io/exploratory を入力し、exploratory を入れます。ターミナルで入れたプラグインも、そこに「ローカルにインストール済み」と表示されます。ローカルの MCP は、Cowork（このコンピューター上で動かしているとき）と Code タブで使えます。通常のチャットでは使えません。

<a id="update"></a>

## 更新と削除

「AI クライアントと接続」のカードで、クライアントの行の「更新」または「削除」を選びます。手作業では、次のコマンドを使います。

| クライアント | 更新 | 削除 |
| --- | --- | --- |
| Claude Code | claude plugin marketplace update exploratory を実行し、続けて claude plugin update exploratory@exploratory を実行して、Claude Code を起動し直します | claude plugin uninstall exploratory@exploratory |
| Codex | codex plugin marketplace upgrade exploratory を実行し、続けて codex plugin remove exploratory@exploratory と codex plugin add exploratory@exploratory を実行します | codex plugin remove exploratory@exploratory |
| Cursor | Claude Code でプラグインを更新します（Cursor は ~/.claude から取り込みます） | Claude Code でアンインストールします。~/.cursor/mcp.json を手で書いたときは、そこから exploratory-desktop を消します |
| Antigravity | クローンしたフォルダで git pull を実行し、もう一度 agy plugin install を実行します | Antigravity のプラグインの設定で、プラグインを削除します |

Desktop の MCP は、Exploratory Desktop を終了すると止まります。プラグインを削除しても、Server の MCP の接続には影響しません。

<a id="control"></a>

## Desktop で決められること

システム設定 \> MCP / CLI では、次のことも決められます。

- AI アプリケーションに渡すデータの範囲: 名前・列・データ型だけ、集計結果（チャート、ピボットテーブル）まで、サンプルの行（最大 100 行）まで、すべての行、から選びます。選んだ範囲を超える要求は断られます。
- 承認: 項目の削除（チャート、アナリティクス、ノート、ダッシュボード、ステップ、ブランチ、パラメーター、接続、パレット、テンプレート、R パッケージ、カタログの項目）、ノート・ダッシュボード・データフレーム・プロジェクトの公開と公開の取り消し、接続の保存、データソースの置き換え、プロジェクトの履歴の復元、データフレームの管理、システム設定やカタログのスケジュールの変更の前には、Desktop が先に確認します。R コードの実行、R パッケージの追加、AI でのデータ処理、ノートの AI への質問の前にも確認します。チャート、ノート、ダッシュボードの作成や編集では確認しません。確認なしで実行する設定は、「変更・削除・公開」と「コードと AI」の 2 つのグループごとにあります。
- 承認済みのアプリ: アプリは、初めて接続するときに、承認を求めます。アプリを削除すると、もう一度承認を求めます。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| exploratory-mcp が見つからない | MCP をオンにした Exploratory Desktop v17 以降を起動するか、「AI クライアントと接続」のカードで「登録」を選んでから、AI クライアントを起動し直します。macOS では、アプリを /Applications か ~/Applications から起動します。 |
| 登録できません。Exploratory が … から起動されています。 | Exploratory を「アプリケーション」フォルダに移して、起動し直します。起動したときに登録されます。 |
| Desktop の MCP のツールが、起動していないというエラーを返す | Exploratory Desktop を起動します。そのあと、同じ会話で、もう一度ツールを使います。 |
| MCP がオフだと表示される | システム設定 \> MCP / CLI で、「MCP を有効にする」をオンにします。 |
| Git was not found on this computer. Install Git and try again. | Antigravity のインストールは、Git でプラグインを取得します。Git を入れて、もう一度試します。 |
| A marketplace named "exploratory" is already registered from a different source … | メッセージに出ているコマンドで削除してから、もう一度「インストール」を選びます。 |
| Your organization's settings may not allow this marketplace. | 管理者に確認します。 |
| Claude Code のフックで node が見つからない | Node.js を入れて、node を PATH に通します。 |
| Desktop の MCP が想定どおりに動かない | Exploratory Desktop にサインインしているかを確認します。 |

<a id="privacy"></a>

## 送られるものと記録されるもの

- Desktop の MCP は、お使いのコンピューターで動きます。アプリを通して、手元のプロジェクトの内容を読み、編集します。
- ツールが返す内容（行、列名、チャートの画像、エラー）は、会話の一部になります。AI の提供元に、その提供元の規約に従って送られます。その提供元に送ってはいけないデータには使わないでください。
- Exploratory Desktop は、Desktop MCP のツールを 1 回呼び出すたびに、サインインしている exploratory.io のサーバーへ、利用記録を 1 件送ります。記録には、ツールの名前と引数（入力した数式や値が入ることがあります）、成功か失敗か（失敗のときはエラーの種類とメッセージ）、結果の大きさ（内容は含みません）、処理時間、Desktop のバージョン、AI クライアントの名前とバージョン、セッションとアイテムの ID が入ります。送られるのは、サインインしていて、AI 機能がオンのときだけです。ローカルのデータカタログのツールでは送りません。

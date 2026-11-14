# Exploratory MCP: Desktop

AI クライアントから、あなたのコンピューターの Exploratory Desktop で、プロジェクトを作り、編集します。

<a id="scope"></a>

## できること

Exploratory Desktop の MCP を使うと、AI クライアントが、あなたのコンピューターの Exploratory Desktop で、プロジェクトを作ったり編集したりできます。扱えるものは次のとおりです。

- データフレーム、加工のステップ、ブランチ、パラメーター、接続
- チャートとアナリティクス
- ノートとダッシュボード

> **変更や削除もできます**
>
> 削除、ノート・ダッシュボード・データフレームの公開と公開の取り消し、R コードの実行を行うツールがあります。AI が書き込む前に、提案を確認してください。

お使いのコンピューターのアプリを通して、アプリにサインインしている人として動きます。exploratory.io に公開した内容を読む Server の MCP とは、別のものです。

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

<a id="clients"></a>

## クライアントごとの手順

カードを使わずに手でインストールする方法と、更新・削除の手順は、クライアントごとのページにあります。

- [Claude Code](clients/claude-code_ja.md) - Claude Code への接続手順
- [Codex](clients/codex_ja.md) - Codex への接続手順
- [Cursor](clients/cursor_ja.md) - Cursor への接続手順
- [Antigravity](clients/antigravity_ja.md) - Antigravity への接続手順

<a id="more"></a>

## あわせて読む

- [できること・ツール](tools_ja.md) - 目的から、AI にできることを確認します。
- [制限と設定](limits_ja.md) - Desktop で決める設定と、送られる情報です。
- [トラブルシューティング](troubleshooting_ja.md) - 表示されたメッセージから対処を探します。
- [MCP Server](../server/server_ja.md) - exploratory.io に公開されたコンテンツを読みます。

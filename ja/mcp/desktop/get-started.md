---
title: "はじめる"
---

Desktop の MCP のプラグインを入れ、Exploratory Desktop で MCP をオンにして、AI ツールにプロジェクトのデータを見せます。所要時間は 5 分ほどで、手順はこのページ 1 つで進められます。同じコンピューターに、Exploratory Desktop と、プラグインを入れる AI ツール（Claude Code、Codex、Antigravity、Cursor のいずれか）を用意してください。

<a id="steps"></a>

## 手順

### 1. プラグインをインストールする

Exploratory Desktop で、画面の左下にある自分の名前を選び、開いたメニューで「システム設定」を選びます。左のメニューで MCP / CLI を選び、先に MCP のスイッチをオンにします（オフの間は、プラグインのインストールの欄のボタンを押せません）。続けて「Exploratory デスクトップ プラグインのインストール」の欄で、使う AI ツールの行の「インストール」を選びます。画面の画像は、[プラグインのインストール](/ja/mcp/desktop/install)にあります。

<a id="manual"></a>

#### システム設定からインストールできないとき

Exploratory Desktop がネットワークに接続できないなどの理由で、システム設定からインストールできないことがあります。そのときは、次のどちらかの方法で手作業でインストールしてから、手順 2 に進みます。

- AI アプリから入れる: [Claude アプリ](/ja/mcp/desktop/install#install-claude-app)、[ChatGPT アプリ（Codex）](/ja/mcp/desktop/install#install-chatgpt)、[Cursor](/ja/mcp/desktop/install#install-cursor) の手順に沿って入れます。
- コマンドで入れる: 次のコマンドをターミナルで実行します。AI ツールに頼んで実行してもらうこともできます。

**Claude Code**

```sh
claude plugin marketplace add exploratory-io/exploratory
claude plugin install exploratory@exploratory
```

**Codex**

```sh
codex plugin marketplace add exploratory-io/exploratory
codex plugin add exploratory@exploratory
```

Antigravity と Cursor は、[コマンドでインストールする](/ja/mcp/desktop/install#commands)を参照してください。

### 2. MCP をオンにする

同じ画面で、MCP のスイッチがオンになっていることを確かめます（初期状態ではオフです。手作業でインストールした場合は、ここでオンにします）。AI にチャート、ノートなどの作成や変更もさせたいときだけ、「作成、変更、削除を許可する」にもチェックを入れます。そして、画面の下の「保存」を選びます。

保存しないと、MCP のスイッチと「作成、変更、削除を許可する」の設定は効きません。ここでほかに決められることは、[許可の範囲と設定](/ja/mcp/desktop/permissions)を参照してください。

### 3. AI ツールを再起動して、接続を許可する

インストールした AI ツールを再起動します。AI ツールが初めて接続するときに、Desktop に「AI ツールが許可を求めています」という画面が出て、許可するかどうかを聞きます。自分で起動したアプリだけ「許可する」を選んでください。

AI ツールで、接続できたかを確かめます。

- Claude Code: /mcp を開き、exploratory-desktop が接続済みかを確かめます。
- Codex: codex mcp list を実行し、exploratory-desktop が一覧にあるかを確かめます。
- Antigravity: アプリの Customizations \> Installed に、プラグインが表示されているかを確かめます。
- Cursor: システム設定から入れた場合は、システム設定の Cursor の行に「インストール済み - v」とプラグインのバージョンが表示されているかを確かめます。手作業で入れた場合は、手順 4 のように、Cursor にデータフレームの一覧を頼んで確かめます。

### 4. AI にデータを見せる

Exploratory Desktop で、使いたいプロジェクトを開きます。そのうえで、AI ツールで次のように頼みます。

```text
開いている Exploratory のプロジェクトのデータフレームを一覧して
```

「作成、変更、削除を許可する」がオフでも動きます。

作成も試すときは、「作成、変更、削除を許可する」をオンにして保存し、自分のデータの列の棒グラフなど、チャートを頼みます。

<a id="trouble"></a>

## うまくいかないとき

- 呼び出しで MCP がオフと言われる: システム設定に戻り、MCP のスイッチをオンにして「保存」を選んだか確かめます。
- 道具が起動していないというエラーを返す: Exploratory Desktop を起動して、同じ会話で道具をもう一度使います。
- 承認の画面で「許可しない」を選んだ: 同じアプリは、5 分間、画面が出ないまま断られます。5 分たってからもう一度接続すると、画面がもう一度出ます。承認したアプリを取り消す方法は、[許可の範囲と設定](/ja/mcp/desktop/permissions#control)を参照してください。
- インストールに失敗する: その AI ツールの行に「インストールできませんでした」と出ます。[プラグインのインストール](/ja/mcp/desktop/install#failure)の「インストールに失敗したとき」を参照するか、[手作業でインストール](#manual)してください。

詳しくは[トラブルシューティング](/ja/mcp/desktop/troubleshooting)を参照してください。

<a id="next"></a>

## 次に読むもの

- [使い方](/ja/mcp/desktop/use) - そのまま使える依頼文と、AI が使う道具です。
- [許可の範囲と設定](/ja/mcp/desktop/permissions) - Desktop で決められることです。
- [データと権限](/ja/mcp/desktop/data) - 何が送られ、何が記録されるかです。

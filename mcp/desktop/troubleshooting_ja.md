# トラブルシューティング（Desktop）

Desktop MCP で表示されるメッセージと、その対処です。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| exploratory-mcp が見つからない | MCP をオンにした Exploratory Desktop v17 以降を起動します。コマンドはアプリの起動時に自動で入ります。そのあと、AI クライアントを起動し直します。 |
| AI クライアントから exploratory-mcp が見つからない（macOS） | Exploratory をディスクイメージから開いています。アプリケーションフォルダに移して起動し直すと、起動時にコマンドが入ります。 |
| Desktop の MCP のツールが、起動していないというエラーを返す | Exploratory Desktop を起動します。そのあと、同じ会話で、もう一度ツールを使います。 |
| MCP がオフだと表示される | システム設定 \> MCP / CLI で、「MCP」のスイッチをオンにします。 |
| Git was not found on this computer. Install Git and try again. | Antigravity のインストールは、Git でプラグインを取得します。Git を入れて、もう一度試します。 |
| A marketplace named "exploratory" is already registered from a different source … | メッセージに出ているコマンドで削除してから、もう一度「インストール」を選びます。 |
| Your organization's settings may not allow this marketplace. | 管理者に確認します。 |
| Claude Code のフックで node が見つからない | Node.js を入れて、node を PATH に通します。 |
| Desktop の MCP が想定どおりに動かない | Exploratory Desktop にサインインしているかを確認します。 |

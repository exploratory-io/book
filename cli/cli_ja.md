# Exploratory CLI

ターミナルから expl コマンドで Exploratory を使います。接続先は 2 つあります。最初に、どちらが必要かを決めます。

| | Server | Desktop |
| --- | --- | --- |
| 対象 | exploratory.io に公開したコンテンツ（ノート、ダッシュボード、データ） | このコンピューターで起動している Exploratory Desktop のプロジェクト |
| できること | 公開されたコンテンツを読み取る（expl server） | 読み取りに加えて、作成、変更、公開（expl） |
| サインイン | expl server login でサインインします | 専用のサインインはありません。Desktop を起動してサインインし、システム設定で CLI をオンにします |

- [Server](server/server_ja.md) - exploratory.io に公開されたコンテンツを読みます。
- [Desktop](desktop/desktop_ja.md) - このコンピューターの Exploratory Desktop のプロジェクトを扱います。

英語のページ: [Exploratory CLI](cli.md)

初めて使うときは、はじめるのページに進みます。Server では、先に[サインイン](server/login_ja.md)します。

- Desktop: [インストール](desktop/install_ja.md)、[はじめる](desktop/get-started_ja.md)
- Server: [インストール](server/install_ja.md)、[サインイン](server/login_ja.md)、[はじめる](server/get-started_ja.md)
- 共通フラグ: [Server](server/global-flags_ja.md)、[Desktop](desktop/global-flags_ja.md)
- 終了コードとエラー: [Server](server/exit-codes_ja.md)、[Desktop](desktop/exit-codes_ja.md)
- 更新: Desktop は[更新する](desktop/install_ja.md#update)、npm でインストールした expl は[更新する](server/install_ja.md#update)

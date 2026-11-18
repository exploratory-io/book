---
title: "Exploratory CLI"
---

ターミナルから expl コマンドで Exploratory を使います。接続先は 2 つあります。最初に、どちらが必要かを決めます。

| | Server | Desktop |
| --- | --- | --- |
| 対象 | exploratory.io に公開したコンテンツ（ノート、ダッシュボード、データ） | このコンピューターで起動している Exploratory Desktop のプロジェクト |
| できること | 公開されたコンテンツを読み取る（expl server） | 読み取りに加えて、作成、変更、公開（expl） |
| サインイン | expl server login でサインインします | 専用のサインインはありません。Desktop を起動してサインインし、システム設定で CLI をオンにします |

- [Server](/ja/cli/server) - exploratory.io に公開されたコンテンツを読みます。
- [Desktop](/ja/cli/desktop) - このコンピューターの Exploratory Desktop のプロジェクトを扱います。

初めて使うときは、はじめるのページに進みます。Server では、先に[サインイン](/ja/cli/server/login)します。

- Desktop: [インストール](/ja/cli/desktop/install)、[はじめる](/ja/cli/desktop/get-started)
- Server: [インストール](/ja/cli/server/install)、[サインイン](/ja/cli/server/login)、[はじめる](/ja/cli/server/get-started)
- 共通フラグ: [Server](/ja/cli/server/global-flags)、[Desktop](/ja/cli/desktop/global-flags)
- 終了コードとエラー: [Server](/ja/cli/server/exit-codes)、[Desktop](/ja/cli/desktop/exit-codes)
- 更新: Desktop は[更新する](/ja/cli/desktop/install#update)、npm でインストールした expl は[更新する](/ja/cli/server/install#update)

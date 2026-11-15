# Claude Code につなぐ

接続すると、AI から Exploratory に公開されたノートやデータを読めるようになります。Claude Code に Exploratory のサーバーを登録し、ブラウザでサインインします。
かかる時間は 3 分ほどです。Exploratory のアカウントと、Claude Code を用意してください。

<a id="need"></a>

## 必要なもの

- Exploratory のアカウント
- Claude Code
- API キーとクライアント ID は必要ありません。

<a id="steps"></a>

## 手順

### 登録してサインインする

プラグインやスキルを使わずに、サーバーだけを登録する方法です。

1. 次のコマンドを実行します。

   ```sh
   claude mcp add --transport http exploratory-server https://exploratory.io/mcp
   ```

Claude の公式のプラグイン一覧に Exploratory Server が掲載された場合は、そこからインストールすることもできます。インストール方法は 1 つだけにしてください。

2. 新しいセッションで、`/mcp` を開きます。
3. exploratory-server の接続を選びます。
4. ブラウザでサインインします。

### つながったことを確かめる

1. 新しいセッションで、次のように送信します。

   ```text
   Exploratory にある「Sales Orders」のデータを探して
   ```

Sales Orders のデータが URL 付きで表示されていれば、接続できています。

**CLI で同じ操作を実行した結果**

```sh
expl server search "Sales Orders" --scope all --type data --limit 3 --json
```

--json を付けると、search ツールが返した結果をそのまま出力します。長い出力は省略しています。

**実行結果**

```text
{
  "results": [
    {
      "id": "llS6nQK3aH",
      "title": "Sales Orders",
      "url": "https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH",
      "type": "data",
      "description": "One row is one order line item (an order can have several lines, line_no 1-3). Period: order_date from 2025-01-01 to 2026-10-31. Columns: order_id (order ID), line_no (line number within the order), order_date, ship_date (shipping date; can be later than the order date, up to 2026-11-04), custome...",
      "author": "Takato Shiroto",
      "team": null,
      "updated_at": "2026-11-12T09:26:51.086Z",
      "refreshed_at": "2026-11-12T08:12:13.528Z",
      "tags": [
        "sales",
        "orders",
        "english"
      ],
      "publication_version": "2026-11-12T09:26:51.086Z",
      "data_as_of": "2026-11-12T08:12:13.528Z",
      "columns": [
        {
          "name": "order_id",
          "type": "character",
          "description": "",
          "missing_count": 0
        },
        {
          "name": "line_no",
          "type": "numeric",
          "description": "",
          "missing_count": 0
        }
… (trimmed)
      ],
      "column_count": 14,
      "row_count": 23131
    }
  ],
  "has_more": false,
  "next_offset": null
}
```

スキルは、AI に操作の進め方を教える説明です。MCP の接続設定とは別のものです。

<a id="apikey"></a>

## API キーで接続する

ブラウザを開けない環境では、ブラウザでのサインインの代わりに、API キーでサーバーを登録します。キーは、アカウント設定 \> API キーで作ります。

```sh
claude mcp add --transport http exploratory-server https://exploratory.io/mcp --header "Authorization: Bearer exp_pat_..."
```

exp_pat_... は、作成したキーに置き換えます。キーがシェルの履歴に残ります。上の OAuth でのサインインか、この方法か、どちらか一方だけを使います。

- [API キーで接続する](../overview_ja.md#apikey) - キーで読めるものと、返ってくるエラーです。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| サインインを求められる | /mcp を開いて、もう一度サインインします。 |
| 同じツールが 2 組表示される | インストール方法は 1 つだけにします（公式のプラグイン、URL の直接追加、claude.ai のコネクタのいずれか）。あとから公式の一覧でインストールする場合は、先に直接追加した分を claude mcp remove exploratory-server で削除します。 |

- [トラブルシューティング](../troubleshooting_ja.md) - MCP Server 全体の、症状ごとの対処です。

<a id="remove"></a>

## 接続を解除する

```sh
claude mcp remove exploratory-server
```

登録を解除しても、アクセスの許可は残ります。許可も取り消すには、exploratory.io のアカウント設定の「接続中のAIアプリ」から、クライアントを解除します。

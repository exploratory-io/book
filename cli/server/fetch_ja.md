# expl server fetch

id を指定して、ノート、ダッシュボード、スライド、データを 1 件読みます。

<a id="examples"></a>

## 例

### ノートを読む

**ターミナル**

```sh
expl server fetch <id> --json
```

\<id\> は、検索結果に表示された id に置き換えます。

実行結果は、id が PNZ7eaY9SU のノート（Sales Orders Overview）で実行したものです。長い出力は省略しています。

**実行結果**

```text
{
  "id": "PNZ7eaY9SU",
  "title": "Sales Orders Overview",
  "text": "# Sales Orders Overview\n\n# Sales Orders Overview\n\nThis note summarizes the Sales Orders data. One row is one order line item (order_id + line_no). The data covers orders from 2025-01-01 to 2026-10-31 (23,131 line items, total sales of about 440.8 million).\n\n## Sales by region\n\n**Chart: Sales by Regi…",
  "url": "https://exploratory.io/note/GMq1Qom5tS/PNZ7eaY9SU",
  "metadata": {
    "scopes": {
      "A": "…"
    },
    "charts": [
      "…",
      "…"
    ],
    "context": {
      "publication_version": "2026-11-12T08:13:18.971Z",
      "data_as_of": "2026-11-12T08:13:19.186Z",
      "parameters": null,
      "dashboard_filters": "none"
    },
    "type": "note",
    "author": "山田 花子",
    "team": null,
    "created_at": "2026-11-12T08:13:18.971Z",
    "updated_at": "2026-11-12T08:13:18.971Z",
    "refreshed_at": "2026-11-12T08:13:19.186Z",
    "tags": []
  }
}
```

### 見出しを 1 つだけ読む

**ターミナル**

```sh
expl server fetch <id> --section s2 --json
```

s2 は、metadata.toc にある見出しの id に置き換えます。

同じノートの見出し s2（Sales by region）だけを返した結果です。このノートは短いため metadata.toc が返らず、見出し id の s2 は、下の --query の結果から取りました。

**実行結果**

```text
{
  "id": "PNZ7eaY9SU",
  "title": "Sales Orders Overview",
  "text": "# Sales Orders Overview > Sales by region\n\n## Sales by region\n\n**Chart: Sales by Region** (chart: `MzU3kks5`, type: bar)\n\nValues: sum of sales\n\n> [Computed summary]\n>\n> 8 region values (all rows). Total of sales: 440,826,130. Top: Kanto (148,695,040 33.7%), Kinki (74,050,840 16.8%), Chubu (72,023,380 16.3%). Bottom: Shikoku (19,857,430 4.5%), Chugoku (24,926,920 5.7%), Hokkaido (25,498,170 5.8%).\n\n| region | sales |\n…",
  "url": "https://exploratory.io/note/GMq1Qom5tS/PNZ7eaY9SU",
  "metadata": {
    "scopes": "…",
    "charts": "…",
    "context": "…",
    "type": "note",
    "author": "山田 花子",
    "team": null,
    "created_at": "2026-11-12T08:13:18.971Z",
    "updated_at": "2026-11-12T08:13:18.971Z",
    "refreshed_at": "2026-11-12T08:13:19.186Z",
    "tags": "…",
    "range": "…"
  }
}
```

### 言葉で探す

**ターミナル**

```sh
expl server fetch <id> --query "region" --json
```

どれかの語を含む段落を返します。

同じノートに --query "region" を付けて実行した結果です。条件に合う段落が、角かっこの中の見出しの id と見出しのパスとともに返ります。

**実行結果**

```text
{
  "id": "PNZ7eaY9SU",
  "title": "Sales Orders Overview",
  "text": "# Sales Orders Overview\n\n[s2 Sales Orders Overview > Sales by region]\n## Sales by region\n\n**Chart: Sales by Region** (chart: `MzU3kks5`, type: bar)\n\nValues: sum of sales\n\n> [Computed summary]\n>\n> 8 region values (all rows). Total of sales: 440,826,130. Top: Kanto (148,695,040 33.7%), Kinki (74,050,840 16.8%), Chubu (72,023,380 16.3%). Bottom: Shikoku (19,857,430 4.5%), Chugoku (24,926,920 5.7%), Hokkaido (25,498,170 …",
  "url": "https://exploratory.io/note/GMq1Qom5tS/PNZ7eaY9SU",
  "metadata": {
    "scopes": "…",
    "charts": "…",
    "context": "…",
    "type": "note",
    "author": "山田 花子",
    "team": null,
    "created_at": "2026-11-12T08:13:18.971Z",
    "updated_at": "2026-11-12T08:13:18.971Z",
    "refreshed_at": "2026-11-12T08:13:19.186Z",
    "tags": "…",
    "matches": "…"
  }
}
```

<a id="usage"></a>

## 書式

```text
expl server fetch <id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="flags"></a>

## 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 | 必須 | コンテンツの id です。検索結果などに出ます。コマンドのすぐあとに書くか、--id で渡します。 |
| `--language` | 文字列 |  | データの概要と列の説明を読む言語です。指定しないと、データの元の言語になります。その言語の文がないときは、もう一方の言語で返り、language_fallback が含まれます。 値: `ja`, `en` |
| `--section` | 文字列 |  | 見出しの id（s12 など）か、metadata.toc にある見出しの文字そのものです。ノート、ダッシュボード、スライドだけで使えます。 |
| `--cursor` | 文字列 |  | 長いノートの続きを読むための印です。前の結果の metadata.range.next_cursor の値を渡します。 |
| `--query` | 文字列 |  | ノートの中から探す言葉です。スペースで区切り、10 語までです。どれかに一致した段落を、一致する語が多い順に、見出しの経路つきで返します。語句は "..." で囲みます。著者が書いた本文だけが対象で、チャートの行や分析の表は含みません。 |
| `--include-toc` | 有効 / 無効 |  | 見出しの一覧（metadata.toc）を返します。section、cursor、query のどれも指定しないときだけ、既定で返ります。ノート、ダッシュボード、スライドだけで使えます。 |

<a id="paging"></a>

## 続きを取得する

長いノートは、--query で話題を探すか、--section で見出しを 1 つ指定して読みます。続きがあるときは、metadata.range.next_cursor の値を --cursor に渡します。metadata.truncated は、続きがあるときだけ含まれます。

<a id="output"></a>

## 出力

ノート、ダッシュボード、スライドは、本文、埋め込まれた各チャートの先頭の行、各アナリティクスの説明を Markdown で返します。metadata.charts と metadata.blocks に、チャートやアナリティクスの名前が入ります。データは、列、行数、サンプルの行、更新状況が入ります。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| 本文が長くて、必要な部分が見つからない | --query で話題を探すか、metadata.toc の見出しを --section で指定します。 |
| チャートやアナリティクスの名前がわからない | 結果の metadata.charts と metadata.blocks を確認します。 |
| Run "expl server login". | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

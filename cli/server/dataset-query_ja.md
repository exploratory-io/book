# expl server dataset query

データをサーバーで絞り込み、集計して、結果だけを返します。列の名前は、search か dataframe get-schema で確認します。

<a id="examples"></a>

## 例

### 地域ごとの行数を数える

**ターミナル**

```sh
expl server dataset query <dataset_id> --mode aggregate --dimensions '[{"column":"region"}]' --metrics '[{"function":"count_rows","alias":"n"}]' --sort '[{"field":"n","direction":"desc"}]' --limit 5 --json
```

\<dataset_id\> は対象のデータの id、region は実際の列の名前に置き換えます。JSON は、全体を単引用符（'）で囲みます。

**実行結果**

Sales Orders のデータ（id: hI6jK7lM8n）で実行した結果です。長い項目は省略して、見やすく整えています。

```text
{
  "dataset": { "id": "hI6jK7lM8n", "name": "Sales Orders", "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n" },
  "columns": [ { "name": "region", "type": "string" }, { "name": "n", "type": "integer" } ],
  "rows": [ ["Kanto", 7814], ["Kinki", 3890], ["Chubu", 3779], ["Kyushu-Okinawa", 2418], ["Tohoku", 1592] ],
  "result": { "row_count": 5, "has_more": true },
  "warnings": [ { "code": "RESULT_TRUNCATED", "message": "Additional rows exist. Refine the query." } ]
}
```

件数の多い順に 5 地域が返りました。上限（--limit 5）で切ったので、result.has_more が true になり、RESULT_TRUNCATED の警告が付いています。残りの地域も見るときは、--limit を増やすか、条件で絞り込みます。

### 全体の行数を数える

**ターミナル**

```sh
expl server dataset query <dataset_id> --mode aggregate --metrics '[{"function":"count_rows","alias":"n"}]' --json
```

dimensions を省くと、全体の 1 行が返ります。

**実行結果**

Sales Orders のデータ（id: hI6jK7lM8n）で実行した結果です。長い項目は省略して、見やすく整えています。

```text
{
  "dataset": { "id": "hI6jK7lM8n", "name": "Sales Orders", "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n" },
  "columns": [ { "name": "n", "type": "integer" } ],
  "rows": [ [23131] ],
  "result": { "row_count": 1, "has_more": false },
  "warnings": []
}
```

全体の行数は 23,131 行でした。

<a id="usage"></a>

## 書式

```text
expl server dataset query [<dataset_id>] [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="flags"></a>

## 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--dataset-id` | 文字列 | queries か datasets を使うとき以外は必須 | データの id です。検索結果などに出ます。コマンドのすぐあとに書くか、--dataset-id で渡します。 |
| `--mode` | 文字列 | queries を使うとき以外は必須 | rows: 条件に合う行を取得します。aggregate: dimensions でグループに分けて、metrics を計算します。 値: `rows`, `aggregate` |
| `--columns` | JSON |  | rows だけで使います。返す列の名前を、1〜50 個、重ならないように指定します。結合するときは alias と column で書きます。 |
| `--filters` | JSON |  | 絞り込みの条件です。条件 1 つか、{ "and": \[...\] } か { "or": \[...\] }（各 2 つ以上）で書きます。入れ子は 3 段まで、条件は全体で 20 個までです。結合するときは、結合のあとに適用されます。 |
| `--dimensions` | JSON |  | aggregate だけで使います。グループに分ける列を、0〜5 個指定します。{ "column": "列の名前" } の形で書きます。保存されている値のまま分けるので、日付から月や年を取り出してグループ化する指定はありません。指定しないと、全体で 1 行になります。 |
| `--metrics` | JSON | aggregate のときは必須 | aggregate だけで使い、必須です。計算を 1〜10 個指定します。function（count_rows、count、count_distinct、sum、avg、min、max）と、結果の名前になる alias を書きます。count_rows 以外は、column も指定します。 |
| `--sort` | JSON |  | 並べ替えです。3 つまで指定します。出力の列の名前を field、向きを direction で書きます。 |
| `--limit` | 整数 |  | 返す行数の上限です。rows は既定 100、最大 1,000。aggregate は既定 100、最大 500 です。続きを取得する指定はありません。残りがあるときは、絞り込みます。 |
| `--datasets` | JSON |  | 結合するデータと、それぞれの alias です。dataset_id の代わりに使います。2〜5 件。{ "id": ..., "alias": ... } の配列で書きます。 |
| `--root-alias` | 文字列 |  | 結合の出発点にするデータの alias です。省略すると、datasets の最初のデータです。 |
| `--joins` | JSON | datasets を使うときは必須 | 結合の種類（inner、left、right、full）、左右の alias、キーにする列を書きます。2 つ目以降のデータごとに、1 つずつ必要です。 |
| `--source-filters` | JSON |  | 結合の前に、データごとに行を絞ります。alias ごとに、そのデータの列名で条件を書きます。left join で、行を落としたくない側の条件に使います。 |
| `--allow-many-to-many` | 有効 / 無効 |  | 結合のキーが両側で重複し、行が増えることを承知しているときだけ、有効にします。 |
| `--queries` | JSON |  | 独立した問い合わせを、1 回の呼び出しにまとめます。5 件までで、サーバー上で並行して実行されます。各問い合わせは、dataset_id（結合する場合は datasets）と、単独の問い合わせと同じ項目を持ちます。 |
| `--include-answer-context` | 有効 / 無効 |  | 既定は有効です。無効にすると、結果に answer_context（問い合わせの解釈や、列の説明・単位などをまとめたもの）を付けません。警告は無効にしても付きます。answer_context を返す設定のサーバーでだけ使えます。 |
| `--language` | 文字列 |  | answer_context に入る、説明・単位・ラベル・指標の名前の言語です。ja か en で指定します。省略すると、データの基本の言語になります。そのデータにない言語の文は、もう一方の言語で返り、その印が付きます。answer_context を返す設定のサーバーでだけ使えます。 値: `ja`, `en` |

<a id="json-arguments"></a>

## JSON の引数の書き方

以下は JSON の入力書式です。\< \> の部分をデータの id、列名、値に置き換えます。実行結果ではありません。コマンドの単引用符を使う例は bash 形式です。PowerShell や cmd では、引用符の書き方が bash と異なり、単引用符を使う例はそのまま動かないことがあります。その場合は、JSON をファイルに保存して、--input で渡してください。

### 条件を指定する: filters

**JSON**

```text
{
  "column": "<column>",
  "operator": "eq",
  "value": "<value>"
}
```

column は列名、operator は比較方法、value は比較する値です。結合後の列は column に alias と column を持つオブジェクトで指定します。

### 結合するデータ: datasets

**JSON**

```text
[
  {
    "id": "<left_id>",
    "alias": "<left_alias>"
  },
  {
    "id": "<right_id>",
    "alias": "<right_alias>"
  }
]
```

### 結合条件: joins

**JSON**

```text
[
  {
    "type": "left",
    "left_alias": "<left_alias>",
    "right_alias": "<right_alias>",
    "on": [
      {
        "left_column": "<left_column>",
        "right_column": "<right_column>"
      }
    ]
  }
]
```

結合では dataset_id の代わりに datasets を渡します。左右の alias は datasets の指定と合わせ、on には対応する列名を指定します。キーが両側で重複すると行が増えるため、集計前にキーを確認してください。

<a id="paging"></a>

## 続きを取得する

ページ送りはありません。結果の has_more が true のときは、絞り込むか、集計します。多くの行がほしいときは、dataframe export でファイルにします。

<a id="output"></a>

## 出力

結果は正確で、データのバージョン（dataset.version）と更新時刻（dataset.updated_at）が付きます。どのバージョンのデータで計算したかを、数値といっしょに伝えてください。結合したときは、元のデータ、出力の列の出どころ、結合の前後の行数も付きます。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| Each dimension must be an object like { "column": "region" }. (INVALID_QUERY) | dimensions は、{ "column": "列の名前" } の形のオブジェクトの配列にします。 |
| Unknown property "aggregation" in a metric. (INVALID_AGGREGATION) | metrics では、function と alias を指定します。count_rows 以外は column も指定します。 |
| alias is required: letters, digits and underscores, not starting with a digit, at most 64 characters. (INVALID_AGGREGATION) | alias は必須です。英字、数字、_ だけで、数字で始めず、64 文字までにします。 |
| Unknown property "by" in a sort entry. (INVALID_SORT) | sort の項目では、出力の列の名前を field で指定します。column、by、alias、name、metric は使えません。 |
| DATASET_UNAVAILABLE | このデータは、全データを含めずに公開されているため、サーバーでは問い合わせできません。公開した人が、今の Exploratory Desktop でデータを公開し直す必要があります。 |
| Run "expl server login". | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

# 結果をファイルに保存する

データの絞り込みや集計の結果を、CSV または Parquet のファイルとして保存し、ダウンロードリンクを取得します。

<a id="steps"></a>

## 2 つの手順

### 1. ファイルとして保存する

dataframe export は、dataset query と同じ指定で絞り込みや集計を行い、結果をファイルにします。結果が大きく、dataset query では取得しきれない場合に使用します。

```sh
expl server dataframe export <dataset_id> --mode rows --limit 5 --json
```

\<dataset_id\> は、データの id に置き換えます。実行結果は、データ Sales Orders（id は llS6nQK3aH）で実行したものです。download_url（ダウンロードリンク）の行は省略しています。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "llS6nQK3aH",
    "type": "data",
    "title": "Sales Orders"
  },
  "summary": "Saved 5 rows (0.0 MB, CSV). The link expires at 2026-11-12T11:01:46.125Z.",
  "result": {
    "format": "csv",
    "rows": 5,
    "bytes": 687,
    "source": "full",
    "dataset_version": "20261112T092646Z-72836d02",
    "data_as_of": "2026-11-12T08:12:13.528Z",
    "expires_at": "2026-11-12T11:01:46.125Z",
… (trimmed)
    "query": {
      "mode": "rows",
      "limit": 5
    }
  },
  "warnings": [],
  "url": "https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH"
}
```

ダウンロードリンクは 15 分間有効で、サインインしている同じユーザーだけが使用できます。形式は --format で指定します。既定は csv で、UTF-8（BOM 付き）のため、Excel で正しく開けます。ファイルの保存先は --output で指定します。

> result に rows と expires_at が表示されていれば、保存できています。

### 2. ダウンロードが許可されていない場合

公開した人がファイルとしてのダウンロードを許可していないデータでは、dataframe export は DATA_EGRESS_LIMIT で失敗します。

```sh
expl server dataframe export <dataset_id> --mode rows --limit 5 --json
```

実行結果は、id が US-Home-Sales-1963-2016-rdf5jJK9vj のデータで実行したものです。

**実行結果**

```text
{
  "success": false,
  "error_code": "DATA_EGRESS_LIMIT",
  "message": "The publisher does not allow downloading this data as a file.",
  "details": {
    "url": "https://exploratory.io/data/GMq1Qom5tS/US-Home-Sales-1963-2016-rdf5jJK9vj"
  },
  "suggested_actions": [
    "Use fetch or dataframe_get_schema for what the publisher shares",
    "Ask the user to open the URL in the browser"
  ]
}
```

この場合は、fetch または dataframe get-schema で、公開した人が共有している内容を確認するか、URL をブラウザで開きます。

> error_code が DATA_EGRESS_LIMIT であれば、このデータはファイルとして保存できません。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| DATA_EGRESS_LIMIT | 公開した人が、このデータをファイルとしてダウンロードすることを許可していません。fetch または dataframe get-schema で、公開した人が共有している内容を確認するか、URL をブラウザで開きます。 |
| SERVER_BUSY | ほかの書き出しが実行中か、1 時間あたりの書き出しの上限に達しています。書き出しは、1 人につき同時に 1 つだけ実行できます。数秒おいてから再度実行します。上限に達した場合は、最大 1 時間待ちます。 |
| Run "expl server login". | サインインしていないか、保存したログイン情報または API キーが拒否されています。expl server login を実行します。 |

- [dataframe export](../dataframe-export_ja.md) - すべてのフラグを説明しています。
- [dataset query](../dataset-query_ja.md) - 絞り込みと集計の指定方法を説明しています。

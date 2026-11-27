---
title: "アナリティクスの結果を取得する"
---

公開されたダッシュボードやノートに含まれるアナリティクス（回帰、相関、カイ二乗検定など）の結果を、構造化されたデータとして取得します。

<a id="steps"></a>

## 2 つの手順

### 1. アナリティクスの名前を確認する

fetch を実行します。結果の metadata.blocks のうち、kind が analytics のものに、アナリティクスの名前（name）とアナリティクスの種類（analysis_type）が含まれます。次の手順では、タイトルではなく name を指定します。

```sh
expl server fetch <id> --json
```

\<id\> は、検索結果に表示された id に置き換えます。実行結果は、ダッシュボード Sales Orders Dashboard（id は pQ9rS0tU1v）で実行したものです。長い出力は省略しています。

**実行結果**

```text
{
  "id": "pQ9rS0tU1v",
  "title": "Sales Orders Dashboard",
  "text": "# Sales Orders Dashboard\n\n### Total Sales\n\n**Chart: Total Sales** (chart: `cD4eF5gH`, type: singlevalue)\n…
  "url": "https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v",
  "metadata": {
    "blocks": [
… (trimmed)
      {
        "id": "b18",
        "kind": "analytics",
        "name": "oP8qR9sT",
        "title": "Monthly Sales Forecast",
        "analysis_type": "do_prophet"
… (trimmed)
```

> kind が analytics のブロックに name が表示されていれば、名前を確認できています。

### 2. 結果を取得する

確認した name を `--analytics` に指定して、analytics get-result を実行します。

```sh
expl server analytics get-result <id> --analytics <analytics> --limit 3 --json
```

\<id\> はダッシュボードなどの id、\<analytics\> はアナリティクスの name に置き換えます。実行結果は、アナリティクスが oP8qR9sT（Monthly Sales Forecast、do_prophet）のものです。長い出力は省略しています。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "pQ9rS0tU1v",
    "type": "dashboard",
    "title": "Sales Orders Dashboard"
  },
  "summary": "Result of do_prophet \"Monthly Sales Forecast\": 2 table(s) (summary, table).",
  "result": {
    "analytics_id": "oP8qR9sT",
    "analysis_type": "do_prophet",
    "has_result": true,
    "model_definition": {
      "target": null,
      "predictors": [],
      "columns": [],
      "n": null
    },
    "tables": {
      "summary": {
        "name": "Summary",
        "headers": [
          "RMSE",
          "MAE",
          "MAPE (Ratio)",
          "R Squared",
          "Number of Rows"
        ],
        "columns": [
          {
            "id": "RMSE",
            "label": "RMSE"
          },
          {
            "id": "MAE",
            "label": "MAE"
          },
          {
            "id": "MAPE (Ratio)",
            "label": "MAPE (Ratio)"
          },
          {
            "id": "R Squared",
            "label": "R Squared"
          },
          {
            "id": "Number of Rows",
            "label": "Number of Rows"
          }
        ],
        "split_column": null,
        "rows": [
          [
            2411505.183760287,
            1661750.1861800158,
            0.083331526547,
            0.15185702612,
            22
          ]
        ],
        "total_row_count": 1,
        "rows_truncated": false,
        "row_level": false
      },
… (trimmed)
    "row_level": true,
    "summary_fields": {
      "test_period": 10,
      "rmse": 2411505.18,
      "mae": 1661750.19,
      "mape": 0.08,
      "mape_pct": 8,
      "r_squared": 0.15,
      "r_squared_pct": 15,
      "n": 22,
      "period": 6
    },
… (trimmed)
    "precision": "as_displayed",
    "title": "Monthly Sales Forecast",
… (trimmed)
```

結果には、モデルの定義（目的変数、説明変数、N）、列の ID が固定された結果の表、学習データとテストデータに分けた主要な統計量、実行時の設定、説明の文（数値から作ったものか、AI が作ったものかの印つき）が含まれます。数値は表示されたとおりの値で、係数は標準化されていません。この例は時系列の予測であるため、model_definition の target と predictors は空です。

`--limit` は、表ごとの最大行数です（最大 100 行）。続きを取得する方法はありません。既定では、分析の答えとなる表が返ります。返す表を指定する場合は、available_tables の id を `--tables` に指定します。

> result.tables に結果の表が表示されていれば、取得できています。

<a id="trouble"></a>

## トラブルシューティング

| 症状 | 対処 |
| --- | --- |
| アナリティクスの名前が分からない | fetch の結果の metadata.blocks を確認します。 |
| `Run "expl server login".` | サインインしていないか、保存したログイン情報または API キーが拒否されています。expl server login を実行します。 |

すべてのフラグは、[analytics get-result](/ja/cli/server/commands#analytics-get-result)で説明しています。

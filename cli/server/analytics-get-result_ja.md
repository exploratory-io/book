# expl server analytics get-result

アナリティクス（回帰、相関、カイ二乗検定など）の結果を、プログラムで扱える形式のデータで取得します。

<a id="examples"></a>

## 例

### アナリティクスの結果を取得する

**ターミナル**

```sh
expl server analytics get-result <id> --analytics <analytics> --limit 3 --json
```

\<id\> はノートなどの id、\<analytics\> は fetch の結果にあるアナリティクスの名前に置き換えます。

実行結果は、単独で公開されているアナリティクス Analytics 1 - Correlations（id が Analytics-1-Correlations-aB1cD2eF）で実行したものです。単独で公開されているため、--analytics は指定していません。長い出力は省略しています。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "Analytics-1-Correlations-aB1cD2eF",
    "type": "analytics",
    "title": "Analytics 1 - Correlations"
  },
  "summary": "Result of do_cor \"Analytics 1\": 1 table(s) (heatmap).",
  "result": {
    "analytics_id": "uV0wX1yZ",
    "analysis_type": "do_cor",
    "has_result": true,
    "model_definition": {
      "target": null,
      "predictors": [],
      "columns": [
        "Sales",
        "Quantity",
        "Discount"
      ],
      "n": null
    },
    "tables": {
      "heatmap": {
        "name": "Correlations",
        "headers": [
          "pair.name.x",
          "pair.name.y",
          "correlation"
        ],
        "columns": [
          {
            "id": "pair.name.x",
            "label": "pair.name.x"
          },
          {
            "id": "pair.name.y",
            "label": "pair.name.y"
          },
          {
            "id": "correlation",
            "label": "correlation"
          }
        ],
        "split_column": null,
        "rows": [
          [
            "Sales",
            "Sales",
            1
          ],
          [
            "Sales",
            "Sales Comp",
            0.76782797841
          ],
          [
            "Sales",
            "Marketing",
            0.75210090599
          ]
        ],
        "total_row_count": 25,
        "rows_truncated": true,
        "row_level": false
      }
    },
    "row_level": false,
    "summary_fields": {
      "baseline_p": 0.05,
      "baseline_p_pct": 5
    },
    "available_tables": [
      {
        "id": "heatmap",
        "name": "Correlations",
        "marker": "heatmap",
        "included": true,
        "row_level": false
      },
      {
        "id": "significance",
        "name": "Significance",
        "marker": "scatter",
        "included": false,
        "row_level": true
      },
      {
        "id": "scattermatrix",
        "name": "Scatter Matrix",
        "marker": "scattermatrix",
        "included": false,
        "row_level": true
      }
    ],
    "precision": "as_displayed",
    "title": "Analytics 1",
    "settings": {
      "target": null,
      "predictors": [],
      "params": {
        "columns": [
          "Sales",
          "Quantity",
          "Discount"
        ],
        "method": "pearson",
        "variable_order": "correlation",
        "distinct": "FALSE",
        "diag": "TRUE",
        "distinct_p_value": "TRUE",
        "diag_p_value": "FALSE"
      },
      "source": {
        "step": "MariaDB_MySQL_Source1"
      },
      "filters": []
    },
    "texts": [
      {
        "source": "generated",
        "kind": "explanation",
        "text": "\n\n# サマリ\n\n選択された変数を対象に相関分析を行いました。\n\n## 分析条件とデータの確認\n\n_[chart omitted]_\n\n相関係数は[設定](//analytics/settings/do_cor_argo)より変更できます。\n\n# 相関の強さ\n\n全ての変数の組み合わせの相関係数を計算し、それらを以下のヒートマップと呼ばれる…"
      }
    ],
    "unsupported": [],
    "context": {
      "publication_version": "2025-06-05T12:17:37.781Z",
      "data_as_of": "2026-11-14T15:01:23.274Z",
      "parameters": {
        "applied": true,
        "values": [
          {
            "name": "Shipmodes",
            "display_name": "Shipmodes（This will not affect SQL）",
            "value": [
              "Same Day",
              "Second Class",
              "Standard Class"
            ]
          }
        ],
        "note": "Values as published. A viewer who changes the parameters in the browser sees different results."
      },
      "dashboard_filters": "none"
    }
  },
  "warnings": [],
  "url": "https://exploratory.io/viz/exploratory/Analytics-1-Correlations-aB1cD2eF"
}
```

<a id="usage"></a>

## 書式

```text
expl server analytics get-result <id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="flags"></a>

## 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 | 必須 | アナリティクスを含むノート、ダッシュボード、スライドの id です。アナリティクス単体で公開したものは、その id です。コマンドのすぐあとに書くか、--id で渡します。 |
| `--analytics` | 文字列 |  | ノート、ダッシュボード、スライドの中のアナリティクスの名前です。fetch の結果の metadata.blocks\[\].name にあります。 |
| `--tables` | 値の配列 |  | 返す表の id のリストです（available_tables\[\].id）。指定しないと、分析の答えになる表を返します。 |
| `--limit` | 整数 |  | 表ごとの行数の上限です。100 までです。 |

<a id="paging"></a>

## 続きを取得する

表ごとの行数を --limit で絞れます。続きを取得する指定はありません。

<a id="output"></a>

## 出力

モデルの定義（目的変数、説明変数、N）、安定した列 id を持つ結果の表、学習用とテスト用に分けた主要な統計量、実行したときの設定、説明の文が入ります。説明の文には、数値から作ったものか、AI が作ったものかの印が付きます。数値は表示されたとおりの桁で、係数は標準化されていません。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| アナリティクスの名前がわからない | fetch の結果の metadata.blocks を確認します。 |
| Run "expl server login". | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

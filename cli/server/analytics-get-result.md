# expl server analytics get-result

Get the result of an analytics (regression, correlation, chi-square test and so on) as structured data.

<a id="examples"></a>

## Examples

### Get an analytics result

**Terminal**

```sh
expl server analytics get-result <id> --analytics <analytics> --limit 3 --json
```

Replace \<id\> with the id of the note and \<analytics\> with an analytics name from the result of fetch.

The result below was run on the analytics Analytics 1 - Correlations (id Analytics-1-Correlations-aB1cD2eF), which is published on its own, so --analytics is not passed. Long output is trimmed.

**Result**

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

## Usage

```text
expl server analytics get-result <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the note, dashboard or slide that holds the analytics, or of an analytics published on its own. Write it right after the command or pass it with --id. |
| `--analytics` | string |  | The name of an analytics inside a note, dashboard or slide. It is metadata.blocks\[\].name in the result of fetch. |
| `--tables` | scalarArray |  | The ids of the tables to return (available_tables\[\].id). By default it returns the tables that answer the analysis. |
| `--limit` | integer |  | The maximum number of rows per table, up to 100. |

<a id="paging"></a>

## More results

Use --limit to cap the rows of each table. There is no way to page through the rest.

<a id="output"></a>

## Output

The result holds the model definition (target, predictors, N), result tables with stable column ids, headline statistics split into training and test, the settings it ran with, and explanation texts marked as generated or AI-generated. Values are as displayed, and coefficients are unstandardized.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| You do not know the name of the analytics | Look at metadata.blocks in the result of fetch. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

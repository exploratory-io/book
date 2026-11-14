# Get analytics results

Get the result of an analytics (regression, correlation, chi-square test and so on) in a published dashboard or note as structured data.

<a id="steps"></a>

## Two steps

### 1. Find the analytics name

Run fetch. In metadata.blocks of the result, the entries whose kind is analytics hold the name of the analytics and its analysis_type. In the next step, pass the name, not the title.

```sh
expl server fetch <id> --json
```

Replace \<id\> with an id from a search result. The result below was run on the dashboard Sales Orders Dashboard (id sjO4NsW7kb). Long output is trimmed.

**Result**

```text
{
  "id": "sjO4NsW7kb",
  "title": "Sales Orders Dashboard",
  "text": "# Sales Orders Dashboard\n\n### Total Sales\n\n**Chart: Total Sales** (chart: `Led2toc6`, type: singlevalue)\n…
  "url": "https://exploratory.io/dashboard/GMq1Qom5tS/sjO4NsW7kb",
  "metadata": {
    "blocks": [
… (trimmed)
      {
        "id": "b18",
        "kind": "analytics",
        "name": "TQj8cbG4",
        "title": "Monthly Sales Forecast",
        "analysis_type": "do_prophet"
… (trimmed)
```

> If the block with kind analytics shows a name, you have the name.

### 2. Get the result

Pass the name to --analytics and run analytics get-result.

```sh
expl server analytics get-result <id> --analytics <analytics> --limit 3 --json
```

Replace \<id\> with the id of the dashboard and \<analytics\> with the name of the analytics. The result below is for the analytics TQj8cbG4 (Monthly Sales Forecast, do_prophet). Long output is trimmed.

**Result**

```text
{
  "success": true,
  "item": {
    "id": "sjO4NsW7kb",
    "type": "dashboard",
    "title": "Sales Orders Dashboard"
  },
  "summary": "Result of do_prophet \"Monthly Sales Forecast\": 2 table(s) (summary, table).",
  "result": {
    "analytics_id": "TQj8cbG4",
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

The result holds the model definition (target, predictors, N), result tables with stable column ids, headline statistics split into training and test, the settings it ran with, and explanation texts marked as generated or AI-generated. Values are as displayed, and coefficients are unstandardized. This example is a time series forecast, so target and predictors in model_definition are empty.

--limit is the maximum number of rows per table (up to 100). There is no way to read on. By default it returns the tables that answer the analysis. To choose tables, pass ids from available_tables to --tables.

> If result.tables holds result tables, you have the result.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| You do not know the name of the analytics | Look at metadata.blocks in the result of fetch. |
| Run "expl server login". | Sign-in is missing, or the saved login or API key was rejected. Run expl server login. |

- [analytics get-result](../analytics-get-result.md) - Describes every flag.

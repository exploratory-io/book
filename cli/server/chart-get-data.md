# expl server chart get-data

Get the data of a chart together with what the numbers mean.

<a id="examples"></a>

## Examples

### Get the first 5 rows of a chart

**Terminal**

```sh
expl server chart get-data <id> --chart <chart> --limit 5 --json
```

Replace \<id\> with the id of the note and \<chart\> with a chart name from the result of fetch.

The result below was run on the chart MzU3kks5 (Sales by Region) in the dashboard Sales Orders Dashboard (id sjO4NsW7kb). Long output is trimmed.

**Result**

```text
{
  "success": true,
  "item": {
    "id": "sjO4NsW7kb",
    "type": "dashboard",
    "title": "Sales Orders Dashboard"
  },
  "summary": "Returned 5 of 8 rows of chart \"Sales by Region\". To aggregate instead of paging, use chart_query with the same id and chart.",
  "result": {
    "chart": {
      "name": "MzU3kks5",
      "title": "Sales by Region",
      "type": "bar",
      "data_granularity": "aggregated",
      "encoding": [
        {
          "role": "x",
          "column": "region",
          "label": "region",
          "csv_column": "region"
        },
        {
          "role": "y",
          "column": "sales",
          "label": "sales",
          "aggregation": "sum",
          "csv_column": "sales"
        }
      ],
      "filters": [],
      "filter_logic": "and",
      "unsupported": []
    },
    "context": {
      "publication_version": "2026-11-12T09:29:37.157Z",
      "data_as_of": "2026-11-12T08:13:36.612Z",
      "parameters": null,
      "dashboard_filters": "none",
      "chart_parameters": [],
      "data": {
        "scope": "A",
        "data_frame": "Sales Orders",
        "step": null,
        "period": null,
        "row_filters": []
      }
    },
    "data_shared": true,
    "columns": [
      "region",
      "sales"
    ],
    "rows": [
      [
        "Kanto",
        148695040
      ],
      [
        "Kinki",
        74050840
      ],
      [
        "Chubu",
        72023380
      ]
    ],
    "offset": 0,
    "returned": 5,
    "has_more": true,
    "row_count": 8,
    "query": {
      "available": true,
      "reason": null,
      "columns": [
        {
          "name": "region",
          "type": "string"
        },
        {
          "name": "sales",
          "type": "integer"
        }
      ],
      "total_rows": {
        "excluded": 0,
        "detection": "not_applicable"
      }
    }
  },
  "warnings": [],
  "url": "https://exploratory.io/dashboard/GMq1Qom5tS/sjO4NsW7kb"
}
```

<a id="usage"></a>

## Usage

```text
expl server chart get-data <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the note, dashboard or slide that holds the chart, or of a chart published on its own. Write it right after the command or pass it with --id. |
| `--chart` | string |  | The name of a chart inside a note, dashboard or slide. It is metadata.charts\[\].name in the result of fetch. |
| `--offset` | integer |  | The number of rows to skip, counted from 0. |
| `--limit` | integer |  | The number of rows to return, up to 100. |

<a id="paging"></a>

## More results

Pass the number of rows you have already read to offset to read on. One call returns at most 100 rows.

<a id="output"></a>

## Output

Besides the rows, the result explains the numbers: chart.encoding (column, aggregation and number format per shelf), chart.filters, chart.data_granularity (aggregated or row level), chart.unsupported (what cannot be returned) and context (publication, data time and parameter values). The numbers are the values as published; results for other parameter values in the browser are not available. A chart published on its own returns a sample of the rows used to draw it (up to 10,000), not aggregated values, so do not add the rows up as a total.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| You need totals, sorting or filtering | Use chart query. |
| DATA_EGRESS_LIMIT | The publisher does not share the rows of this data. Use its charts, analytics or summary instead. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

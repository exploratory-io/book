---
title: "Get chart numbers"
---

For a chart in a published dashboard or note, get its numbers, aggregate them on the server, and get its image.

<a id="steps"></a>

## Two steps

### 1. Find the chart name

Run fetch with the id of the dashboard or note. In the result, metadata.charts holds the name, the aggregation (values) and the filters of each chart.

```sh
expl server fetch <id> --json
```

Replace \<id\> with an id from a search result. The result below was run on the dashboard Sales Orders Dashboard (id pQ9rS0tU1v). Long output is trimmed.

**Result**

```text
{
  "id": "pQ9rS0tU1v",
  "title": "Sales Orders Dashboard",
  "text": "# Sales Orders Dashboard\n\n### Total Sales\n\n**Chart: Total Sales** (chart: `cD4eF5gH`, type: singlevalue)\n\nValues: sum of sales\n\n| sales |\n| --- |\n| 440826130 |…,
  "url": "https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v",
  "metadata": {
    … (trimmed),
    "charts": [
      {
        "name": "cD4eF5gH",
        "title": "Total Sales",
        "type": "singlevalue",
        "values": [
          {
            "column": "sales",
            "label": "sales",
            "aggregation": "sum"
          }
        ],
        "row_count": 1,
        "queryable": true
      },
      {
        "name": "qR0sT1uV",
        "title": "Monthly Sales Trend",
        "type": "line",
        "values": [
          {
            "column": "sales",
            "label": "sales",
            "aggregation": "sum"
          }
        ],
        "row_count": 22,
        "queryable": true
      },
      … (trimmed)
    ],
    "context": {
      "publication_version": "2026-11-12T08:22:40.602Z",
      "data_as_of": "2026-11-12T08:13:36.612Z",
      "parameters": null,
      "dashboard_filters": "none"
    },
    "type": "dashboard",
    "author": "Alex Kim",
    "team": null,
    "created_at": "2026-11-12T08:13:36.316Z",
    "updated_at": "2026-11-12T08:22:40.602Z",
    "refreshed_at": "2026-11-12T08:13:36.612Z",
    "tags": [],
    … (trimmed)
  }
}
```

> If metadata.charts lists the name of each chart, you have the chart names.

### 2. Get the numbers

Pass a name to `--chart` and run chart get-data.

```sh
expl server chart get-data <id> --chart <chart> --limit 5 --json
```

Replace \<id\> with the id of the dashboard and \<chart\> with the name of the chart. The result below is for the chart qR0sT1uV (Monthly Sales Trend) in the dashboard with the id pQ9rS0tU1v. Long output is trimmed.

**Result**

```text
{
  "success": true,
  "item": {
    "id": "pQ9rS0tU1v",
    "type": "dashboard",
    "title": "Sales Orders Dashboard"
  },
  "summary": "Returned 5 of 22 rows of chart \"Monthly Sales Trend\".",
  "result": {
    "chart": {
      "name": "qR0sT1uV",
      "title": "Monthly Sales Trend",
      "type": "line",
      "data_granularity": "aggregated",
      "encoding": [
        {
          "role": "x",
          "column": "order_date",
          "label": "order_date",
          "aggregation": "monthname_with_year",
          "csv_column": "order_date"
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
      "publication_version": "2026-11-12T08:22:40.602Z",
      "data_as_of": "2026-11-12T08:13:36.612Z",
      "parameters": null,
      "dashboard_filters": "none"
    },
    "data_shared": true,
    "columns": [
      "order_date",
      "sales"
    ],
    "rows": [
      [
        "2025-01",
        17994220
      ],
      [
        "2025-02",
        14191900
      ],
      [
        "2025-03",
        20790580
      ],
      [
        "2025-04",
        20476270
      ],
      [
        "2025-05",
        16507690
      ]
    ],
    "offset": 0,
    "returned": 5,
    "has_more": true,
    "row_count": 22
… (trimmed)
```

rows holds the numbers, and chart.encoding the column and aggregation of each axis. context holds the publication time, the data time and the parameter values. The numbers are the values as published.

When has_more is true, there are more rows. Pass the number of rows you have already read to `--offset` to read on. One call returns at most 100 rows.

> If the first 5 rows are in rows, you have the numbers.

<a id="aggregate"></a>

## Aggregate (optional)

For totals, rankings or the rows that match a condition, use chart query. It takes the same inputs as dataset query.

```sh
expl server chart query --id <id> --chart <chart> --mode aggregate --dimensions '[{"column":"region"}]' --metrics '[{"function":"sum","column":"sales","alias":"sales"}]' --sort '[{"field":"sales","direction":"desc"}]' --limit 3 --json
```

Replace \<id\> and \<chart\> with the id of the dashboard and the name of the chart. Take column names from query.columns in the result of chart get-data. The result below is for the chart kL8mN9oP (Sales by Region). The top 3 regions match the first 3 rows of the chart.

**Result**

```text
{
  "query_id": "cq_d16081f8",
  "chart": {
    "item_id": "pQ9rS0tU1v",
    "item_title": "Sales Orders Dashboard",
    "item_type": "dashboard",
    "name": "kL8mN9oP",
    "title": "Sales by Region",
    "type": "bar",
    "data_granularity": "aggregated",
    "url": "https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v",
    "version": "20261112T082240Z-3fc872d2",
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
    "filter_logic": "and"
  },
  "context": {
    "publication_version": "2026-11-12T08:22:40.602Z",
    "data_as_of": "2026-11-12T08:13:36.612Z",
    "parameters": null,
    "dashboard_filters": "none"
  },
  "columns": [
    {
      "name": "region",
      "type": "string",
      "role": "x"
    },
    {
      "name": "sales",
      "type": "integer",
      "source": {
        "function": "sum",
        "column": "sales"
      }
    }
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
  "result": {
    "row_count": 3,
    "has_more": true,
    "source_row_count": 8
  },
  "warnings": [
    {
      "code": "RESULT_TRUNCATED",
      "message": "Additional rows exist. Refine the query."
    }
  ]
}
```

The table queried is the chart's table as published. If you sum or average a column the chart already averaged, counted distinct or computed as a ratio, the warning CHART_REAGGREGATION appears. Then say so when you report the result, or use result.excluded_totals.

When result.has_more is true, there are rows that are not in the result. There is no paging, so narrow the filters or aggregate. The warning RESULT_TRUNCATED above shows this case.

> If the aggregated result is in rows, the query worked.

<a id="image"></a>

## See the shape of the chart (optional)

To see the trend or layout of a chart, get its image.

```sh
expl server chart get-image <id> --chart <chart> --json
```

Example of the output shape; values are illustrative. The example is for the chart qR0sT1uV (Monthly Sales Trend). The image_path line (where the image is saved) is trimmed.

**Result**

```text
{
  "success": true,
  "item": {
    "id": "pQ9rS0tU1v",
    "type": "dashboard",
    "title": "Sales Orders Dashboard"
  },
  "summary": "Returned the image of chart \"Monthly Sales Trend\" (600x400).",
  "result": {
    "chart": {
      "name": "qR0sT1uV",
      "title": "Monthly Sales Trend",
      "type": "line"
    },
    "data_shared": true,
    "image": {
      "mime_type": "image/png",
      "width": 600,
      "height": 400,
      "original_width": 600,
      "original_height": 400,
      "bytes": 41970,
      "resized": false,
      "captured_at": "2026-11-12T09:26:51.086Z",
      "may_be_stale": true
    },
    "context": {
      "publication_version": "2026-11-12T09:26:51.086Z",
      "data_as_of": "2026-11-14T22:02:56.899Z",
      "parameters": {
        "applied": true,
        "values": [
          {
            "name": "Start_Date",
            "display_name": "Start_Date",
            "value": [
              "2017-01-01"
            ]
          },
          {
            "name": "End_Date",
            "display_name": "End_Date",
            "value": [
              "2020-12-31"
            ]
          },
          {
            "name": "Market",
            "display_name": "Market",
            "value": []
          }
        ],
        "note": "Values as published. A viewer who changes the parameters in the browser sees different results."
      },
      "dashboard_filters": "none"
    }
  },
  "warnings": [
    "The image is the chart as saved when it was published. Read exact numbers with chart_get_data, not from the image.",
    "The data was refreshed at 2026-11-14T22:02:56.899Z, after this image was captured at 2026-11-12T09:26:51.086Z. The image may not show the current numbers; use chart_get_data for them."
  ],
  "url": "https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v",
… (trimmed)
}
```

The image is the one saved when the item was published, so it can be older than the data. Check result.image.may_be_stale. The image is saved on the computer that runs expl, and image_path shows where. You can also choose the location with `--output`. Read exact numbers with chart get-data, not from the image.

> If result.image describes the image, you have it.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| You need totals, sorting or filtering | Use chart query. |
| DATA_EGRESS_LIMIT | The publisher does not share the rows of this data. Use its charts, analytics or summary instead. |
| `Run "expl server login".` | You are not signed in, or the saved login or API key was rejected. Run expl server login. |

Every flag is described in [chart get-data](/en/cli/server/commands#chart-get-data), how to aggregate in [chart query](/en/cli/server/commands#chart-query), and getting the image in [chart get-image](/en/cli/server/commands#chart-get-image).

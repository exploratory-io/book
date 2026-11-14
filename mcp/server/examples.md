# Examples

Examples of what to ask your AI, with the tools it uses and a few tips.

<a id="find"></a>

## Find and read a note

```text
Find the "Sales Orders" data on Exploratory.
```

The AI calls search with scope: "all" and shows the matching data with its URL. To read one, it calls fetch with the id.

**The same operation run with the CLI**

```sh
expl server search "Sales Orders" --scope all --type data --limit 3 --json
```

With --json, the result the search tool returned is printed as it is. Long output is trimmed.

**Result**

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

<a id="data"></a>

## Aggregate data

```text
What columns does the "Sales Orders" data on Exploratory have, and which 5 regions have the highest sales?
```

The AI works in this order.

- It finds the data with search.
- It reads the columns and the approved semantics (what a row means, aggregation rules) with dataframe_get_schema.
- It aggregates with query_dataset and reports the numbers and what it computed (aggregation, filters, data date).

**The same operation run with the CLI**

```sh
expl server dataset query <dataset_id> --mode aggregate --dimensions '[{"column":"region"}]' --metrics '[{"function":"sum","column":"sales","alias":"sales"}]' --sort '[{"field":"sales","direction":"desc"}]' --limit 5 --json
```

The result below sums sales by region on the data Sales Orders (id llS6nQK3aH).

**Result**

```text
{
  "query_id": "qry_2a25c1716e94b226",
  "dataset": {
    "id": "llS6nQK3aH",
    "name": "Sales Orders",
    "version": "20261112T081211Z-72836d02",
    "updated_at": "2026-11-12T08:12:11.243Z",
    "url": "https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH"
  },
  "columns": [
    {
      "name": "region",
      "type": "string"
    },
    {
      "name": "sales",
      "type": "float"
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
    ],
    [
      "Kyushu-Okinawa",
      45545510
    ],
    [
      "Tohoku",
      30228840
    ]
  ],
  "result": {
    "row_count": 5,
    "has_more": true
  },
  "warnings": [
    {
      "code": "RESULT_TRUNCATED",
      "message": "Additional rows exist. Refine the query."
    }
  ]
}
```

<a id="chart"></a>

## Get the numbers of a chart

```text
Tell me the numbers of the chart "Monthly Sales Trend" in the dashboard "Sales Orders Dashboard".
```

The AI looks up the chart name (metadata.charts) in the note with fetch and gets the numbers with chart_get_data. When it needs filtering or aggregation, it uses chart_query. The numbers are the values as published.

**The same operation run with the CLI**

```sh
expl server chart get-data <id> --chart <chart> --limit 5 --json
```

The result below is for the chart dkc1UUY6 (Monthly Sales Trend) in the dashboard with the id sjO4NsW7kb. Long output is trimmed.

**Result**

```text
{
  "success": true,
  "item": {
    "id": "sjO4NsW7kb",
    "type": "dashboard",
    "title": "Sales Orders Dashboard"
  },
  "summary": "Returned 5 of 22 rows of chart \"Monthly Sales Trend\".",
  "result": {
    "chart": {
      "name": "dkc1UUY6",
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

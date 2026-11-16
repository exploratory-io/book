# Try it

Find and read published data, then aggregate it, in three steps.

Before you start, install expl on the [Installation](install.md) page and [sign in](login.md). Check the state with expl server status. If you use Exploratory Desktop, expl is already installed.

<a id="steps"></a>

## Three steps

### 1. Search

Write the search words right after the command. A value written without a flag name, like this, is called a positional argument.

```sh
expl server search "Sales Orders" --scope all --type data
```

--scope all searches content published by other people as well as your own. --type data limits the result to data. An empty result means that nothing matched; it is not a sign-in error.

**Result**

```text
ID          TITLE         URL                                                TYPE  DESCRIPTION                                                                                                                                                                                                                                                                                                   AUTHOR
hI6jK7lM8n  Sales Orders  https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n  data  One row is one order line item (an order can have several lines, line_no 1-3). Period: order_date from 2025-01-01 to 2026-10-31. Columns: order_id (order ID), line_no (line number within the order), order_date, ship_date (shipping date; can be later than the order date, up to 2026-11-04), custome...  Alex Kim
```

> If the result lists content with ids and URLs, the search works.

### 2. Read

```sh
expl server fetch <id> --json
```

Replace \<id\> with an id from the search result. --json prints the server's result as JSON. In the result below, IDs, URLs, and names are replaced for illustration. Long output is trimmed, so the JSON below is an excerpt, not a complete JSON.

**Result**

```text
{
  "id": "hI6jK7lM8n",
  "title": "Sales Orders",
  "text": "# Sales Orders\n\nRows (total): 23,131\n\n## Columns\n\n| name | type | description |\n| --- | --- | --- |\n| order_id… (trimmed)",
  "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n",
  "metadata": {
    "update_status": {
      "freshness": "not_scheduled",
      "last_refreshed_at": "2026-11-12T08:12:13.528Z",
      "last_published_at": "2026-11-12T08:12:13.447Z",
      "schedule": null,
      "last_run_status": "idle",
      "last_failure_at": null,
      "consecutive_failures": 0
    },
    "language": "en",
    "base_language": "en",
    "context": {
      "publication_version": "2026-11-12T08:12:13.447Z",
      "data_as_of": "2026-11-12T08:12:13.528Z",
      "parameters": null,
      "dashboard_filters": "none"
    },
    "type": "data",
    "author": "Alex Kim",
    "team": null,
    "created_at": "2026-11-12T08:12:13.447Z",
    "updated_at": "2026-11-12T08:12:13.447Z",
    "refreshed_at": "2026-11-12T08:12:13.528Z",
    "tags": [
      "sales",
      "orders"
    ]
  }
}
```

The result holds the text. For a note, dashboard or slide it can also hold the list of headings (metadata.toc), depending on its length and your options. When it is missing, get the heading ids with --query.

### 3. Aggregate

For a data item, first check the column names and types.

```sh
expl server dataframe get-schema <id> --detail light --json
```

Replace \<id\> with the id of a data item. In the result below, IDs, URLs, and names are replaced for illustration. Long output is trimmed.

**Result**

```text
{
  "success": true,
  "item": {
    "id": "hI6jK7lM8n",
    "type": "data",
    "title": "Sales Orders"
  },
  "summary": "14 columns, 23131 rows.",
  "result": {
    "row_count": 23131,
    "columns": [
      {
        "name": "order_id",
        "data_type": "character"
      },
      {
        "name": "line_no",
        "data_type": "numeric"
      },
      {
        "name": "order_date",
        "data_type": "Date"
      },
… (trimmed)
```

Once you know the column names, aggregate. This example sums the sales column for each value of the region column and sorts the totals from the largest.

```sh
expl server dataset query <dataset_id> --mode aggregate --dimensions '[{"column":"region"}]' --metrics '[{"function":"sum","column":"sales","alias":"sales"}]' --sort '[{"field":"sales","direction":"desc"}]' --limit 5 --json
```

Replace \<dataset_id\> with the data id and region with a real column name. Wrap each JSON value in single quotes ('). In the result below, IDs, URLs, and names are replaced for illustration. It sums sales by region on the Sales Orders data. The values match Sales by Region in the Sales Orders Dashboard.

**Result**

```text
{
  "query_id": "qry_2a25c1716e94b226",
  "dataset": {
    "id": "hI6jK7lM8n",
    "name": "Sales Orders",
    "version": "20261112T081211Z-72836d02",
    "updated_at": "2026-11-12T08:12:11.243Z",
    "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n"
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

The result includes the data version and update time. Check which data the numbers are based on.

<a id="next"></a>

## Next

- [Read notes](guides/read-notes.md) - How to read long notes and get chart numbers.
- [Query data](guides/query-data.md) - How to write the JSON arguments.
- [Automation](guides/automation.md) - Create an API key and run it in CI.
- [Troubleshooting](troubleshooting.md) - Find a fix by symptom.

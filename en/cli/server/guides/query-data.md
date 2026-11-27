---
title: "Query data"
---

Check the columns of published data, then filter and aggregate it on the server.

<a id="pick"></a>

## Pick the data

Search for data items with `--type` data. The result also lists the columns (name and type) and the row count.

```sh
expl server search "sales" --type data --json
```

Note the id in the result. You will use it in the next commands.

<a id="schema"></a>

## Check the columns

Check the column names and types before you aggregate. A name must be written exactly.

```sh
expl server dataframe get-schema <id> --detail light --json
```

Replace \<id\> with the id of the data item. `--detail` light returns only the column names, types and the row count.

To look at the rows, get the first few.

```sh
expl server dataframe preview <id> --limit 3 --json
```

When the publisher did not include all data, the rows are the sample saved at publish time. Do totals and filters with dataset query below, not on a sample.

<a id="query"></a>

## Filter and aggregate

This example sums the sales column for each value of the region column and returns the top 5, largest first.

```sh
expl server dataset query <dataset_id> --mode aggregate --dimensions '[{"column":"region"}]' --metrics '[{"function":"sum","column":"sales","alias":"sales"}]' --sort '[{"field":"sales","direction":"desc"}]' --limit 5 --json
```

Replace \<dataset_id\> with the data id and region with a real column name. The result below sums sales by region on the data with the id hI6jK7lM8n (Sales Orders).

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

- `--mode` aggregate groups by `--dimensions` and calculates `--metrics`.
- `--mode` rows gets the rows that match the conditions. Name the columns to return with `--columns`.
- rows returns at most 1,000 rows and aggregate at most 500. There is no paging. When has_more in the result is true, narrow the query or aggregate.
- The result includes the data version and update time. When you report the numbers, say which data they are based on.

To get the rows that match a condition, use `--mode` rows. It needs `--columns`, and `--filters` narrows the rows. This example returns two columns of the rows where region is Kanto.

```sh
expl server dataset query <dataset_id> --mode rows --columns '["region","sales"]' --filters '{"column":"region","operator":"eq","value":"Kanto"}' --limit 10 --json
```

operator is the comparison. The operators a data item supports are in the result of `expl server dataframe get-schema <id> --detail` full. For how to combine several conditions, see [Filter conditions](/en/cli/server/commands#dataset-query-json-arguments).

When the result is too large, save it as a CSV or Parquet file with dataframe export. To join several data items, see the [dataset query](/en/cli/server/commands#dataset-query) page.

<a id="json"></a>

## Write the JSON arguments

JSON is a text format for writing structured data. Pass dimensions, metrics, sort and similar flags as JSON. Wrap the whole JSON in single quotes (') and write the strings inside in double quotes (").

| Flag | Shape | Meaning |
| --- | --- | --- |
| `--dimensions` | \[`{"column":"region"}`\] | Group by the values of the region column. |
| `--metrics` | \[`{"function":"sum","column":"sales","alias":"sales"}`\] | Sum the sales column and name the result sales. |
| `--sort` | \[`{"field":"sales","direction":"desc"}`\] | Sort by the output column sales, largest first. |

The alias in metrics is required. Use only letters, digits and _, do not start with a digit, and use at most 64 characters. In sort, name the output column with field.

These are the messages you see for a wrong shape, and how to fix them.

| What you see | What to do |
| --- | --- |
| Each dimension must be an object like `{ "column": "region" }`. (INVALID_QUERY) | Write dimensions as an array of objects like `{ "column": "column name" }`. |
| Unknown property "aggregation" in a metric. (INVALID_AGGREGATION) | In metrics, give a function and an alias. |
| alias is required: letters, digits and underscores, not starting with a digit, at most 64 characters. (INVALID_AGGREGATION) | Add an alias. The allowed characters and length are described above. |
| Unknown property "by" in a sort entry. (INVALID_SORT) | Name the output column with field. column, by, alias, name and metric are not accepted. |

<a id="unavailable"></a>

## Data that cannot be queried

Data published without its full data cannot be queried on the server. dataset query then fails with this error.

| What you see | What to do |
| --- | --- |
| DATASET_UNAVAILABLE | The publisher needs to republish it from the latest version of Exploratory Desktop. |

Search results and `--detail` light do not show whether a data item can be queried. Run `--detail` full and check that query.available in the result is not false.

```sh
expl server dataframe get-schema <id> --detail full --json
```

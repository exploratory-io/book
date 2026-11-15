# expl server dataset query

Filter and aggregate a data item on the server and return only the result. Check exact column names with search or dataframe get-schema.

<a id="examples"></a>

## Examples

### Count rows for each region

**Terminal**

```sh
expl server dataset query <dataset_id> --mode aggregate --dimensions '[{"column":"region"}]' --metrics '[{"function":"count_rows","alias":"n"}]' --sort '[{"field":"n","direction":"desc"}]' --limit 5 --json
```

Replace \<dataset_id\> with the target id and region with a real column name. Wrap each JSON value in single quotes (').

**Result**

The result of running it on the Sales Orders data (id: hI6jK7lM8n). Long fields are left out and the layout is tidied.

```text
{
  "dataset": { "id": "hI6jK7lM8n", "name": "Sales Orders", "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n" },
  "columns": [ { "name": "region", "type": "string" }, { "name": "n", "type": "integer" } ],
  "rows": [ ["Kanto", 7814], ["Kinki", 3890], ["Chubu", 3779], ["Kyushu-Okinawa", 2418], ["Tohoku", 1592] ],
  "result": { "row_count": 5, "has_more": true },
  "warnings": [ { "code": "RESULT_TRUNCATED", "message": "Additional rows exist. Refine the query." } ]
}
```

The five regions with the most rows came back. The limit (--limit 5) cut the result, so result.has_more is true and a RESULT_TRUNCATED warning is attached. To see the other regions, raise --limit or narrow the query with a filter.

### Count all rows

**Terminal**

```sh
expl server dataset query <dataset_id> --mode aggregate --metrics '[{"function":"count_rows","alias":"n"}]' --json
```

Without dimensions, one total row is returned.

**Result**

The result of running it on the Sales Orders data (id: hI6jK7lM8n). Long fields are left out and the layout is tidied.

```text
{
  "dataset": { "id": "hI6jK7lM8n", "name": "Sales Orders", "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n" },
  "columns": [ { "name": "n", "type": "integer" } ],
  "rows": [ [23131] ],
  "result": { "row_count": 1, "has_more": false },
  "warnings": []
}
```

The whole data has 23,131 rows.

<a id="usage"></a>

## Usage

```text
expl server dataset query [<dataset_id>] [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--dataset-id` | string | Required unless queries or datasets is used | The id of the data item, from a search result or a fetch. Write it right after the command or pass it with --dataset-id. |
| `--mode` | string | Required unless queries is used | rows: get the rows that match the filters. aggregate: group by dimensions and calculate metrics. Values: `rows`, `aggregate` |
| `--columns` | json |  | Only in rows mode. 1 to 50 unique column names to return. In a join, write each column with alias and column. |
| `--filters` | json |  | The filter conditions: a single condition, or { "and": \[...\] } or { "or": \[...\] } with 2 or more conditions each. Nest at most 3 levels, with at most 20 conditions in all. In a join, they apply after the join. |
| `--dimensions` | json |  | Only in aggregate mode. 0 to 5 columns to group by, written as { "column": "column name" }. Values are used as stored, so there is no option to extract a month or year from a date for grouping. Without it, you get one total row. |
| `--metrics` | json | Required in aggregate mode | Only in aggregate mode, and required there. 1 to 10 calculations, each with a function (count_rows, count, count_distinct, sum, avg, min, max) and an alias that names the result. Everything except count_rows also takes a column. |
| `--sort` | json |  | The sort order, up to 3 entries. Each entry names an output field with field and a direction with direction. |
| `--limit` | integer |  | The maximum number of result rows. rows: default 100, at most 1,000. aggregate: default 100, at most 500. There is no paging; narrow the query when rows remain. |
| `--datasets` | json |  | The data items to join and their aliases, used instead of dataset_id. 2 to 5 items, written as an array of { "id": ..., "alias": ... }. |
| `--root-alias` | string |  | The alias of the data item where joins start. By default, the first of datasets. |
| `--joins` | json | Required with datasets | Join types (inner, left, right, full), the left and right aliases and the key columns. One join is needed for each data item after the first. |
| `--source-filters` | json |  | Narrows the rows of each data item before the join. For each alias, write conditions with that data item's plain column names. Use it for a condition on the side of a left join that should not drop rows. |
| `--allow-many-to-many` | boolean |  | Enable it only when a key repeats on both sides of a join and the rows multiplying is what you want. |
| `--queries` | json |  | Several independent queries in one call, up to 5, run in parallel on the server. Each takes dataset_id (or datasets for a join) and the same fields as a single query. |
| `--include-answer-context` | boolean |  | On by default. Turn it off to leave answer_context (an interpretation of the query and the descriptions and units of the columns) out of the result. Warnings are still returned. It works only on a server that returns answer_context. |
| `--language` | string |  | The language of the descriptions, units, labels and metric names in answer_context: ja or en. By default it is the base language of the data. A text that does not exist in the language is returned in the other one and marked. It works only on a server that returns answer_context. Values: `ja`, `en` |

<a id="json-arguments"></a>

## JSON input structure

These are JSON input templates, not results. Replace \< \> placeholders with data ids, columns and values. Command examples using single quotes use bash syntax. PowerShell and cmd write quotes differently from bash, so an example that uses single quotes may not run as it is. In that case, save the JSON to a file and pass it with --input.

### Filter conditions: filters

**JSON**

```text
{
  "column": "<column>",
  "operator": "eq",
  "value": "<value>"
}
```

column is the column name, operator is the comparison, and value is the comparison value. After a join, column is an object containing alias and column.

### Datasets to join: datasets

**JSON**

```text
[
  {
    "id": "<left_id>",
    "alias": "<left_alias>"
  },
  {
    "id": "<right_id>",
    "alias": "<right_alias>"
  }
]
```

### Join conditions: joins

**JSON**

```text
[
  {
    "type": "left",
    "left_alias": "<left_alias>",
    "right_alias": "<right_alias>",
    "on": [
      {
        "left_column": "<left_column>",
        "right_column": "<right_column>"
      }
    ]
  }
]
```

For joins, pass datasets instead of dataset_id. Match the aliases to datasets and use on for the corresponding key columns. Repeated keys on both sides can multiply rows; inspect keys before aggregating.

<a id="paging"></a>

## More results

There is no paging. When has_more in the result is true, narrow the filters or aggregate. To get many rows, save them as a file with dataframe export.

<a id="output"></a>

## Output

The result is exact and includes the data version (dataset.version) and update time (dataset.updated_at). Say which version of the data the numbers are based on. A join also returns the source data, where each output column comes from, and the row counts before and after each join.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| Each dimension must be an object like { "column": "region" }. (INVALID_QUERY) | Write dimensions as an array of objects like { "column": "column name" }. |
| Unknown property "aggregation" in a metric. (INVALID_AGGREGATION) | In metrics, give a function and an alias. Everything except count_rows also takes a column. |
| alias is required: letters, digits and underscores, not starting with a digit, at most 64 characters. (INVALID_AGGREGATION) | alias is required. Use only letters, digits and _, do not start with a digit, and use at most 64 characters. |
| Unknown property "by" in a sort entry. (INVALID_SORT) | In a sort entry, give the output column name with field. column, by, alias, name and metric are not accepted. |
| DATASET_UNAVAILABLE | This data was published without its full data, so it cannot be queried on the server. The publisher needs to republish it from the current Exploratory Desktop. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

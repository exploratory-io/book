# expl server dataframe get-schema

Look up the columns of a data item: names, types, descriptions the publisher wrote, and the row count.

<a id="examples"></a>

## Examples

### Check only column names and types

**Terminal**

```sh
expl server dataframe get-schema <id> --detail light --json
```

Replace \<id\> with the id of a data item.

The result below was run on the data Sales Orders (id hI6jK7lM8n). Long output is trimmed.

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
      }
    ],
    "context": {
      "publication_version": "2026-11-12T09:26:51.086Z",
      "data_as_of": "2026-11-12T08:12:13.528Z",
      "parameters": null,
      "dashboard_filters": "none"
    }
  },
  "warnings": [],
  "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n"
}
```

### Check in detail

**Terminal**

```sh
expl server dataframe get-schema <id> --json
```

The result below was run on the same data. Statistics, semantics and the list of operators the query supports are trimmed.

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
    "data_source": {
      "type": "parquet"
    },
    "update_status": {
      "freshness": "not_scheduled",
      "last_refreshed_at": "2026-11-12T08:12:13.528Z",
      "last_published_at": "2026-11-12T09:26:51.086Z",
      "schedule": null,
      "last_run_status": "idle",
      "last_failure_at": null,
      "consecutive_failures": 0
    },
    "language": "en",
    "base_language": "en",
    "columns": [
      {
        "name": "order_id",
        "data_type": "character",
        "description": "",
        "missing_count": 0,
        "unique_count": 15970,
        "sample_values": [
          "SO-250101-00001",
          "SO-250101-00002"
        ],
        "query_type": "string"
      },
      {
        "name": "line_no",
        "data_type": "numeric",
        "description": "",
        "missing_count": 0,
        "min": 1,
        "max": 3,
        "query_type": "float"
      }
    ],
    "query": {
      "available": true,
      "source": "full",
      "export_available": true,
      "dataset": {
        "version": "20261112T092646Z-72836d02",
        "updated_at": "2026-11-12T09:26:46.214Z"
      }
    },
    "context": {
      "publication_version": "2026-11-12T09:26:51.086Z",
      "data_as_of": "2026-11-12T08:12:13.528Z",
      "parameters": null,
      "dashboard_filters": "none"
    }
  },
  "warnings": [
    "Semantics: 1 approved."
  ],
  "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n"
}
```

<a id="usage"></a>

## Usage

```text
expl server dataframe get-schema <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the data item, from a search result or a fetch. Write it right after the command or pass it with --id. |
| `--detail` | string |  | full: descriptions, statistics, semantics (what a row means, aggregation rules) and what dataset query supports. light: only each column's name and type, and the row count, in a smaller and faster result. Values: `full`, `light` |
| `--language` | string |  | The language of the descriptions and definitions. By default it is the base language of the data. A text that does not exist in this language is returned in the other one and marked language_fallback. Values: `ja`, `en` |
| `--include-unapproved` | boolean |  | Also return definitions the owner has not approved yet (drafts and AI suggestions). Only the owner of the data can use it. They are hints, not official definitions. |

<a id="paging"></a>

## More results

There is no way to page through the result.

<a id="output"></a>

## Output

The result includes the column names, types and the row count. With full it also includes the descriptions the publisher wrote, missing and unique counts, minimum and maximum, top values and the update status (when the data was last refreshed and whether it is fresh). When the owner has approved them, it includes semantics: what a row means, column roles, default aggregations and aggregation rules. Semantics is the official definition, so read it before you aggregate.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| dataset query fails with DATASET_UNAVAILABLE | Run it with --detail full and check query.available in the result. Data with false cannot be queried on the server. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

# expl server dataframe preview

Get the rows of a data item, page by page with offset and limit.

<a id="examples"></a>

## Examples

### See the first 3 rows

**Terminal**

```sh
expl server dataframe preview <id> --limit 3 --json
```

Replace \<id\> with the id of a data item.

The result below was run on the data Sales Orders (id llS6nQK3aH). Long output is trimmed.

**Result**

```text
{
  "success": true,
  "item": {
    "id": "llS6nQK3aH",
    "type": "data",
    "title": "Sales Orders"
  },
  "summary": "Returned 3 of 23131 rows from offset 0.",
  "result": {
    "columns": [
      "order_id",
      "line_no",
      "order_date"
    ],
    "rows": [
      [
        "SO-250101-00001",
        1,
        "2025-01-01"
      ],
      [
        "SO-250101-00002",
        1,
        "2025-01-01"
      ],
      [
        "SO-250101-00002",
        2,
        "2025-01-01"
      ]
    ],
    "offset": 0,
    "returned": 3,
    "has_more": true,
    "sample_row_count": 23131,
    "row_count": 23131,
    "is_sample": false,
    "source": "full",
    "context": {
      "publication_version": "2026-11-12T09:26:51.086Z",
      "data_as_of": "2026-11-12T08:12:13.528Z",
      "parameters": null,
      "dashboard_filters": "none"
    }
  },
  "warnings": [],
  "url": "https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH"
}
```

### Get rows 101–200

**Terminal**

```sh
expl server dataframe preview <id> --offset 100 --limit 100 --json
```

The result below is trimmed to the first 2 of the 100 rows.

**Result**

```text
{
  "success": true,
  "item": {
    "id": "llS6nQK3aH",
    "type": "data",
    "title": "Sales Orders"
  },
  "summary": "Returned 100 of 23131 rows from offset 100.",
  "result": {
    "columns": [
      "order_id",
      "line_no"
    ],
    "rows": [
      [
        "SO-250104-00073",
        1
      ],
      [
        "SO-250104-00074",
        1
      ]
    ],
    "offset": 100,
    "returned": 100,
    "has_more": true,
    "sample_row_count": 23131,
    "row_count": 23131,
    "is_sample": false,
    "source": "full",
    "context": {
      "publication_version": "2026-11-12T09:26:51.086Z",
      "data_as_of": "2026-11-12T08:12:13.528Z",
      "parameters": null,
      "dashboard_filters": "none"
    }
  },
  "warnings": [],
  "url": "https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH"
}
```

<a id="usage"></a>

## Usage

```text
expl server dataframe preview <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the data item, from a search result or a fetch. Write it right after the command or pass it with --id. |
| `--offset` | integer |  | The number of rows to skip, counted from 0. |
| `--limit` | integer |  | The number of rows to return, up to 100. |

<a id="paging"></a>

## More results

Pass the number of rows you have already read to offset to read on. One call returns at most 100 rows.

<a id="output"></a>

## Output

When the publisher included all data, every row can be read. Otherwise the rows come from the sample saved at publish time, so check is_sample and row_count. To compute totals or filter rows, use dataset query instead of reading every page.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| DATA_EGRESS_LIMIT | The publisher does not share the rows of this data. Use its charts, analytics or summary instead. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

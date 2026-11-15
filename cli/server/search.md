# expl server search

Search the content you can view by title, description and tags. Without search words, list items newest first.

<a id="examples"></a>

## Examples

### Search by words

**Terminal**

```sh
expl server search "sales"
```

The result below lists the first rows of the output. Descriptions are trimmed.

**Result**

```text
ID  TITLE  URL  TYPE  DESCRIPTION  AUTHOR
pQ9rS0tU1v  Sales Orders Dashboard  https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v  dashboard  Alex Kim
hI6jK7lM8n  Sales Orders  https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n  data  One row is one order line item (an order can have several lines, line_no 1-3). P…  Alex Kim
wX2yZ3aB4c  Sales Orders Overview  https://exploratory.io/note/aB3cD4eF5g/wX2yZ3aB4c  note  Alex Kim
```

### List your content

**Terminal**

```sh
expl server search "" --scope mine --limit 50 --json
```

Lists up to 50 of your own items, newest first.

The result below is trimmed to the first 2 items.

**Result**

```text
{
  "results": [
    {
      "id": "Customer-Usage-Monitoring-uV9wX0yZ1a",
      "title": "Customer_Usage_Monitoring",
      "url": "https://exploratory.io/dashboard/aB3cD4eF5g/Customer-Usage-Monitoring-uV9wX0yZ1a",
      "type": "dashboard",
      "description": "",
      "author": "Alex Kim",
      "team": null,
      "updated_at": "2026-11-14T22:03:01.394Z",
      "refreshed_at": "2026-11-14T22:03:01.894Z",
      "tags": [
        "operation"
      ],
      "publication_version": "2021-05-26T02:29:48.269Z",
      "data_as_of": "2026-11-14T22:03:01.894Z"
    },
    {
      "id": "hI6jK7lM8n",
      "title": "Sales Orders",
      "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n",
      "type": "data",
      "description": "One row is one order line item (an order can have several lines, line_no 1-3). Period: order_date from 2025-01-01 to 2026-10-31. Columns: order_id (order ID), line_no (line number within the order), order_date, ship_date (shipping date; can be later than the order date, up to 2026-11-04), custome...",
      "author": "Alex Kim",
      "team": null,
      "updated_at": "2026-11-12T09:26:51.086Z",
      "refreshed_at": "2026-11-12T08:12:13.528Z",
      "tags": [
        "sales",
        "orders"
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
          "name": "order_date",
          "type": "Date",
          "description": "",
          "missing_count": 0
        }
      ],
      "column_count": 14,
      "row_count": 23131
    }
  ],
  "has_more": true,
  "next_offset": 50,
  "hint": "To read a dashboard or note: fetch it, then use chart_query for totals, rankings and comparisons."
}
```

<a id="usage"></a>

## Usage

```text
expl server search [<query>] [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--query` | string |  | Search words, written right after the command or passed with --query. Matches titles, descriptions and tags. Empty (or \*) lists everything in scope, newest first. |
| `--type` | string |  | The type of content to search. Values: `all`, `note`, `dashboard`, `slide`, `chart`, `analytics`, `data` |
| `--scope` | string |  | all: everything you can view. mine: items you own. shared: items shared with you. team: items of one team. Values: `all`, `mine`, `shared`, `team` |
| `--team` | string | Required with --scope team | The team name. |
| `--semantic` | boolean |  | Search by meaning instead of by keyword. |
| `--limit` | integer |  | The maximum number of results, up to 50. |
| `--offset` | integer |  | The number of results to skip. Use it to get the next page. |

<a id="paging"></a>

## More results

When has_more in the result is true, pass next_offset to --offset to get the next page.

<a id="output"></a>

## Output

Results include the id and URL of each item. Pass an id to fetch or another command. Data items also list their columns (name and type) and row count. The default output is for people; --json prints JSON.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| Too big: expected number to be \<=50 at limit | Set --limit to 50 or less. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

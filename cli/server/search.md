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
      "id": "COVID-19-Infected-Cases-Death-Data-Worldwide-nO6pQ7rS8t",
      "title": "World Wide COVID-19 Data by Johns Hopkins (JHU CCSE)",
      "url": "https://exploratory.io/data/aB3cD4eF5g/COVID-19-Infected-Cases-Death-Data-Worldwide-nO6pQ7rS8t",
      "type": "data",
      "description": "#### English This data is about the COVID-19 infection and death numbers for all the countries around the world. it is originally published and shared by Johns Hopkins Un…",
      "author": "Alex Kim",
      "team": null,
      "updated_at": "2026-11-14T15:13:52.790Z",
      "refreshed_at": "2026-11-14T15:13:53.053Z",
      "tags": [
        "covid19",
        "covid-19"
      ],
      "publication_version": "2021-04-08T00:30:28.931Z",
      "data_as_of": "2026-11-14T15:13:53.053Z",
      "columns": [
        {
          "name": "Country/Region",
          "type": "character",
          "description": "国/地域",
          "missing_count": 0
        },
        {
          "name": "Date",
          "type": "Date",
          "description": "日付",
          "missing_count": 0
        }
      ],
      "column_count": 5,
      "row_count": 229743
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

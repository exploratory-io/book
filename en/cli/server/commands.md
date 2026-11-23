---
title: "All commands"
---

Choose a command by purpose. Open its name to see arguments and examples.

How to read the usage lines: replace a \<value\> placeholder with your own value; an item in \[brackets\] can be left out. Write a boolean as `--flag` or `--no-flag`. To give a list of values, repeat the flag, for example `--tables` summary `--tables` table. The JSON examples are written for bash; on Windows you can also pass a JSON file with `--input`.

The commands for signing in and managing the connection are on their own pages: [Sign in](/en/cli/server/login) (login, logout, status), [API keys](/en/cli/server/token) (token) and [Inspect commands](#inspect-commands) on this page (tools list, tools describe). expl server skill prints a description for AI agents in the form of a SKILL.md file.

<a id="syntax-index"></a>

## Command syntax index

| Command | Usage | Flags |
| --- | --- | --- |
| [expl server search](#search) | `expl server search [<query>] [flags]` | `--query` `--type` `--scope` `--team` `--semantic` `--limit` `--offset` |
| [expl server fetch](#fetch) | `expl server fetch <id> [flags]` | `--id` `--language` `--section` `--cursor` `--query` `--include-toc` |
| [expl server dataframe get-schema](#dataframe-get-schema) | `expl server dataframe get-schema <id> [flags]` | `--id` `--detail` `--language` `--include-unapproved` |
| [expl server dataframe preview](#dataframe-preview) | `expl server dataframe preview <id> [flags]` | `--id` `--offset` `--limit` |
| [expl server dataset query](#dataset-query) | `expl server dataset query [<dataset_id>] [flags]` | `--dataset-id` `--mode` `--columns` `--filters` `--dimensions` `--metrics` `--sort` `--limit` `--datasets` `--root-alias` `--joins` `--source-filters` `--allow-many-to-many` `--queries` |
| [expl server dataframe export](#dataframe-export) | `expl server dataframe export <dataset_id> [flags]` | `--dataset-id` `--format` `--mode` `--columns` `--filters` `--dimensions` `--metrics` `--sort` `--limit` |
| [expl server dataframe get-wrangling](#dataframe-get-wrangling) | `expl server dataframe get-wrangling <id> [flags]` | `--id` `--steps` `--column` `--include-scripts` `--cursor` `--language` |
| [expl server chart get-data](#chart-get-data) | `expl server chart get-data <id> [flags]` | `--id` `--chart` `--offset` `--limit` |
| [expl server chart get-image](#chart-get-image) | `expl server chart get-image <id> [flags]` | `--id` `--chart` |
| [expl server analytics get-result](#analytics-get-result) | `expl server analytics get-result <id> [flags]` | `--id` `--analytics` `--tables` `--limit` |
| [expl server chart query](#chart-query) | `expl server chart query [flags]` | `--id` `--chart` `--mode` `--columns` `--filters` `--dimensions` `--metrics` `--sort` `--limit` `--queries` |
| [expl server desktop mcp-setup-guide](#desktop-mcp-setup-guide) | `expl server desktop mcp-setup-guide [flags]` | `--client` |

<a id="commands-search"></a>

## Find and read

| Command | Purpose |
| --- | --- |
| [expl server search](#search) | Search the content you can view by title, description and tags. Without search words, list items newest first. |
| [expl server fetch](#fetch) | Read one note, dashboard, slide or data item by its id. |

<a id="commands-dataframe-preview"></a>

## Data

| Command | Purpose |
| --- | --- |
| [expl server dataframe get-schema](#dataframe-get-schema) | Get the columns of a data item, with their types. |
| [expl server dataframe preview](#dataframe-preview) | Get the rows of a data item, page by page with offset and limit. |
| [expl server dataset query](#dataset-query) | Filter and aggregate a data item on the server and return only the result. |
| [expl server dataframe export](#dataframe-export) | Save the result of a query on a data item as a CSV or Parquet file and return a download link. |
| [expl server dataframe get-wrangling](#dataframe-get-wrangling) | Get how a data item was built: its data wrangling steps in order. |

<a id="commands-chart-get-data"></a>

## Charts and analytics

| Command | Purpose |
| --- | --- |
| [expl server chart get-data](#chart-get-data) | Get the data of a chart together with what the numbers mean. |
| [expl server chart get-image](#chart-get-image) | Get a chart as a PNG image, to see its shape, trend and layout. |
| [expl server analytics get-result](#analytics-get-result) | Get the results of analytics (regression, correlation, chi-square test and so on) as structured data. |
| [expl server chart query](#chart-query) | Filter and aggregate the data of a chart in a note, dashboard or slide on the server and return only the result. |

<a id="commands-desktop-mcp-setup-guide"></a>

## Connection and management

| Command | Purpose |
| --- | --- |
| [expl server desktop mcp-setup-guide](#desktop-mcp-setup-guide) | Return the steps and links for connecting an AI tool to Exploratory Desktop. |

<a id="inspect-commands"></a>

## Inspect commands

Inspect the commands the server offers and their flags.

<a id="inspect-list"></a>

### List the commands

```sh
expl server tools list
```

The command list comes from the server each time. A new operation on the server does not need a new version of expl. When the server cannot be reached or you are not signed in, expl shows the list it saved last time, or an empty list when none is saved.

Exit code 0 from tools list does not mean that the connection works. To check the connection, run expl server status.

<a id="inspect-describe"></a>

### Describe one command

```sh
expl server tools describe <command>
```

Replace \<command\> with the name of a command from the list. Wrap a command of two words in quotes, as in `expl server tools describe "chart get-data"`. The tool name, such as `chart_get_data`, also works.

It shows what the command does and the flags it takes. Check here instead of guessing command names.

<a id="inspect-form"></a>

### The shape of a command

search and fetch take no verb: expl server search \<query\> and expl server fetch \<id\>. Other commands put a noun and a verb after server, as in expl server dataset query.

Each command also has the name of the tool behind it, the one an MCP client sees. expl server call \<tool_name\> runs a command by that name, for example expl server call dataframe_preview \<id\>.

To see the usage and flags of every command, see [Command syntax index](#syntax-index).

<a id="search"></a>

## expl server search

Search the content you can view by title, description and tags. Without search words, list items newest first.

<a id="search-usage"></a>

### Usage

```text
expl server search [<query>] [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="search-flags"></a>

### Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--query` | string |  | Search words, written right after the command or passed with `--query`. Matches titles, descriptions and tags. Empty (or \*) lists everything in scope, newest first. |
| `--type` | string |  | The type of content to search. The default is `all`. Values: `all`, `note`, `dashboard`, `slide`, `chart`, `analytics`, `data` |
| `--scope` | string |  | all: everything you can view. mine: items you own. shared: items shared with you. team: items of one team. The default is `all`. Values: `all`, `mine`, `shared`, `team` |
| `--team` | string | Required with `--scope` team | The team name. |
| `--semantic` | boolean |  | Search by meaning instead of by keyword. |
| `--limit` | integer |  | The maximum number of results, up to 50. The default is 20. |
| `--offset` | integer |  | The number of results to skip. Use it to get the next page. |

<a id="search-examples"></a>

### Examples

#### Search by words

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

#### List your content

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

<a id="search-output"></a>
<a id="search-paging"></a>

### Output and limits

Results include the id and URL of each item. Pass an id to fetch or another command. Data items also list their columns (name and type) and row count. The default output is for people; `--json` prints JSON.

When has_more in the result is true, pass next_offset to `--offset` to get the next page.

<a id="search-trouble"></a>

### Troubleshooting

| What you see | What to do |
| --- | --- |
| Too big: expected number to be \<=50 at limit | Set `--limit` to 50 or less. |
| `Run "expl server login".` | You are not signed in or the token was rejected. Run expl server login. |

Related: [expl server fetch](#fetch), [expl server dataframe get-schema](#dataframe-get-schema)

<a id="fetch"></a>

## expl server fetch

Read one note, dashboard, slide or data item by its id.

<a id="fetch-usage"></a>

### Usage

```text
expl server fetch <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="fetch-flags"></a>

### Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the item, from a search result or an earlier fetch. Write it right after the command or pass it with `--id`. |
| `--language` | string |  | The language of the data overview and column descriptions. By default it is the base language of the data. A text that does not exist in this language is returned in the other one and marked language_fallback. Values: `ja`, `en` |
| `--section` | string |  | A heading id (for example s12) or the exact heading text from metadata.toc. Only for notes, dashboards and slides. |
| `--cursor` | string |  | The marker for reading on in a long note. Pass the value of metadata.range.next_cursor from the previous result. |
| `--query` | string |  | Words to find in the item, separated by spaces, up to 10. Paragraphs that match any word come first, ordered by how many words match, each labeled with its heading path. Use "..." for a phrase. Only the text written by the author is searched, not chart rows or analytics tables. |
| `--include-toc` | boolean |  | Return the list of headings (metadata.toc). By default it is returned only when section, cursor and query are all omitted. Only for notes, dashboards and slides. |

<a id="fetch-examples"></a>

### Examples

#### Read an item

**Terminal**

```sh
expl server fetch <id> --json
```

Replace \<id\> with an id from the search result.

The result below was run on the note Sales Orders Overview (id wX2yZ3aB4c). Long output is trimmed.

**Result**

```text
{
  "id": "wX2yZ3aB4c",
  "title": "Sales Orders Overview",
  "text": "# Sales Orders Overview\n\n# Sales Orders Overview\n\nThis note summarizes the Sales Orders data. One row is one order line item (order_id + line_no). The data covers orders from 2025-01-01 to 2026-10-31 (23,131 line items, total sales of about 440.8 million).\n\n## Sales by region\n\n**Chart: Sales by Regi…",
  "url": "https://exploratory.io/note/aB3cD4eF5g/wX2yZ3aB4c",
  "metadata": {
    "scopes": {
      "A": "…"
    },
    "charts": [
      "…",
      "…"
    ],
    "context": {
      "publication_version": "2026-11-12T08:13:18.971Z",
      "data_as_of": "2026-11-12T08:13:19.186Z",
      "parameters": null,
      "dashboard_filters": "none"
    },
    "type": "note",
    "author": "Alex Kim",
    "team": null,
    "created_at": "2026-11-12T08:13:18.971Z",
    "updated_at": "2026-11-12T08:13:18.971Z",
    "refreshed_at": "2026-11-12T08:13:19.186Z",
    "tags": []
  }
}
```

#### Read one heading

**Terminal**

```sh
expl server fetch <id> --section s2 --json
```

Replace s2 with a heading id from metadata.toc.

The result below returns only the heading s2 (Sales by region) of the same note. metadata.toc is not returned for a short note like this one, so the heading id s2 was taken from the result of `--query` below.

**Result**

```text
{
  "id": "wX2yZ3aB4c",
  "title": "Sales Orders Overview",
  "text": "# Sales Orders Overview > Sales by region\n\n## Sales by region\n\n**Chart: Sales by Region** (chart: `kL8mN9oP`, type: bar)\n\nValues: sum of sales\n\n> [Computed summary]\n>\n> 8 region values (all rows). Total of sales: 440,826,130. Top: Kanto (148,695,040 33.7%), Kinki (74,050,840 16.8%), Chubu (72,023,380 16.3%). Bottom: Shikoku (19,857,430 4.5%), Chugoku (24,926,920 5.7%), Hokkaido (25,498,170 5.8%).\n\n| region | sales |\n…",
  "url": "https://exploratory.io/note/aB3cD4eF5g/wX2yZ3aB4c",
  "metadata": {
    "scopes": "…",
    "charts": "…",
    "context": "…",
    "type": "note",
    "author": "Alex Kim",
    "team": null,
    "created_at": "2026-11-12T08:13:18.971Z",
    "updated_at": "2026-11-12T08:13:18.971Z",
    "refreshed_at": "2026-11-12T08:13:19.186Z",
    "tags": "…",
    "range": "…"
  }
}
```

#### Find a topic

**Terminal**

```sh
expl server fetch <id> --query "region" --json
```

Returns paragraphs that contain any of the words.

The result below was run with `--query "region"` on the same note. Each paragraph that matches comes with its heading id and path in square brackets.

**Result**

```text
{
  "id": "wX2yZ3aB4c",
  "title": "Sales Orders Overview",
  "text": "# Sales Orders Overview\n\n[s2 Sales Orders Overview > Sales by region]\n## Sales by region\n\n**Chart: Sales by Region** (chart: `kL8mN9oP`, type: bar)\n\nValues: sum of sales\n\n> [Computed summary]\n>\n> 8 region values (all rows). Total of sales: 440,826,130. Top: Kanto (148,695,040 33.7%), Kinki (74,050,840 16.8%), Chubu (72,023,380 16.3%). Bottom: Shikoku (19,857,430 4.5%), Chugoku (24,926,920 5.7%), Hokkaido (25,498,170 …",
  "url": "https://exploratory.io/note/aB3cD4eF5g/wX2yZ3aB4c",
  "metadata": {
    "scopes": "…",
    "charts": "…",
    "context": "…",
    "type": "note",
    "author": "Alex Kim",
    "team": null,
    "created_at": "2026-11-12T08:13:18.971Z",
    "updated_at": "2026-11-12T08:13:18.971Z",
    "refreshed_at": "2026-11-12T08:13:19.186Z",
    "tags": "…",
    "matches": "…"
  }
}
```

<a id="fetch-output"></a>
<a id="fetch-paging"></a>

### Output and limits

Notes, dashboards and slides come back as Markdown with their text, the first rows of each embedded chart and the explanation of each analytics. metadata.charts and metadata.blocks hold the names of charts and analytics. Data items include columns, the row count, sample rows and the update status.

For a long note, find a topic with `--query` or read one heading with `--section`. When more text follows, pass the value of metadata.range.next_cursor to `--cursor`. metadata.truncated is set only when more text follows.

<a id="fetch-trouble"></a>

### Troubleshooting

| What you see | What to do |
| --- | --- |
| The text is long and you cannot find the part you need | Find the topic with `--query`, or pass a heading from metadata.toc to `--section`. |
| You do not know the name of a chart or analytics | Look at metadata.charts and metadata.blocks in the result. |
| `Run "expl server login".` | You are not signed in or the token was rejected. Run expl server login. |

Related: [expl server search](#search), [expl server chart get-data](#chart-get-data), [expl server analytics get-result](#analytics-get-result)

<a id="dataframe-get-schema"></a>

## expl server dataframe get-schema

Look up the columns of a data item: names, types, descriptions the publisher wrote, and the row count.

<a id="dataframe-get-schema-usage"></a>

### Usage

```text
expl server dataframe get-schema <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="dataframe-get-schema-flags"></a>

### Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the data item, from a search result or a fetch. Write it right after the command or pass it with `--id`. |
| `--detail` | string |  | full: descriptions, statistics, semantics (what a row means, aggregation rules) and what dataset query supports. light: only each column's name and type, and the row count, in a smaller and faster result. Values: `full`, `light` |
| `--language` | string |  | The language of the descriptions and definitions. By default it is the base language of the data. A text that does not exist in this language is returned in the other one and marked language_fallback. Values: `ja`, `en` |
| `--include-unapproved` | boolean |  | Also return definitions the owner has not approved yet (drafts and AI suggestions). Only the owner of the data can use it. They are hints, not official definitions. |

<a id="dataframe-get-schema-examples"></a>

### Examples

#### Check only column names and types

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

#### Check in detail

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

<a id="dataframe-get-schema-output"></a>
<a id="dataframe-get-schema-paging"></a>

### Output and limits

The result includes the column names, types and the row count. With full it also includes the descriptions the publisher wrote, missing and unique counts, minimum and maximum, top values and the update status (when the data was last refreshed and whether it is fresh). When the owner has approved them, it includes semantics: what a row means, column roles, default aggregations and aggregation rules. Semantics is the official definition, so read it before you aggregate.

There is no way to page through the result.

<a id="dataframe-get-schema-trouble"></a>

### Troubleshooting

| What you see | What to do |
| --- | --- |
| dataset query fails with DATASET_UNAVAILABLE | Run it with `--detail` full and check query.available in the result. Data with false cannot be queried on the server. |
| `Run "expl server login".` | You are not signed in or the token was rejected. Run expl server login. |

Related: [expl server dataframe preview](#dataframe-preview), [expl server dataset query](#dataset-query)

<a id="dataframe-preview"></a>

## expl server dataframe preview

Get the rows of a data item, page by page with offset and limit.

<a id="dataframe-preview-usage"></a>

### Usage

```text
expl server dataframe preview <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="dataframe-preview-flags"></a>

### Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the data item, from a search result or a fetch. Write it right after the command or pass it with `--id`. |
| `--offset` | integer |  | The number of rows to skip, counted from 0. |
| `--limit` | integer |  | The number of rows to return, up to 100. |

<a id="dataframe-preview-examples"></a>

### Examples

#### See the first 3 rows

**Terminal**

```sh
expl server dataframe preview <id> --limit 3 --json
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
  "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n"
}
```

#### Get rows 101–200

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
    "id": "hI6jK7lM8n",
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
  "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n"
}
```

<a id="dataframe-preview-output"></a>
<a id="dataframe-preview-paging"></a>

### Output and limits

When the publisher included all data, every row can be read. Otherwise the rows come from the sample saved at publish time, so check is_sample and row_count. To compute totals or filter rows, use dataset query instead of reading every page.

Pass the number of rows you have already read to offset to read on. One call returns at most 100 rows.

<a id="dataframe-preview-trouble"></a>

### Troubleshooting

| What you see | What to do |
| --- | --- |
| DATA_EGRESS_LIMIT | The publisher does not share the rows of this data. Use its charts, analytics or summary instead. |
| `Run "expl server login".` | You are not signed in or the token was rejected. Run expl server login. |

Related: [expl server dataframe get-schema](#dataframe-get-schema), [expl server dataset query](#dataset-query)

<a id="dataset-query"></a>

## expl server dataset query

Filter and aggregate a data item on the server and return only the result. Check exact column names with search or dataframe get-schema.

<a id="dataset-query-usage"></a>

### Usage

```text
expl server dataset query [<dataset_id>] [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="dataset-query-flags"></a>

### Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--dataset-id` | string | Required unless queries or datasets is used | The id of the data item, from a search result or a fetch. Write it right after the command or pass it with `--dataset-id`. |
| `--mode` | string | Required unless queries is used | rows: get the rows that match the filters. aggregate: group by dimensions and calculate metrics. Values: `rows`, `aggregate` |
| `--columns` | JSON | Required in rows mode (optional in a join) | Only in rows mode. 1 to 50 unique column names to return. In a join, write each column with alias and column. In a join, leaving it out returns every column. |
| `--filters` | JSON |  | The filter conditions: a single condition, or `{ "and": [...] }` or `{ "or": [...] }` with 2 or more conditions each. Nest at most 3 levels, with at most 20 conditions in all. In a join, they apply after the join. |
| `--dimensions` | JSON |  | Only in aggregate mode. 0 to 5 columns to group by, written as `{ "column": "column name" }`. Values are used as stored, so there is no option to extract a month or year from a date for grouping. Without it, you get one total row. |
| `--metrics` | JSON | Required in aggregate mode | Only in aggregate mode, and required there. 1 to 10 calculations, each with a function (count_rows, count, count_distinct, sum, avg, min, max) and an alias that names the result. Everything except count_rows also takes a column. |
| `--sort` | JSON |  | The sort order, up to 3 entries. Each entry names an output field with field and a direction with direction. |
| `--limit` | integer |  | The maximum number of result rows. rows: default 100, at most 1,000. aggregate: default 100, at most 500. There is no paging; narrow the query when rows remain. |
| `--datasets` | JSON |  | The data items to join and their aliases, used instead of dataset_id. 2 to 5 items, written as an array of `{ "id": ..., "alias": ... }`. |
| `--root-alias` | string |  | The alias of the data item where joins start. By default, the first of datasets. |
| `--joins` | JSON | Required with datasets | Join types (inner, left, right, full), the left and right aliases and the key columns. One join is needed for each data item after the first. |
| `--source-filters` | JSON |  | Narrows the rows of each data item before the join. For each alias, write conditions with that data item's plain column names. Use it for a condition on the side of a left join that should not drop rows. |
| `--allow-many-to-many` | boolean |  | Enable it only when a key repeats on both sides of a join and the rows multiplying is what you want. |
| `--queries` | JSON |  | Several independent queries in one call, up to 5, run in parallel on the server. Each takes dataset_id (or datasets for a join) and the same fields as a single query. |

<a id="dataset-query-json-arguments"></a>

### JSON input structure

These are JSON input templates, not results. Replace \< \> placeholders with data ids, columns and values. Command examples using single quotes use bash syntax. PowerShell and cmd write quotes differently from bash, so an example that uses single quotes may not run as it is. In that case, save the JSON to a file and pass it with `--input`.

#### Filter conditions: filters

**JSON**

```text
{
  "column": "<column>",
  "operator": "eq",
  "value": "<value>"
}
```

column is the column name, operator is the comparison, and value is the comparison value. After a join, column is an object containing alias and column.

#### Datasets to join: datasets

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

#### Join conditions: joins

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

<a id="dataset-query-examples"></a>

### Examples

#### Count rows for each region

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

The five regions with the most rows came back. The limit (`--limit` 5) cut the result, so result.has_more is true and a RESULT_TRUNCATED warning is attached. To see the other regions, raise `--limit` or narrow the query with a filter.

#### Count all rows

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

<a id="dataset-query-output"></a>
<a id="dataset-query-paging"></a>

### Output and limits

The result is exact and includes the data version (dataset.version) and update time (dataset.updated_at). Say which version of the data the numbers are based on. A join also returns the source data, where each output column comes from, and the row counts before and after each join.

There is no paging. When has_more in the result is true, narrow the filters or aggregate. To get many rows, save them as a file with dataframe export.

<a id="dataset-query-trouble"></a>

### Troubleshooting

| What you see | What to do |
| --- | --- |
| Each dimension must be an object like `{ "column": "region" }`. (INVALID_QUERY) | Write dimensions as an array of objects like `{ "column": "column name" }`. |
| columns is required in rows mode. (INVALID_QUERY) | In rows mode, name the columns to return with `--columns`. |
| Unknown property "aggregation" in a metric. (INVALID_AGGREGATION) | In metrics, give a function and an alias. Everything except count_rows also takes a column. |
| alias is required: letters, digits and underscores, not starting with a digit, at most 64 characters. (INVALID_AGGREGATION) | alias is required. Use only letters, digits and _, do not start with a digit, and use at most 64 characters. |
| Unknown property "by" in a sort entry. (INVALID_SORT) | In a sort entry, give the output column name with field. column, by, alias, name and metric are not accepted. |
| DATASET_UNAVAILABLE | This data was published without its full data, so it cannot be queried on the server. The publisher needs to republish it from the latest version of Exploratory Desktop. |
| `Run "expl server login".` | You are not signed in or the token was rejected. Run expl server login. |

Related: [expl server dataframe get-schema](#dataframe-get-schema), [expl server dataframe export](#dataframe-export)

<a id="dataframe-export"></a>

## expl server dataframe export

Save the result of a query on a data item as a CSV or Parquet file and return a download link.

<a id="dataframe-export-usage"></a>

### Usage

```text
expl server dataframe export <dataset_id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="dataframe-export-flags"></a>

### Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--dataset-id` | string | Required | The id of the data item, from a search result or a fetch. Write it right after the command or pass it with `--dataset-id`. |
| `--format` | string |  | The file format. The default is csv (UTF-8 with BOM, which opens correctly in Excel). Values: `csv`, `parquet` |
| `--mode` | string | Required | rows: export the rows that match the filters. aggregate: export the result of grouping by dimensions and calculating metrics. Values: `rows`, `aggregate` |
| `--columns` | list of values |  | Only in rows mode. 1 to 50 unique column names to export. Without it, every column is exported. |
| `--filters` | JSON |  | The filter conditions: a single condition, or `{ "and": [...] }` or `{ "or": [...] }` with 2 or more conditions each. Nest at most 3 levels, with at most 20 conditions in all. |
| `--dimensions` | JSON |  | Only in aggregate mode. 0 to 5 columns to group by. |
| `--metrics` | JSON | Required in aggregate mode | Only in aggregate mode, and required there. 1 to 10 calculations. |
| `--sort` | JSON |  | The sort order, up to 3 entries. |
| `--limit` | integer |  | The maximum number of rows to export. |

<a id="dataframe-export-json-arguments"></a>

### JSON inputs

See [dataset query](#dataset-query-json-arguments) for the JSON structure of filters, metrics and sort.

<a id="dataframe-export-examples"></a>

### Examples

#### Save rows as a file

**Terminal**

```sh
expl server dataframe export <dataset_id> --mode rows --limit 5 --json
```

Replace \<dataset_id\> with the id of a data item. For data whose publisher does not allow downloading it as a file, this fails with DATA_EGRESS_LIMIT.

The result below was run on the data Sales Orders (id hI6jK7lM8n). download_url is the link to the file (trimmed here). It expires at expires_at.

**Result**

```text
{
  "success": true,
  "item": {
    "id": "hI6jK7lM8n",
    "type": "data",
    "title": "Sales Orders"
  },
  "summary": "Saved 5 rows (0.0 MB, CSV). The link expires at 2026-11-15T06:59:47.779Z.",
  "result": {
    "format": "csv",
    "rows": 5,
    "bytes": 687,
    "source": "full",
    "dataset_version": "20261112T092646Z-72836d02",
    "data_as_of": "2026-11-12T08:12:13.528Z",
    "expires_at": "2026-11-15T06:59:47.779Z",
    "download_url": "https://exploratory.io/mcp/exports/…",
    "query": {
      "mode": "rows",
      "limit": 5
    }
  },
  "warnings": [],
  "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n"
}
```

<a id="dataframe-export-output"></a>
<a id="dataframe-export-paging"></a>

### Output and limits

A download link that expires in 15 minutes is returned. The link works only for the same signed-in user. Use `--output` to choose where to save a file result.

There is no paging. Use this command when the result is too large for dataset query.

<a id="dataframe-export-trouble"></a>

### Troubleshooting

| What you see | What to do |
| --- | --- |
| DATA_EGRESS_LIMIT | The publisher does not allow downloading this data as a file. Use fetch or dataframe get-schema for what the publisher shares, or open the URL in the browser. |
| SERVER_BUSY | Another export of yours is running, or you reached the hourly export limit. One export can run at a time per user. Try again in a few seconds; for the hourly limit, wait up to an hour. |
| `Run "expl server login".` | You are not signed in or the token was rejected. Run expl server login. |

Related: [expl server dataset query](#dataset-query), [expl server dataframe preview](#dataframe-preview)

<a id="dataframe-get-wrangling"></a>

## expl server dataframe get-wrangling

Look up how a published data item was built: the data wrangling steps in order, the data it was read from and joined with, and which steps created or changed each column.

<a id="dataframe-get-wrangling-usage"></a>

### Usage

```text
expl server dataframe get-wrangling <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="dataframe-get-wrangling-flags"></a>

### Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the data item, from a search result or a fetch. Write it right after the command or pass it with `--id`. |
| `--steps` | list of values |  | The refs of the steps to return in detail, such as s3, taken from the outline. 1 to 20 refs, no duplicates. Cannot be used with `--column`. |
| `--column` | string |  | Return only the steps that created or changed this column of the final data, in detail. Write the exact column name. Cannot be used with `--steps`. |
| `--include-scripts` | boolean | Only with `--steps` or `--column` | Include the R code of the steps. Only for data whose rows may be shared. |
| `--cursor` | string | Not with `--steps` or `--column` | To continue an outline that did not fit in one result, pass range.next_cursor of the previous result. |
| `--language` | string |  | The language of the descriptions and definitions: ja or en. By default it is the base language of the data. Values: `ja`, `en` |

<a id="dataframe-get-wrangling-examples"></a>

### Examples

#### See the outline

**Terminal**

```sh
expl server dataframe get-wrangling <id> --json
```

Replace \<id\> with the id of a data item.

#### See the steps that made one column

**Terminal**

```sh
expl server dataframe get-wrangling <id> --column "order_date" --json
```

Replace order_date with the exact name of a column of the final data.

<a id="dataframe-get-wrangling-output"></a>
<a id="dataframe-get-wrangling-paging"></a>

### Output and limits

Without `--steps` or `--column`, the result is an outline: an overview, every step in order as one line (type, label and what it does), the data it was read from and joined with, and an index of which steps created or changed each column. To see a step in detail (the full explanation, the expression, the settings such as filter conditions or join keys), run it again with `--steps` (the refs from the outline) or with `--column`. The refs are valid only for the current version of the data.

The overview is a summary written by AI and not reviewed, so say so when you quote it. For the processing summary the owner has approved, read the semantics in dataframe get-schema.

An outline that does not fit in one result continues with `--cursor`. When the steps cannot be read, the result says why: they were not recorded when the data was published, the owner does not share them, or the publisher does not share the rows of the data.

<a id="dataframe-get-wrangling-trouble"></a>

### Troubleshooting

| What you see | What to do |
| --- | --- |
| Use either steps or column, not both. (INVALID_PARAMETER) | Pass only one of `--steps` and `--column`. |
| include_scripts works only together with steps or column. (INVALID_PARAMETER) | Add `--steps` or `--column` when you use `--include-scripts`. |
| cursor belongs to an older version of this data. Call again without cursor. (INVALID_PARAMETER) | The data was published again. Run the command again without `--cursor`. |
| `Run "expl server login".` | You are not signed in or the token was rejected. Run expl server login. |

Related: [expl server dataframe get-schema](#dataframe-get-schema), [expl server dataset query](#dataset-query)

<a id="chart-get-data"></a>

## expl server chart get-data

Get the data of a chart together with what the numbers mean.

<a id="chart-get-data-usage"></a>

### Usage

```text
expl server chart get-data <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="chart-get-data-flags"></a>

### Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the note, dashboard or slide that holds the chart, or of a chart published on its own. Write it right after the command or pass it with `--id`. |
| `--chart` | string | Required for an item embedded in a note, dashboard or slide | The name of a chart inside a note, dashboard or slide. It is metadata.charts\[\].name in the result of fetch. |
| `--offset` | integer |  | The number of rows to skip, counted from 0. |
| `--limit` | integer |  | The number of rows to return, up to 100. |

<a id="chart-get-data-examples"></a>

### Examples

#### Get the first 5 rows of a chart

**Terminal**

```sh
expl server chart get-data <id> --chart <chart> --limit 5 --json
```

Replace \<id\> with the id of the note and \<chart\> with a chart name from the result of fetch.

The result below was run on the chart kL8mN9oP (Sales by Region) in the dashboard Sales Orders Dashboard (id pQ9rS0tU1v). Long output is trimmed.

**Result**

```text
{
  "success": true,
  "item": {
    "id": "pQ9rS0tU1v",
    "type": "dashboard",
    "title": "Sales Orders Dashboard"
  },
  "summary": "Returned 5 of 8 rows of chart \"Sales by Region\". To aggregate instead of paging, use chart_query with the same id and chart.",
  "result": {
    "chart": {
      "name": "kL8mN9oP",
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
  "url": "https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v"
}
```

<a id="chart-get-data-output"></a>
<a id="chart-get-data-paging"></a>

### Output and limits

Besides the rows, the result explains the numbers: chart.encoding (column, aggregation and number format per shelf), chart.filters, chart.data_granularity (aggregated or row level), chart.unsupported (what cannot be returned) and context (publication, data time and parameter values). The numbers are the values as published; results for other parameter values in the browser are not available. A chart published on its own returns a sample of the rows it was drawn from (up to 10,000), not aggregated values or the values of the whole chart, so do not add the rows up as a total.

Pass the number of rows you have already read to offset to read on. One call returns at most 100 rows.

<a id="chart-get-data-trouble"></a>

### Troubleshooting

| What you see | What to do |
| --- | --- |
| You need totals, sorting or filtering | Use chart query. |
| DATA_EGRESS_LIMIT | The publisher does not share the rows of this data. Use its charts, analytics or summary instead. |
| `Run "expl server login".` | You are not signed in or the token was rejected. Run expl server login. |

Related: [expl server chart query](#chart-query), [expl server chart get-image](#chart-get-image)

<a id="chart-get-image"></a>

## expl server chart get-image

Get a chart as a PNG image, to see its shape, trend and layout.

<a id="chart-get-image-usage"></a>

### Usage

```text
expl server chart get-image <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="chart-get-image-flags"></a>

### Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the note, dashboard or slide that holds the chart, or of a chart published on its own. Write it right after the command or pass it with `--id`. |
| `--chart` | string | Required for an item embedded in a note, dashboard or slide | The name of a chart inside a note, dashboard or slide. It is metadata.charts\[\].name in the result of fetch. |

<a id="chart-get-image-examples"></a>

### Examples

#### Get a chart image

**Terminal**

```sh
expl server chart get-image <id> --chart <chart> --json
```

Replace \<id\> with the id of the note and \<chart\> with a chart name from the result of fetch.

Example of the output shape; values are illustrative. The example is for the chart qR0sT1uV (Monthly Sales Trend) in the dashboard pQ9rS0tU1v. The image_path line (where the image is saved) is left out. A chart published without a stored image returns NOT_FOUND ("This chart has no stored image"); use chart get-data for it.

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
      "data_as_of": "2026-11-14T22:02:21.534Z",
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
    "The data was refreshed at 2026-11-14T22:02:21.534Z, after this image was captured at 2026-11-12T09:26:51.086Z. The image may not show the current numbers; use chart_get_d…"
  ],
  "url": "https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v"
}
```

<a id="chart-get-image-output"></a>
<a id="chart-get-image-paging"></a>

### Output and limits

The image is the one saved when the item was published; it is not drawn again, so it can be older than the data. Check result.image.may_be_stale. The image is saved on the computer that runs expl, and image_path in the result gives the location. Use `--output` to choose where to save it. Read exact numbers with chart get-data, not from the image.

There is no paging.

<a id="chart-get-image-trouble"></a>

### Troubleshooting

| What you see | What to do |
| --- | --- |
| A may_be_stale warning appears | The image may be older than the latest data update. Check the latest numbers with chart get-data. The warning is printed to standard error. |
| `Run "expl server login".` | You are not signed in or the token was rejected. Run expl server login. |

Related: [expl server chart get-data](#chart-get-data)

<a id="analytics-get-result"></a>

## expl server analytics get-result

Get the results of analytics (regression, correlation, chi-square test and so on) as structured data.

<a id="analytics-get-result-usage"></a>

### Usage

```text
expl server analytics get-result <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="analytics-get-result-flags"></a>

### Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the note, dashboard or slide that holds the analytics, or of an analytics published on its own. Write it right after the command or pass it with `--id`. |
| `--analytics` | string | Required for an item embedded in a note, dashboard or slide | The name of an analytics inside a note, dashboard or slide. It is metadata.blocks\[\].name in the result of fetch. |
| `--tables` | list of values |  | The ids of the tables to return (available_tables\[\].id). By default it returns the tables that answer the analysis. |
| `--limit` | integer |  | The maximum number of rows per table, up to 100. |

<a id="analytics-get-result-examples"></a>

### Examples

#### Get an analytics result

**Terminal**

```sh
expl server analytics get-result <id> --analytics <analytics> --limit 3 --json
```

Replace \<id\> with the id of the note and \<analytics\> with an analytics name from the result of fetch.

The result below was run on the analytics Analytics 1 - Correlations (id Analytics-1-Correlations-aB1cD2eF), which is published on its own, so `--analytics` is not passed. Long output is trimmed. The explanation texts are left empty in this example.

**Result**

```text
{
  "success": true,
  "item": {
    "id": "Analytics-1-Correlations-aB1cD2eF",
    "type": "analytics",
    "title": "Analytics 1 - Correlations"
  },
  "summary": "Result of do_cor \"Analytics 1\": 1 table(s) (heatmap).",
  "result": {
    "analytics_id": "uV0wX1yZ",
    "analysis_type": "do_cor",
    "has_result": true,
    "model_definition": {
      "target": null,
      "predictors": [],
      "columns": [
        "Sales",
        "Quantity",
        "Discount"
      ],
      "n": null
    },
    "tables": {
      "heatmap": {
        "name": "Correlations",
        "headers": [
          "pair.name.x",
          "pair.name.y",
          "correlation"
        ],
        "columns": [
          {
            "id": "pair.name.x",
            "label": "pair.name.x"
          },
          {
            "id": "pair.name.y",
            "label": "pair.name.y"
          },
          {
            "id": "correlation",
            "label": "correlation"
          }
        ],
        "split_column": null,
        "rows": [
          [
            "Sales",
            "Sales",
            1
          ],
          [
            "Sales",
            "Sales Comp",
            0.76782797841
          ],
          [
            "Sales",
            "Marketing",
            0.75210090599
          ]
        ],
        "total_row_count": 25,
        "rows_truncated": true,
        "row_level": false
      }
    },
    "row_level": false,
    "summary_fields": {
      "baseline_p": 0.05,
      "baseline_p_pct": 5
    },
    "available_tables": [
      {
        "id": "heatmap",
        "name": "Correlations",
        "marker": "heatmap",
        "included": true,
        "row_level": false
      },
      {
        "id": "significance",
        "name": "Significance",
        "marker": "scatter",
        "included": false,
        "row_level": true
      },
      {
        "id": "scattermatrix",
        "name": "Scatter Matrix",
        "marker": "scattermatrix",
        "included": false,
        "row_level": true
      }
    ],
    "precision": "as_displayed",
    "title": "Analytics 1",
    "settings": {
      "target": null,
      "predictors": [],
      "params": {
        "columns": [
          "Sales",
          "Quantity",
          "Discount"
        ],
        "method": "pearson",
        "variable_order": "correlation",
        "distinct": "FALSE",
        "diag": "TRUE",
        "distinct_p_value": "TRUE",
        "diag_p_value": "FALSE"
      },
      "source": {
        "step": "MariaDB_MySQL_Source1"
      },
      "filters": []
    },
    "texts": [],
    "unsupported": [],
    "context": {
      "publication_version": "2025-06-05T12:17:37.781Z",
      "data_as_of": "2026-11-14T15:01:23.274Z",
      "parameters": {
        "applied": true,
        "values": [
          {
            "name": "Shipmodes",
            "display_name": "Shipmodes（This will not affect SQL）",
            "value": [
              "Same Day",
              "Second Class",
              "Standard Class"
            ]
          }
        ],
        "note": "Values as published. A viewer who changes the parameters in the browser sees different results."
      },
      "dashboard_filters": "none"
    }
  },
  "warnings": [],
  "url": "https://exploratory.io/viz/exploratory/Analytics-1-Correlations-aB1cD2eF"
}
```

<a id="analytics-get-result-output"></a>
<a id="analytics-get-result-paging"></a>

### Output and limits

The result holds the model definition (target, predictors, N), result tables with stable column ids, headline statistics split into training and test, the settings it ran with, and explanation texts marked as generated or AI-generated. Values are as displayed, and coefficients are unstandardized.

Use `--limit` to cap the rows of each table. There is no way to page through the rest.

<a id="analytics-get-result-trouble"></a>

### Troubleshooting

| What you see | What to do |
| --- | --- |
| You do not know the name of the analytics | Look at metadata.blocks in the result of fetch. |
| `Run "expl server login".` | You are not signed in or the token was rejected. Run expl server login. |

Related: [expl server fetch](#fetch)

<a id="chart-query"></a>

## expl server chart query

Filter and aggregate the data of a chart in a note, dashboard or slide on the server and return only the result.

<a id="chart-query-usage"></a>

### Usage

```text
expl server chart query [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="chart-query-flags"></a>

### Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required unless queries is used | The id of the note, dashboard or slide that holds the chart, from a search result or a fetch. |
| `--chart` | string | Required unless queries is used | The name of the chart: metadata.charts\[\].name in the result of fetch (letters, digits, _ and -). |
| `--mode` | string | Required unless queries is used | rows: get the rows that match the filters. aggregate: group by dimensions and calculate metrics. Values: `rows`, `aggregate` |
| `--columns` | list of values |  | Only in rows mode. 1 to 50 unique column names to return. |
| `--filters` | JSON |  | The filter conditions: a single condition, or `{ "and": [...] }` or `{ "or": [...] }` with 2 or more conditions each. Nest at most 3 levels, with at most 20 conditions in all. |
| `--dimensions` | JSON |  | Only in aggregate mode. 0 to 5 columns to group by. Values are used as stored, so there is no option to extract a month or year from a date for grouping. Without it, you get one total row. |
| `--metrics` | JSON | Required in aggregate mode | Only in aggregate mode, and required there. 1 to 10 calculations. |
| `--sort` | JSON |  | The sort order, up to 3 entries. |
| `--limit` | integer |  | The maximum number of result rows. rows: default 100, at most 1,000. aggregate: default 100, at most 500. There is no paging. |
| `--queries` | JSON |  | Several independent queries in one call, up to 10. Each takes id, chart and the same fields as a single query. |

<a id="chart-query-json-arguments"></a>

### JSON inputs

See [dataset query](#dataset-query-json-arguments) for the JSON structure of filters, metrics and sort. Chart queries do not use the join parameters.

<a id="chart-query-examples"></a>

### Examples

#### Aggregate the data of a chart

**Terminal**

```sh
expl server chart query --id <id> --chart <chart> --mode aggregate --dimensions '[{"column":"<column>"}]' --metrics '[{"function":"count_rows","alias":"n"}]' --json
```

Replace \<id\> with the id of the note, \<chart\> with the chart name and \<column\> with a column name from query.columns in the result of chart get-data. The syntax is the same as for dataset query.

The result below was run on the chart kL8mN9oP (Sales by Region) in the dashboard Sales Orders Dashboard (id pQ9rS0tU1v). The chart has 8 regions, so each region counts 1 row. Long output is trimmed.

**Result**

```text
{
  "query_id": "cq_ba198537",
  "chart": {
    "item_id": "pQ9rS0tU1v",
    "item_title": "Sales Orders Dashboard",
    "item_type": "dashboard",
    "name": "kL8mN9oP",
    "title": "Sales by Region",
    "type": "bar",
    "data_granularity": "aggregated",
    "url": "https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v",
    "version": "20261112T092937Z-3fc872d2",
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
  "columns": [
    {
      "name": "region",
      "type": "string",
      "role": "x"
    },
    {
      "name": "n",
      "type": "integer",
      "source": {
        "function": "count_rows",
        "column": null
      }
    }
  ],
  "rows": [
    [
      "Kinki",
      1
    ],
    [
      "Kyushu-Okinawa",
      1
    ],
    [
      "Shikoku",
      1
    ]
  ],
  "result": {
    "row_count": 8,
    "has_more": false,
    "source_row_count": 8
  },
  "warnings": []
}
```

<a id="chart-query-output"></a>
<a id="chart-query-paging"></a>

### Output and limits

The table queried is the chart's table as published, with values the chart has already aggregated. Grand total and subtotal rows are not in the table; they come back in result.excluded_totals, so use them for overall values instead of adding up rows. Summing or averaging a column the chart already averaged, counted distinct or computed as a ratio carries the warning CHART_REAGGREGATION; then say so or use excluded_totals. When you report numbers, also say the chart's aggregation, chart.filters, context.parameters and context.data_as_of.

There is no paging. When has_more in the result is true, narrow the filters or aggregate.

<a id="chart-query-trouble"></a>

### Troubleshooting

| What you see | What to do |
| --- | --- |
| CHART_REAGGREGATION | You are aggregating a column the chart has already aggregated. Mention the warning or use result.excluded_totals. |
| `Run "expl server login".` | You are not signed in or the token was rejected. Run expl server login. |

Related: [expl server chart get-data](#chart-get-data), [expl server chart get-image](#chart-get-image)

<a id="desktop-mcp-setup-guide"></a>

## expl server desktop mcp-setup-guide

Return the steps and links for connecting an AI tool to Exploratory Desktop.

<a id="desktop-mcp-setup-guide-usage"></a>

### Usage

```text
expl server desktop mcp-setup-guide [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="desktop-mcp-setup-guide-flags"></a>

### Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--client` | string |  | The MCP client you use. Without it, the steps for all clients are returned. Values: `claude_code`, `codex`, `cursor`, `antigravity` |

<a id="desktop-mcp-setup-guide-examples"></a>

### Examples

#### Get the steps

**Terminal**

```sh
expl server desktop mcp-setup-guide --json
```

Long output is trimmed. The result lists the requirements, the install commands of each client and the steps for Grok Bot; only the first client is shown here.

**Result**

```text
{
  "summary": "Install the Exploratory Desktop plugin (exploratory@exploratory) from our GitHub marketplace (exploratory-io/exploratory). It registers exploratory-desktop for local projects on the user's computer. Exploratory Desktop v17 or later must be running for every De…",
  "links": {
    "plugin": "https://github.com/exploratory-io/exploratory",
    "install": "https://github.com/exploratory-io/exploratory#install"
  },
  "install": [
    {
      "client": "Claude Code",
      "installs": "The exploratory-desktop MCP server, Desktop skills and Claude-only hooks from our GitHub marketplace.",
      "commands": [
        "claude plugin marketplace add exploratory-io/exploratory",
        "claude plugin install exploratory@exploratory"
      ],
      "after": "Start a new session and check exploratory-desktop in /mcp. Server sign-in is not needed for Desktop."
    }
  ]
}
```

<a id="desktop-mcp-setup-guide-output"></a>
<a id="desktop-mcp-setup-guide-paging"></a>

### Output and limits

It only returns steps and links. It does not install or run anything, and it does not operate Desktop.

There is no paging.

<a id="desktop-mcp-setup-guide-trouble"></a>

### Troubleshooting

| What you see | What to do |
| --- | --- |
| `Run "expl server login".` | You are not signed in or the token was rejected. Run expl server login. |

Related: [Sign in](/en/cli/server/login)

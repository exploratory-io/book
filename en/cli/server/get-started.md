---
title: "Get started"
---

Install expl, sign in, then search for published content and read it. Do the steps below in order and you get your first result on this one page.

<a id="steps"></a>

## Steps

### 1. Install

If you use Exploratory Desktop, expl is already installed. If not, install it with npm. Node.js 20 or later is required.

```sh
npm install -g @exploratory/cli
```

This installs the latest version. Open a new terminal and check it.

```sh
expl --version
```

> If the first line reads expl \<version\>, it works.

For other ways to install, and for what to do when two copies are installed, see [Installation](/en/cli/server/install).

### 2. Sign in

```sh
expl server login
```

Your browser opens. Sign in to Exploratory and allow access.

```sh
expl server status
```

Shows the server, your user and how you are signed in. If you see "Logged in to exploratory.io as …" after login, you are signed in.

### 3. Search

Write the search words right after the command. A value written without a flag name, like this, is called a positional argument.

```sh
expl server search "Sales Orders" --scope all --type data
```

`--scope` all searches content published by other people as well as your own. `--type` data limits the result to data. An empty result means that nothing matched; it is not a sign-in error. To search for notes, use `--type` note.

**Result**

```text
ID          TITLE         URL                                                TYPE  DESCRIPTION                                                                                                                                                                                                                                                                                                   AUTHOR
hI6jK7lM8n  Sales Orders  https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n  data  One row is one order line item (an order can have several lines, line_no 1-3). Period: order_date from 2025-01-01 to 2026-10-31. Columns: order_id (order ID), line_no (line number within the order), order_date, ship_date (shipping date; can be later than the order date, up to 2026-11-04), custome...  Alex Kim
```

> If the result lists content with ids and URLs, the search works.

### 4. Read

```sh
expl server fetch <id> --json
```

Replace \<id\> with an id from the search result. `--json` prints the server's result as JSON. In the result below, IDs, URLs, and names are replaced for illustration. Long output is trimmed, so the JSON below is an excerpt, not a complete JSON.

**Result**

```text
{
  "id": "hI6jK7lM8n",
  "title": "Sales Orders",
  "text": "# Sales Orders\n\nRows (total): 23,131\n\n## Columns\n\n| name | type | description |\n| --- | --- | --- |\n| order_id… (trimmed)",
  "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n",
  "metadata": { … (trimmed) }
}
```

The result holds the text. For a note, dashboard or slide it can also hold the list of headings (metadata.toc), depending on its length and your options. When it is missing, add `--include-toc` to return it, or get the heading ids with `--query`.

### 5. Aggregate (optional)

For a data item, first check the column names and types.

```sh
expl server dataframe get-schema <id> --detail light --json
```

Replace \<id\> with the id of a data item. In the result below, IDs, URLs, and names are replaced for illustration. Long output is trimmed.

**Result**

```text
{
  "success": true,
  "item": { "id": "hI6jK7lM8n", "type": "data", "title": "Sales Orders" },
  "summary": "14 columns, 23131 rows.",
  "result": { "row_count": 23131, "columns": [ … (trimmed) ] }
}
```

Once you know the column names, aggregate. This example sums the sales column for each value of the region column and sorts the totals from the largest.

```sh
expl server dataset query <dataset_id> --mode aggregate --dimensions '[{"column":"region"}]' --metrics '[{"function":"sum","column":"sales","alias":"sales"}]' --sort '[{"field":"sales","direction":"desc"}]' --limit 5 --json
```

Replace \<dataset_id\> with the data id and region with a real column name. Wrap each JSON value in single quotes ('). In the result below, IDs, URLs, and names are replaced for illustration. It sums sales by region on the Sales Orders data. The values match Sales by Region in the Sales Orders Dashboard.

**Result**

```text
{
  "dataset": { "id": "hI6jK7lM8n", "name": "Sales Orders", … (trimmed) },
  "columns": [ { "name": "region", "type": "string" }, { "name": "sales", "type": "float" } ],
  "rows": [ [ "Kanto", 148695040 ], [ "Kinki", 74050840 ], … (trimmed) ],
  "result": { "row_count": 5, "has_more": true }
}
```

The result includes the data version and update time. Check which data the numbers are based on.

<a id="trouble"></a>

## If something does not work

- The search result is empty: nothing matched. It is not a sign-in error. Change the search words, or use `--scope` all.
- You cannot open a browser: in a script or CI, where there is no browser, sign in with an API key instead: `expl server login --with-token` (see [API keys](/en/cli/server/token)). For a machine that cannot open a browser, see [Sign in](/en/cli/server/login#nobrowser).
- You see `Run "expl server login".`: you are not signed in, or the saved login was rejected. Run expl server login.
- You see expl: command not found: open a new terminal and try again.
- You do not know which id to use: use an id from the search result.
- The list of headings (metadata.toc) is missing from a note: add `--include-toc`, or get the heading ids with `--query`.

See [Troubleshooting](/en/cli/server/troubleshooting) for more.

<a id="next"></a>

## Next

- [Read notes](/en/cli/server/guides/read-notes) - How to read long notes and get chart numbers.
- [Query data](/en/cli/server/guides/query-data) - How to write the JSON arguments.
- [Automation](/en/cli/server/guides/automation) - Create an API key and run it in CI.
- [Use](/en/cli/server/use) - Find the command for what you want to do.
- [Troubleshooting](/en/cli/server/troubleshooting) - Find a fix by symptom.

# Exploratory CLI: Server

expl server reads the notes, dashboards and data published on exploratory.io from your terminal.

<a id="target"></a>

## What this is for

> This page covers Exploratory Server only. For Exploratory Desktop, see [CLI Desktop](../desktop/desktop.md) and [MCP Desktop](../../mcp/desktop/desktop.md).
>
> To connect from an AI app, see [MCP Server](../../mcp/server/server.md).

<a id="start"></a>

## Get started

### 1. Install

If you use Exploratory Desktop, expl is bundled with the app. Without Desktop, install it with npm (the command that installs Node.js packages).

#### Bundled with Desktop

**Bundled with Desktop**

```sh
expl --version
```

#### Install with npm

**Install with npm**

```sh
npm install -g @exploratory/cli@<version>
```

Replace \<version\> with the version you want. Node.js 20 or later is required. After installation, open a new terminal and run expl --version to verify it.

#### Run with npx

**Run with npx**

```sh
npx -y @exploratory/cli --version
```

Runs expl once without installing it. Node.js 20 or later is required; see the Node.js website (https://nodejs.org/) to install it.

> If the first line reads expl \<version\>, it is installed.

### 2. Sign in

```sh
expl server login
```

Your browser opens. Sign in to Exploratory and allow access. A token (a string that lets expl act as you on Exploratory) is saved on this computer.

> If you see "Logged in to exploratory.io as …", you are signed in.

To sign in without a browser, use an API key: run expl server login --with-token. See the API keys page.

### 3. Find and read

```sh
expl server search "Sales Orders" --scope all --type data
```

--scope all searches content published by other people as well as your own. --type data limits the result to data.

**Result**

```text
ID          TITLE         URL                                                TYPE  DESCRIPTION                                                                                                                                                                                                                                                                                                   AUTHOR
llS6nQK3aH  Sales Orders  https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH  data  One row is one order line item (an order can have several lines, line_no 1-3). Period: order_date from 2025-01-01 to 2026-10-31. Columns: order_id (order ID), line_no (line number within the order), order_date, ship_date (shipping date; can be later than the order date, up to 2026-11-04), custome...  Alex Kim
```

```sh
expl server fetch <id>
```

Replace \<id\> with an id from the search result. The result below was run on the data with the id llS6nQK3aH (Sales Orders). Long output is trimmed.

**Result**

```text
# Sales Orders

Rows (total): 23,131

## Columns

| name | type | description |
| --- | --- | --- |
| order_id | character |  |
| line_no | numeric |  |
| order_date | Date |  |
| ship_date | Date |  |
| customer_id | character |  |
| prefecture | character |  |
| channel | character |  |
| category | character |  |
| quantity | numeric |  |
| amount | numeric |  |
| sales | numeric |  |
| discount | numeric |  |
| return_flag | character |  |
| region | character |  |

## Sample rows

| order_id | line_no | order_date | ship_date | customer_id | prefecture | channel | category | quantity | amount | sales | discount | return_flag | region |
… (trimmed)
```

<a id="tasks"></a>

## Find a guide

- [Read notes](guides/read-notes.md) - Search, then read the text and chart numbers.
- [Query data](guides/query-data.md) - Check columns, filter and aggregate.
- [Get chart numbers](guides/dashboard-charts.md) - Get and aggregate the numbers of a chart in a dashboard or note.
- [Get analytics results](guides/analytics.md) - Get the result of an analysis as tables.
- [Save results to a file](guides/export.md) - Save the result of a query as CSV or Parquet.
- [Automation](guides/automation.md) - Run it from scripts and CI without anyone at the keyboard.

<a id="commands"></a>

## Server commands (expl server)

The commands you will use most. Arguments and flags (extra settings that start with --) are on each command page.

| Goal | Command |
| --- | --- |
| Search or list | expl server search |
| Read content | expl server fetch |
| Check the columns of data | expl server dataframe get-schema |
| See rows of data | expl server dataframe preview |
| Filter and aggregate data | expl server dataset query |
| Save a result as a file | expl server dataframe export |
| Get chart numbers | expl server chart get-data |
| Get a chart image | expl server chart get-image |
| Aggregate chart numbers | expl server chart query |
| Get an analytics result | expl server analytics get-result |

- [All commands](commands.md) - Find every command by purpose.

<a id="ai"></a>

## Use with AI

- [AI agents](guides/agents.md) - Teach an AI that can run shell commands how to use expl.
- [MCP Server](../../mcp/server/server.md) - Read published content from an AI app.

<a id="privacy"></a>

## What is sent and recorded

expl sends no usage analytics of its own. It talks only to Exploratory Desktop on your computer and to the Exploratory Server you sign in to.

- [What Exploratory Server records](../../mcp/server/data.md) - Tokens, the data access log, server logs and errors.
- [What Desktop records](../desktop/desktop.md#records) - Described on the Desktop page.

# Examples

Examples of what you can ask the AI through the Desktop MCP. For each one, open a project in Exploratory Desktop and talk to your AI tool. If you have not installed the plugin yet, do [Install the plugin](install.md) first.

The charts and text that come out depend on your data and your AI tool. You can use the sample requests as they are, or reword them for your own data.

<a id="before"></a>

## Before you start

- Open a project in Exploratory Desktop and turn on Enable MCP in System Settings \> MCP / CLI.
- For the examples that create or change charts, notes, dashboards and so on, also check Allow create, edit and delete. With it off, the AI can only read.
- Desktop asks you before it deletes, publishes or runs R code. See [Permissions and settings](limits.md).

<a id="server-or-desktop"></a>

## Server or Desktop

Desktop works on your local projects, including changes you have not published. To read content published on exploratory.io, use the [Server MCP](../server/server.md).

When a request does not say which one, the plugin's skill checks first. For example, when you ask for a chart from data on exploratory.io, the AI may ask whether to build it in Exploratory Desktop. If you say "in Exploratory Desktop" from the start, it goes ahead without asking.

<a id="examples"></a>

## Examples

### Read the data

```text
What columns does the sales data in my open project have? Also give me the count for each region.
```

The AI reads the column names, the values and the counts from the data frame (the data frame preview and profile tools).

### Create or change a chart

```text
In my open Exploratory project, build a monthly bar chart from the sales data.
```

```text
Change this chart to a scatter plot.
```

Creating and changing charts (create_chart, update_chart). You can open the chart in Exploratory Desktop to check it.

### Wrangle the data

```text
Make a month column from the order date, then total the sales by region.
```

Wrangling such as creating, filtering, summarizing and joining columns is added as wrangling steps (create_wrangling_step). The steps line up in the steps on the right side of Exploratory Desktop.

### Classify text

```text
Make a column that classifies the free-text reviews by topic.
```

Classifying text by its meaning is built as an AI function column. It is separate from converting values by fixed rules. Desktop asks you before it runs.

### Run a statistical analysis

```text
Find out with a regression which factors affect sales.
```

```text
Split the customers into clusters.
```

Creates analytics such as regression, tests and clustering (create_analytics). You can open the result as analytics in Exploratory Desktop.

### Write up a report

```text
Put the analysis results into a note.
```

Writes and saves a note and embeds charts in it (create_note, update_note). You can also ask to update a dashboard, or to publish a note or a dashboard (publish_note, publish_dashboard). Desktop asks you before it publishes.

### Add a filter

```text
I want a filter where I can pick the period.
```

Creates a parameter, sets its list of values and applies it to a filter or a chart (save_parameter and others).

### Import data

```text
Import this file.
```

Imports data from a file or a database and creates a data source or a connection (create_data_source, save_connection). Desktop asks you before it saves a connection.

<a id="next"></a>

## Read next

- [Tools](tools.md) - What the AI can do, by purpose.
- [Permissions and settings](limits.md) - When Desktop asks you, and how much data the AI can see.

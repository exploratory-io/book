# Use

What you can ask your AI to do in your local projects through the Desktop MCP. For each one, open a project in Exploratory Desktop and talk to your AI tool. If you have not installed the plugin yet, do [Install the plugin](install.md) first.

| What you want to do | Section | Main tools the AI uses |
| --- | --- | --- |
| Import data | [Import and wrangle data](#import) | create_data_source, save_connection |
| Wrangle data | [Import and wrangle data](#import) | create_wrangling_step |
| See columns and counts | [Other](#other) | preview_data_frame, profile_data_frame |
| Create a chart | [Create charts](#charts) | create_chart, update_chart |
| Create an analytics | [Create analytics](#analytics) | create_analytics |
| Write a note | [Write notes](#notes) | create_note, update_note |
| Create or copy a dashboard | [Create and duplicate dashboards](#dashboards) | create_dashboard, get_dashboard, validate_dashboard |
| Publish | [Publish](#publish) | publish_note, publish_dashboard |
| Add a filter that picks a value | [Other](#other) | save_parameter |

For what each tool does, and which ones need Allow create, edit and delete, see [Tools](tools.md). To do the same from a terminal, see [Use](../../cli/desktop/use.md) of CLI Desktop.

The charts and text that come out depend on your data and your AI tool. You can use the sample requests as they are, or reword them for your own data.

<a id="before"></a>

## Before you start

- Open a project in Exploratory Desktop and turn on the MCP switch in System Settings \> MCP / CLI.
- For the examples that create or change charts, notes, dashboards and so on, also check Allow create, edit and delete. With it off, the AI can only read.
- After you change the settings, choose Save at the bottom of System Settings to save them.
- Desktop asks you before it deletes, publishes or runs R code, unless you turned on the setting that runs these without asking. Where an example below says Desktop asks you, it means this case. See [Permissions and settings](limits.md).

<a id="server-or-desktop"></a>

## Server or Desktop

Desktop works on your local projects, including changes you have not published. To read content published on exploratory.io, use the [Server MCP](../server/server.md).

When a request does not say which one, the plugin's skill checks first. For example, when you ask for a chart from data on exploratory.io, the AI may ask whether to build it in Exploratory Desktop. If you say "in Exploratory Desktop" from the start, it goes ahead without asking.

<a id="examples"></a>

## Examples

<a id="import"></a>

### Import and wrangle data

```text
Import this file.
```

Imports data from a file or a database and creates a data source or a connection (create_data_source, save_connection). Desktop asks you before it saves a connection.

```text
Make a month column from the order date, then total the sales by region.
```

Wrangling such as creating, filtering, summarizing and joining columns is added as wrangling steps (create_wrangling_step). The steps line up in the steps on the right side of Exploratory Desktop.

```text
Make a column that classifies the free-text reviews by topic.
```

Classifying text by its meaning is built as an AI function column. It is separate from converting values by fixed rules. Desktop asks you before it runs.

<a id="charts"></a>

### Create charts

```text
In my open Exploratory project, build a monthly bar chart from the sales data.
```

```text
Change this chart to a scatter plot.
```

Creating and changing charts (create_chart, update_chart). You can open the chart in Exploratory Desktop to check it.

<a id="analytics"></a>

### Create analytics

```text
Find out with a regression which factors affect sales.
```

```text
Split the customers into clusters.
```

Creates analytics such as regression, tests and clustering (create_analytics). You can open the result as analytics in Exploratory Desktop.

<a id="notes"></a>

### Write notes

```text
Put the analysis results into a note.
```

Writes and saves a note and embeds charts in it (create_note, update_note). You can open the note in Exploratory Desktop to check it.

<a id="dashboards"></a>

### Create and duplicate dashboards

```text
Create a dashboard with the sales charts side by side.
```

Creates a dashboard of pages, rows and panels (create_dashboard). You can check the layout before saving (validate_dashboard).

```text
Duplicate the "Sales Orders Dashboard" and change only the title.
```

Reads the definition of the original dashboard (get_dashboard), changes the title and creates it as a new dashboard (create_dashboard).

<a id="publish"></a>

### Publish

```text
Publish this note and this dashboard.
```

Publishes a note or a dashboard to the server with a public URL (publish_note, publish_dashboard). You can also take a publication back (unpublish). Desktop asks you before it publishes or takes a publication back.

<a id="other"></a>

### Other

```text
What columns does the sales data in my open project have? Also give me the count for each region.
```

The AI reads the column names, the values and the counts from the data frame (the data frame preview and profile tools).

```text
I want a filter where I can pick the period.
```

Creates a parameter, sets its list of values and applies it to a filter or a chart (save_parameter and others).

<a id="next"></a>

## Read next

- [Tools](tools.md) - What the AI can do, by purpose.
- [Permissions and settings](limits.md) - When Desktop asks you, and how much data the AI can see.

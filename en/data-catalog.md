---
title: "Data Catalog"
sidebarTitle: "Data Catalog"
description: "Find the data you have published in one list, import it into other projects, refresh it on a schedule, and use it from AI agents."
---

The Data Catalog is a place to keep published data together, find it, and reuse it. Once you publish a data frame, you can import it into other projects. If you set a refresh schedule, you can always work with up-to-date data. AI agents can also find and use it.

There are two kinds of Data Catalog.

- **Server**: Data published to Exploratory Server (exploratory.io). You can share it with your team members
- **Local**: Data saved on this PC. You can list, search, refresh on a schedule, and use it from AI agents without putting it on the server

You register data in both from the publish dialog of a data frame.

## Publish Data to the Catalog

1. In a project, select the step of the data frame you want to add to the catalog and click the "Publish" button
2. Under "Publish to" in the publish dialog, check "Server", "Local", or both
   - **Server**: "Share on Exploratory Server" and "Schedulable on the server"
   - **Local**: "Save on this PC" and "Schedulable on this PC"
3. Enter a title, a description, and tags. Click the "AI" button in the description field and AI reads the data and writes a description for you
4. Click "Publish"

When you publish to Local, a message says the data was published to the data catalog. The data appears in the "Data Catalog" tab of the window that lists your projects.

Publishing to the server works only when offline mode is off and you are signed in. If you check both and your sign-in has expired, the data is saved only locally. Sign in and publish again.

To update data you have already published, publish it again in the same way. A "Change note" you write is kept in the version history.

## Find Data in the List

The "Data Catalog" tab of the window that lists your projects shows the local data catalog on this PC.

- In the search box, choose which of "Name", "Description", "Tags", and "Columns" to search. Matching tags and columns appear under the data name as "Match"
- You can sort by updated date (newest or oldest first) or by name (ascending or descending)
- The list shows the data name, the source project, the number of rows, the updated date, the schedule, the refresh status (Success, Failed, Running), and the MCP checkbox
- Click a data name to open its details

The details screen has these tabs.

| Tab | Content |
| --- | --- |
| Summary | An overview of the data |
| Table | The data itself. You can filter and sort it |
| Metadata | The description, tags, and a description for each column. "Generate or improve with AI" lets AI write or improve them together |
| Wrangling Steps | The data wrangling steps that produce the data |
| Source | Where the data came from |
| Access Log | A record of access from AI agents (MCP) |

The "⋯" menu at the top right has these actions.

- **Open Folder**: Opens the folder where the data is saved
- **Republish**: Opens the publish dialog of the original data frame. It is not available when the original project or data frame cannot be found
- **Export as EDF**: Writes the data out as an EDF file
- **Delete**: Removes it from the catalog. The files saved on this PC are deleted too

## Import Data from the Catalog

1. In the Data Import menu, choose "Data Catalog"
2. At the top of the "Import from Data Catalog" dialog, choose "Server" or "Local"
3. Search and select the data you want to import. Data that is already imported is marked "Imported"
4. If needed, set filters, choose columns, join other catalog data, or summarize
5. Click "Import"

The selected data is brought into the project as a data frame. Click "Update" after importing to read the latest data again with the same conditions. You can also switch the data source of an existing data frame to catalog data.

## Refresh on a Schedule

Local data can be refreshed regularly at times you choose. Open the schedule dialog from the clock button on the details screen.

- For "Repeat By", choose Monthly, Weekly, Daily, Hourly, or every N minutes
- You can also set a time zone and an end date. "Next run" shows when the next refresh will happen
- A refresh imports the data again from the data sources used when it was published, runs the wrangling steps again, and replaces the data
- It runs even when the app is closed, as long as the PC is on
- You can have a PC notification shown when a refresh fails or succeeds
- The "Run results" tab shows the start time, result, number of rows, and duration of recent runs. To stop the schedule, set "Repeat By" to "None"

Some data cannot be refreshed, for example data whose data source was published as a snapshot, or data that uses a data source that does not support refreshing. A refresh also fails when the data source file cannot be found. Put the file back in the same place on this PC, or update the data source in the original project and publish again. Hover over the refresh status in the list to see the reason.

Data published to the server is refreshed by the server's schedule. See [Schedule](/en/schedule/manage).

## Use It from AI Agents (MCP)

AI agents such as Claude can search the local data catalog, read the data, and filter, group, aggregate, or join it. Only data whose "MCP" checkbox is checked in the list is visible to AI agents. Unchecking it hides the data.

For the tools you can use and when you are asked for confirmation, see these pages.

- [Desktop MCP tools](/en/mcp/desktop/tools)
- [Data and permissions](/en/mcp/desktop/data)
- [Permissions and settings](/en/mcp/desktop/permissions)

## Let AI Answer Questions with the Server Data Catalog

In the server data catalog, you can attach "semantics" to published data. Semantics are definitions that tell AI what the data means. An AI agent reads from them what column names alone do not say, such as what one row represents, which columns can be summed, and whether cancellations are included.

### Generate with AI, then approve as a person

On the "Metadata" tab of the data page, click "Generate / improve with AI". AI drafts the semantics from the overview and the column descriptions. The definitions fall into five groups.

| Group | What you define |
| --- | --- |
| Meaning of the data | The grain (what one row is), the primary date column, what is in and out of scope, a summary of the wrangling, and the update status |
| Column meanings and roles | What each column is for and how to aggregate it |
| Business metrics | The main metrics calculated from this data and how each one is calculated |
| Aggregation rules and cautions | The rules needed to aggregate and interpret the data correctly |
| Questions and aggregation examples | Common questions and the right way to aggregate for each |

What AI writes does not become an official definition as it is. The data owner reviews each item marked "AI suggestion available" and chooses "Approve" or "Reject". Only approved items are passed to AI agents as official definitions. If you edit an approved item and save, the approval is removed, so approve it again.

The "AI Ready" column in the data list shows the preparation status: "Ready", "Needs Review", "Draft", or "Not Set".

### Give AI only the results it needs

An AI agent does not have to read pages of rows. It receives only the results aggregated on the server. The server calculates the filtering, grouping, aggregation, and joining of `query_dataset` with DuckDB, so only the result rows enter the AI conversation.

### Use it from the server MCP

From the server MCP, AI can find and aggregate data using the approved semantics.

- `dataframe_get_schema` returns the approved semantics together with the column information. AI reads these definitions before it aggregates. A definition marked "Needs Review" may be out of date
- `query_dataset` filters and aggregates the data on the server

The data owner can stop MCP access for each data item. Open "Access settings" from the "⋮" menu in the data list and choose "MCP access".

For how to use the tools and what is recorded, see these pages.

- [Server MCP tools](/en/mcp/server/tools)
- [Server MCP data and permissions](/en/mcp/server/data)

## Getting Started Guide

A note explains the steps with screenshots, from publishing to using the data from the server MCP and the Desktop MCP. See [Getting Started: Data Catalog](https://exploratory.io/note/exploratory/Getting-Started-Data-Catalog-ypQ4SEG4).

## Server and Local

| | Server | Local |
| --- | --- | --- |
| Where it is stored | Exploratory Server | This PC |
| Sharing | Shareable with team members | This PC only |
| What search covers | Name, description, tags, author | Name, description, tags, columns |
| Refresh schedule | Runs on the server | Runs on this PC (the PC must be on) |

You can browse server catalog data by "Owned by Me", "Owned by Team", and "Shared With Me". For publishing steps and sharing settings, see [Sharing Data](/en/share/data).

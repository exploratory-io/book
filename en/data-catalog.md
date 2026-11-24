---
title: "Data Catalog"
sidebarTitle: "Data Catalog"
description: "Find the data you have published in one list, import it into other projects, refresh it on a schedule, and use it from AI agents."
---

The Data Catalog is a place to keep published data together, find it, and reuse it. Published data can be reused in other projects. If you set a refresh schedule, the data is refreshed at the times you set. AI agents can also find it. The Data Catalog was added in Exploratory v17.

The Data Catalog offers four values.

- **Prepare**: Publish data that a person has checked, with its wrangling steps kept
- **Understand**: Tell AI what the data means and what its business rules are, with semantics
- **Access**: Get only the data you need with queries
- **Control**: Manage MCP access for each data item, and check usage in the access log

There are two kinds of Data Catalog.

- **Server**: Data published to Exploratory Server (exploratory.io). You can share it with your team members
- **Local**: Data saved on this PC. You can list, search, refresh on a schedule, and use it from AI agents without putting it on the server

You register data in both from the publish dialog of a data frame.

## Publish Data to the Catalog

1. In a project, select the data frame you want to add to the catalog and click the "Publish" button at the top right of the "Table" tab. If the window is narrow, the button shows only its icon. It is not in the menu (≡) of the data frame
2. Under "Publish to" in the publish dialog, check "Server", "Local", or both
   - **Server**: "Share on Exploratory Server" and "Schedulable on the server"
   - **Local**: "Save on this PC" and "Schedulable on this PC"
3. Enter a title, a description, and tags. Click the "AI" button to the right of each heading (pointing at it shows "Generate with AI") and AI writes a draft. The button appears only when an AI service is available. Check the content and edit it if needed
4. Click "Publish". For data you have already published, the button is "Republish"

When publishing to the server is done, a panel shows the progress. Choose "Open" to open the data page on the server.

When you publish only to Local, a message says the data was published to the data catalog. The data appears in the "Data Catalog" tab of the window that lists your projects.

In offline mode, you cannot choose "Server". Even with offline mode off, the data is not published to the server if your sign-in has expired. If you checked both, it is saved only locally. Sign in and publish again.

To update data you have already published, publish it again in the same way. When you publish to the server, a "Change note" you write is kept in the version history.

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
| Metadata | The description, tags, and a description for each column. "Generate / improve with AI" has AI write or improve the overview, the column descriptions, and the semantics |
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
3. Search and select the data you want to import
4. If needed, set filters, choose columns, join other catalog data, or summarize
5. Click "Import"

On the "Local" tab, data you have already imported is marked "Imported". Data whose full data is not saved cannot be imported. Publish it again from the original project.

The selected data is brought into the project as a data frame. Click "Update" after importing to read the latest data again with the same conditions. You can also switch the data source of an existing data frame to catalog data.

You can also ask an AI (such as Claude Code) that is connected to the Desktop MCP to import data from the server Data Catalog into a Desktop project. This works with Exploratory Desktop 17.0 or later. Sign in to the Desktop you import into.

## Refresh on a Schedule

Local data can be refreshed regularly at times you choose. Open the schedule dialog from the clock button on the details screen.

- For "Repeat By", choose Monthly, Weekly, Daily, Hourly, or every N minutes
- You can also set a time zone and an end date. "Next run" shows when the next refresh will happen
- A refresh imports the data again from the data sources used when it was published, runs the wrangling steps again, and replaces the data
- If the background refresh is registered with the OS, it runs even when the app is closed. If it could not be registered, it refreshes while the app is open, and missed refreshes run once when you next open the app (on Windows, also when you sign in)
- You can have a PC notification shown when a refresh fails or succeeds
- The "Run results" tab shows the start time, result, number of rows, and duration of recent runs. To stop the schedule, set "Repeat By" to "None"

Some data cannot be refreshed, for example data whose data source was published as a snapshot, or data that uses a data source that does not support refreshing. A refresh also fails when the data source file cannot be found. Put the file back in the same place on this PC, or update the data source in the original project and publish again. Hover over the refresh status in the list to see the reason.

Data published to the server is refreshed by the server's schedule. See [Schedule](/en/schedule/manage).

## Use It from AI Agents (MCP)

AI agents such as Claude can search the local data catalog, read the data, and filter, group, aggregate, or join it. Only data whose "MCP" checkbox is checked in the list is visible to AI agents. Unchecking it hides the data. You can also add semantics to local data on the "Metadata" tab of the details screen.

For the tools you can use and when you are asked for confirmation, see these pages.

- [Desktop MCP tools](/en/mcp/desktop/tools)
- [Data and permissions](/en/mcp/desktop/data)
- [Permissions and settings](/en/mcp/desktop/permissions)

## Open the Server Data Catalog Page

1. On exploratory.io, choose the account icon at the top right
2. Choose "Data Catalog" in the menu

The list of the data you published appears on the "Data" tab. Some accounts also show an "Access Log" tab. The list has these columns.

- Name, Owner, Sharing, Updated, Schedule, Refresh (the refresh status)
- MCP Access, CLI Access, REST API Access
- AI Ready

Choose a data name to open its data page. You can check the contents on tabs such as "Summary" and "Table". On the "Wrangling Steps" tab, you can see in a diagram how the data was made from the original data.

The "Access Log" shows access to the data: the access method (MCP, API, UI), where it came from (country, IP address, client), the query content, the processing time, and the status.

## Let AI Answer Questions with the Server Data Catalog

In the server data catalog, you can attach "semantics" to published data. Semantics are definitions that tell AI what the data means. An AI agent reads from them what column names alone do not say, such as what one row represents, which columns can be summed, and whether cancellations are included.

### Generate with AI, then approve as a person

1. Open the "Metadata" tab of the data page
2. Click "Generate / improve with AI"
3. In the "Generate metadata with AI" dialog, check "Generation targets" and click "Generate". AI drafts the semantics from the overview, the column information, statistics, the wrangling steps, and so on

The definitions fall into five groups. Aggregation rules are generated only when your server settings enable them.

| Group | What you define |
| --- | --- |
| Meaning of the data | The grain (what one row is), the primary date column, what is in and out of scope, a summary of the wrangling, and the update status |
| Column meanings and roles | What each column is for and how to aggregate it |
| Business metrics | The main metrics calculated from this data and how each one is calculated. You can also register alternative names |
| Aggregation rules and cautions | The rules needed to aggregate and interpret the data correctly |
| Questions and aggregation examples | Common questions and the right way to aggregate for each |

What AI writes does not become an official definition as it is. The data owner reviews it in these steps. Only the data owner can edit semantics.

1. Read the items marked "AI suggestion available" and fix anything that is wrong with "Edit"
2. For each item that is correct, click "Approve". To reject one, click "Reject"
3. To approve many at once, check "Select all" in each section and click "Approve selected (N)". N is the number of items you selected. For "Grain of the data", however, click "Approve" on its own. If other items cannot be approved at once, check their contents and approve each one

Approved items are passed to AI agents as official definitions. Definitions you have not approved are not used. The values in the column can still be aggregated. If you edit an approved item and save, the approval is removed, so approve it again.

The "AI Ready" column in the data list shows the preparation status: "Ready", "Needs Review", "Draft", or "Not Set".

### Give AI only the results it needs

When you ask for an aggregation with `query_dataset`, the server calculates the filtering, grouping, aggregation, and joining with DuckDB. An AI agent can receive the aggregated result without reading pages of rows. In tests during development, data of several million to tens of millions of rows came back within one second. The actual speed depends on the network between the AI agent and the server. When it asks for the original rows, or uses another read tool, the returned rows become part of the conversation. See [Server MCP data and permissions](/en/mcp/server/data) for details.

### Use it from the server MCP

From the server MCP, AI can find and aggregate data using the approved semantics.

- `dataframe_get_schema` returns the approved definitions when you get the full detail (`full`). A definition that became "Needs Review", for example after the data changed, comes with a warning. AI reads these definitions before it aggregates
- `query_dataset` filters and aggregates the data on the server. On an on-premises server, it is available only when the administrator has enabled it

The data owner can set MCP and other access for each data item.

1. In the server "Data Catalog", click the "⋮" at the right end of the row. The menu shows "View Access Log", "Access Settings", and "Unpublish"
2. Choose "Access Settings". You can also select several data items and set them all at once
3. For each of "MCP Access", "CLI Access", and "REST API Access", decide whether to check "Enable". "CLI Access" lets a terminal or an AI agent read the data with `expl server`. "REST API Access" does not appear in some environments
4. When you change a setting, click "Apply". You cannot click "Apply" until you change a setting

For example, to stop MCP, uncheck "Enable" under "MCP Access" and click "Apply". Enabling access does not open the data to everyone. Sign-in, view permissions, and download permissions apply as before.

For how to use the tools and what is recorded, see these pages.

- [Server MCP tools](/en/mcp/server/tools)
- [Server MCP data and permissions](/en/mcp/server/data)

## If Something Goes Wrong

- **It does not appear in the catalog**: Check that the account you are signed in with is the same one you published with. On the server, it appears after publishing succeeds. Also check that the progress panel has finished
- **There is no "Generate / improve with AI" button, or you get an error when you click it**: Only the data owner can edit semantics. It also does not work when the AI feature is off on the server, or when you have not agreed to the terms of use of the AI feature. Ask the owner or the server administrator

## Getting Started Guide

A note explains the steps with screenshots, from publishing to using the data from the server MCP and the Desktop MCP. See [Getting Started: Data Catalog](https://exploratory.io/note/exploratory/Getting-Started-Data-Catalog-ypQ4SEG4). The ideas behind the Data Catalog are explained in [Introduction to Exploratory Data Catalog - Built for Humans and AI Agents](https://exploratory.io/note/kanaugust/uTX9WoA2tT).

## Server and Local

| | Server | Local |
| --- | --- | --- |
| Where it is stored | Exploratory Server | This PC |
| Sharing | Shareable with team members | This PC only |
| What search covers (import dialog) | Name, description, tags, author | Name, description, tags, columns |
| Refresh schedule | Runs on the server | Runs on this PC (even when the app is closed, if registered with the OS) |

On the "Server" tab of the import dialog, you can browse server data by "Owned by Me", "Owned by Team", and "Shared with Me". For publishing steps and sharing settings, see [Sharing Data](/en/share/data).

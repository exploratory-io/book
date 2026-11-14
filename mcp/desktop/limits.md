# Permissions and settings

What Desktop asks you first, what you decide in Desktop, and what is sent and recorded.

<a id="control"></a>

## What you control in Desktop

In System Settings \> MCP / CLI you also decide the following.

- Data to share with the AI application: names, columns and data types only; up to aggregated results (charts, pivot tables); up to sample rows (max 100 rows); or all rows. Requests for more than the level you choose are refused.
- Approval: Desktop asks you first before it deletes items (charts, analytics, notes, dashboards, steps, branches, parameters, connections, palettes, templates, R packages, catalog items), publishes or unpublishes notes, dashboards, data frames and projects, saves a connection, replaces a data source, restores a project's history, manages data frames, changes the system settings or the catalog schedule. It also asks before it runs R code, adds R packages, processes data with AI or asks the note AI. Creating and editing charts, notes and dashboards is not asked about. You can choose to run each of these two groups (changes, deletions and publishing; code and AI) without asking.
- Approved apps: an app asks for your approval the first time it connects. Remove an app to make it ask again.

<a id="privacy"></a>

## What is sent and recorded

- The Desktop MCP runs on your computer. It reads and edits local project content through the app.
- What a tool returns (rows, column names, chart images, errors) becomes part of your conversation. It goes to the provider of your AI under that provider's terms. Do not use it on data that you may not send to that provider.
- Exploratory Desktop sends one usage record for each Desktop MCP tool call to the exploratory.io server you are signed in to. A record holds the tool name and its arguments (which can include formulas and values you entered), success or failure with the error type and message, the size of the result (not the content), the duration, the Desktop version, the AI client name and version, and the session and item IDs. It sends records only while you are signed in and AI features are on, and never for local data catalog tools.

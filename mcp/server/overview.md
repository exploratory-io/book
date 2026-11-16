# Overview and server URL

Read notes and data published on Exploratory from an AI client. An AI client is an app where you ask an AI to do work, such as Claude Code. MCP (Model Context Protocol) is a shared standard for AI apps to connect to outside services and use their features.

<a id="readonly"></a>

## It is read-only

> **Read-only**
>
> This server cannot create, edit, publish or delete content. The one exception is dataframe_export, which creates a download link that is valid for 15 minutes.

> **Server only**
>
> This section covers Exploratory Server only. To create and edit projects in Exploratory Desktop on your computer, use the [Desktop MCP](../desktop/desktop.md).

To use it from a terminal or a script, see [Exploratory CLI](../../cli/server/server.md).

<a id="clients"></a>

## Add it from your app

Pick your app on the [Add from an AI tool](clients/apps.md) page. Claude app, ChatGPT app, Antigravity, Grok Bot, Claude Code, Codex, Cursor and other clients each have their own steps.

<a id="url"></a>

## Server URL

Every client connects to the same address.



```text
https://exploratory.io/mcp
```

<a id="steps"></a>

## Connect

### 1. Register

The [Add from an AI tool](clients/apps.md) page has the registration steps for each app. The server URL is the same for every app.

### 2. Sign in and authorize

After registering the server, start authentication using your app's instructions. Some apps need a login command or an Authenticate button. When the browser opens, sign in to Exploratory and approve the access. This sign-in does not need an API key. If your client cannot open a browser, connect with an API key instead (see [Connect with an API key](auth.md)).

### 3. Try it

```text
Using the connected Exploratory Server, list up to three items I can view, with their URLs. If none are found, say so.
```

> If items appear with their URLs, the connection works. An empty result does not necessarily mean that authentication or the connection failed. If an error appears, follow the guidance for that message in [Limits and errors](limits.md).

To run the same operation from a terminal, see [Exploratory CLI](../../cli/server/server.md).

<a id="apikey"></a>

## Connect with an API key

If your client cannot open a browser, or a job runs by itself, connect with an API key. The steps, the key format, the error messages and the transport and authorization details are in [Authentication and API keys](auth.md).

<a id="examples"></a>

## What you can ask

```text
What columns does the "Sales Orders" data on Exploratory have, and which 5 regions have the highest sales?
```

- [Examples](examples.md) - Examples with notes, data and charts.

<a id="tools"></a>

## What the AI can use

A tool is an operation the AI calls. They only read.

| Kind | Tool | Read only, or create, change, delete | What it does |
| --- | --- | --- | --- |
| Find and read | search | Read only | Search and list published content. |
| Find and read | fetch | Read only | Read a note, dashboard or slide as Markdown. |
| Charts and analytics | chart_get_data | Read only | Get the numbers behind a chart. |
| Charts and analytics | chart_get_image | Read only | Get a chart as an image. |
| Charts and analytics | chart_query | Read only | Filter and aggregate the data of a chart in a note, dashboard or slide on the server. |
| Charts and analytics | analytics_get_result | Read only | Get coefficients, p-values and other results of an analytics. |
| Data | dataframe_get_schema | Read only | Describe the columns and their approved meaning. |
| Data | dataframe_get_wrangling | Read only | Show how a data item was built, step by step. |
| Data | dataframe_preview | Read only | Show rows. |
| Data | query_dataset | Read only | Filter and aggregate on the server. |
| Data | dataframe_export | Read only | Save a result as CSV or Parquet. |

exploratory.io offers these tools. On an on-premises server, which tools appear depends on the server settings; query_dataset, chart_query and dataframe_export appear only when the administrator has turned them on. More tools can appear depending on the settings, for example desktop_mcp_setup_guide, which returns the steps to connect an AI client to Exploratory Desktop. Run expl server tools list to see what your server offers.

- [Tools](tools.md) - Check the inputs and how to use each tool.

<a id="scope"></a>

## Data and permissions

- Calls run as the signed-in user. They never go beyond what that user can view on exploratory.io.
- A publisher can turn off MCP access for each piece of published content. A publisher can also keep the rows of data private.
- You can see and remove connections under Connected AI Apps in your account settings, and API keys under API Keys.

- [Data and permissions](data.md) - Also describes what Exploratory records.
- [Limits and errors](limits.md) - Rate limits and what to do about errors.

<a id="cannot"></a>

## What it does not do

- Create, edit, publish or delete content.
- Recompute a chart or analytics for parameter values other than the published ones.
- Read content that is not published to Exploratory Server, such as projects that exist only in Exploratory Desktop. Use the separate [Desktop MCP](../desktop/desktop.md) for those.

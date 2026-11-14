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

Pick your app on the [Add from an app](clients/apps.md) page. Claude app, ChatGPT app, Antigravity, Grok Bot, Claude Code, Codex, Cursor and other clients each have their own steps.

<a id="url"></a>

## Server URL

Every client connects to the same address.



```text
https://exploratory.io/mcp
```

<a id="spec"></a>

## Transport and authorization

| Item | Value |
| --- | --- |
| Server URL | https://exploratory.io/mcp |
| Transport | Streamable HTTP (a way to send MCP over HTTP), stateless |
| Authorization | OAuth 2.1 with PKCE: sign in with your browser the first time. Or an API key sent as Authorization: Bearer exp_pat_... |
| Scope | content:read (an API key has the same scope) |

Every call needs Authorization: Bearer \<access token or API key\>. A browser session cookie does not authenticate MCP calls. The consent page, the metadata URLs and the details of failed calls are in [Data and permissions](data.md#auth).

<a id="steps"></a>

## Connect

### 1. Register

The [Add from an app](clients/apps.md) page has the registration steps for each app. The server URL is the same for every app.

### 2. Sign in and authorize

On the first call, your client opens a browser window. Sign in to Exploratory and approve the access. This sign-in does not need an API key. If your client cannot open a browser, connect with an API key instead (see Connect with an API key).

### 3. Try it

```text
Find the "Sales Orders" data on Exploratory.
```

> If the Sales Orders data appears with its URL, the connection works.

**The same operation run with the CLI**

```sh
expl server search "Sales Orders" --scope all --type data --limit 3 --json
```

With --json, the result the search tool returned is printed as it is. Long output is trimmed.

**Result**

```text
{
  "results": [
    {
      "id": "llS6nQK3aH",
      "title": "Sales Orders",
      "url": "https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH",
      "type": "data",
      "description": "One row is one order line item (an order can have several lines, line_no 1-3). Period: order_date from 2025-01-01 to 2026-10-31. Columns: order_id (order ID), line_no (line number within the order), order_date, ship_date (shipping date; can be later than the order date, up to 2026-11-04), custome...",
      "author": "Takato Shiroto",
      "team": null,
      "updated_at": "2026-11-12T09:26:51.086Z",
      "refreshed_at": "2026-11-12T08:12:13.528Z",
      "tags": [
        "sales",
        "orders",
        "english"
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
          "name": "line_no",
          "type": "numeric",
          "description": "",
          "missing_count": 0
        }
… (trimmed)
      ],
      "column_count": 14,
      "row_count": 23131
    }
  ],
  "has_more": false,
  "next_offset": null
}
```

<a id="apikey"></a>

## Connect with an API key

Some setups cannot open a browser: a server, a scheduled job, or a client that only lets you set a fixed header. Connect those with an API key. Create one in Account Settings \> API Keys (see API keys on the CLI pages), then send it in the Authorization header of every call to the server URL.

```text
Authorization: Bearer exp_pat_...
```

Replace exp_pat_... with your key.

In Claude Code, a client that accepts a fixed header, register the server like this.

```sh
claude mcp add --transport http exploratory-server https://exploratory.io/mcp --header "Authorization: Bearer exp_pat_..."
```

Typing the key here leaves it in your shell history. Where your client can take the header from a secret store or an environment variable, use that.

- A key reads what you can view, as your browser sign-in does. It is read-only (content:read). Only Authors can create one.
- When a key fails, the server answers 401 or 403 with the reason. It does not start the browser sign-in (OAuth) instead. Fix the key.
- Use the browser sign-in where you can. A key does not go through the consent page, SSO or MFA, so treat it like a password.

| HTTP status | Message | What to do |
| --- | --- | --- |
| 401 | The API key is invalid or expired. Create a new one in Account Settings \> API Keys. | Create a new key, then replace the key in the header. The same message appears when the key was revoked or its owner can no longer use API keys. |
| 403 | API keys are disabled by your administrator. | An administrator turned API keys off. Ask your administrator. |
| 403 | This IP address is not allowed for API keys. | Your administrator allows API keys only from certain IP addresses. Connect from an allowed address. |
| 429 | Too many failed API key attempts. Try again later. | More than 30 refused keys came from one address within 15 minutes (counted per IPv4 address, or per IPv6 /64 range). Fix the key and try again later. |

An administrator on an on-premises or Hosted server can turn API keys off or limit them to certain IP addresses; the two 403 messages above mean that. The publisher settings in Data and permissions apply to a key in the same way.

- [API keys](../../cli/server/token.md) - Create, expire, revoke and keep a key safe.

<a id="examples"></a>

## What you can ask

```text
What columns does the "Sales Orders" data on Exploratory have, and which 5 regions have the highest sales?
```

- [Examples](examples.md) - Examples with notes, data and charts.

<a id="tools"></a>

## What the AI can use

A tool is an operation the AI calls. They only read.

| Kind | Tool | What it does |
| --- | --- | --- |
| Find and read | search | Search and list published content. |
| Find and read | fetch | Read a note, dashboard or slide as Markdown. |
| Charts and analytics | chart_get_data | Get the numbers behind a chart. |
| Charts and analytics | chart_get_image | Get a chart as an image. |
| Charts and analytics | chart_query | Filter and aggregate the data of a chart on the server. |
| Charts and analytics | analytics_get_result | Get coefficients, p-values and other results of an analytics. |
| Data | dataframe_get_schema | Describe the columns and their approved meaning. |
| Data | dataframe_preview | Show rows. |
| Data | query_dataset | Filter and aggregate on the server. |
| Data | dataframe_export | Save a result as CSV or Parquet. |

This is the set every server offers. Depending on the server settings, more tools appear, for example desktop_mcp_setup_guide, which returns the steps to connect an AI client to Exploratory Desktop. Run expl server tools list to see what your server offers.

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

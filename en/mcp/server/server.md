# Exploratory MCP: Server

Read notes, dashboards, charts, analytics and data published on exploratory.io from an AI tool. An AI tool is an app where you ask an AI to do work, such as Claude Code. MCP (Model Context Protocol) is a shared standard for AI tools to connect to outside services and use their features.

<a id="readonly"></a>

## It is read-only

> **Read-only**
>
> This server cannot create, edit, publish or delete content. The one exception is dataframe_export, which creates a download link that is valid for 15 minutes.

It reads published content that you can view.

<a id="cannot"></a>

## What it does not do

- Create, edit, publish or delete content.
- Recompute a chart or analytics for parameter values other than the published ones.
- Read content that is not published to Exploratory Server, such as projects that exist only in Exploratory Desktop. Use the separate [Desktop MCP](../desktop/desktop.md) for those.

<a id="url"></a>

## Server URL

Every AI tool connects to the same address.

```text
https://exploratory.io/mcp
```

When you connect, you sign in to Exploratory and approve the access. If your setup cannot open a browser, connect with an API key instead (see [Authentication and API keys](auth.md)).

<a id="scope"></a>

## Where to go next

- [Get started](get-started.md) - Connect your AI tool and go as far as the first request. The steps for each AI tool are on [Add from an AI tool](clients/apps.md).
- [Use](use.md) - What you can ask the AI.
- [Reference](reference.md) - Look up the tools, limits and errors, and data and permissions.
- [Troubleshooting](troubleshooting.md) - Find what to do from a symptom.

To create and edit projects in Exploratory Desktop on your computer, use the [Desktop MCP](../desktop/desktop.md) instead. To read published content from a terminal or a script, see [Exploratory CLI](../../cli/server/server.md).

---
title: "Exploratory MCP: Server"
sidebarTitle: "Server"
---

Read notes, dashboards, charts, analytics and data published on exploratory.io from an AI tool. An AI tool is an app where you ask an AI to do work, such as Claude Code. MCP (Model Context Protocol) is a shared standard for AI tools to connect to outside services and use their features.

<a id="readonly"></a>

## It mostly reads

> **Mostly read-only**
>
> This server reads published content that you can view. The only content it writes is a Page (an HTML page): it creates private Pages in your account, and updates or deletes Pages you or your team own. Whether you can create Pages, and how many, depends on your plan. It cannot create, edit, publish or delete notes, dashboards, charts, analytics or data. dataframe_export creates a download link (valid for 15 minutes by default).

<a id="cannot"></a>

## What it does not do

- Create, edit, publish or delete content other than Pages you or your team own.
- Recompute a chart or analytics for parameter values other than the published ones.
- Read content that is not published to Exploratory Server, such as projects that exist only in Exploratory Desktop. Use the separate [Desktop MCP](/en/mcp/desktop) for those.

<a id="url"></a>

## Server URL

Every AI tool connects to the same address.

```text
https://exploratory.io/mcp
```

When you connect, you sign in to Exploratory and approve the access. If your setup cannot open a browser, connect with an API key instead (see [Authentication and API keys](/en/mcp/server/auth)).

<a id="scope"></a>

## Where to go next

- [Get started](/en/mcp/server/get-started) - Connect your AI tool and go as far as the first request. The steps for each AI tool are on [Add from an AI tool](/en/mcp/server/clients/apps).
- [Use](/en/mcp/server/use) - What you can ask the AI.
- [Reference](/en/mcp/server/reference) - Look up the tools, limits and errors, and data and permissions.
- [Troubleshooting](/en/mcp/server/troubleshooting) - Find what to do from a symptom.

To create and edit projects in Exploratory Desktop on your computer, use the [Desktop MCP](/en/mcp/desktop) instead. To read published content from a terminal or a script, see [Exploratory CLI](/en/cli/server).

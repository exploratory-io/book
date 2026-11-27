---
title: "Exploratory MCP: Desktop"
sidebarTitle: "Desktop"
---

Create and edit projects in Exploratory Desktop on your computer from an AI tool. It works on your local projects, including changes you have not published. An AI tool is an app where you ask an AI to do work, such as Claude Code.

<a id="scope"></a>

## What it does

It works with these items.

- Data frames, wrangling steps, branches, parameters and connections
- Charts and analytics
- Notes and dashboards

> **It can change and delete**
>
> Some tools delete things, publish notes, dashboards, data frames and projects, unpublish notes, dashboards and projects, or run R code. Review what the AI proposes before it writes.

It works through the app on your computer, as the user signed in to the app. It is separate from the Server MCP, which reads content published on exploratory.io.

<a id="need"></a>

## Requirements

- Exploratory Desktop v17 or later, signed in and running
- The command exploratory-mcp on your PATH. The plugin starts this command. Desktop puts it on your PATH automatically when it starts; no action is needed.
- On macOS, if you run Desktop directly from the disk image, the command is not added automatically. Move Desktop to /Applications or \~/Applications and start it from there.
- For Claude Code: node on your PATH. The plugin's review hooks use it.
- An AI tool: Claude Code, Codex, Cursor or Antigravity

<a id="more"></a>

## Where to go next

- [Get started](/en/mcp/desktop/get-started) - Install the plugin, turn on MCP and go as far as the first request. The steps are also on [Install the plugin](/en/mcp/desktop/install) and [Permissions and settings](/en/mcp/desktop/permissions).
- [Use](/en/mcp/desktop/use) - What you can ask the AI.
- [Reference](/en/mcp/desktop/reference) - Look up the tools, limits and errors, and data and permissions.
- [Troubleshooting](/en/mcp/desktop/troubleshooting) - Find what to do from a message.

To read content published on exploratory.io, use the [Server MCP](/en/mcp/server) instead.

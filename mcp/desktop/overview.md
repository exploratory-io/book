# Overview and requirements

Create and edit projects in Exploratory Desktop on your computer from an AI client.

<a id="scope"></a>

## What it does

Exploratory Desktop MCP lets an AI client create and edit projects in Exploratory Desktop on your computer. It works with these items.

- Data frames, wrangling steps, branches, parameters and connections
- Charts and analytics
- Notes and dashboards

> **It can change and delete**
>
> Some tools delete things, publish and unpublish notes, dashboards and data frames, or run R code. Review what your agent proposes before it writes.

It works through the app on your computer, as the user signed in to the app. It is separate from the Server MCP, which reads content published on exploratory.io.

<a id="need"></a>

## Requirements

- Exploratory Desktop v17 or later, signed in and running
- The command exploratory-mcp on your PATH. The plugin starts this command. Desktop puts it on your PATH automatically when it starts; no action is needed.
- On macOS, if you keep Desktop open from the disk image, the command is not added automatically. Move Desktop to /Applications or ~/Applications and start it from there.
- For Claude Code: node on your PATH. The plugin's review hooks use it.
- An AI client: Claude Code, Codex, Cursor or Antigravity

<a id="more"></a>

## Read next

- [Install the plugin](install.md) - Install the plugin into your AI tool from System Settings.
- [Examples](examples.md) - What you can ask the AI.
- [Tools](tools.md) - Find what the AI can do by purpose.
- [Permissions and settings](limits.md) - Settings you control in Desktop, and what is sent.
- [Troubleshooting](troubleshooting.md) - Find what to do from a message.
- [Server MCP](../server/server.md) - Read content published on exploratory.io.

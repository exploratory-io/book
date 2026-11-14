# Exploratory MCP: Desktop

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
- The command exploratory-mcp on your PATH. The plugin starts this command. Desktop registers it when it starts, or you register it in the Connect AI clients card.
- On macOS, Desktop must run from /Applications or ~/Applications to register the command.
- For Claude Code: node on your PATH. The plugin's review hooks use it.
- An AI client: Claude Code, Codex, Cursor or Antigravity

<a id="steps"></a>

## Connect

### 1. Turn on MCP in Desktop

Open System Settings \> MCP / CLI and turn on Enable MCP. To create or change charts, notes and other content, also check Allow create, edit and delete. Both are off by default.

### 2. Install the plugin from Connect AI clients

In the same tab, the Connect AI clients card connects the AI clients on this computer. It lists Claude Code, Codex, Antigravity and Cursor. Choose Install on the client you use. For Claude Code, Codex and Antigravity it installs the Exploratory Desktop plugin (with its skills), and the row shows Installed with the plugin version; Update and Remove take the place of Install. For Cursor it only adds exploratory-mcp to ~/.cursor/mcp.json: no skills are installed, and the row shows Installed without a version.

A client that is not on this computer shows Not found on this computer. If the command row says it is not registered, choose Register. You may be asked for an administrator password.

When the install ends, restart the AI client.

### 3. Allow the connection and try it

The first time a client connects, Desktop asks whether to allow it. Allow only an app you started yourself. Then open a project in Exploratory Desktop and try this.

```text
In my open Exploratory project, build a monthly bar chart from the sales data.
```

In Claude Code, open /mcp and check that exploratory-desktop is connected. In Codex, run codex mcp list and check that exploratory-desktop is listed. If a call says that MCP is turned off, go back to step 1.

<a id="clients"></a>

## By client

Installing by hand, updating and removing are on each client page.

- [Claude Code](clients/claude-code.md) - Connect Claude Code
- [Codex](clients/codex.md) - Connect Codex
- [Cursor](clients/cursor.md) - Connect Cursor
- [Antigravity](clients/antigravity.md) - Connect Antigravity

<a id="more"></a>

## Read next

- [Tools and what you can do](tools.md) - Find what the AI can do by purpose.
- [Limits and what you control](limits.md) - Settings you control in Desktop, and what is sent.
- [Troubleshooting](troubleshooting.md) - Find what to do from a message.
- [MCP Server](../server/server.md) - Read content published on exploratory.io.

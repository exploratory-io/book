> Draft, not published (下書き・未公開)

# Exploratory MCP: Desktop

Create and edit projects in Exploratory Desktop on your computer from an AI client.

<a id="scope"></a>

## What it does

> TODO: (remove before publication): The "Connect AI clients" card in System Settings \> MCP / CLI (tam #40758, branch fix/issue-40758-40761) is not merged into tam master yet. Check that it ships in Desktop v17 before you publish this page. Whether to publish this page at all is the owner's decision: the sheet also proposes to state that MCP Desktop is not supported.

Exploratory Desktop MCP lets an AI client create and edit projects in Exploratory Desktop on your computer. It works with these items.

- Data frames, wrangling steps, branches, parameters and connections
- Charts and analytics
- Notes and dashboards

> **It can change and delete**
>
> Some tools delete things, publish and unpublish notes, dashboards and data frames, or run R code. Review what your agent proposes before it writes.

It works through the app on your computer, as the user signed in to the app. It is separate from the Server MCP, which reads content published on exploratory.io.

- [MCP Server](server.md) - Read content published on exploratory.io.

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

<a id="manual"></a>

## Install by hand

Use this when you do not use the Connect AI clients card. The plugin is not in the official plugin directories. Add the repository exploratory-io/exploratory as a marketplace, then install the plugin exploratory. Run the commands yourself in a terminal. Do not ask an AI client to run them: some permission modes block it.

### Claude Code

**Claude Code**

```sh
claude plugin marketplace add exploratory-io/exploratory
claude plugin install exploratory@exploratory
```

You can also open /plugin in Claude Code, add the marketplace exploratory-io/exploratory and select exploratory.

### Codex

**Codex**

```sh
codex plugin marketplace add exploratory-io/exploratory
codex plugin add exploratory@exploratory
```

### Cursor

**Cursor**

```sh
{
  "mcpServers": {
    "exploratory-desktop": {
      "command": "exploratory-mcp"
    }
  }
}
```

Add this to ~/.cursor/mcp.json. It adds the Desktop MCP without the skills, the same entry the Connect AI clients card writes. Cursor also shows the Claude Code plugins it imports from ~/.claude: install the plugin with Claude Code first, then turn on Include Third-Party Plugins, Skills, and Other Configs in Cursor's settings.

### Antigravity

**Antigravity**

```sh
git clone https://github.com/exploratory-io/exploratory
agy plugin install ./exploratory/plugins/exploratory-desktop
```

Needs Git. The plugin appears in the Antigravity app under Customizations \> Installed.

In the Claude app, open Settings \> Plugins, choose Add marketplace \> From repository, enter exploratory-io/exploratory, then install exploratory. A plugin installed from the terminal also appears there as "Installed locally". The local MCP runs in Cowork (when it runs on this computer) and in the Code tab. It does not run in a regular chat.

<a id="update"></a>

## Update and remove

In the Connect AI clients card, choose Update or Remove on the row of the client. By hand, use these commands.

| Client | Update | Remove |
| --- | --- | --- |
| Claude Code | claude plugin marketplace update exploratory, then claude plugin update exploratory@exploratory, and restart Claude Code | claude plugin uninstall exploratory@exploratory |
| Codex | codex plugin marketplace upgrade exploratory, then codex plugin remove exploratory@exploratory and codex plugin add exploratory@exploratory | codex plugin remove exploratory@exploratory |
| Cursor | Update the plugin in Claude Code (Cursor imports it from ~/.claude) | Uninstall it in Claude Code. If you wrote ~/.cursor/mcp.json by hand, remove exploratory-desktop from it |
| Antigravity | Run git pull in the cloned folder, then agy plugin install again | Remove the plugin in Antigravity's plugin settings |

The Desktop MCP stops when you quit Exploratory Desktop. Removing the plugin does not affect your Server MCP connection.

<a id="control"></a>

## What you control in Desktop

In System Settings \> MCP / CLI you also decide the following.

- Data to share with the AI application: names, columns and data types only; up to aggregated results (charts, pivot tables); up to sample rows (max 100 rows); or all rows. Requests for more than the level you choose are refused.
- Approval: Desktop asks you first before it deletes items (charts, analytics, notes, dashboards, steps, branches, parameters, connections, palettes, templates, R packages, catalog items), publishes or unpublishes notes, dashboards, data frames and projects, saves a connection, replaces a data source, restores a project's history, manages data frames, changes the system settings or the catalog schedule. It also asks before it runs R code, adds R packages, processes data with AI or asks the note AI. Creating and editing charts, notes and dashboards is not asked about. You can choose to run each of these two groups (changes, deletions and publishing; code and AI) without asking.
- Approved apps: an app asks for your approval the first time it connects. Remove an app to make it ask again.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| exploratory-mcp is not found | Start Exploratory Desktop v17 or later with MCP on, or choose Register in the Connect AI clients card, then restart your AI client. On macOS, run the app from /Applications or ~/Applications. |
| Cannot register. Exploratory is running from … | Move Exploratory to the Applications folder and start it again. It is registered when it starts. |
| The Desktop MCP tools return a not-running error | Start Exploratory Desktop. Then use the tools again in the same conversation. |
| A call says that MCP is turned off | Turn on Enable MCP in System Settings \> MCP / CLI. |
| Git was not found on this computer. Install Git and try again. | The Antigravity install fetches the plugin with Git. Install Git and try again. |
| A marketplace named "exploratory" is already registered from a different source … | Remove it with the command the message shows, then choose Install again. |
| Your organization's settings may not allow this marketplace. | Ask your administrator. |
| A Claude Code hook cannot find node | Install Node.js and add node to your PATH. |
| The Desktop MCP does not work as you expect | Check that you are signed in to Exploratory Desktop. |

<a id="privacy"></a>

## What is sent and recorded

- The Desktop MCP runs on your computer. It reads and edits local project content through the app.
- What a tool returns (rows, column names, chart images, errors) becomes part of your conversation. It goes to the provider of your AI under that provider's terms. Do not use it on data that you may not send to that provider.
- Exploratory Desktop sends one usage record for each Desktop MCP tool call to the exploratory.io server you are signed in to. A record holds the tool name and its arguments (which can include formulas and values you entered), success or failure with the error type and message, the size of the result (not the content), the duration, the Desktop version, the AI client name and version, and the session and item IDs. It sends records only while you are signed in and AI features are on, and never for local data catalog tools.

# Install the plugin

In Exploratory Desktop, System Settings installs the Desktop MCP plugin into the AI tools on this computer. There is no separate procedure for each AI tool: Claude Code, Codex, Antigravity and Cursor all install from the same card.

<a id="steps"></a>

## Install

### 1. Turn on MCP in Desktop

Open System Settings \> MCP / CLI and turn on Enable MCP. To create or change charts, notes and other content, also check Allow create, edit and delete. Both are off by default.

### 2. Install from the "Install the Exploratory Desktop plugin" card

In the same tab, the "Install the Exploratory Desktop plugin" card says:

> Installs the Desktop MCP plugin into the AI tools on this computer. After installing, restart that AI tool.

The card lists Claude Code, Codex, Antigravity and Cursor. Choose Install on the AI tool you use. An AI tool that is not on this computer shows Not found on this computer. The command is added automatically when the app starts, so there is no step to register it.

<!-- image: images/en/desktop-plugin-card.png (The "Install the Exploratory Desktop plugin" card in MCP / CLI in System Settings) -->

### 3. Restart the AI tool

When the install ends, restart that AI tool.

### 4. Allow the connection and try it

The first time an AI tool connects, Desktop asks whether to allow it. Allow only an app you started yourself. Then open a project in Exploratory Desktop and try this.

```text
In my open Exploratory project, build a monthly bar chart from the sales data.
```

In Claude Code, open /mcp and check that exploratory-desktop is connected. In Codex, run codex mcp list and check that exploratory-desktop is listed. If a call says that MCP is turned off, go back to step 1.

<a id="differences"></a>

## Differences between AI tools

The card works the same way, but what it installs differs a little.

| AI tool | What the card installs | What the card shows |
| --- | --- | --- |
| Claude Code | The Exploratory Desktop plugin (with its skills) | Installed with the plugin version; Update and Remove take the place of Install |
| Codex | Same | Same |
| Antigravity | Same | Same |
| Cursor | Only adds exploratory-mcp to ~/.cursor/mcp.json. No skills are installed | Installed, without a version |

Restart the AI tool after installing, whichever one it is.

<a id="manual"></a>

## Install by hand

Use this when you do not use the card. The plugin is not in the official plugin directories. Add the repository exploratory-io/exploratory as a marketplace, then install the plugin exploratory. Run the commands yourself in a terminal. Do not ask an AI tool to run them: some permission modes block it.

**Claude Code**

```sh
claude plugin marketplace add exploratory-io/exploratory
claude plugin install exploratory@exploratory
```

You can also open /plugin in Claude Code, add the marketplace exploratory-io/exploratory and select exploratory.

In the Claude app, open Settings \> Plugins, choose Add marketplace \> From repository, enter exploratory-io/exploratory, then install exploratory. A plugin installed from the terminal also appears there as "Installed locally". The local MCP runs in Cowork (when it runs on this computer) and in the Code tab. It does not run in a regular chat.

**Codex**

```sh
codex plugin marketplace add exploratory-io/exploratory
codex plugin add exploratory@exploratory
```

**Antigravity**

```sh
git clone https://github.com/exploratory-io/exploratory
agy plugin install ./exploratory/plugins/exploratory-desktop
```

Needs Git. The plugin appears in the Antigravity app under Customizations \> Installed.

**Cursor**

Add this to ~/.cursor/mcp.json. It adds the Desktop MCP without the skills, the same entry the card writes.

```json
{
  "mcpServers": {
    "exploratory-desktop": {
      "command": "exploratory-mcp"
    }
  }
}
```

Cursor also shows the Claude Code plugins it imports from ~/.claude: install the plugin with Claude Code first, then turn on Include Third-Party Plugins, Skills, and Other Configs in Cursor's settings.

<a id="update"></a>

## Update and remove

For Claude Code, Codex and Antigravity installed with the card, use Update and Remove on the card. If you installed by hand, or for Cursor, use the methods below.

| AI tool | Update | Remove |
| --- | --- | --- |
| Claude Code | claude plugin marketplace update exploratory, then claude plugin update exploratory@exploratory, and restart Claude Code | claude plugin uninstall exploratory@exploratory |
| Codex | codex plugin marketplace upgrade exploratory, then codex plugin remove exploratory@exploratory and codex plugin add exploratory@exploratory | codex plugin remove exploratory@exploratory |
| Antigravity | Run git pull in the cloned folder, then agy plugin install again | Remove the plugin in Antigravity's plugin settings |
| Cursor | Update the plugin in Claude Code (Cursor imports it from ~/.claude) | Uninstall it in Claude Code. If you wrote ~/.cursor/mcp.json by hand, remove exploratory-desktop from it |

The Desktop MCP stops when you quit Exploratory Desktop. Removing the plugin does not affect your Server MCP connection.

<a id="trouble"></a>

## If it does not work

[Troubleshooting](troubleshooting.md) lists the messages and what to do.

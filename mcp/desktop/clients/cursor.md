# Cursor (Desktop)

Connect the Exploratory Desktop MCP from Cursor.

<a id="install"></a>

## Install by hand

The Connect AI clients card in Exploratory Desktop is described under Connect on the overview page. This page covers installing by hand, updating and removing.

> Overview steps: [Connect the Desktop MCP](../desktop.md#steps)

Use this when you do not use the Connect AI clients card. The plugin is not in the official plugin directories. Add the repository exploratory-io/exploratory as a marketplace, then install the plugin exploratory. Run the commands yourself in a terminal. Do not ask an AI client to run them: some permission modes block it.

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

<a id="update"></a>

## Update and remove

| Update | Remove |
| --- | --- |
| Update the plugin in Claude Code (Cursor imports it from ~/.claude) | Uninstall it in Claude Code. If you wrote ~/.cursor/mcp.json by hand, remove exploratory-desktop from it |

The Desktop MCP stops when you quit Exploratory Desktop. Removing the plugin does not affect your Server MCP connection.

<a id="trouble"></a>

## If it does not work

> [Troubleshooting](../troubleshooting.md) lists the messages and what to do.

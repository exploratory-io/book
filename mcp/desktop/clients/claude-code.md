# Claude Code (Desktop)

Connect the Exploratory Desktop MCP from Claude Code.

<a id="install"></a>

## Install by hand

The Connect AI clients card in Exploratory Desktop is described under Connect on the overview page. This page covers installing by hand, updating and removing.

> Overview steps: [Connect the Desktop MCP](../desktop.md#steps)

Use this when you do not use the Connect AI clients card. The plugin is not in the official plugin directories. Add the repository exploratory-io/exploratory as a marketplace, then install the plugin exploratory. Run the commands yourself in a terminal. Do not ask an AI client to run them: some permission modes block it.

**Claude Code**

```sh
claude plugin marketplace add exploratory-io/exploratory
claude plugin install exploratory@exploratory
```

You can also open /plugin in Claude Code, add the marketplace exploratory-io/exploratory and select exploratory.

In the Claude app, open Settings \> Plugins, choose Add marketplace \> From repository, enter exploratory-io/exploratory, then install exploratory. A plugin installed from the terminal also appears there as "Installed locally". The local MCP runs in Cowork (when it runs on this computer) and in the Code tab. It does not run in a regular chat.

<a id="update"></a>

## Update and remove

| Update | Remove |
| --- | --- |
| claude plugin marketplace update exploratory, then claude plugin update exploratory@exploratory, and restart Claude Code | claude plugin uninstall exploratory@exploratory |

The Desktop MCP stops when you quit Exploratory Desktop. Removing the plugin does not affect your Server MCP connection.

<a id="trouble"></a>

## If it does not work

> [Troubleshooting](../troubleshooting.md) lists the messages and what to do.

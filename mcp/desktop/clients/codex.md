# Codex (Desktop)

Connect the Exploratory Desktop MCP from Codex.

<a id="install"></a>

## Install by hand

The "Install the Exploratory Desktop plugin" card in Exploratory Desktop is described under Connect on the overview page. This page covers installing by hand, updating and removing.

> Overview steps: [Connect the Desktop MCP](../desktop.md#steps)

Use this when you do not use the "Install the Exploratory Desktop plugin" card. The plugin is not in the official plugin directories. Add the repository exploratory-io/exploratory as a marketplace, then install the plugin exploratory. Run the commands yourself in a terminal. Do not ask an AI client to run them: some permission modes block it.

**Codex**

```sh
codex plugin marketplace add exploratory-io/exploratory
codex plugin add exploratory@exploratory
```

<a id="update"></a>

## Update and remove

| Update | Remove |
| --- | --- |
| codex plugin marketplace upgrade exploratory, then codex plugin remove exploratory@exploratory and codex plugin add exploratory@exploratory | codex plugin remove exploratory@exploratory |

The Desktop MCP stops when you quit Exploratory Desktop. Removing the plugin does not affect your Server MCP connection.

<a id="trouble"></a>

## If it does not work

> [Troubleshooting](../troubleshooting.md) lists the messages and what to do.

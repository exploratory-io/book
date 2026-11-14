# Antigravity (Desktop)

Connect the Exploratory Desktop MCP from Antigravity.

<a id="install"></a>

## Install by hand

The "Install the Exploratory Desktop plugin" card in Exploratory Desktop is described under Connect on the overview page. This page covers installing by hand, updating and removing.

> Overview steps: [Connect the Desktop MCP](../desktop.md#steps)

Use this when you do not use the "Install the Exploratory Desktop plugin" card. The plugin is not in the official plugin directories. Add the repository exploratory-io/exploratory as a marketplace, then install the plugin exploratory. Run the commands yourself in a terminal. Do not ask an AI client to run them: some permission modes block it.

**Antigravity**

```sh
git clone https://github.com/exploratory-io/exploratory
agy plugin install ./exploratory/plugins/exploratory-desktop
```

Needs Git. The plugin appears in the Antigravity app under Customizations \> Installed.

<a id="update"></a>

## Update and remove

| Update | Remove |
| --- | --- |
| Run git pull in the cloned folder, then agy plugin install again | Remove the plugin in Antigravity's plugin settings |

The Desktop MCP stops when you quit Exploratory Desktop. Removing the plugin does not affect your Server MCP connection.

<a id="trouble"></a>

## If it does not work

> [Troubleshooting](../troubleshooting.md) lists the messages and what to do.

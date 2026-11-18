---
title: "Get started"
---

Install the Desktop MCP plugin, turn on MCP in Exploratory Desktop, and ask your AI tool to look at the data in your project. It takes about 5 minutes, and you can do the steps on this one page. You need Exploratory Desktop and the AI tool you want to install into (Claude Code, Codex, Antigravity or Cursor) on the same computer.

<a id="steps"></a>

## Steps

### 1. Install the plugin

In Exploratory Desktop, choose your name at the bottom left of the screen, then choose System Settings in the menu that opens. In the menu on the left, choose MCP / CLI, find the "Install the Exploratory Desktop plugin" card, and choose Install on the row of the AI tool you use. The pictures and the steps by hand are on [Install the plugin](install.md).

### 2. Turn on MCP

On the same screen, turn on the MCP switch. It is off by default. Only when you want the AI to create or change charts, notes and other content, also check Allow create, edit and delete. Then choose Save at the bottom of the screen.

If you do not save, the MCP switch and the Allow create, edit and delete setting do not take effect. For what else you can decide here, see [Permissions and settings](permissions.md).

### 3. Restart the AI tool and allow the connection

Restart the AI tool you installed into. The first time an AI tool connects, Desktop shows a window titled "An AI tool is asking for your approval" and asks whether to allow it. Choose Allow only for an app you started yourself.

Check that the connection works in your AI tool.

- Claude Code: open /mcp and check that exploratory-desktop is connected.
- Codex: run codex mcp list and check that exploratory-desktop is listed.
- Antigravity: check that the plugin appears under Customizations > Installed in the app.
- Cursor: check that the Cursor row of the card shows "Installed - v" followed by the plugin version.

### 4. Ask the AI to look at your data

In Exploratory Desktop, open the project you want to use. Then, in the AI tool, ask this.

```text
List the data frames in my open Exploratory project.
```

This works with Allow create, edit and delete off too.

To try creating something, turn on Allow create, edit and delete and save, then ask for a chart, such as a bar chart of a column of your own data.

<a id="trouble"></a>

## If something does not work

- A call says that MCP is turned off: go back to System Settings and check that you turned the MCP switch on and chose Save.
- The tools return a not-running error: start Exploratory Desktop, then use the tools again in the same conversation.
- You chose Don't allow on the approval window: for 5 minutes the same app is refused without the window appearing again. After 5 minutes, connect again and the window appears again. To approve an app you refused, or to take back an approval, see [Permissions and settings](permissions.md#control).
- The install fails: the row of that AI tool shows "Could not install." See "When the install fails" on [Install the plugin](install.md#failure).

See [Troubleshooting](troubleshooting.md) for more.

<a id="next"></a>

## Next

- [Use](use.md) - Requests to copy, with the tools the AI uses.
- [Permissions and settings](permissions.md) - What you decide in Desktop.
- [Data and permissions](data.md) - What is sent and recorded.

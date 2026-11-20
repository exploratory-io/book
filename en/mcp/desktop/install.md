---
title: "Install the plugin"
---

After you install it, an AI tool can use Exploratory Desktop. In Exploratory Desktop, System Settings installs the Desktop MCP plugin into the AI tools on this computer.
It takes about 5 minutes. You need Exploratory Desktop and the AI tool you want to install into (Claude Code, Codex, Antigravity or Cursor) on the same computer.

Claude Code, Codex, Antigravity and Cursor all install from System Settings in Exploratory Desktop. If you can’t install from System Settings, see [Install by hand](#manual).

<a id="steps"></a>

## Install

### Install from System Settings

In Exploratory Desktop, choose your name at the bottom left of the screen, then choose System Settings in the menu that opens (1 and 2 in the picture).

![The menu that opens when you choose your name at the bottom left of Exploratory Desktop. 1 is your name and 2 is System Settings](images/en/open-system-settings.png)

1. In the menu on the left, choose MCP / CLI.
2. Find the "Install the Exploratory Desktop plugin" section.
3. Choose Install on the row of the AI tool you use.

![The "Install the Exploratory Desktop plugin" section in MCP / CLI in System Settings](images/en/desktop-plugin-card.png)

The section says:

> Installs the Desktop MCP plugin into the AI tools on this computer. After installing, restart that AI tool.

The section lists Claude Code, Codex, Antigravity and Cursor. An AI tool that is not on this computer shows Not found on this computer. The command is added automatically when the app starts, so there is no step to register it.

Next, on the same screen, do this.

4. Turn on the MCP switch. It is off by default.
5. Only when you want the AI to create or change charts, notes and other content, check Allow create, edit and delete. Without it, the AI can only read.
6. Choose Save at the bottom of the screen.

If you do not save, the MCP switch and the Allow create, edit and delete setting do not take effect.

<a id="check"></a>

### Check it in the AI tool

1. When the install ends, restart that AI tool.
2. The first time an AI tool connects, Desktop shows a window titled "An AI tool is asking for your approval". Choose Allow only for an app you started yourself. If you choose Don't allow, see [If something does not work](/en/mcp/desktop/get-started#trouble).
3. In Exploratory Desktop, open the project you want to use.
4. In the AI tool, ask this.

   ```text
   List the data frames in my open Exploratory project.
   ```

   This works with Allow create, edit and delete off too. To try creating something, turn on Allow create, edit and delete and save, then ask for a chart instead, such as a bar chart of a column of your own data.

5. Check the connection.
   - In Claude Code, open `/mcp` and check that exploratory-desktop is connected.
   - In Codex, run `codex mcp list` and check that exploratory-desktop is listed.
   - In Antigravity, check that the plugin appears under Customizations > Installed in the app.
   - If you installed the Cursor plugin from System Settings, check that the Cursor row in System Settings shows "Installed - v" followed by the plugin version. If you installed it from the app, check that Cursor returns the data frames from your open Exploratory project.

If a call says that MCP is turned off, go back to System Settings and check that you turned the MCP switch on and chose Save.

<a id="differences"></a>

## Differences between AI tools

You install the same way from System Settings for every AI tool, but what gets installed differs a little.

| AI tool | What System Settings installs | What System Settings shows |
| --- | --- | --- |
| Claude Code | The Exploratory Desktop plugin (with its skills) | "Installed - v" followed by the plugin version; Reinstall and Remove take the place of Install |
| Codex | Same | Same |
| Antigravity | Same | Same |
| Cursor | Same. Only the location differs: it copies the plugin to the Cursor plugin folder (\~/.cursor/plugins/local/exploratory) instead of writing \~/.cursor/mcp.json. If \~/.cursor/mcp.json still has an old exploratory-desktop entry, it deletes that entry; other entries stay | Same |

Restart the AI tool after installing, whichever one it is.

The buttons on each row change with its state.

| State | What the row shows |
| --- | --- |
| Not installed | Not installed, and a green Install button |
| Installed | Installed, with Reinstall and Remove |

Choosing Remove opens a confirmation.

<a id="failure"></a>

## When the install fails

When an install fails, the second line of that AI tool's row shows "Could not install." in red. Details is right after it, then a sentence that gives the reason (for example "Check that you are connected to the internet."), and a Try again button at the right of the row. When updating an installed plugin fails, a Remove button also appears to its right.

Hold the mouse pointer over Details to see the output of the command that ran, in a pop-up. It shows up to the last 2,000 characters of the output. If it is long, you can scroll inside the pop-up vertically. The pop-up stays when you move the pointer into it. Click Details to keep it open. Copy at the top right copies the output.

The image is an example of how the error details look when updating an installed plugin failed. The command output in the pop-up is a sample and differs from real output.

1. Hold the mouse pointer over Details.
2. Choose Copy at the top right.

![System Settings when updating an installed plugin failed, with the pointer over Details (example)](images/en/desktop-plugin-card-error.png)

If the reason does not let you fix it, send the copied output to support. When it is fixed, choose Try again.

<a id="manual"></a>

## Install by hand

If you can’t install the plugin from System Settings, for example because Exploratory Desktop can’t reach the network, follow the instructions below for your AI app. If you prefer to use a terminal, go to “Install with commands” in this section.

### Install from your AI app

- [Claude app](#install-claude-app)
- [ChatGPT app (Codex)](#install-chatgpt)
- [Cursor](#install-cursor)

<a id="install-claude-app"></a>

#### Claude app

Use the Claude app on the same computer as Exploratory Desktop. The Claude app needs access to the GitHub repository to add the marketplace.

1. In **Customize**, choose **Plugins** (❶), then open the **Add** menu (❷).

   ![Plugins tab and Add button in Claude’s Customize view](images/en/app-install-claude-en-1-plugins-empty.png)

2. Choose **Add marketplace** (❶).

   ![Add marketplace in Claude’s Add menu](images/en/app-install-claude-en-1-add-menu.png)

3. In the **Add marketplace** dialog, choose **Add from a repository** (❶).

   ![Add from a repository in Claude’s Add marketplace dialog](images/en/app-install-claude-en-2-add-marketplace-dialog.png)

4. In the **URL** field, click **Select a repository** (❶) and enter `exploratory-io/exploratory`. Typing does not narrow the list, so scroll through it and select the `exploratory` repository owned by `exploratory-io`.

   ![Select a repository in the URL field](images/en/app-install-claude-en-3-repository-dialog.png)

5. Once the **URL** field shows `exploratory-io/exploratory`, choose **Sync** (❶).

   ![Sync button after selecting exploratory-io/exploratory](images/en/app-install-claude-en-4-url-entered.png)

6. When syncing finishes, Claude automatically opens the **Discover** tab. Choose **Add** on the **Exploratory Desktop** row (❶).

   ![Add button on the Exploratory Desktop row in Discover](images/en/app-install-claude-en-5-after-sync.png)

7. In the **This plugin includes local MCP servers** dialog, check that it lists `exploratory-desktop`, then choose **Continue** (❶).

   ![Continue button in the dialog listing the exploratory-desktop MCP server](images/en/app-install-claude-en-6-local-mcp-dialog.png)

8. When installation finishes, the plugin details screen opens. Choose **← Plugins** (❶) to return to **Discover**.

   ![Plugins back button on the Exploratory Desktop details screen](images/en/app-install-claude-en-7-detail.png)

9. Choose the **Yours** tab (❶).

   ![Yours tab after returning to Discover](images/en/app-install-claude-en-8-back-to-discover.png)

Check that **Exploratory Desktop** appears under **From marketplaces you added**.

![Exploratory Desktop listed under From marketplaces you added](images/en/app-install-claude-en-9-yours-list.png)

Next, in Exploratory Desktop, open System Settings > MCP / CLI, turn on the MCP switch, and choose Save at the bottom of the screen. To check the connection, open a project in Exploratory Desktop and in the Claude app’s Code tab, or in Cowork running on this computer, ask Claude, “List the data frames in my open Exploratory project.” If it returns the list from your project, the connection is working. The local MCP does not run in a regular chat. See [Check it in the AI tool](#check) for the full steps.

<a id="install-chatgpt"></a>

#### ChatGPT app (Codex)

Use the ChatGPT app (Codex) on the same computer as Exploratory Desktop. The ChatGPT app needs access to the GitHub repository to add the marketplace.

If the left sidebar still shows Japanese labels, follow the numbered markers to find the controls.

1. Choose **Plugins** (**プラグイン**) in the left sidebar (❶), then open **Add** at the top right (❷).

   ![Plugins in the left sidebar and the Add button at the top right](images/en/app-install-chatgpt-en-09-plugins-menu.png)

2. Choose **Add a marketplace** (❶).

   ![Add a marketplace in the Add menu](images/en/app-install-chatgpt-en-10-add-menu.png)

3. In **Add plugin marketplace**, enter `exploratory-io/exploratory` in **Source** (❶). Leave **Git ref** and **Sparse paths** empty.

   ![Source field in the Add plugin marketplace dialog](images/en/app-install-chatgpt-en-11-add-marketplace-dialog.png)

4. Choose **Add marketplace** (❶).

   ![Add marketplace button after entering the source](images/en/app-install-chatgpt-en-12-source-entered.png)

5. When the dialog closes, enter `exploratory` in **Search plugins** (❶).

   ![Search plugins field after adding the marketplace](images/en/app-install-chatgpt-en-13-after-add.png)

6. Find **Exploratory Desktop** from **Exploratory, Inc.** (❶) and select the **+** on the right side of its search result.

   ![Exploratory Desktop from Exploratory, Inc. with the plus button on the right](images/en/app-install-chatgpt-en-14-search.png)

7. Under **Installed** (**インストール済み**) in the left sidebar, check that **Exploratory Desktop** is listed (❶).

   ![Exploratory Desktop in the installed plugins list](images/en/app-install-chatgpt-en-16-installed-detail.png)

Next, in Exploratory Desktop, open System Settings > MCP / CLI, turn on the MCP switch, and choose Save at the bottom of the screen. To check the connection, open a project in Exploratory Desktop and ask Codex in the ChatGPT app, “List the data frames in my open Exploratory project.” If it returns the list from your project, the connection is working. See [Check it in the AI tool](#check) for the full steps.

<a id="install-cursor"></a>

#### Cursor

Use Cursor on the same computer as Exploratory Desktop. Cursor needs access to the GitHub repository to import the marketplace.

1. In the Cursor Agents window, choose Customize (❶).

   ![Customize at the top left of Cursor’s Agents window](images/en/app-install-cursor-m3-00-customize-entry.png)

2. On the next screen, choose Plugins (❶), then + Add (❷).

   ![Plugins in Cursor and + Add to the right of Installed](images/en/app-install-cursor-m2-06-plugins-list.png)

3. Choose From GitHub Repository (❶).

   ![From GitHub Repository in Cursor’s + Add menu](images/en/app-install-cursor-m2-07-add-menu.png)

4. In Import Marketplace, enter `https://github.com/exploratory-io/exploratory` in Repository (❶). Leave Scope set to User and choose Import (❷).

   ![Repository field with the URL entered and the Import button](images/en/app-install-cursor-m2-09-url-entered.png)

   When the import finishes, Cursor opens the marketplace.

   ![Marketplace before scrolling down](images/en/app-install-cursor-m2-10-after-import.png)

5. Scroll down and choose **Add** on the **Exploratory Desktop** row (❶).

   Section names can vary, so use the plugin name and description to identify it. The publisher is **Exploratory, Inc.** and the description reads “Create data, charts, analytics, and reports in Exploratory Desktop v17 or later.” Skip the similarly named **exploratory** plugin with the description “Work with Exploratory Desktop, search and read published content …”.

   ![The exploratory and Exploratory Desktop rows in the marketplace, with the Add button marked for Exploratory Desktop](images/en/app-install-cursor-m2-11-io-exploratory-section.png)

6. The button on the Exploratory Desktop row changes to ✓ Added.

   ![Added button on the Exploratory Desktop row](images/en/app-install-cursor-m2-12-after-add.png)

7. Return to **Customize** > **Plugins** and check that **Exploratory Desktop** appears under **Installed** (❶).

   ![Exploratory Desktop added to the installed plugins list in Cursor](images/en/app-install-cursor-m2-13-installed.png)

If **Third-Party Imports** under **Settings** > **Agents** is turned on, **Exploratory Desktop** may already appear under **Installed** before you choose Add.

You can check the description and publisher in the plugin details.

![Exploratory Desktop details showing the description and publisher, Exploratory, Inc.](images/en/app-install-cursor-m2-14-detail.png)

Next, in Exploratory Desktop, open System Settings > MCP / CLI, turn on the MCP switch, and choose Save at the bottom of the screen. To check the connection, open a project in Exploratory Desktop and ask Cursor, “List the data frames in my open Exploratory project.” If it returns the list from your project, the connection is working. See [Check it in the AI tool](#check) for the full steps.

### Install with commands

The plugin is not in the official plugin directories. Add the repository exploratory-io/exploratory as a marketplace, then install the plugin exploratory. Run the commands in a terminal yourself, or ask an AI tool to run them.

**Claude Code**

```sh
claude plugin marketplace add exploratory-io/exploratory
claude plugin install exploratory@exploratory
```

You can also open /plugin in Claude Code, add the marketplace exploratory-io/exploratory and select exploratory. A plugin installed from the terminal appears as "Installed locally" in the Claude app’s plugins list.

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

```sh
git clone --depth 1 https://github.com/exploratory-io/exploratory
mkdir -p ~/.cursor/plugins/local
cp -R exploratory/plugins/exploratory-desktop ~/.cursor/plugins/local/exploratory
```

Needs Git. This copies the plugin into the same folder that System Settings uses (~/.cursor/plugins/local/exploratory). Quit and restart Cursor, and Exploratory appears under Customize \> Plugins \> Installed with a Local label. It duplicates the Exploratory Desktop plugin added from the Cursor app, so use one or the other.

<a id="update"></a>

## Update and remove

It depends on how you installed it.

- Installed from System Settings (Claude Code, Codex, Antigravity, Cursor): choose Reinstall on that AI tool's row in System Settings to install the latest plugin again (this is also how you update). To remove it, choose Remove on the same row.
- Installed with commands (Claude Code, Codex, Antigravity, Cursor). Follow the steps in the table below to update or remove the plugin.

| AI tool | Update | Remove |
| --- | --- | --- |
| Claude Code | claude plugin marketplace update exploratory, then claude plugin update exploratory@exploratory, and restart Claude Code | claude plugin uninstall exploratory@exploratory |
| Codex | codex plugin marketplace upgrade exploratory, then codex plugin remove exploratory@exploratory and codex plugin add exploratory@exploratory | codex plugin remove exploratory@exploratory |
| Antigravity | Run git pull in the cloned folder, then agy plugin install again | Remove the plugin in Antigravity's plugin settings |
| Cursor | Run git pull in the cloned folder exploratory, then run rm -rf ~/.cursor/plugins/local/exploratory && cp -R plugins/exploratory-desktop ~/.cursor/plugins/local/exploratory, and restart Cursor | Run rm -rf ~/.cursor/plugins/local/exploratory, and restart Cursor |

The Desktop MCP stops when you quit Exploratory Desktop. Removing the plugin does not affect your Server MCP connection.

<a id="trouble"></a>

## If it does not work

[Troubleshooting](/en/mcp/desktop/troubleshooting) lists the messages and what to do.

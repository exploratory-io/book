# Connect the ChatGPT app (desktop)

Add the Exploratory server to the ChatGPT desktop app as an MCP server. An MCP server is the address an AI app connects to in order to use the data and features of an outside service. After you add it, connect to Exploratory and approve the access, and ChatGPT can read notes and data published on Exploratory.

On the web (chatgpt.com), the screens for adding a server differ. The web steps are further down this page.

<a id="need"></a>

## Requirements

- An Exploratory account
- The ChatGPT desktop app

You do not need an API key or a client ID.

<a id="steps"></a>

## Steps (desktop app)

### 1. Open settings

In the ChatGPT desktop app, open settings.

### 2. Choose Plugins

In the menu on the left of settings, choose Plugins under the integrations group.

### 3. Choose the MCP tab

Among the tabs for plugins, apps, MCP and skills, choose the MCP tab.

<!-- image: images/en/chatgpt-desktop-01-plugins.png (Plugins in settings and the MCP tab) -->

### 4. Choose Add

Choose Add at the top right.

### 5. Choose the option to add an MCP server

In the menu, choose the option to add an MCP server. The screen for connecting to a custom MCP opens.

<!-- image: images/en/chatgpt-desktop-03-add-menu.png (The Add menu) -->

### 6. Enter the name

In the name field, enter the name to show in the list, for example Exploratory.

### 7. Choose the type

For the type, choose streamable HTTP. Do not choose STDIO.

### 8. Enter the URL

In the URL field, enter this URL.

```text
https://exploratory.io/mcp
```

### 9. Leave the other fields empty

Leave the bearer token environment variable and the headers empty. Exploratory connects through a sign-in in your browser, so it needs no token and no header.

<!-- image: images/en/chatgpt-desktop-05-custom-mcp-filled.png (The custom MCP screen with the name, the type and the URL filled in) -->

### 10. Save

Choose the save button at the bottom right. The server you added appears in the list of servers on the MCP tab.

<!-- image: images/en/chatgpt-desktop-08-connected.png (The list of servers on the MCP tab) -->

The official documentation describes the rest as follows. The labels are quoted as the documentation writes them.

### 11. Restart

After you save, restart the ChatGPT desktop app, following the documentation's Restart instruction.

### 12. Authenticate

For a server that needs OAuth, the server list shows that. When it does, choose Authenticate, as the documentation says.

### 13. Approve the access

Your browser opens exploratory.io. If you are not signed in, sign in first. On the screen where ChatGPT asks for access, choose Allow. (The screen in the image below is shown in Japanese.)

![The approval screen on exploratory.io](images/en/chatgpt-07-sign-in.png)

In the image, 1 is the approval button (Allow).

### 14. Check the connection

Type `/mcp` in the chat box to see the connected servers.

### 15. Try it

In a new chat, send this.

```text
Find the "Sales Orders" data on Exploratory.
```

If the Sales Orders data appears with its URL, it works.

<a id="web"></a>

## Add it on the web (chatgpt.com)

On the web, the screens for adding a server differ from the desktop app. This section describes the web steps.

### 1. Open settings

In ChatGPT, open Settings.

### 2. Choose Plugins

Choose Plugins in Settings.

![Plugins in Settings](images/en/chatgpt-01-plugins.png)

In the image, 1 is Plugins and 2 is Browse directory.

### 3. Open the plugin list

Choose Browse directory. The Plugins screen under Customize opens.

![The Plugins screen under Customize, with Add at the top right](images/en/chatgpt-02-plugin-directory.png)

In the image, 1 is Add.

### 4. Choose Add

Choose Add at the top right.

### 5. Choose Add custom MCP server

In the menu, choose Add custom MCP server.

![The Add menu](images/en/chatgpt-03-add-menu.png)

In the image, 1 is Add custom MCP server.

### 6. Enter the name

In Name, enter the name to show in the list, for example Exploratory.

![The Add custom MCP server screen](images/en/chatgpt-04-custom-mcp-empty.png)

In the image, 1 is Name, 2 is the Server URL field and 3 is the check box I understand and want to continue.

### 7. Enter the URL

Under Connection, leave Server URL selected. In the URL field, enter this URL.

```text
https://exploratory.io/mcp
```

### 8. Check the authentication

Check that Authentication is OAuth. There is nothing to change.

### 9. Read the warning and select the check box

The screen says "Custom MCP servers introduce risk." Make sure you trust the server, then select I understand and want to continue.

![The screen with the name, the URL, OAuth and the check box filled in](images/en/chatgpt-05-custom-mcp-filled.png)

In the image, 1 is Name, 2 is the Server URL field and 3 is the check box I understand and want to continue.

### 10. Create it

Choose Create as a plugin.

### 11. Connect to Exploratory

The Connect Exploratory screen opens. Choose the Connect Exploratory button.

![The Connect Exploratory screen](images/en/chatgpt-06-connect-dialog.png)

In the image, 1 is the Connect Exploratory button.

### 12. Approve the access

Your browser opens exploratory.io. If you are not signed in, sign in first. On the screen where ChatGPT asks for access, choose Allow.

![The approval screen on exploratory.io](images/en/chatgpt-07-sign-in.png)

In the image, 1 is the approval button (Allow). This screen of exploratory.io is shown in Japanese.

### 13. Check that it is connected

Back in ChatGPT, Exploratory appears under Installed on the left of Customize. Open Exploratory to see its details: the Exploratory row under Apps, and Information. Information lists Developer, Category, Version and Website.

![Apps and Information in the Exploratory details](images/en/chatgpt-08-connected.png)

In the image, 1 is the Exploratory row under Apps. The Developer field is blurred in the image.

### 14. Try it

Choose Try in chat to open a chat. Send this.

```text
Find the "Sales Orders" data on Exploratory.
```

If the Sales Orders data appears with its URL, it works.

<a id="trouble"></a>

## If it does not work

For other symptoms, see [Troubleshooting](../troubleshooting.md).

<a id="remove"></a>

## Disconnect

In the desktop app, turn off the switch of the server you added in the list of servers on the MCP tab, and it is no longer used. On the web, delete the Exploratory plugin you added in the plugin list. Then open Account Settings on exploratory.io and remove the app you connected under Connected AI Apps. Deleting it in ChatGPT alone does not revoke the access you approved on Exploratory.

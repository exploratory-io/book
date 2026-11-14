# Connect the ChatGPT app (desktop and web)

Add the Exploratory server to ChatGPT as a custom MCP server. An MCP server is the address an AI app connects to in order to use the data and features of an outside service. After you add it, connect to Exploratory and approve the access, and ChatGPT can read notes and data published on Exploratory.

You can make the same settings in the ChatGPT desktop app and on the web.

<a id="need"></a>

## Requirements

- An Exploratory account
- The ChatGPT desktop app, or the web version

You do not need an API key or a client ID.

<a id="steps"></a>

## Steps

### 1. Open the plugin settings

In ChatGPT, open Settings and choose Plugins.

<!-- image: images/en/chatgpt-01-plugins.png (Plugins in Settings) -->

### 2. Open the plugin list

Choose Browse directory. The Plugins screen under Customize opens.

<!-- image: images/en/chatgpt-02-plugin-directory.png (The Plugins screen under Customize, with Add at the top right) -->

### 3. Open the screen for adding a custom MCP server

Choose Add at the top right, then choose Add custom MCP server.

<!-- image: images/en/chatgpt-03-add-menu.png (The Add menu) -->

### 4. Enter the name

In Name, enter the name to show in the list, for example Exploratory.

<!-- image: images/en/chatgpt-04-custom-mcp-empty.png (The Add custom MCP server screen) -->

### 5. Enter the URL

Under Connection, leave Server URL selected. In the URL field, enter this URL.

```text
https://exploratory.io/mcp
```

### 6. Check the authentication

Check that Authentication is OAuth. There is nothing to change.

### 7. Read the warning and select the check box

The screen says "Custom MCP servers introduce risk." Make sure you trust the server, then select I understand and want to continue.

<!-- image: images/en/chatgpt-05-custom-mcp-filled.png (The screen with the name, the URL, OAuth and the check box filled in) -->

### 8. Create it

Choose Create as a plugin.

### 9. Connect to Exploratory

The Connect Exploratory screen opens. Choose the Connect Exploratory button.

<!-- image: images/en/chatgpt-06-connect-dialog.png (The Connect Exploratory screen) -->

### 10. Approve the access

Your browser opens exploratory.io. If you are not signed in, sign in first. On the screen where ChatGPT asks for access, choose Allow.

<!-- image: images/en/chatgpt-07-sign-in.png (The approval screen on exploratory.io) -->

### 11. Check that it is connected

Back in ChatGPT, Exploratory appears under Installed on the left of Customize. Open Exploratory to see its details, such as Version, and the Try in chat button.

<!-- image: images/en/chatgpt-08-connected.png (The Exploratory details) -->

### 12. Try it

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

In the ChatGPT plugin list, delete the Exploratory plugin you added. Then open Account Settings on exploratory.io and remove the app you connected under Connected AI Apps. Deleting it in ChatGPT alone does not revoke the access you approved on Exploratory.

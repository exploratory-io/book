# Connect the ChatGPT app

Add the Exploratory server to the ChatGPT desktop app as an MCP server. An MCP server is the address an AI app connects to in order to use the data and features of an outside service.

<a id="need"></a>

## Requirements

- An Exploratory account
- The ChatGPT desktop app

You do not need an API key or a client ID.

<a id="steps"></a>

## Steps

### 1. Open the plugin settings

In the ChatGPT app, open settings and choose Plugins. At the top of the screen, choose the MCP tab.

<!-- image: images/en/chatgpt-01-settings.png (Choose the MCP tab under Plugins in settings) -->

### 2. Open the custom MCP screen

At the top right of the screen, choose Add and open the screen for connecting to a custom MCP.

<!-- image: images/en/chatgpt-02-add-menu.png (The Add menu) -->

### 3. Enter the name and the URL

In the name field, enter the name to show in the list, for example exploratory-server.

Set the type to the streamable HTTP option.

In the URL field, enter this URL.

```text
https://exploratory.io/mcp
```

Leave the bearer token environment variable and the headers empty. When you have filled in the fields, choose Save.

<!-- image: images/en/chatgpt-03-add-server.png (Enter the name, the type and the URL) -->

<a id="remove"></a>

## Disconnect

After you delete the MCP server in the ChatGPT app, open Account Settings on exploratory.io and remove the app you connected under Connected AI Apps. Deleting it in the app alone does not revoke the access you approved on Exploratory.

For other symptoms, see [Troubleshooting](../troubleshooting.md).

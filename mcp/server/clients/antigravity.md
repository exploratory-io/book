# Connect Antigravity

Register the Exploratory server in Antigravity and sign in through your browser. After that, the AI can read notes and data published on Exploratory. It takes about 10 minutes.

<a id="need"></a>

## Requirements

- An Exploratory account
- Antigravity
- You do not need an API key or a client ID.

<a id="steps"></a>

## Steps

### Copy the config file path

1. In the Antigravity app, select Customizations in the sidebar, then select Installed.
2. In the MCP Servers header, select Copy Config File Path to copy the location of the config file (mcp_config.json).

![The Installed screen under Customizations](images/en/antigravity-01-customizations.png)

### Register the server

Open mcp_config.json and add the following. A remote server takes its URL in "serverUrl".

**mcp_config.json**

```text
{
  "mcpServers": {
    "exploratory-server": {
      "serverUrl": "https://exploratory.io/mcp"
    }
  }
}
```

To use the agy command line, write the same content in ~/.gemini/config/mcp_config.json.

### Sign in and approve the access

1. Under MCP Servers, select Authenticate next to exploratory-server.
2. Your browser opens. Sign in to Exploratory.
3. On Exploratory's consent page, approve the access.
4. Copy the authorization code shown in the browser.
5. Paste the authorization code into the Enter authorization code field.
6. Select Submit.

The server reconnects automatically. A server you have signed in to shows a Sign out button.

To use agy, follow these steps.

1. Start agy.
2. Run /plugin.
3. Open the exploratory-server connection (the Desktop plugin exploratory is separate).
4. Choose Sign in.
5. Approve on Exploratory's consent page.
6. Paste the authorization code from the browser into agy.

### Check that it is connected

In a new chat, send this.

```text
Find the "Sales Orders" data on Exploratory.
```

If the Sales Orders data appears with its URL, the connection works.

1. The Sales Orders data in the table of search results.

![Check in a chat](images/en/antigravity-04-try.png)

<a id="plugin"></a>

## Check the connection when you installed the plugin

If you installed the Exploratory plugin, open Exploratory under Plugins in Customizations to check the connection. On the Accounts tab, exploratory-server shows OAUTH and CONNECTED. The MCP tab shows exploratory-server and the number of tools it provides (for example "10 tools enabled").

1. The Accounts tab.
2. The CONNECTED label.

![The Accounts tab in the Exploratory details](images/en/antigravity-02-connected-plugin.png)

1. The MCP tab.
2. The exploratory-server row.

![The MCP tab in the Exploratory details](images/en/antigravity-02-mcp-plugin.png)

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| You are asked to sign in | Go through the sign-in steps above again. |
| You installed the Desktop plugin but the Server tools do not appear | The Desktop plugin exploratory is separate from Server. Register Server with the configuration above. |

- [Troubleshooting](../troubleshooting.md) - Fixes by symptom for the MCP Server as a whole.

<a id="remove"></a>

## Disconnect

In the app, select More actions (⋮) next to exploratory-server and choose Delete. To pause it only, choose Disable. You can also disconnect by deleting the exploratory-server entry you added to mcp_config.json.

Removing the registration does not revoke the access you approved. To revoke it, also remove the client under Connected AI Apps in your account settings on exploratory.io.

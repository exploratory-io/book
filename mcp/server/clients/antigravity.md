# Connect Antigravity

Register the Exploratory server in Antigravity and sign in through your browser.

<a id="need"></a>

## Requirements

- An Exploratory account
- Antigravity
- You do not need an API key or a client ID.

<a id="steps"></a>

## Steps

### 1. Find the config file

In the Antigravity app, select Customizations in the sidebar, then select Installed.

In the MCP Servers header, select Copy Config File Path to copy the location of the config file (mcp_config.json).

<!-- image: images/en/antigravity-01-customizations.png (Copy Config File Path in MCP Servers, under Installed in Customizations) -->

### 2. Register the server

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

### 3. Sign in

Under MCP Servers, select Authenticate next to exploratory-server.

<!-- image: images/en/antigravity-02-authenticate.png (Authenticate next to exploratory-server) -->

Your browser opens. Sign in to Exploratory and approve the access.

Copy the authorization code shown in the browser, paste it into the Enter authorization code field, and select Submit.

<!-- image: images/en/antigravity-03-authorization-code.png (The Enter authorization code field) -->

The server reconnects automatically. A server you have signed in to shows a Sign out button.

To use agy, follow these steps.

| Step | What to do |
| --- | --- |
| 1 | Start agy. |
| 2 | Run /plugin. |
| 3 | Open the exploratory-server connection (the Desktop plugin exploratory is separate). |
| 4 | Choose Sign in. |
| 5 | Approve on Exploratory's consent page. |
| 6 | Paste the authorization code from the browser into agy. |

### 4. Try it

In a new chat, send this.

```text
Find the "Sales Orders" data on Exploratory.
```

If the Sales Orders data appears with its URL, the connection works.

<!-- image: images/en/antigravity-04-try.png (Check in a chat) -->

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

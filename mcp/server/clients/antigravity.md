# Connect Antigravity

Register the Exploratory server in Antigravity and sign in through your browser.

<a id="need"></a>

## Requirements

- An Exploratory account
- Antigravity
- You do not need an API key or a client ID.

> **Verification status**
>
> These steps follow the source documentation. They have not yet been checked in this client.

<a id="steps"></a>

## Steps

### 1. Register

To register only the server, add this to ~/.gemini/config/mcp_config.json.

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

When Server is listed in the official plugin directory, you can install it from there instead.

### 2. Sign in

| Step | What to do |
| --- | --- |
| 1 | Start agy. |
| 2 | Run /plugin. |
| 3 | Open the exploratory-server connection (the Desktop plugin exploratory is separate). |
| 4 | Choose Sign in. |
| 5 | Approve on Exploratory's consent page. |
| 6 | Paste the authorization code from the browser into agy. |

In the Antigravity app, select Authenticate next to the server under Agent settings \> Customizations.

### 3. Try it

```text
Find the "Sales Orders" data on Exploratory.
```

> If the Sales Orders data appears with its URL, the connection works.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| You are asked to sign in | Go through the sign-in steps above again. |
| You installed the Desktop plugin but the Server tools do not appear | The Desktop plugin exploratory is separate from Server. Register Server with the configuration above. |

- [Troubleshooting](../troubleshooting.md) - Fixes by symptom for the MCP Server as a whole.

<a id="remove"></a>

## Disconnect

Delete the exploratory-server entry you added to mcp_config.json.

Removing the registration does not revoke the access you approved. To revoke it, also remove the client under Connected AI Apps in your account settings on exploratory.io.

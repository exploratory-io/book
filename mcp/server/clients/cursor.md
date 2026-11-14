# Connect Cursor

Register the Exploratory server in the Cursor agent and sign in through your browser. It works with the model you pick in Cursor, including Grok.

<a id="need"></a>

## Requirements

- An Exploratory account
- Cursor (the agent is agent or cursor-agent)
- You do not need an API key or a client ID.

<a id="steps"></a>

## Steps

### 1. Register

Until Exploratory Server is listed in the official plugin directory, add only the server by hand, without the skill. Add this to ~/.cursor/mcp.json (or .cursor/mcp.json in a project).

**mcp.json**

```text
{
  "mcpServers": {
    "exploratory-server": {
      "type": "http",
      "url": "https://exploratory.io/mcp"
    }
  }
}
```

In the Cursor app, you can check the MCP server you added under Customize in the sidebar. You can turn each server on or off there.

<!-- image: images/en/cursor-01-customize.png (exploratory-server under Customize in the sidebar) -->

### 2. Sign in

```sh
agent mcp login exploratory-server
```

Your browser opens. Sign in to Exploratory and approve the access.

<!-- image: images/en/cursor-02-sign-in.png (Sign in and approve in the browser) -->

### 3. Try it

```text
Find the "Sales Orders" data on Exploratory.
```

> If the Sales Orders data appears with its URL, the connection works.

<!-- image: images/en/cursor-03-try.png (Check in a chat) -->

A skill gives an AI instructions for using a service. It is separate from the MCP connection settings.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| You are asked to sign in | Run agent mcp login exploratory-server to sign in again. |
| You installed the Desktop plugin but the Server tools do not appear | The Desktop plugin does not add Server. Add Server with the JSON above. |

- [Troubleshooting](../troubleshooting.md) - Fixes by symptom for the MCP Server as a whole.

<a id="remove"></a>

## Disconnect

Delete the exploratory-server entry you added to mcp.json.

Removing the registration does not revoke the access you approved. To revoke it, also remove the client under Connected AI Apps in your account settings on exploratory.io.

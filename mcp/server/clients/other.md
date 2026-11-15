# Connect other clients

After you connect, an AI can read notes and data published on Exploratory. Any MCP client that supports Streamable HTTP and OAuth can connect with the server URL.
It takes about 5 minutes, depending on the client. You need an Exploratory account and a supported MCP client.

<a id="need"></a>

## Requirements

- An Exploratory account
- An MCP client that supports Streamable HTTP (a way to send MCP over HTTP) and OAuth (sign in through the browser and approve access)
- You do not need a client ID or an API key. The client registers itself.

<a id="steps"></a>

## Steps

### Register

See the client's own documentation for where and how.

1. Register this server URL in the client's MCP server settings.

   ```text
   https://exploratory.io/mcp
   ```

### Sign in

1. Follow the client's prompts to sign in to Exploratory in the browser.
2. Approve the access.

### Try it

1. In a new chat of the client, send this.

   ```text
   Find the "Sales Orders" data on Exploratory.
   ```

If the Sales Orders data appears with its URL, the connection works.

<a id="trouble"></a>

## Troubleshooting

A request without a valid token gets HTTP 401. Sign in again with your client's own steps.

- [Data and permissions](../data.md#auth) - The authorization mechanism and the metadata URLs.

- [Troubleshooting](../troubleshooting.md) - Fixes by symptom for the MCP Server as a whole.

<a id="remove"></a>

## Disconnect

Remove exploratory-server from the client's settings.

Removing the registration does not revoke the access you approved. To revoke it, also remove the client under Connected AI Apps in your account settings on exploratory.io.

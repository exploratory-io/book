---
title: "Connect other clients"
sidebarTitle: "Other clients"
---

After you connect, an AI can read notes and data published on Exploratory, and create Pages (HTML pages). Any MCP client that supports Streamable HTTP and OAuth can connect with the server URL.
It takes about 5 minutes, depending on the client. You need an Exploratory account and a supported MCP client.

<a id="need"></a>

## Requirements

- An Exploratory account
- An MCP client that supports Streamable HTTP (a way to send MCP over HTTP) and OAuth (sign in through the browser and approve access)
- You do not need a client ID or an API key. The client registers itself.

<a id="steps"></a>

## Steps

### Register and sign in

See the client's own documentation for where and how.

1. Register this server URL in the client's MCP server settings.

   ```text
   https://exploratory.io/mcp
   ```

2. Follow the client's prompts to sign in to Exploratory in the browser.
3. Approve the access.

### Check that it is connected

1. In a new chat of the client, send this.

   ```text
   Using the connected Exploratory Server, list up to three items I can view, with their URLs. If none are found, say so.
   ```

If items appear with their URLs, the connection works. An empty result does not necessarily mean that authentication or the connection failed. To tell them apart, see [Your content does not appear](/en/mcp/server/troubleshooting#zero).

<a id="apikey"></a>

## Connect with an API key

If your client cannot open a browser, use an API key. Create the key in Account Settings \> API Keys, put it in an environment variable, and have the client send it from there as Authorization: Bearer \<your key\>. If you type the key on a command line or write it in a settings file as it is, it stays in your shell history or in that file. See [Connect with an API key](/en/mcp/server/auth#apikey) for what a key can read.

<a id="trouble"></a>

## Troubleshooting

A request without a valid token gets HTTP 401. Sign in again with your client's own steps.

- [Data and permissions](/en/mcp/server/data#auth) - The authorization mechanism and the metadata URLs.

- [Troubleshooting](/en/mcp/server/troubleshooting) - Fixes by symptom for the Server MCP as a whole.

<a id="remove"></a>

## Disconnect

Remove exploratory-server (or the name you registered) from the client's settings.

Removing the registration does not revoke the access you approved. To revoke it, also remove the client under Connected AI Apps in Account Settings on exploratory.io.

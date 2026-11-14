# Data and permissions

Whose permissions this server uses, what it reads, and what Exploratory records.

<a id="who"></a>

## Whose permissions it uses

Server MCP calls run as the signed-in user. They never go beyond what that user can view on exploratory.io. They read published content only and are read-only.

<a id="publisher"></a>

## What publishers can do

A publisher can turn off MCP access for each piece of published content. A publisher can also keep the rows of data private. The publisher can still share its summary.

<a id="records"></a>

## What Exploratory records

For calls to this MCP server, Exploratory Server records the following. It is the same for the expl server command line.

A token is a string representing authorization. A hash is a value used for verification without storing the original token text.

- Tokens and API keys: stored as hashes, not as plain text, with the creation time, expiry and last use. You can see and revoke tokens in Connected AI Apps, and API keys in Account Settings \> API Keys.
- Data access log: the item, your user ID and email address, the channel, how you signed in (browser or API key) and the API key name, the operation, the client name, the IP address, the result and error code, and the duration. Kept for 90 days by default (1 to 400 days, set on the server).
- Server log: each tool call (email address, client, result, row count, duration), and when a token is created or deleted.
- Errors of failed calls: the time, the tool call and the error are collected to improve the product.

- [Exploratory privacy policy](https://exploratory.io/privacy) - Read the policy on data handling.

<a id="provider"></a>

## What goes to your AI provider

What a tool returns (rows, column names, chart images, errors) becomes part of your conversation. It goes to the provider of your AI (for example Anthropic, OpenAI, Google or xAI) under that provider's terms. Do not use this connection on data that you may not send to that provider.

<a id="disconnect"></a>

## Disconnect

To disconnect a client from the Server MCP, open Account Settings on exploratory.io and remove it under Connected AI Apps. Removing the registration in the client alone does not revoke the access you approved. To stop an API key, revoke it under API Keys in the same Account Settings.

- [Choose your client](server.md) - How to remove the registration in each client.

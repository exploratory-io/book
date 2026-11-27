---
title: "Data and permissions"
---

Whose permissions this server uses, what it reads, and what Exploratory records.

<a id="who"></a>

## Whose permissions it uses

Server MCP calls run as the signed-in user. They never go beyond what that user can view on exploratory.io. They read published content only. The only content they write is a Page (an HTML page): they create Pages in your account, and update or delete Pages you or your team own.

<a id="publisher"></a>

## What publishers can do

A publisher can turn off MCP access for each piece of published content. A publisher can also keep the rows of data private. Even then, the publisher can share a summary of the data.

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

<a id="auth"></a>

## How calls are authorized

For people who build a client or want to check a setting.

| Item | Value |
| --- | --- |
| Transport | Streamable HTTP, stateless (POST only; GET and DELETE return 405) |
| Registration | Clients register by Dynamic Client Registration or a Client ID Metadata Document (both let a client register itself) |
| Metadata | https://exploratory.io/.well-known/oauth-protected-resource/mcp and https://exploratory.io/.well-known/oauth-authorization-server |

A call without a valid token returns HTTP 401. The response has a WWW-Authenticate header that points to the protected-resource metadata. Clients use this header to start the sign-in.

A key that fails gets 401 or 403 with WWW-Authenticate: Bearer error="…", error_description="…". Unlike the 401 above, this header has no resource_metadata, so a client that sends a fixed header does not start the sign-in. After more than 30 refused keys from one address within 15 minutes (counted per IPv4 address, or per IPv6 /64 range), the answer is 429.

The first sign-in shows a consent page. That page says you can revoke access in "Settings > Connected apps". It links to Account Settings, where the section is named Connected AI Apps (see [Disconnect](#disconnect)). To sign in again after a 401, see [Troubleshooting](/en/mcp/server/troubleshooting#signin).

<a id="disconnect"></a>

## Disconnect

To disconnect a client from the Server MCP, open Account Settings on exploratory.io and remove it under Connected AI Apps. Removing the registration in the client alone does not revoke the access you approved. To stop an API key, revoke it under API Keys in the same Account Settings.

- [Add from an AI tool](/en/mcp/server/clients/apps) - How to remove the registration in each client.

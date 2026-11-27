---
title: "Troubleshooting"
---

Find a fix by symptom.

<a id="check"></a>

## Check the state first

Check that the connection works with the steps in step 3 of [Get started](/en/mcp/server/get-started#steps). If it does not, find your symptom below.

<a id="contact"></a>

## When you contact support

Send these to support@exploratory.io: the server URL you connect to, the name and version of your AI client, what you did, and the error message as it was shown. Hide any token or API key.

<a id="network"></a>

## When it does not connect on a company network

Ask your IT staff to allow communication to exploratory.io. For an on-premises server, ask them to allow the URL of your own server.

<a id="signin"></a>

## You are asked to sign in

A request without a valid token gets HTTP 401. Sign in again as follows.

| Client | How to sign in again |
| --- | --- |
| Claude Code | Open /mcp |
| Codex | codex mcp login exploratory-server |
| Cursor | agent mcp login exploratory-server |
| Claude app | Go through the sign-in steps on the client page again |
| ChatGPT app | Go through the sign-in steps on the client page again |
| Grok Bot | Remove the connection and add it again |
| Antigravity | Go through the sign-in steps on the client page again |
| Other clients | Sign in again as the client's documentation describes, or connect with an API key |

- [Add from an AI tool](/en/mcp/server/clients/apps) - Steps for each client.

<a id="apikey"></a>

## Your API key is refused

A key that fails gets the reason in the response, and the client does not fall back to the browser sign-in.

| HTTP status | Message | What to do |
| --- | --- | --- |
| 401 | The API key is invalid or expired. Create a new one in Account Settings \> API Keys. | Create a new key, then replace the key in the header. The same message appears when the key was revoked or its owner can no longer use API keys. |
| 403 | API keys are disabled by your administrator. | An administrator turned API keys off. Ask your administrator. |
| 403 | This IP address is not allowed for API keys. | Your administrator allows API keys only from certain IP addresses. Connect from an allowed address. |
| 429 | Too many failed API key attempts. Try again later. | More than 30 refused keys came from one address within 15 minutes (counted per IPv4 address, or per IPv6 /64 range). Fix the key and try again later. |

- [Connect with an API key](/en/mcp/server/auth#apikey) - The header, and what a key can read.

<a id="duplicate"></a>

## The same tools appear twice

Use one way only: the plugin from your app's official directory (if it lists Exploratory Server), the direct URL, or the Exploratory connector on claude.ai (it also appears in Claude Code when you sign in with the same Claude account).

If your app's official directory lists Exploratory Server and you install it from there, remove the direct entry first. Otherwise, keep the direct entry. `exploratory@exploratory` is the Desktop plugin, not Server. In Claude Code, use the command below to remove the direct entry. Replace `exploratory-server` with the name you registered. The chat-based setup example uses `Exploratory`. If you do not remove it, the same tools appear twice.

```sh
claude mcp remove exploratory-server
```

<a id="zero"></a>

## Your content does not appear

| What you see | What to do |
| --- | --- |
| Nothing is listed | Check that the account you signed in with is the one that published the content. Server MCP runs as the signed-in user, so only what that user can view is visible. |
| You want only your own content | Ask the AI for "my" content. |
| NOT_FOUND | The content does not exist or you cannot view it. Open its URL in your browser and check whether the same account can view it. If not, ask the owner to check the sharing settings. |
| CHANNEL_DISABLED | The publisher turned off MCP access for this content. Ask the publisher to check the MCP access setting of the content. |
| DATA_EGRESS_LIMIT | The publisher does not share the rows of this data. Use its charts, analytics or summary instead. |

<a id="rate"></a>

## Rate limit

| What you see | What to do |
| --- | --- |
| 429 RATE_LIMITED | One user sent more than 120 requests in a minute. Wait one minute. |
| SERVER_BUSY | Try again in a few seconds. If it happens twice in a row, try again later. For the hourly export limit, wait up to an hour. |
| RATE_LIMIT_EXCEEDED / QUERY_ENGINE_UNAVAILABLE | The query engine is busy. Try again in a few seconds. |

- [Limits and errors](/en/mcp/server/limits) - The list of errors.

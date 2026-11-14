# Endpoint

The server URL, the transport, authorization and metadata URLs. For people who build a client or want to check a setting.

<a id="url"></a>

## Server URL



```text
https://exploratory.io/mcp
```

<a id="spec"></a>

## Transport and authorization

| Item | Value |
| --- | --- |
| Server URL | https://exploratory.io/mcp |
| Transport | Streamable HTTP (a way to send MCP over HTTP), stateless (POST only; GET and DELETE return 405) |
| Authorization | OAuth 2.1 with PKCE. Clients register by Dynamic Client Registration or a Client ID Metadata Document (both let a client register itself). Or an API key sent as Authorization: Bearer exp_pat_... |
| Scope | content:read (an API key has the same scope) |
| Metadata | https://exploratory.io/.well-known/oauth-protected-resource/mcp and https://exploratory.io/.well-known/oauth-authorization-server |

<a id="calls"></a>

## Authenticating calls

Every call needs Authorization: Bearer \<access token or API key\>. A browser session cookie does not authenticate MCP calls.

A call without a valid token returns HTTP 401. The response has a WWW-Authenticate header that points to the protected-resource metadata. Clients use this header to start the sign-in.

A key that fails gets 401 or 403 with WWW-Authenticate: Bearer error="…", error_description="…". Unlike the 401 above, this header has no resource_metadata, so a client that sends a fixed header does not start the sign-in. After more than 30 refused keys from one address within 15 minutes (counted per IPv4 address, or per IPv6 /64 range), the answer is 429.

<a id="consent"></a>

## Consent and connections

The first sign-in shows a consent page. To see and revoke connected clients, open Account Settings and go to Connected AI Apps.

MCP access does not exceed the signed-in user’s viewing permissions. Publishers may restrict MCP access to content or sharing of data rows.

- [Data and permissions](data.md) - Read about publisher settings and revoking access.

<a id="sign401"></a>

## When you get 401

Sign in again.

| Client | How to sign in again |
| --- | --- |
| Claude Code | /mcp |
| Codex | codex mcp login exploratory-server |
| Cursor | agent mcp login exploratory-server |
| Grok Bot | Remove the connection and add it again. |

When you connect with an API key, a 401 means the key is invalid, expired or revoked. Create a new key (see Connect with an API key).

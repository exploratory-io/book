---
title: "Authentication and API keys"
---

How the server authenticates a call: the browser sign-in, and the API key for setups that have no browser.

<a id="apikey"></a>

## Connect with an API key

Some setups cannot open a browser: a server, a scheduled job, or a client that only lets you set a fixed header. Connect those with an API key. Create one in Account Settings \> API Keys (see [API keys](../../cli/server/token.md)), then send it in the Authorization header of every call to the server URL.

```text
Authorization: Bearer exp_pat_...
```

Replace exp_pat_... with your key.

Put the key in an environment variable and let the client read it from there. Set EXPLORATORY_API_KEY through your environment's secret-management facility, such as your operating system's credential store or the secrets of your CI, not through your shell's startup file. Do not write the key itself on the command line or in a configuration file; it stays in your shell history or in that file. The configuration below assumes that this environment variable is already set. For example, in Claude Code, a client that accepts a fixed header, refer to the variable in .mcp.json.

```json
{
  "mcpServers": {
    "exploratory-server": {
      "type": "http",
      "url": "https://exploratory.io/mcp",
      "headers": {
        "Authorization": "Bearer ${EXPLORATORY_API_KEY}"
      }
    }
  }
}
```

For other clients, see the steps for [Codex](clients/codex.md#apikey), [Cursor](clients/cursor.md#apikey) and [other clients](clients/other.md#apikey).

- A key reads what you can view, as your browser sign-in does. It is read-only (content:read). Only Authors can create one.
- When a key fails, the server answers 401 or 403 with the reason. It does not start the browser sign-in (OAuth) instead. Fix the key.
- Use the browser sign-in where you can. A key does not go through the consent page, SSO or MFA, so treat it like a password.

| HTTP status | Message | What to do |
| --- | --- | --- |
| 401 | The API key is invalid or expired. Create a new one in Account Settings \> API Keys. | Create a new key, then replace the key in the header. The same message appears when the key was revoked or its owner can no longer use API keys. |
| 403 | API keys are disabled by your administrator. | An administrator turned API keys off. Ask your administrator. |
| 403 | This IP address is not allowed for API keys. | Your administrator allows API keys only from certain IP addresses. Connect from an allowed address. |
| 429 | Too many failed API key attempts. Try again later. | More than 30 refused keys came from one address within 15 minutes (counted per IPv4 address, or per IPv6 /64 range). Fix the key and try again later. |

An administrator on an on-premises or Hosted server can turn API keys off or limit them to certain IP addresses; the two 403 messages above mean that. The publisher settings in [Data and permissions](data.md#publisher) apply to a key in the same way.

- [API keys](../../cli/server/token.md) - Create, expire, revoke and keep a key safe.

<a id="spec"></a>

## Transport and authorization

| Item | Value |
| --- | --- |
| Server URL | https://exploratory.io/mcp |
| Transport | Streamable HTTP (a way to send MCP over HTTP), stateless |
| Authorization | OAuth 2.1 with PKCE: sign in with your browser the first time. Or an API key sent as Authorization: Bearer exp_pat_... |
| Scope | content:read (an API key has the same scope) |

If a person uses it in a browser, use the browser sign-in. If there is no browser, or a job runs by itself, use an API key.

Every call needs Authorization: Bearer \<access token or API key\>. A browser session cookie does not authenticate MCP calls. The consent page, the metadata URLs and the details of failed calls are in [Data and permissions](data.md#auth).

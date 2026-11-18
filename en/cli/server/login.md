---
title: "Sign in"
---

Sign in with your browser, or with an API key (a string that lets expl read Exploratory as you without a browser), and save the login on this computer. You also check the state and sign out here.

<a id="signin"></a>


If a person uses expl and has a browser, sign in with the browser. If there is no browser, or a script or CI runs expl, use an API key.

```sh
expl server login
```

Your browser opens. Sign in to Exploratory and allow access. In a terminal that is not interactive, expl does not open a browser and prints the URL instead.

> If you see "Logged in to exploratory.io as …", you are signed in.

```sh
expl server status
```

Shows the server, your user and how you are signed in.

```sh
expl server logout
```

Removes the saved login. Unless you supply an API key through EXPL_SERVER_TOKEN, the next call requires sign-in. If you signed in with an API key, only the saved copy is removed; the key itself keeps working until you revoke it.

<a id="apikey"></a>

## Sign in with an API key

An API key lets expl sign in without a browser. Create one in Account Settings \> API Keys (see [API keys](/en/cli/server/token)), then run this.

```sh
expl server login --with-token
```

In a terminal, `expl asks "API key:"` and does not show what you paste. When the key comes through a pipe, expl reads it from standard input.

**Result**

```text
Logged in to exploratory.io as you@example.com with API key "ci-nightly".
```

```sh
expl server login --with-token < key-file
```

key-file is a file that holds only the key. Do not write the key on the command line.

expl checks the key with the server first. If the server refuses it, nothing is saved. A key starts with exp_pat_. `--with-token` cannot be used together with `--no-browser`. To choose the server, add `--url`.

The key is saved in the same place as a browser login (see Where the login is saved). A saved API key is never refreshed and never opens a browser. Signing in again replaces it.

Instead of saving it, you can set the environment variable EXPL_SERVER_TOKEN. It is used before any saved login.

| Order | Source |
| --- | --- |
| 1 | EXPL_SERVER_TOKEN |
| 2 | The saved login (a browser login, or an API key saved by `--with-token`) |

To switch from the environment-variable key to a saved login, run unset EXPL_SERVER_TOKEN first. While it is set, it is used before the saved login.

```sh
expl server status
```

Shows how you are signed in. With EXPL_SERVER_TOKEN the line reads: API key "ci-nightly" from EXPL_SERVER_TOKEN, expires 2026-12-13. A key with no expiry reads: never expires. After a browser login it reads: login (refresh token saved …, access token valid until …).

**Result**

```text
Server: https://exploratory.io (Exploratory 0.17.0)
User: you@example.com
Auth: API key "ci-nightly" saved by login --with-token, expires 2026-12-13
```

For how to create a key and keep it safe, see [API keys](/en/cli/server/token).

<a id="nobrowser"></a>

## Without a browser

Use this on a machine where expl cannot open a browser, such as a remote server.

```sh
expl server login --no-browser
```

### 1. Open the URL

The command prints a URL that starts with https://exploratory.io/oauth/authorize? and waits. Open that URL in a browser.

### 2. Allow access

Sign in to Exploratory and allow access.

### 3. Expect an error page

The browser then goes to a page that cannot be reached. That is expected.

### 4. Copy the redirect URL

Copy the URL in the browser's address bar. It starts with http://127.0.0.1/callback?code=. It is not the first URL the command printed.

### 5. Paste it

Paste it into the terminal and press Enter.

> "Logged in to ... as ..." means you are signed in.

The code in that URL works only once and expires 60 seconds after the browser reaches that page, so paste it right away. If signing in fails, start again from the beginning.

<a id="saved"></a>

## Where the login is saved

The login is saved under \~/.exploratory/expl/server/, one file per host, with permission 0600 (readable only by you). A browser login and an API key saved by `--with-token` go to the same place. On Windows it is under %USERPROFILE%\\.exploratory\\expl\\server\\.

A saved login is used only for the same origin (scheme, host and port). On a standard port, a later login to the same host replaces the saved file.

If the browser login is revoked on the server (for example in Connected AI Apps), the next call exits with code 4 and tells you to run expl server login. An API key is revoked in Account Settings \> API Keys.

<a id="url"></a>

## The server URL

The default server is https://exploratory.io. To use another server, pass `--url` or set the environment variable EXPL_SERVER_URL. The order of precedence is as follows.

| Order | Source |
| --- | --- |
| 1 | `--url` |
| 2 | EXPL_SERVER_URL |
| 3 | The host whose saved login is the most recent (a token refresh updates it too) |
| 4 | https://exploratory.io |

<a id="records"></a>

## What the server records

For the operations that expl server calls, Exploratory Server records the following. It records the same when an AI tool connects to Exploratory through MCP.

- Tokens and API keys: stored as hashes, not as plain text, with the creation time, expiry and last use. You can see and revoke the tokens of a browser login in Connected AI Apps, and API keys in Account Settings \> API Keys.
- Data access log: the item, your user ID and email address, the channel (cli), how you signed in (browser or API key) and the API key name, the operation, the client name, the IP address, the result and error code, and the duration. Kept for 90 days by default (1 to 400 days, set on the server).
- Server log: each tool call (email address, client, result, row count, duration), and when a token is created or deleted.
- Errors of failed calls: the time, the tool call and the error are collected to improve the product.

The [Data and permissions](/en/mcp/server/data) page of MCP Server describes the same records.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| `Run "expl server login".` | You are not signed in, or the saved login was rejected. Run expl server login. |
| The redirect URL has no authorization code. | With `--no-browser`, you pasted the first URL. Paste the redirect URL that starts with http://127.0.0.1/callback?code= instead. |
| It fails after you paste | The code works only once and expires after 60 seconds. Start again from the beginning. |
| The API key is invalid or expired. Create a new one in Account Settings \> API Keys. (UNAUTHORIZED) | The key is wrong, expired or revoked, or its owner can no longer use API keys. Exit code 4. Create a new API key, then set EXPL_SERVER_TOKEN or run `expl server login --with-token`. |
| API keys are disabled by your administrator. | An administrator turned API keys off. Exit code 4. Ask your administrator, or sign in with expl server login. |
| This IP address is not allowed for API keys. | Your administrator limits API keys to certain IP addresses. Exit code 4. Run expl from an allowed address, or ask your administrator. |
| Too many failed API key attempts. Try again later. | Many refused keys came from this address in a short time. Fix the key and try again later. |
| `--token` was removed. … | Use the environment variable EXPL_SERVER_TOKEN, or run `expl server login --with-token`. Exit code 2. |
| Paste an API key (it starts with exp_pat_) when … | The value is not an API key. Copy the whole key from Account Settings \> API Keys. Exit code 2. |

---
title: "API keys"
---

Create an API key, pass it to expl, and keep it safe. Use it for CI, scripts and any place without a browser.

<a id="what"></a>

## What an API key is

An API key is a string that lets a program read Exploratory as you. It takes the place of a password. CI (a system that runs steps automatically when code changes) has no one to sign in through a browser, so you give it an API key. A key starts with exp_pat_.

A key reads what you can view, as your browser sign-in does (read-only). It cannot create or change anything. Only Authors can create keys.

The commands on this page are named token (expl server token), and what they handle is the API key.

<a id="create"></a>

## Create an API key

### 1. Open API Keys

On exploratory.io, open Account Settings from the icon at the top right (https://exploratory.io/account/settings ) and go to the API Keys section.

### 2. Create it

Choose Create API key. Enter a name that says where the key is used, for example ci-nightly. The name can have up to 100 characters and must be new among your keys.

### 3. Choose when it expires

Choose 7, 30, 90 or 365 days, a date, or No expiry. The default is 30 days. An administrator can set a shorter maximum. Then choose Create.

### 4. Copy the key

The key is shown only once. Copy it and keep it in a password manager or a CI secret.

> The key appears in your list with its name, expiry and last use. The value is not shown again.

| Item | Limit |
| --- | --- |
| Active keys per person | Up to 20 |
| Who can create | Author |
| Permission | Read only |

If you lose a key, choose Regenerate to get a new value. The old value stops working right away. If the page asks you to sign out and sign in again before you change keys, do that and try again.

<a id="pass"></a>

## Give the key to expl

Save the key with `expl server login --with-token`, or set the environment variable EXPL_SERVER_TOKEN, which is used first. The order and how to switch are on [Sign in](/en/cli/server/login#apikey). `--token` was removed; passing it exits with code 2.

For how to use it in GitHub Actions, see [Automation](/en/cli/server/guides/automation).

<a id="cli"></a>

## Create, list and revoke from the terminal

These commands work only when you signed in with the browser (expl server login). With an API key, expl server token create fails with: Log in with "expl server login" to create tokens.

```sh
expl server token create --name ci
```

`--name` is required. From the terminal, the name can use letters, digits, ".", "_" and "-", up to 64 characters. `--expires <days>` sets how many days the key lasts, from 1 to 365. A key made this way is an API key and also appears in Account Settings \> API Keys. The key is printed once; save it right away.

**Result**

```text
exp_pat_...
Token name: ci
Expires: 2026-12-13T09:00:00.000Z
Save this token; it will not be shown again.
Set EXPL_SERVER_TOKEN for CI.
```

```sh
expl server token list
```

Lists your keys. The key value is not shown. Without keys it prints "No tokens."

**Result**

```text
NAME  CREATED_AT                LAST_USED_AT              EXPIRES_AT
ci    2026-11-13T09:00:00.000Z  2026-11-13T09:05:00.000Z  2026-12-13T09:00:00.000Z
```

```sh
expl server token revoke ci
```

ci is the name you gave when you created it.

**Result**

```text
Revoked ci.
```

<a id="safe"></a>

## Keep the key safe

- Do not write the key on the command line or in a script. It stays in your shell history and can be seen in the process list. Use `expl server login --with-token` (it asks without showing the key), or an environment variable.
- In CI, pass the key as a secret and keep it out of logs; see [Automation](/en/cli/server/guides/automation#token).
- A key expires. You get an email before it does, 7 days and 1 day ahead. Create a new key before then so your jobs keep running.
- You also get an email when a key is created, regenerated or revoked. If you do not expect it, revoke the key and change your password.

<a id="revoke"></a>

## Revoke a key

Revoke a key when it leaks or when you no longer need it. Choose Revoke in Account Settings \> API Keys, or run expl server token revoke \<name\> after a browser login. The command sends the revocation without asking for confirmation, and without `--yes`. The key stops working right away.

A call with a revoked, expired or wrong key exits with code 4 and prints: The API key is invalid or expired. Create a new one in Account Settings \> API Keys. (UNAUTHORIZED)

<a id="admin"></a>

## What your administrator controls

On on-premises and Hosted servers, administrators can do the following in the admin settings.

- Turn API keys off. Every key stops working at once, and works again when the setting is turned back on. The message is: API keys are disabled by your administrator.
- Set the longest lifetime of a key. A key with a longer lifetime stops working.
- Allow keys only from certain IP addresses. The message is: This IP address is not allowed for API keys.
- See and revoke the keys of every user. The owner gets an email.

<a id="records"></a>

## What is recorded

API keys are stored as hashes, with the creation time, expiry and last use. The other records are described on the [Data and permissions](/en/mcp/server/data) page of MCP Server.

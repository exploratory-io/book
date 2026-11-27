---
title: "Automation"
---

Run expl server from scripts and CI without anyone signing in through a browser, with an API key.

<a id="token"></a>

## Create an API key

CI is a system that runs steps automatically when code changes. No one can sign in through a browser there, so you give it an API key. Create one as described on the [API keys](/en/cli/server/token#create) page.

Store the key as a secret in your CI (a feature that keeps values hidden). Do not write it in a script, and do not print it to the screen or to logs. A key expires; create a new one and replace the secret before then.

For how to create a key and keep it safe, see [API keys](/en/cli/server/token).

<a id="pass"></a>

## Pass the key

Pass the key with the environment variable EXPL_SERVER_TOKEN. For the order against a saved login, see [Sign in](/en/cli/server/login#apikey). To use another server, set EXPL_SERVER_URL.

<a id="run"></a>

## Example: GitHub Actions

An example for GitHub Actions. Replace \<id\> with the id of the content to read.

```text
- uses: actions/setup-node@v4
  with:
    node-version: 22
- run: npx -y @exploratory/cli server fetch <id> --json
  env:
    EXPL_SERVER_TOKEN: ${{ secrets.EXPL_SERVER_TOKEN }}
    EXPL_SERVER_URL: https://exploratory.io
```

<a id="exit"></a>

## Exit codes

A script can tell success from failure by the exit code. These two are common in CI.

| Code | Meaning | What to do |
| --- | --- | --- |
| 3 | The server cannot be reached (network, an HTML error page and so on) | Check the network and run it again. |
| 4 | Not signed in, or the API key was rejected | Check that the key is correct, has not expired and has not been revoked. |

Every exit code is described in [Exit codes and errors](/en/cli/server/exit-codes).

<a id="revoke"></a>

## Revoke the API key

Revoke a key that leaks or that you no longer need, as described in [API keys](/en/cli/server/token#revoke).

A call with a revoked or expired key exits with code 4.

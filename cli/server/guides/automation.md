# Automation

Run expl server from scripts and CI without anyone signing in through a browser, with an API key.

<a id="token"></a>

## Create an API key

CI is a system that runs steps automatically when code changes. No one can sign in through a browser there, so you give it an API key (a string that lets expl read Exploratory as you). Create one in Account Settings \> API Keys. Choose a name that says where it is used, such as ci-nightly, and an expiry; the default is 30 days. The key is shown only once.

Store the key as a secret in your CI (a feature that keeps values hidden). Do not write it in a script, and do not print it to the screen or to logs. A key expires; create a new one and replace the secret before then.

- [API keys](../token.md) - How to create a key and keep it safe.

<a id="pass"></a>

## Pass the key

Pass the key with the environment variable EXPL_SERVER_TOKEN. It is used before a login saved on the machine. --token was removed. To use another server, set EXPL_SERVER_URL.

<a id="run"></a>

## Example: GitHub Actions

An example for GitHub Actions. Replace \<id\> with the id of the content to read. Replace \<version\> with the version you use, and always pin it.

```text
- uses: actions/setup-node@v4
  with:
    node-version: 22
- run: npx @exploratory/cli@<version> server fetch <id> --json
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

- [Exit codes](../exit-codes.md) - Describes every exit code.

<a id="revoke"></a>

## Revoke the token

Revoke the key when it leaks or when you no longer need it. Choose Revoke in Account Settings \> API Keys. After a browser login you can also run expl server token revoke \<name\>.

A call with a revoked or expired key exits with code 4.

# Connect Claude Code

After you connect, an AI can read notes and data published on Exploratory. You register the Exploratory server in Claude Code and sign in through your browser.
It takes about 3 minutes. You need an Exploratory account and Claude Code.

<a id="need"></a>

## Requirements

- An Exploratory account
- Claude Code
- You do not need an API key or a client ID.

<a id="steps"></a>

## Steps

### Register and sign in

This registers only the server, without the plugin or skill.

1. Run this command.

   ```sh
   claude mcp add --transport http exploratory-server https://exploratory.io/mcp
   ```

2. Start a new session.
3. Open `/mcp`.
4. Choose the exploratory-server connection.
5. Sign in through the browser.

### Check that it is connected

1. In the new session, send this.

   ```text
   Find the "Sales Orders" data on Exploratory.
   ```

If the Sales Orders data appears with its URL, the connection works.

A skill gives an AI instructions for using a service. It is separate from the MCP connection settings.

<a id="apikey"></a>

## Connect with an API key

If your environment cannot open a browser, register the server with an API key instead of signing in through the browser. Create the key in Account Settings \> API Keys.

```sh
claude mcp add --transport http exploratory-server https://exploratory.io/mcp --header "Authorization: Bearer exp_pat_..."
```

Replace exp_pat_... with your key. This leaves the key in your shell history. Use one way only: the OAuth sign-in above or this one.

- [Connect with an API key](../overview.md#apikey) - What a key can read and the errors it can return.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| You are asked to sign in | Open /mcp and sign in again. |
| The same tools appear twice | Use one way only: the official plugin, the direct URL, or the connector on claude.ai. If you later install the plugin from the official directory, first remove the direct entry with claude mcp remove exploratory-server. |

- [Troubleshooting](../troubleshooting.md) - Fixes by symptom for the MCP Server as a whole.

<a id="remove"></a>

## Disconnect

```sh
claude mcp remove exploratory-server
```

Removing the registration does not revoke the access you approved. To revoke it, also remove the client under Connected AI Apps in your account settings on exploratory.io.

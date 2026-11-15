# Connect Codex

Register the Exploratory server in Codex and sign in through your browser. It takes about 3 minutes.

<a id="need"></a>

## Requirements

- An Exploratory account
- Codex
- You do not need an API key or a client ID.

<a id="steps"></a>

## Steps

### Register

This registers only the server, without the skill. Use either of the two ways below.

#### Edit the config file

**Edit the config file**

```text
[mcp_servers.exploratory-server]
url = "https://exploratory.io/mcp"
```

Add this to ~/.codex/config.toml.

#### Add with a command

**Add with a command**

```sh
codex mcp add exploratory-server --url https://exploratory.io/mcp
```

When Exploratory Server is listed in Codex's official plugin directory, you can install it from there instead. Use one way only. exploratory@exploratory in Exploratory's GitHub marketplace is for Desktop and does not install Server.

### Sign in

```sh
codex mcp login exploratory-server
```

Your browser opens. Sign in to Exploratory and approve the access.

### Try it

```text
Find the "Sales Orders" data on Exploratory.
```

> If the Sales Orders data appears with its URL, the connection works.

A skill gives an AI instructions for using a service. It is separate from the MCP connection settings.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| You are asked to sign in | Run codex mcp login exploratory-server to sign in again. |
| The Server tools do not appear | exploratory@exploratory is for Desktop. Register Server with the steps above. |

- [Troubleshooting](../troubleshooting.md) - Fixes by symptom for the MCP Server as a whole.

<a id="remove"></a>

## Disconnect

Delete the \[mcp_servers.exploratory-server\] entry you added to ~/.codex/config.toml.

Removing the registration does not revoke the access you approved. To revoke it, also remove the client under Connected AI Apps in your account settings on exploratory.io.

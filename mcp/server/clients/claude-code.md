# Connect Claude Code

Register the Exploratory server in Claude Code and sign in through your browser. It takes about 3 minutes.

<a id="need"></a>

## Requirements

- An Exploratory account
- Claude Code
- You do not need an API key or a client ID.

<a id="steps"></a>

## Steps

### Register

This registers only the server, without the plugin or skill.

```sh
claude mcp add --transport http exploratory-server https://exploratory.io/mcp
```

When Exploratory Server is listed in Claude's official plugin directory, you can install it from there instead. Use one way only.

### Sign in

Start a new session, open /mcp, choose the exploratory-server connection and sign in through the browser.

### Try it

```text
Find the "Sales Orders" data on Exploratory.
```

> If the Sales Orders data appears with its URL, the connection works.

**The same operation run with the CLI**

```sh
expl server search "Sales Orders" --scope all --type data --limit 3 --json
```

With --json, the result the search tool returned is printed as it is. Long output is trimmed.

**Result**

```text
{
  "results": [
    {
      "id": "llS6nQK3aH",
      "title": "Sales Orders",
      "url": "https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH",
      "type": "data",
      "description": "One row is one order line item (an order can have several lines, line_no 1-3). Period: order_date from 2025-01-01 to 2026-10-31. Columns: order_id (order ID), line_no (line number within the order), order_date, ship_date (shipping date; can be later than the order date, up to 2026-11-04), custome...",
      "author": "Takato Shiroto",
      "team": null,
      "updated_at": "2026-11-12T09:26:51.086Z",
      "refreshed_at": "2026-11-12T08:12:13.528Z",
      "tags": [
        "sales",
        "orders",
        "english"
      ],
      "publication_version": "2026-11-12T09:26:51.086Z",
      "data_as_of": "2026-11-12T08:12:13.528Z",
      "columns": [
        {
          "name": "order_id",
          "type": "character",
          "description": "",
          "missing_count": 0
        },
        {
          "name": "line_no",
          "type": "numeric",
          "description": "",
          "missing_count": 0
        }
… (trimmed)
      ],
      "column_count": 14,
      "row_count": 23131
    }
  ],
  "has_more": false,
  "next_offset": null
}
```

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

# Connect Grok Bot

Add the Exploratory server in a Grok Bot chat. Grok Bot is a chat client where you add MCP servers by message.

<a id="need"></a>

## Requirements

- An Exploratory account
- Grok Bot
- You do not need an API key or a client ID.

<a id="steps"></a>

## Steps

### 1. Register

In a Grok Bot chat, send this message. It adds the MCP server only; it does not install the skill.

```text
Add this remote MCP server. Name: exploratory-server, URL: https://exploratory.io/mcp
```

<!-- image: images/en/grok-bot-01-add.png (Ask in the chat to add the MCP server) -->

### 2. Sign in

Grok Bot shows a card for exploratory-server. Sign in to Exploratory from the card. When the card says it is connected, check the connection in the next step.

<!-- image: images/en/grok-bot-02-card.png (The exploratory-server card) -->

### 3. Try it

```text
Find the "Sales Orders" data on Exploratory.
```

> If the Sales Orders data appears with its URL, the connection works.

<!-- image: images/en/grok-bot-03-try.png (Check in a chat) -->

A skill gives an AI instructions for using a service. It is separate from the MCP connection settings.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| You are asked to sign in | Remove the connection and add it again. |

- [Troubleshooting](../troubleshooting.md) - Fixes by symptom for the MCP Server as a whole.

<a id="remove"></a>

## Disconnect

Remove exploratory-server from Grok Bot's connections.

Removing the registration does not revoke the access you approved. To revoke it, also remove the client under Connected AI Apps in your account settings on exploratory.io.

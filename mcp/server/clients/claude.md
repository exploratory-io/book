# Connect the Claude app

Add the Exploratory server to the Claude desktop app as a custom connector. A connector is a link that lets Claude use the data and features of an outside service. After you add it and approve the access by signing in to Exploratory in your browser, you can read notes and data published on Exploratory from a Claude chat.

<a id="need"></a>

## Requirements

- An Exploratory account
- The Claude desktop app

You do not need an API key or a client ID.

<a id="steps"></a>

## Steps

### 1. Open settings

In the Claude app, open settings.

### 2. Open the connectors screen

In the menu on the left of settings, choose Connectors under Customize.

<!-- image: images/en/claude-01-settings.png (Choose Connectors in the left menu of settings) -->

### 3. Add a custom connector

At the top right of the connectors screen, choose Add, then choose Add custom connector.

<!-- image: images/en/claude-03-add-menu.png (The Add menu) -->

The Add custom connector screen opens. In Name, enter the name to show in the list, for example Exploratory.

In MCP server URL, enter this URL.

```text
https://exploratory.io/mcp
```

When both are filled in, choose Continue.

<!-- image: images/en/claude-04-custom-connector.png (Enter the name and the MCP server URL) -->

### 4. Sign in and approve

Your browser opens. Sign in to Exploratory and approve the access.

<!-- image: images/en/claude-05-sign-in.png (Sign in and approve) -->

When Exploratory appears in the connectors list with Connected on its right, the connection works.

<!-- image: images/en/claude-02-connectors.png (Connected is shown in the list) -->

### 5. Try it

Open a new chat and send this.

```text
Find the "Sales Orders" data on Exploratory.
```

If the Sales Orders data appears with its URL, it works.

<!-- image: images/en/claude-06-try.png (Check in a chat) -->

<a id="permissions"></a>

## Check when tools run

Open Exploratory in the list to see the Tool permissions screen. The tools of the Exploratory connector are grouped under Read-only tools. You can choose when each tool runs. This setting decides when Claude may use the tools in Manual mode. In Auto mode, an automated check blocks actions it flags as risky; for other actions, Claude may act without asking, even for tools set to Needs approval.

<!-- image: images/en/claude-07-tool-permissions.png (The Tool permissions screen) -->

<a id="trouble"></a>

## If it does not work

| What you see | What to do |
| --- | --- |
| A message says that a connector for this URL already exists in your organization | Someone on your team (organization) already added it. Do not add it again; use the existing connector in the list. |
| You are asked to sign in | Open Exploratory in the connectors list and sign in again. |

For other symptoms, see [Troubleshooting](../troubleshooting.md).

<a id="remove"></a>

## Disconnect

Open Exploratory in the connectors list and choose Disconnect at the top right.

Disconnect does not revoke the access you approved on Exploratory. To revoke it too, open Account Settings on exploratory.io and remove Claude under Connected AI Apps.

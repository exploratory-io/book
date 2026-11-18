---
title: "Data and permissions"
---

What is sent and what is recorded when you use the Desktop MCP. What Desktop asks you first, and the settings, are on [Permissions and settings](/en/mcp/desktop/permissions).

<a id="privacy"></a>

## What is sent and recorded

- The Desktop MCP runs on your computer. It reads and edits local project content through the app.
- What a tool returns (rows, column names, chart images, errors) becomes part of your conversation. It goes to the provider of your AI under that provider's terms. Do not use it on data that you may not send to that provider.
- Exploratory Desktop keeps a record of each tool call on your computer and deletes it after 90 days. A record holds the tool name, the names of the arguments (not their values), the result, and the duration.
- Exploratory Desktop sends one usage record for each Desktop MCP tool call to the exploratory.io server you are signed in to. A record holds the tool name and its arguments (which can include formulas and values you entered), success or failure with the error type and message, the size of the result (not the content), the duration, the Desktop version, the AI tool name and version, and the session and item IDs. It sends records only while you are signed in and AI features are on, and never for local data catalog tools.

---
title: "Data and permissions"
---

What is sent and what is recorded when you use expl.

<a id="records"></a>

## What is sent and recorded

Commands go to the Desktop app over a local connection on your computer. Desktop keeps a log of each tool call on your computer (tool name, parameter names without their values, result, duration) and deletes it after 90 days.

While you are signed in and AI features are on, Desktop also sends one usage record for each tool call to the exploratory.io server you are signed in to, as it does for MCP Desktop (never for local data catalog tools). A record holds the tool name and its arguments (which can include formulas and values you entered), success or failure with the error type and message, the size of the result (not the content), the duration, the Desktop version, the client name and version, and the session and item IDs.

expl itself sends no usage analytics.

For what MCP Desktop records, see also [Data and permissions](/en/mcp/desktop/data).

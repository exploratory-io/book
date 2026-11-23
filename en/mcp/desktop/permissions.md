---
title: "Permissions and settings"
---

What Desktop asks you first, and what you decide in Desktop. What is sent and recorded is on [Data and permissions](/en/mcp/desktop/data).

<a id="control"></a>

## What you control in Desktop

In System Settings \> MCP / CLI you decide the following.

- Allow create, edit and delete: when it is off, the AI can only read. Turn it on only when you want the AI to create or change content.
- Approval: Desktop asks you before it deletes items (charts, analytics, notes, dashboards, steps, branches, parameters, connections, palettes, templates, R packages, catalog items), publishes notes, dashboards, data frames and projects, unpublishes notes, dashboards and projects, saves a connection, replaces a data source, restores a project's history, manages data frames, changes the system settings or the catalog schedule. It also asks before it runs R code, adds R packages, processes data with AI or asks the note AI. Desktop does not ask before creating or editing charts, notes and dashboards. You can choose to run each of these two groups without asking, with "Run changes, deletions and publishing without asking" and "Run code and AI processing without asking".
- Approved apps: an app asks for your approval the first time it connects. Under Approved apps in the same screen, choose Remove on an app's row to make it ask again. If you choose Don't allow on the approval window, the same app is refused for 5 minutes without the window appearing again.

<a id="cautions"></a>

## Cautions when you use it

- Use your AI client's tool approval (the confirmation before a tool runs). Do not turn it off for the Desktop tools unless you accept what the AI can do.
- When you use other MCP servers together, text in data or documents (values, column names, notes and so on) is content, not instructions. Do not let the AI follow an instruction written there, and do not let it publish, delete or run something only because the content says so. Your own request is what counts.

<a id="plugin-settings"></a>

## Plugin settings (Claude Code)

The Desktop plugin has three settings in Claude Code. Each value is the string `"true"` or `"false"`, not a JSON boolean.

| Setting | Default | What it does |
| --- | --- | --- |
| `ai_summary` | `"false"` | Creates and saves an AI Summary for the charts and analytics you create. |
| `save_comments` | `"false"` | Saves an explanatory comment on the charts you create. |
| `review_hook` | `"false"` | Asks the AI to review its work, checks custom R commands, and before the final report asks the AI to look at the whole image of the note or dashboard once. See [Limits and errors](/en/mcp/desktop/limits#gates). |

To see or change the settings, run `claude plugin configure exploratory@exploratory`. These settings are separate from the System Settings \> MCP / CLI options above.

With `review_hook` off (the default), one check still runs: get_note_image and get_dashboard_image are refused unless your latest message asks for an image. The hook reads the conversation file on your computer to check this. If it cannot read your message, it lets the call through.

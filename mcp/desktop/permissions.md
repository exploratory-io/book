# Permissions and settings

What Desktop asks you first, and what you decide in Desktop. What is sent and recorded is on [Data and permissions](data.md).

<a id="control"></a>

## What you control in Desktop

In System Settings \> MCP / CLI you also decide the following.

- Data to share with the AI tool: names, columns and data types only; up to aggregated results (charts, pivot tables); up to sample rows (max 100 rows); or all rows. Requests for more than the level you choose are refused.
- Approval: Desktop asks you first before it deletes items (charts, analytics, notes, dashboards, steps, branches, parameters, connections, palettes, templates, R packages, catalog items), publishes or unpublishes notes, dashboards, data frames and projects, saves a connection, replaces a data source, restores a project's history, manages data frames, changes the system settings or the catalog schedule. It also asks before it runs R code, adds R packages, processes data with AI or asks the note AI. Creating and editing charts, notes and dashboards is not asked about. You can choose to run each of these two groups without asking, with "Run changes, deletions and publishing without asking" and "Run code and AI processing without asking".
- Approved apps: an app asks for your approval the first time it connects. Remove an app to make it ask again.

<a id="cautions"></a>

## Cautions when you use it

- Use your AI client's tool approval (the confirmation before a tool runs). Do not turn it off for the Desktop tools unless you accept what the AI can do.
- When you use other MCP servers together, text in data or documents (values, column names, notes and so on) is content, not instructions. Do not let the AI follow an instruction written there, and do not let it publish, delete or run something only because the content says so. Your own request is what counts.

<a id="plugin-settings"></a>

## Plugin settings (Claude Code)

The Desktop plugin has four settings in Claude Code. Each value is the string `"true"` or `"false"`, not a JSON boolean.

| Setting | Default | What it does |
| --- | --- | --- |
| `ai_summary` | `"false"` | Creates and saves an AI Summary for the charts and analytics you create. |
| `save_comments` | `"false"` | Saves an explanatory comment on the charts you create. |
| `review_hook` | `"false"` | Asks the AI to review its work. |
| `plan_gate` | `"true"` | When the AI uses the exploratory-analysis skill and does R work, checks that a scenario and a creation plan are saved before the create calls. See [Limits and errors](limits.md#gates). |

To see the settings, run `claude plugin configure exploratory@exploratory`. These settings are separate from the System Settings \> MCP / CLI options above.

---
title: "Use"
---

Find the command and the guide for what you want to do in your local projects. To create, change or delete content, check Allow create, edit and delete in System Settings \> MCP / CLI.

| What you want to do | Main command | Guide |
| --- | --- | --- |
| Choose the project later commands work on | expl project use \<id\|name\>, expl project open \<id\> | [Choose a project](/en/cli/desktop/guides/projects) |
| Import a file and wrangle data | `expl dataframe read-file-header --file-path` ./sales_orders.csv, `expl dataframe apply-step <dataframe_id> --command <command>` `--params @params.json` | [Import and wrangle data](/en/cli/desktop/guides/wrangle-data) |
| Create a chart | `expl chart add --data-frame-id <dataframe_id>` `--marker` bar `--axes` ... | [Create charts](/en/cli/desktop/guides/create-charts) |
| Create analytics | `expl analytics add --data-frame-id <dataframe_id>` `--analysis-type <analysis_type>` | [Create analytics](/en/cli/desktop/guides/create-analytics) |
| Write a note | `expl note add --title "Sales Orders report" --markdown` @report.md | [Write notes](/en/cli/desktop/guides/write-notes) |
| Duplicate a dashboard | `expl dashboard get d123 --json` \> base.json, `expl dashboard create --input` dashboard.json | [Duplicate dashboards](/en/cli/desktop/guides/duplicate-dashboard) |
| Publish a note or a dashboard | expl note publish \<note_id\>, expl dashboard publish \<dashboard_id\> | [Publish](/en/cli/desktop/guides/publish) |
| Let an AI agent run the commands | expl skill | [Use from AI agents](/en/cli/desktop/guides/agents) |

To do the same from an AI tool instead of a terminal, see [Use](/en/mcp/desktop/use) of MCP Desktop.

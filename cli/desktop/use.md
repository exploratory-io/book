# Use

Find the command and the guide for what you want to do in your local projects. To create, change or delete content, turn on Allow create, edit and delete in System Settings \> MCP / CLI.

| What you want to do | Main command | Guide |
| --- | --- | --- |
| Choose the project later commands work on | expl project use \<id\|name\>, expl project open \<id\> | [Choose a project](guides/projects.md) |
| Import a file and wrangle data | expl dataframe read-file-header --file-path ./sales_orders.csv, expl dataframe apply-step \<dataframe_id\> --command \<command\> --params @params.json | [Import and wrangle data](guides/wrangle-data.md) |
| Create a chart | expl chart add --data-frame-id \<dataframe_id\> --marker bar --axes ... | [Create charts](guides/create-charts.md) |
| Create an analytics | expl analytics add --data-frame-id \<dataframe_id\> --analysis-type \<analysis_type\> | [Create analytics](guides/create-analytics.md) |
| Write a note | expl note add --title "Sales Orders report" --markdown @report.md | [Write notes](guides/write-notes.md) |
| Copy a dashboard | expl dashboard get d123 --json \> base.json, expl dashboard create --input dashboard.json | [Duplicate a dashboard](guides/duplicate-dashboard.md) |
| Publish a note or a dashboard | expl note publish \<note_id\>, expl dashboard publish \<dashboard_id\> | [Publish](guides/publish.md) |
| Let an AI agent run the commands | expl skill | [Use from AI agents](guides/agents.md) |

To do the same from an AI tool instead of a terminal, see [Use](../../mcp/desktop/examples.md) of MCP Desktop.

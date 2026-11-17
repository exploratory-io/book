# Use

Find the command and the guide for what you want to do with published content.

| What you want to do | Main command | Guide |
| --- | --- | --- |
| Find the data or note you need | expl server search "Sales Orders" --scope all --type data | [Find data](guides/find-data.md) |
| Read a published note | expl server fetch \<id\> --section \<id\> (or --query "sales forecast") | [Read notes](guides/read-notes.md) |
| Check the columns and types of data | expl server dataframe get-schema \<id\> --detail light | [Query data](guides/query-data.md) |
| Filter and aggregate data | expl server dataset query \<dataset_id\> --mode aggregate --dimensions ... --metrics ... | [Query data](guides/query-data.md) |
| Get the numbers behind a chart | expl server chart get-data \<id\> --chart \<chart\> | [Get chart numbers](guides/dashboard-charts.md) |
| See the shape of a chart | expl server chart get-image \<id\> --chart \<chart\> | [Get chart numbers](guides/dashboard-charts.md) |
| Get the results of an analytics | expl server analytics get-result \<id\> --analytics \<analytics\> | [Get analytics results](guides/analytics.md) |
| Save a result as a file | expl server dataframe export \<dataset_id\> --mode rows --output rows.csv | [Save results to a file](guides/export.md) |
| Run commands from a script or CI | expl server login --with-token, expl server token create --name ci | [Automation](guides/automation.md) |
| Let an AI agent run the commands | expl server status, expl server tools list --json | [Use from AI agents](guides/agents.md) |

To do the same from an AI tool instead of a terminal, see [Use](../../mcp/server/use.md) of MCP Server.

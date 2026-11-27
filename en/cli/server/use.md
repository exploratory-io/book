---
title: "Use"
---

Find the command and the guide for what you want to do with published content.

| What you want to do | Main command | Guide |
| --- | --- | --- |
| Find the data or note you need | `expl server search "Sales Orders" --scope all --type` data | [Find data](/en/cli/server/guides/find-data) |
| Read a published note | `expl server fetch <id> --section <id>` (or `--query "sales forecast"`) | [Read notes](/en/cli/server/guides/read-notes) |
| Check the columns and types of data | `expl server dataframe get-schema <id> --detail` light | [Query data](/en/cli/server/guides/query-data) |
| Filter and aggregate data | `expl server dataset query <dataset_id> --mode` aggregate `--dimensions` ... `--metrics` ... | [Query data](/en/cli/server/guides/query-data) |
| Get the numbers behind a chart | `expl server chart get-data <id> --chart <chart>` | [Get chart numbers](/en/cli/server/guides/dashboard-charts) |
| See the shape of a chart | `expl server chart get-image <id> --chart <chart>` | [Get chart numbers](/en/cli/server/guides/dashboard-charts) |
| Get the results of an analytics | `expl server analytics get-result <id> --analytics <analytics>` | [Get analytics results](/en/cli/server/guides/analytics) |
| Save a result as a file | `expl server dataframe export <dataset_id> --mode` rows `--output` rows.csv | [Save results to a file](/en/cli/server/guides/export) |
| Run commands from a script or CI | `expl server login --with-token`, `expl server token create --name` ci | [Automation](/en/cli/server/guides/automation) |
| Let an AI agent run the commands | expl server status, `expl server tools list --json` | [Use from AI agents](/en/cli/server/guides/agents) |

To do the same from an AI tool instead of a terminal, see [Use](/en/mcp/server/use) of MCP Server.

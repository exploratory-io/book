# Desktop commands (expl)

The commands you will use most, grouped by purpose.

<a id="cmd-check"></a>

## Check

| Command | Purpose |
| --- | --- |
| expl status | The Desktop version and the signed-in user (with --json it also shows permissions and tools) |
| expl tools list | All available commands (read-only or not, and risk) |
| expl tools describe \<command\> | Arguments, types, required or not, allowed values (put a two-word command in quotes, for example expl tools describe "dashboard get") |

<a id="cmd-project"></a>

## Projects

| Command | Purpose |
| --- | --- |
| expl project list | List projects |
| expl project use \<id\|name\> | Choose the project later commands work on |
| expl project open \<id\> | Open a project |

<a id="cmd-data"></a>

## Data

| Command | Purpose |
| --- | --- |
| expl dataframe list | List data frames |
| expl dataframe get-schema \<id\> | Column names and types (it also returns the wrangling steps and more) |
| expl dataframe preview | See rows |

<a id="cmd-chart"></a>

## Charts

| Command | Purpose |
| --- | --- |
| expl chart list \<dataframe_id\> | List charts (a data frame id is required) |
| expl chart get-result \<id\> | The numbers of a chart |
| expl chart get-image \<id\> --output \<file\> | Save the image of a chart |

<a id="cmd-note"></a>

## Notes

| Command | Purpose |
| --- | --- |
| expl note list | List notes |
| expl note get \<id\> | The content of a note |

<a id="cmd-dashboard"></a>

## Dashboards

| Command | Purpose |
| --- | --- |
| expl dashboard list | List dashboards |
| expl dashboard get \<id\> | The definition of a dashboard |
| expl dashboard create --input \<file\> | Create a dashboard |
| expl dashboard publish \<id\> | Publish it (a confirmation appears before it runs) |

<a id="cmd-other"></a>

## Other

| Command | Purpose |
| --- | --- |
| expl execution get \<execution_id\> | Check the state of an operation you did not wait for |
| expl call \<tool_name\> | Call an operation by its tool name |
| expl lang \[en\|ja\] | Show or switch the display language (it exits with code 2 when it cannot decide the target project; for example expl lang --project \<id\>) |
| expl skill | Print a description for AI agents |

<a id="more"></a>

## More commands

Every command is listed by expl tools list. For the generated commands, such as those for data, charts, notes and dashboards, the arguments are shown by expl \<command\> --help. For project use, tools describe, call and lang, see how they are written in this table ([Global flags](global-flags.md)).

- [Server commands](../server/commands.md) - Commands that read content on exploratory.io.

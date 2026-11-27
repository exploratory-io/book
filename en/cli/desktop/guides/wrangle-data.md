---
title: "Import and wrangle data"
---

Import data into a project as a data frame, check its columns, and add wrangling steps.

<a id="before"></a>

## Before you start

- Exploratory Desktop is running and the project is open ([Choose a project](/en/cli/desktop/guides/projects)). Check with expl status.
- The commands that create or change things (create-source, apply-step and the others in this page) work only when Allow create, edit and delete is on in System Settings > MCP / CLI.
- Running R (run-r), ai-wrangle and deleting steps ask for confirmation first. In a terminal, expl asks Continue? \[y/N\]. From a script or an AI agent, add `--yes`. See [Confirmation and long-running operations](/en/cli/desktop/guides/confirmation).

<a id="steps"></a>

## Steps

### 1. Check the file, then import it

For a local text file, check its beginning and format first.

```sh
expl dataframe read-file-header --file-path ./sales_orders.csv
```

`--head-bytes` sets how much to read, and `--encoding` takes utf-8, shift_jis or auto.

To import, pass a name and an R script that returns the whole data frame. @file reads the script from a file ([Pass arguments and JSON](/en/cli/desktop/guides/input)).

```sh
expl dataframe create-source --data-frame-name "Sales Orders" --r-script @import.R
```

import.R is a script whose last value is the data.frame, for example `readr::read_csv("./sales_orders.csv")`. To import from a data source plugin instead of a script, pass `--source` with a JSON object that has type, connection_id and params. For a database, run expl dataframe get-source-params to see what the plugin takes. To import a catalog item, the source types are local_catalog (params.item_id) and server_catalog (params.url).

### 2. Look at the data frame

```sh
expl dataframe list
expl dataframe get-schema <dataframe_id>
expl dataframe preview <dataframe_id> --limit 20
```

list returns the id of each data frame. get-schema returns the column names and types, the wrangling steps and the row count. preview returns the first rows, up to 100. Copy the column names from get-schema exactly as they are.

### 3. Add a wrangling step

Ask for the parameters of the command first. The names that get-command returns are the only ones that work.

```sh
expl dataframe get-command --command filter
```

Then add one step. `--command` is the operation, and `--params` is a JSON object that holds all of its settings.

```sh
expl dataframe apply-step <dataframe_id> --command <command> --params @params.json
```

Replace \<command\> with a command name from get-command, and write params.json with the names it returned. Add one step per operation, not several at once. If R cannot run the step, it is rolled back; `--save-with-error` keeps it as an error step. To insert a step before or after an existing one, pass `--insert-position` '`{"side":"after","stepName":"<step name>"}`'; without it the step is added at the end.

expl dataframe preview-steps tries changes on temporary objects and shows the effect without saving. Its arguments are in `expl dataframe preview-steps --help`.

### 4. Check the result

```sh
expl dataframe get-schema <dataframe_id>
```

The new step appears in the steps, and the columns and the row count are updated.

If you want the AI to write the R for a request, use `expl dataframe ai-wrangle --prompt "..."` (add `--run` to add it as a step). It asks for confirmation. The step diagram and the other read commands are in [Desktop commands](/en/cli/desktop/commands).

<a id="trouble"></a>

## If it fails

| What you see | What to do |
| --- | --- |
| PERMISSION_DENIED | Turn on Allow create, edit and delete in the system settings. See [Exit codes and errors](/en/cli/desktop/exit-codes). |
| PROJECT_NOT_OPEN | Open the project with expl project open \<id\>. |
| NO_DATA_FRAME | Give the data frame id, as the argument of the command or with `--data-frame-id`. |
| A step does not apply | Check the names with expl dataframe get-command, and use the column names of get-schema. |
| Exit code 2 without a prompt | The command needs confirmation and is not in a terminal. Add `--yes` after you have checked it. |

For the arguments of any command, run `expl <command> --help` or `expl tools describe "<command>"`.

<a id="related"></a>

## Related pages

- [Confirmation and long-running operations](/en/cli/desktop/guides/confirmation)
- [Pass arguments and JSON](/en/cli/desktop/guides/input)
- [Create charts](/en/cli/desktop/guides/create-charts)
- [Desktop commands](/en/cli/desktop/commands)

To do the same through MCP, see Import and wrangle data in [Use](/en/mcp/desktop/use#examples).

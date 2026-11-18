---
title: "Create analytics"
---

Create analytics (regression, classification, clustering and so on) from a data frame, and read its result.

<a id="before"></a>

## Before you start

- Exploratory Desktop is running and the project is open ([Choose a project](/en/cli/desktop/guides/projects)). Check with expl status.
- You know the id of the data frame and its column names (expl dataframe list and expl dataframe get-schema \<dataframe_id\>).
- analytics add and analytics edit work only when Allow create, edit and delete is on in System Settings > MCP / CLI. They do not ask for confirmation; deleting analytics does. See [Confirmation and long-running operations](/en/cli/desktop/guides/confirmation).

<a id="steps"></a>

## Steps

### 1. Pick the type of analytics

```sh
expl analytics list-templates
```

The result lists each analytics type with its id, label and slots. Choose by the label and by what you want to find out. Do not guess the id.

### 2. Look up its slots and settings

```sh
expl analytics get-template --analysis-type <analysis_type>
```

Replace \<analysis_type\> with an id from step 1. The result shows the slots (where the columns go) and the settings of that type, with the names and the allowed values. Only these names work.

### 3. Create it

`--analysis-type` and `--slots` are required. `--slots` is a JSON object that puts column names in the slots, with the slot name as the key: a string for a slot of one column, an array for a slot of several columns. `--settings` takes a JSON object of the setting names from step 2 (a true or false setting is the string "TRUE" or "FALSE").

```sh
expl analytics add --data-frame-id <dataframe_id> --analysis-type <analysis_type> --slots @slots.json --title "Sales drivers"
```

Write slots.json with the slot names that get-template returned and the column names of get-schema. For example, for the correlation type (do_cor), which has one slot named columns that takes several columns:

```json
{"columns": ["Sales", "Ad Spend", "Visitors"]}
```

Settings go in settings.json in the same way, for example `{"cor_method": "spearman"}`. Other types have other slot and setting names, so copy them from get-template. The command creates the analytics and runs it. The result carries the id (analyticsId) and the state of each output.

### 4. Read the result

```sh
expl analytics list <dataframe_id>
expl analytics get <analytics_id>
```

list returns the analytics of a data frame, with the output types each one has (availableOutputTypes). get returns the type, the settings and the outputs, with the data as CSV. To read another output, pass a value of availableOutputTypes with `--output-type`.

### 5. Change it

```sh
expl analytics edit <analytics_id> --settings @settings.json
```

Pass only what changes: `--slots`, `--settings`, `--title`, `--analysis-type` and so on. It runs the analytics again; if that fails, the definition goes back to the one before.

<a id="trouble"></a>

## If it fails

| What you see | What to do |
| --- | --- |
| PERMISSION_DENIED | Turn on Allow create, edit and delete in the system settings. See [Exit codes and errors](/en/cli/desktop/exit-codes). |
| NO_DATA_FRAME | Add `--data-frame-id <dataframe_id>`. |
| An unknown name is rejected | Look up the slot or setting name again with expl analytics get-template. |
| The slots are empty | Analytics cannot be created without columns in its slots. |

For the arguments of any command, run `expl <command> --help` or `expl tools describe "<command>"`.

<a id="related"></a>

## Related pages

- [Create charts](/en/cli/desktop/guides/create-charts)
- [Write notes](/en/cli/desktop/guides/write-notes)
- [Pass arguments and JSON](/en/cli/desktop/guides/input)
- [Desktop commands](/en/cli/desktop/commands)

To do the same through MCP, see Create analytics in [Use](/en/mcp/desktop/use#examples).

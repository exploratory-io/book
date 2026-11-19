---
title: "Create charts"
---

Create a chart from a data frame, check its numbers and image, and change it.

<a id="before"></a>

## Before you start

- Exploratory Desktop is running and the project is open ([Choose a project](/en/cli/desktop/guides/projects)). Check with expl status.
- You know the id of the data frame and its column names (expl dataframe list and expl dataframe get-schema \<dataframe_id\>).
- chart add and chart edit work only when Allow create, edit and delete is on in System Settings > MCP / CLI. They do not ask for confirmation; deleting a chart does. See [Confirmation and long-running operations](/en/cli/desktop/guides/confirmation).

<a id="steps"></a>

## Steps

### 1. Look up the settings of the chart type

`--marker` is the type of the chart: bar, line, area, pie, scatter, pivot, singlevalue, table and so on. Without `--section`, the result is a table of contents of the settings.

```sh
expl chart list-settings --marker bar
```

`--setting <name>` looks up one setting exactly, and `--search <part of a name>` narrows by part of a name. Do not guess setting names; only the names returned here work.

### 2. Create the chart

`--marker` and `--axes` are required. `--axes` is a JSON object that puts a column in each slot, with the slot name as the key. The slots of bar and line charts are x, y, color and facet; those of a pivot table are rowh, colh and meas. The value is a column name, or `{"column": "...", "func": "sum"}` to choose the aggregation.

```sh
expl chart add --data-frame-id <dataframe_id> --marker bar --axes '{"x":"order_date","y":{"column":"sales","func":"sum"}}' --title "Monthly Sales"
```

Replace \<dataframe_id\> with the id from expl dataframe list, and use the column names of get-schema as they are. `--settings` takes a JSON object of the names from step 1 (an on/off setting is the string "on" or "off", not true or false), and `--filters` takes the list of filter conditions. The conditions are described in `expl chart add --help`.

The result carries the id of the new chart (chartId). Without `--data-frame-id`, the data frame selected in Desktop is used; if none is selected, it stops with NO_DATA_FRAME.

### 3. Check the numbers and the image

```sh
expl chart get-result <chart_id> --limit 20
expl chart get-image <chart_id> --output chart.png
```

get-result runs the chart and returns the aggregated values. Use it, not the image, for exact numbers. get-image saves the image of the chart as a PNG file. To find ids later, run expl chart list \<dataframe_id\>.

### 4. Change it

Pass only what changes. What you leave out stays. The id does not change.

```sh
expl chart edit <chart_id> --marker line --title "Monthly Sales Trend"
```

`--axes`, `--settings` and `--filters` work the same way as in chart add. `--run` runs the chart when Auto Run is off.

<a id="trouble"></a>

## If it fails

| What you see | What to do |
| --- | --- |
| PERMISSION_DENIED | Turn on Allow create, edit and delete in the system settings. See [Exit codes and errors](/en/cli/desktop/exit-codes). |
| NO_DATA_FRAME | Add `--data-frame-id <dataframe_id>`. |
| INVALID_ARGUMENT | A setting name or value is wrong. Look it up again with expl chart list-settings. |
| The chart is empty or has the wrong columns | Check the column names against expl dataframe get-schema, character for character. |

For the arguments of any command, run `expl <command> --help` or `expl tools describe "<command>"`.

<a id="related"></a>

## Related pages

- [Import and wrangle data](/en/cli/desktop/guides/wrangle-data)
- [Create analytics](/en/cli/desktop/guides/create-analytics)
- [Write notes](/en/cli/desktop/guides/write-notes)
- [Desktop commands](/en/cli/desktop/commands)

To do the same through MCP, see Create charts in [Use](/en/mcp/desktop/use#examples).

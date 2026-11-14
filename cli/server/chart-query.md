# expl server chart query

Filter and aggregate the data of a chart in a note, dashboard or slide on the server and return only the result.

<a id="examples"></a>

## Examples

### Aggregate the data of a chart

**Terminal**

```sh
expl server chart query --id <id> --chart <chart> --mode aggregate --dimensions '[{"column":"<column>"}]' --metrics '[{"function":"count_rows","alias":"n"}]' --json
```

Replace \<id\> with the id of the note, \<chart\> with the chart name and \<column\> with a column name from query.columns in the result of chart get-data. The syntax is the same as for dataset query.

> TODO: S6: Complete this section against its source and verified output before publication.

<a id="usage"></a>

## Usage

```text
expl server chart query [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string |  | The id of the note, dashboard or slide that holds the chart, from a search result or a fetch. |
| `--chart` | string |  | The name of the chart: metadata.charts\[\].name in the result of fetch (letters, digits, _ and -). |
| `--mode` | string | Required unless queries is used | rows: get the rows that match the filters. aggregate: group by dimensions and calculate metrics. Values: `rows`, `aggregate` |
| `--columns` | scalarArray |  | Only in rows mode. 1 to 50 unique column names to return. |
| `--filters` | json |  | The filter conditions: a single condition, or { "and": \[...\] } or { "or": \[...\] } with 2 or more conditions each. Nest at most 3 levels, with at most 20 conditions in all. |
| `--dimensions` | json |  | Only in aggregate mode. 0 to 5 columns to group by. Values are used as stored, so there is no option to extract a month or year from a date for grouping. Without it, you get one total row. |
| `--metrics` | json | Required in aggregate mode | Only in aggregate mode, and required there. 1 to 10 calculations. |
| `--sort` | json |  | The sort order, up to 3 entries. |
| `--limit` | integer |  | The maximum number of result rows. rows: default 100, at most 1,000. aggregate: default 100, at most 500. There is no paging. |
| `--queries` | json |  | Several independent queries in one call, up to 10. Each takes id, chart and the same fields as a single query. |

<a id="json-arguments"></a>

## JSON inputs

See dataset query for the JSON structure of filters, metrics and sort. Chart queries do not use the join parameters.

- [JSON structure](dataset-query.md#json-arguments) - Check input keys and placeholder values.

<a id="paging"></a>

## More results

There is no paging. When has_more in the result is true, narrow the filters or aggregate.

<a id="output"></a>

## Output

The table queried is the chart's table as published, with values the chart has already aggregated. Grand total and subtotal rows are not in the table; they come back in result.excluded_totals, so use them for overall values instead of adding up rows. Summing or averaging a column the chart already averaged, counted distinct or computed as a ratio carries the warning CHART_REAGGREGATION; then say so or use excluded_totals. When you report numbers, also say the chart's aggregation, chart.filters, context.parameters and context.data_as_of.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| CHART_REAGGREGATION | You are aggregating a column the chart has already aggregated. Mention the warning or use result.excluded_totals. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

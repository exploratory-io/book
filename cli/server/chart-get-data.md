# expl server chart get-data

Get the data of a chart together with what the numbers mean.

<a id="examples"></a>

## Examples

### Get the first 5 rows of a chart

**Terminal**

```sh
expl server chart get-data <id> --chart <chart> --limit 5 --json
```

Replace \<id\> with the id of the note and \<chart\> with a chart name from the result of fetch.

> TODO: S6: Complete this section against its source and verified output before publication.

<a id="usage"></a>

## Usage

```text
expl server chart get-data <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the note, dashboard or slide that holds the chart, or of a chart published on its own. Write it right after the command or pass it with --id. |
| `--chart` | string |  | The name of a chart inside a note, dashboard or slide. It is metadata.charts\[\].name in the result of fetch. |
| `--offset` | integer |  | The number of rows to skip, counted from 0. |
| `--limit` | integer |  | The number of rows to return, up to 100. |

<a id="paging"></a>

## More results

Pass the number of rows you have already read to offset to read on. One call returns at most 100 rows.

<a id="output"></a>

## Output

Besides the rows, the result explains the numbers: chart.encoding (column, aggregation and number format per shelf), chart.filters, chart.data_granularity (aggregated or row level), chart.unsupported (what cannot be returned) and context (publication, data time and parameter values). The numbers are the values as published; results for other parameter values in the browser are not available. A chart published on its own returns a sample of the rows used to draw it (up to 10,000), not aggregated values, so do not add the rows up as a total.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| You need totals, sorting or filtering | Use chart query. |
| DATA_EGRESS_LIMIT | The publisher does not share the rows of this data. Use its charts, analytics or summary instead. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

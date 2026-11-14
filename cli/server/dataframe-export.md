# expl server dataframe export

Save the result of a query on a data item as a CSV or Parquet file and return a download link.

<a id="examples"></a>

## Examples

### Save rows as a file

**Terminal**

```sh
expl server dataframe export <dataset_id> --mode rows --limit 5 --json
```

Replace \<dataset_id\> with the id of a data item. For data whose publisher does not allow downloading it as a file, this fails with DATA_EGRESS_LIMIT.

> TODO: S6: Complete this section against its source and verified output before publication.

<a id="usage"></a>

## Usage

```text
expl server dataframe export <dataset_id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--dataset-id` | string | Required | The id of the data item, from a search result or a fetch. Write it right after the command or pass it with --dataset-id. |
| `--format` | string |  | The file format. The default is csv (UTF-8 with BOM, which opens correctly in Excel). Values: `csv`, `parquet` |
| `--mode` | string | Required | rows: export the rows that match the filters. aggregate: export the result of grouping by dimensions and calculating metrics. Values: `rows`, `aggregate` |
| `--columns` | scalarArray |  | Only in rows mode. 1 to 50 unique column names to export. Without it, every column is exported. |
| `--filters` | json |  | The filter conditions: a single condition, or { "and": \[...\] } or { "or": \[...\] } with 2 or more conditions each. Nest at most 3 levels, with at most 20 conditions in all. |
| `--dimensions` | json |  | Only in aggregate mode. 0 to 5 columns to group by. |
| `--metrics` | json | Required in aggregate mode | Only in aggregate mode, and required there. 1 to 10 calculations. |
| `--sort` | json |  | The sort order, up to 3 entries. |
| `--limit` | integer |  | The maximum number of rows to export. |

<a id="json-arguments"></a>

## JSON inputs

See dataset query for the JSON structure of filters, metrics and sort.

- [JSON structure](dataset-query.md#json-arguments) - Check input keys and placeholder values.

<a id="paging"></a>

## More results

There is no paging. Use this command when the result is too large for dataset query.

<a id="output"></a>

## Output

A download link that expires in 15 minutes is returned. The link works only for the same signed-in user. Use --output to choose where to save a file result.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| DATA_EGRESS_LIMIT | The publisher does not allow downloading this data as a file. Use fetch or dataframe get-schema for what the publisher shares, or open the URL in the browser. |
| SERVER_BUSY | Another export of yours is running, or you reached the hourly export limit. One export can run at a time per user. Try again in a few seconds; for the hourly limit, wait up to an hour. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

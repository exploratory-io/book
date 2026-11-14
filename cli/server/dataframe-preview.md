# expl server dataframe preview

Get the rows of a data item, page by page with offset and limit.

<a id="examples"></a>

## Examples

### See the first 3 rows

**Terminal**

```sh
expl server dataframe preview <id> --limit 3 --json
```

Replace \<id\> with the id of a data item.

> TODO: S6: Complete this section against its source and verified output before publication.

### Get rows 101–200

**Terminal**

```sh
expl server dataframe preview <id> --offset 100 --limit 100 --json
```

> TODO: S6: Complete this section against its source and verified output before publication.

<a id="usage"></a>

## Usage

```text
expl server dataframe preview <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the data item, from a search result or a fetch. Write it right after the command or pass it with --id. |
| `--offset` | integer |  | The number of rows to skip, counted from 0. |
| `--limit` | integer |  | The number of rows to return, up to 100. |

<a id="paging"></a>

## More results

Pass the number of rows you have already read to offset to read on. One call returns at most 100 rows.

<a id="output"></a>

## Output

When the publisher included all data, every row can be read. Otherwise the rows come from the sample saved at publish time, so check is_sample and row_count. To compute totals or filter rows, use dataset query instead of reading every page.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| DATA_EGRESS_LIMIT | The publisher does not share the rows of this data. Use its charts, analytics or summary instead. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

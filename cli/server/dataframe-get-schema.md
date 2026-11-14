# expl server dataframe get-schema

Look up the columns of a data item: names, types, descriptions the publisher wrote, and the row count.

<a id="examples"></a>

## Examples

### Check only column names and types

**Terminal**

```sh
expl server dataframe get-schema <id> --detail light --json
```

Replace \<id\> with the id of a data item.

> TODO: S6: Complete this section against its source and verified output before publication.

### Check in detail

**Terminal**

```sh
expl server dataframe get-schema <id> --json
```

> TODO: S6: Complete this section against its source and verified output before publication.

<a id="usage"></a>

## Usage

```text
expl server dataframe get-schema <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the data item, from a search result or a fetch. Write it right after the command or pass it with --id. |
| `--detail` | string |  | full: descriptions, statistics, semantics (what a row means, aggregation rules) and what dataset query supports. light: only each column's name and type, and the row count, in a smaller and faster result. Values: `full`, `compact`, `light` |
| `--language` | string |  | The language of the descriptions and definitions. By default it is the base language of the data. A text that does not exist in this language is returned in the other one and marked language_fallback. Values: `ja`, `en` |
| `--include-unapproved` | boolean |  | Also return definitions the owner has not approved yet (drafts and AI suggestions). Only the owner of the data can use it. They are hints, not official definitions. |
| `--columns` | scalarArray |  | TODO S2: Complete this section against its source and verified output before publication. |
| `--column-query` | string |  | TODO S2: Complete this section against its source and verified output before publication. |

<a id="paging"></a>

## More results

There is no way to page through the result.

<a id="output"></a>

## Output

The result includes the column names, types and the row count. With full it also includes the descriptions the publisher wrote, missing and unique counts, minimum and maximum, top values and the update status (when the data was last refreshed and whether it is fresh). When the owner has approved them, it includes semantics: what a row means, column roles, default aggregations and aggregation rules. Semantics is the official definition, so read it before you aggregate.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| dataset query fails with DATASET_UNAVAILABLE | Run it with --detail full and check query.available in the result. Data with false cannot be queried on the server. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

# expl server analytics get-result

Get the result of an analytics (regression, correlation, chi-square test and so on) as structured data.

<a id="examples"></a>

## Examples

### Get an analytics result

**Terminal**

```sh
expl server analytics get-result <id> --analytics <analytics> --limit 3 --json
```

Replace \<id\> with the id of the note and \<analytics\> with an analytics name from the result of fetch.

> TODO: S6: Complete this section against its source and verified output before publication.

<a id="usage"></a>

## Usage

```text
expl server analytics get-result <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the note, dashboard or slide that holds the analytics, or of an analytics published on its own. Write it right after the command or pass it with --id. |
| `--analytics` | string |  | The name of an analytics inside a note, dashboard or slide. It is metadata.blocks\[\].name in the result of fetch. |
| `--tables` | scalarArray |  | The ids of the tables to return (available_tables\[\].id). By default it returns the tables that answer the analysis. |
| `--limit` | integer |  | The maximum number of rows per table, up to 100. |

<a id="paging"></a>

## More results

Use --limit to cap the rows of each table. There is no way to page through the rest.

<a id="output"></a>

## Output

The result holds the model definition (target, predictors, N), result tables with stable column ids, headline statistics split into training and test, the settings it ran with, and explanation texts marked as generated or AI-generated. Values are as displayed, and coefficients are unstandardized.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| You do not know the name of the analytics | Look at metadata.blocks in the result of fetch. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

# expl server chart get-image

Get a chart as a PNG image, to see its shape, trend and layout.

<a id="examples"></a>

## Examples

### Get a chart image

**Terminal**

```sh
expl server chart get-image <id> --chart <chart> --json
```

Replace \<id\> with the id of the note and \<chart\> with a chart name from the result of fetch.

> TODO: S6: Complete this section against its source and verified output before publication.

<a id="usage"></a>

## Usage

```text
expl server chart get-image <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the note, dashboard or slide that holds the chart, or of a chart published on its own. Write it right after the command or pass it with --id. |
| `--chart` | string |  | The name of a chart inside a note, dashboard or slide. It is metadata.charts\[\].name in the result of fetch. |

<a id="paging"></a>

## More results

There is no paging.

<a id="output"></a>

## Output

The image is the one saved when the item was published; it is not drawn again, so it can be older than the data. Check result.image.may_be_stale. The image is saved on the computer that runs expl, and image_path in the result gives the location. Use --output to choose where to save it. Read exact numbers with chart get-data, not from the image.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| A may_be_stale warning appears | The image may be older than the latest data update. Check the latest numbers with chart get-data. The warning is printed to standard error. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

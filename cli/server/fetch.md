# expl server fetch

Read one note, dashboard, slide or data item by its id.

<a id="examples"></a>

## Examples

### Read an item

**Terminal**

```sh
expl server fetch <id> --json
```

Replace \<id\> with an id from the search result.

> TODO: S6: Complete this section against its source and verified output before publication.

### Read one heading

**Terminal**

```sh
expl server fetch <id> --section s2 --json
```

Replace s2 with a heading id from metadata.toc.

> TODO: S6: Complete this section against its source and verified output before publication.

### Find a topic

**Terminal**

```sh
expl server fetch <id> --query "sales forecast" --json
```

Returns paragraphs that contain any of the words.

> TODO: S6: Complete this section against its source and verified output before publication.

<a id="usage"></a>

## Usage

```text
expl server fetch <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the item, from a search result or an earlier fetch. Write it right after the command or pass it with --id. |
| `--language` | string |  | The language of the data overview and column descriptions. By default it is the base language of the data. A text that does not exist in this language is returned in the other one and marked language_fallback. Values: `ja`, `en` |
| `--section` | string |  | A heading id (for example s12) or the exact heading text from metadata.toc. Only for notes, dashboards and slides. |
| `--cursor` | string |  | The marker for reading on in a long note. Pass the value of metadata.range.next_cursor from the previous result. |
| `--query` | string |  | Words to find in the item, separated by spaces, up to 10. Paragraphs that match any word come first, ordered by how many words match, each labeled with its heading path. Use "..." for a phrase. Only the text written by the author is searched, not chart rows or analytics tables. |
| `--include-toc` | boolean |  | Return the list of headings (metadata.toc). By default it is returned only when section, cursor and query are all omitted. Only for notes, dashboards and slides. |

<a id="paging"></a>

## More results

For a long note, find a topic with --query or read one heading with --section. When more text follows, pass the value of metadata.range.next_cursor to --cursor. metadata.truncated is set only when more text follows.

<a id="output"></a>

## Output

Notes, dashboards and slides come back as Markdown with their text, the first rows of each embedded chart and the explanation of each analytics. metadata.charts and metadata.blocks hold the names of charts and analytics. Data items include columns, the row count, sample rows and the update status.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| The text is long and you cannot find the part you need | Find the topic with --query, or pass a heading from metadata.toc to --section. |
| You do not know the name of a chart or analytics | Look at metadata.charts and metadata.blocks in the result. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

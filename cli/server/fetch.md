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

The result below was run on the note Sales Orders Overview (id wX2yZ3aB4c). Long output is trimmed.

**Result**

```text
{
  "id": "wX2yZ3aB4c",
  "title": "Sales Orders Overview",
  "text": "# Sales Orders Overview\n\n# Sales Orders Overview\n\nThis note summarizes the Sales Orders data. One row is one order line item (order_id + line_no). The data covers orders from 2025-01-01 to 2026-10-31 (23,131 line items, total sales of about 440.8 million).\n\n## Sales by region\n\n**Chart: Sales by Regi…",
  "url": "https://exploratory.io/note/aB3cD4eF5g/wX2yZ3aB4c",
  "metadata": {
    "scopes": {
      "A": "…"
    },
    "charts": [
      "…",
      "…"
    ],
    "context": {
      "publication_version": "2026-11-12T08:13:18.971Z",
      "data_as_of": "2026-11-12T08:13:19.186Z",
      "parameters": null,
      "dashboard_filters": "none"
    },
    "type": "note",
    "author": "Alex Kim",
    "team": null,
    "created_at": "2026-11-12T08:13:18.971Z",
    "updated_at": "2026-11-12T08:13:18.971Z",
    "refreshed_at": "2026-11-12T08:13:19.186Z",
    "tags": []
  }
}
```

### Read one heading

**Terminal**

```sh
expl server fetch <id> --section s2 --json
```

Replace s2 with a heading id from metadata.toc.

The result below returns only the heading s2 (Sales by region) of the same note. metadata.toc is not returned for a short note like this one, so the heading id s2 was taken from the result of --query below.

**Result**

```text
{
  "id": "wX2yZ3aB4c",
  "title": "Sales Orders Overview",
  "text": "# Sales Orders Overview > Sales by region\n\n## Sales by region\n\n**Chart: Sales by Region** (chart: `kL8mN9oP`, type: bar)\n\nValues: sum of sales\n\n> [Computed summary]\n>\n> 8 region values (all rows). Total of sales: 440,826,130. Top: Kanto (148,695,040 33.7%), Kinki (74,050,840 16.8%), Chubu (72,023,380 16.3%). Bottom: Shikoku (19,857,430 4.5%), Chugoku (24,926,920 5.7%), Hokkaido (25,498,170 5.8%).\n\n| region | sales |\n…",
  "url": "https://exploratory.io/note/aB3cD4eF5g/wX2yZ3aB4c",
  "metadata": {
    "scopes": "…",
    "charts": "…",
    "context": "…",
    "type": "note",
    "author": "Alex Kim",
    "team": null,
    "created_at": "2026-11-12T08:13:18.971Z",
    "updated_at": "2026-11-12T08:13:18.971Z",
    "refreshed_at": "2026-11-12T08:13:19.186Z",
    "tags": "…",
    "range": "…"
  }
}
```

### Find a topic

**Terminal**

```sh
expl server fetch <id> --query "region" --json
```

Returns paragraphs that contain any of the words.

The result below was run with --query "region" on the same note. Each paragraph that matches comes with its heading id and path in square brackets.

**Result**

```text
{
  "id": "wX2yZ3aB4c",
  "title": "Sales Orders Overview",
  "text": "# Sales Orders Overview\n\n[s2 Sales Orders Overview > Sales by region]\n## Sales by region\n\n**Chart: Sales by Region** (chart: `kL8mN9oP`, type: bar)\n\nValues: sum of sales\n\n> [Computed summary]\n>\n> 8 region values (all rows). Total of sales: 440,826,130. Top: Kanto (148,695,040 33.7%), Kinki (74,050,840 16.8%), Chubu (72,023,380 16.3%). Bottom: Shikoku (19,857,430 4.5%), Chugoku (24,926,920 5.7%), Hokkaido (25,498,170 …",
  "url": "https://exploratory.io/note/aB3cD4eF5g/wX2yZ3aB4c",
  "metadata": {
    "scopes": "…",
    "charts": "…",
    "context": "…",
    "type": "note",
    "author": "Alex Kim",
    "team": null,
    "created_at": "2026-11-12T08:13:18.971Z",
    "updated_at": "2026-11-12T08:13:18.971Z",
    "refreshed_at": "2026-11-12T08:13:19.186Z",
    "tags": "…",
    "matches": "…"
  }
}
```

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

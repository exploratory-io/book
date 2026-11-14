# expl server search

Search the content you can view by title, description and tags. Without search words, list items newest first.

<a id="examples"></a>

## Examples

### Search by words

**Terminal**

```sh
expl server search "sales"
```

> TODO: S6: Complete this section against its source and verified output before publication.

### List your content

**Terminal**

```sh
expl server search "" --scope mine --limit 50 --json
```

Lists up to 50 of your own items, newest first.

> TODO: S6: Complete this section against its source and verified output before publication.

<a id="usage"></a>

## Usage

```text
expl server search [<query>] [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--query` | string |  | Search words, written right after the command or passed with --query. Matches titles, descriptions and tags. Empty (or \*) lists everything in scope, newest first. |
| `--type` | string |  | The type of content to search. Values: `all`, `note`, `dashboard`, `slide`, `chart`, `analytics`, `data` |
| `--scope` | string |  | all: everything you can view. mine: items you own. shared: items shared with you. team: items of one team. Values: `all`, `mine`, `shared`, `team` |
| `--team` | string | Required with --scope team | The team name. |
| `--semantic` | boolean |  | Search by meaning instead of by keyword. |
| `--limit` | integer |  | The maximum number of results, up to 50. |
| `--offset` | integer |  | The number of results to skip. Use it to get the next page. |

<a id="paging"></a>

## More results

When has_more in the result is true, pass next_offset to --offset to get the next page.

<a id="output"></a>

## Output

Results include the id and URL of each item. Pass an id to fetch or another command. Data items also list their columns (name and type) and row count. The default output is for people; --json prints JSON.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| Too big: expected number to be \<=50 at limit | Set --limit to 50 or less. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

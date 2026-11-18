---
title: "Find data"
---

Search the data, notes and dashboards published on exploratory.io, get their ids, and move on to fetch or the schema of a data item.

<a id="before"></a>

## Before you start

You have signed in with expl server login (see [Sign in](/en/cli/server/login)). A search returns only what you can view.

<a id="steps"></a>

## Steps

### 1. Search

Write the search words right after the command. `--scope` all searches content that other people published as well as your own, and `--type` data narrows the result to data.

```sh
expl server search "Sales Orders" --scope all --type data
```

`--type` takes all, note, dashboard, slide, chart, analytics or data. `--scope` takes all, mine, shared or team (with `--scope` team, add `--team <team name>`). `--semantic` searches by meaning instead of by keyword. `--json` prints the result as JSON.

The result is a table of id, title, URL, type and description. An empty result means nothing matched; it is not a sign-in error.

To list your own content, leave the search words empty and add `--scope` mine.

```sh
expl server search "" --scope mine --limit 50 --json
```

`--limit` is the maximum number of results, up to 50. When has_more in the JSON is true, pass next_offset to `--offset` to get the next page.

### 2. Take the id

Each result has an id and a URL. The id is the value you pass to the next command. The URL is for pointing a person to the content.

### 3. Read it, or look at the columns

For a note or a dashboard, read the content with fetch.

```sh
expl server fetch <id> --json
```

For a data item, look at its columns and types first.

```sh
expl server dataframe get-schema <id> --json
```

Replace \<id\> with the id from the search result. fetch returns the text and the metadata of the item (for a dashboard or a note, including the charts in it). get-schema returns the column names and types of the data item, with what a row means when the publisher has approved it.

To read a note, its charts and its analytics, see [Read notes](/en/cli/server/guides/read-notes). To total up a data item, see [Query data](/en/cli/server/guides/query-data).

<a id="trouble"></a>

## If it fails

| What you see | What to do |
| --- | --- |
| The result is empty | Check the search words, then try `--scope` all. Try a shorter word, or `--semantic`. |
| A sign-in error | Run expl server login. See [Sign in](/en/cli/server/login). |
| The id is not found | Use the id of the search result as it is. A similar title is not the same item. |

For the arguments of a command, run `expl server <command> --help`.

<a id="related"></a>

## Related pages

- [Read notes](/en/cli/server/guides/read-notes)
- [Query data](/en/cli/server/guides/query-data)
- [Server commands](/en/cli/server/commands#search)

To do the same through MCP, see [Find data](/en/mcp/server/use#find).

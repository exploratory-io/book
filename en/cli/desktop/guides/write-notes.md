---
title: "Write notes"
---

Write a Markdown note that embeds charts and analytics, add to it later, and read it back.

<a id="before"></a>

## Before you start

- Exploratory Desktop is running and the project is open ([Choose a project](/en/cli/desktop/guides/projects)). Check with expl status.
- You have the ids of the charts and analytics to embed (expl chart list \<dataframe_id\> and expl analytics list \<dataframe_id\>).
- note add and note edit work only when Allow create, edit and delete is on in System Settings > MCP / CLI. They do not ask for confirmation; deleting a note does. See [Confirmation and long-running operations](/en/cli/desktop/guides/confirmation).

<a id="steps"></a>

## Steps

### 1. Write the body

Write the body in a Markdown file, report.md. To embed a chart or an analytics, put an embed tag such as \{\{chart:\<chart_id\>\}\} on a line of its own, with a blank line before and after it.

```text
# Sales Orders

Monthly sales rose through the year.

{{chart:<chart_id>}}

{{analytics:<analytics_id>|<output_type>}}
```

Replace \<chart_id\> and \<analytics_id\> with the ids you got when you created them, or from the list commands. \{\{analytics:\<analytics_id\>\}\} works without an output type only when the analytics has one output; otherwise give an output type from availableOutputTypes. Do not write the path of a chart yourself. An embed tag written in the middle of a line, or inside a code block, is not embedded and stays as text. Under each figure, write what the figure shows with the numbers (read them with expl chart get-result).

### 2. Create the note

`--title` and `--markdown` are required. @file reads the long text from a file ([Pass arguments and JSON](/en/cli/desktop/guides/input)).

```sh
expl note add --title "Sales Orders report" --markdown @report.md
```

The result carries the id of the note (note_id). The note opens in Desktop. A note with the same title already in the project is not overwritten: it stops with NOTE_TITLE_EXISTS and writes nothing, so use another title. `--folder` puts the note in an existing folder, and `--settings` takes a JSON object of the note settings (the table of contents and so on).

### 3. Add to it or rewrite it

```sh
expl note edit <note_id> --markdown @more.md
```

By default the text is appended. `--mode` replace replaces the whole body. `--title` renames the note. To find an id, run expl note list.

### 4. Read it back

```sh
expl note get <note_id>
expl note get-image <note_id>
```

get returns the Markdown body, the folder and the dependencies. get-image returns the whole preview of the note as an image. expl note export-html and expl note export-pdf write the note to a file, and expl note ask-ai asks the note editor's AI to rewrite, translate or summarize text (it does not change the note).

<a id="trouble"></a>

## If it fails

| What you see | What to do |
| --- | --- |
| PERMISSION_DENIED | Turn on Allow create, edit and delete in the system settings. See [Exit codes and errors](/en/cli/desktop/exit-codes). |
| NOTE_TITLE_EXISTS | Use another title with note add, or edit the existing note with note edit. |
| NOTE_NOT_FOUND | The id is wrong. Copy it from expl note list. |
| A figure is blank | The embed tag has a wrong id, or is not on a line of its own. |

For the arguments of any command, run `expl <command> --help` or `expl tools describe "<command>"`.

<a id="related"></a>

## Related pages

- [Create charts](/en/cli/desktop/guides/create-charts)
- [Create analytics](/en/cli/desktop/guides/create-analytics)
- [Publish](/en/cli/desktop/guides/publish)
- [Desktop commands](/en/cli/desktop/commands)

To do the same through MCP, see Write notes in [Use](/en/mcp/desktop/use#examples).

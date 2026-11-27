---
title: "Output and language"
---

Standard output carries only the result. You can switch between a readable form and JSON, and the text expl writes follows the language of Desktop.

<a id="streams"></a>

## Standard output and standard error

Standard output carries the result. Progress, warnings, the confirmation and error messages go to standard error.

<a id="format"></a>

## Readable form and JSON

The default is a form for people. With `--json`, the result is printed as one JSON. expl project use, expl skill and expl completion are exceptions: they always print text.

On a failure, `--json` prints an error like the one below on standard output. The message differs by error, and details and suggested_actions are filled in when there is something to add. Warnings still go to standard error, one per line, even with `--json`.

```json
{
  "success": false,
  "error_code": "USAGE",
  "message": "Invalid value for --timeout.",
  "details": null,
  "suggested_actions": []
}
```

The JSON outputs shown in these pages are often excerpts: lines that do not matter for the example are left out, so they are not complete JSON.

```sh
expl dashboard get d123 --json
```

<a id="lang"></a>

## Language

The text expl writes itself follows the language of Desktop. Switch it with expl lang ja or expl lang en. This changes the display language of Desktop itself as well. Run expl status first to check that Desktop is connected. Without a language, it shows the current language (for example `expl lang --project <id>`). When it cannot decide the target project (none of `--project`, EXPL_PROJECT, a default project or an open project is available), it exits with code 2.

```sh
expl lang ja
```

Output meant for machines does not change with the language. The structure of `--json`, its error_code, the exit codes and the flag names are the same. Only the message text in JSON changes.

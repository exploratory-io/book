# Output and language

Standard output carries only the result. You can switch between a readable form and JSON, and the text expl writes follows the language of Desktop.

<a id="streams"></a>

## Standard output and standard error

Standard output carries the result. Progress, warnings, the confirmation and error messages go to standard error.

<a id="format"></a>

## Readable form and JSON

The default is a form for people. With --json, the result is printed as one JSON.

On a failure, --json prints { "success": false, "error_code": ..., "message": ... } on standard output. Warnings still go to standard error, one per line, even with --json.

```sh
expl dashboard get d123 --json
```

<a id="lang"></a>

## Language

The text expl writes itself follows the language of Desktop. Switch it with expl lang ja or expl lang en. Without an argument, it shows the current language.

```sh
expl lang ja
```

Output meant for machines does not change with the language. The structure of --json, its error_code, the exit codes and the flag names are the same. Only the message text in JSON changes.

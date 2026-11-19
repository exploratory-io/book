---
title: "Pass arguments and JSON"
---

Pass input with flags that match its type, or give the whole input as JSON.

<a id="kinds"></a>

## How to pass each kind of input

| Kind of input | How | Example |
| --- | --- | --- |
| String, number, choice | `--kebab-case <value>` or `--kebab-case=<value>` | `--title "Sales 2026"` |
| Boolean | `--flag` or `--no-flag` | `--include-data` |
| List of values | Repeat the flag | `--tag sales --tag weekly` |
| Object or list of objects | A JSON string or @file | `--pages @pages.json` |
| Long text | @file (its content becomes the value) | `--markdown @report.md` |

<a id="json"></a>

## Give the whole input as JSON

```sh
expl dashboard create --input dashboard.json
```

```sh
cat dashboard.json | expl dashboard create --input -
```

With `--input -`, expl reads the JSON from standard input.

- If you give both `--input` and a flag, the flag wins. The exception is a list: a repeated flag adds its items to the list in the `--input` JSON. To replace the whole list, change it in the JSON.
- A generated command rejects an unknown flag or an extra argument (exit code 2) with a suggestion of similar names. The built-in commands (expl status, expl project use, expl lang, expl skill and expl completion) do not report them; see [Global flags](/en/cli/desktop/global-flags).
- Pass an input that has the same name as a global flag, and a string that itself starts with @, in the `--input` JSON.

<a id="id"></a>

## An id can be the first argument

A command that needs exactly one id takes it as the first argument. Giving it as a flag, such as `--chart-id` c789, is the same. When a required id is missing, expl lists the candidates it can find and exits with code 2.

```sh
expl dashboard get d123
```

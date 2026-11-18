---
title: "Global flags"
---

Flags you can add to any command. You can place them before or after the command.

<a id="all"></a>


| Flag | What it does |
| --- | --- |
| `--project <id\|name>` | The project to work on |
| `--json` | Print the result as JSON, as the tool returned it |
| `--yes`, -y | Skip the confirmation of an operation that is hard to undo |
| `--no-wait` | Do not wait for a long operation; print its ids and exit |
| `--timeout <seconds>` | Longest time to wait. Without it, a tool call waits up to 120 seconds for the answer, and waiting for a long operation to finish has no overall limit |
| `--quiet`, -q | No progress output |
| `--verbose` | Print what is sent and received to standard error (tokens are never printed) |
| `--input <file\|->` | Give the whole input as JSON from a file or standard input |
| `--output <file>` | Where to save an image result, such as chart get-image |
| `--help`, -h | Help |
| `--version` | Version |

Review the output of `--verbose` before you paste it anywhere.

A few commands are exceptions.

- `expl status` does not use the `--input` JSON. It ignores it if you pass one.
- `--help` also shows help for the built-in commands (expl status, expl project use, expl lang, expl skill and expl completion).
- expl tools describe and expl call, given no argument, give a usage error (exit code 2).
- `--json` has no effect on expl project use, expl skill and expl completion. They always print text.
- The built-in commands (expl status, expl project use, expl lang, expl skill and expl completion) do not report an unknown flag or an extra argument. Pass only what their usage shows. The generated commands reject them (exit code 2).

`--timeout` takes a number of seconds. A value that is not a number is a usage error (exit code 2).

<a id="env"></a>

## Environment variables

| Variable | Used for | Order of precedence |
| --- | --- | --- |
| EXPL_PROJECT | The project that Desktop commands work on | `--project`, then EXPL_PROJECT, then the default set with expl project use. See [Choose a project](/en/cli/desktop/guides/projects). |
| EXPL_SERVER_URL | The server that expl server calls | `--url`, then EXPL_SERVER_URL, then the server you signed in to most recently, then https://exploratory.io. See [The server URL](/en/cli/server/login#url). |
| EXPL_SERVER_TOKEN | An API key for expl server | Used before a saved login. See [API keys](/en/cli/server/token). |

<a id="completion"></a>

## Shell completion

expl completion bash, expl completion zsh and expl completion powershell print a completion script. Run the script to turn completion on.

| Shell | To turn it on in the current session | To keep it for later sessions |
| --- | --- | --- |
| bash | `eval "$(expl completion bash)"` | Add that line to \~/.bashrc |
| zsh | `eval "$(expl completion zsh)"` | Add that line to \~/.zshrc |
| PowerShell | expl completion powershell \| Out-String \| Invoke-Expression | Add that line to $PROFILE |

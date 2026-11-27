---
title: "Global flags"
---

Flags you can add to any command. You can place them before or after the command.

<a id="all"></a>


| Flag | What it does | With expl server |
| --- | --- | --- |
| `--project <id\|name>` | The project to work on. | Not accepted. expl server stops with a usage error (exit code 2). |
| `--json` | Print the result as JSON, as the tool returned it. | The same. |
| `--yes`, -y | Skip the confirmation of an operation that is hard to undo. | The same. |
| `--no-wait` | Do not wait for a long operation; print its ids and exit. | The same. |
| `--timeout <seconds>` | The longest time to wait. Without it, a call waits up to 120 seconds for the answer, and waiting for a long operation to finish has no overall limit. | The longest time for one HTTP request to the server. The default is 300 seconds. |
| `--quiet`, -q | No progress output. | The same. |
| `--verbose` | Print what is sent and received to standard error. Tokens are never printed. | The same. |
| `--input <file\|->` | Give the whole input as JSON from a file or standard input. | The same. |
| `--output <file>` | Where to save an image result. | See the table below. |
| `--help`, -h | Print help. | Prints help. It also works with the built-in commands (expl server login, logout, status, token and skill). |
| `--version` | Print the version. | The same. |

Review the output of `--verbose` before you paste it anywhere.

`--json` has no effect on expl server login, expl server logout, expl server skill and expl completion. They always print text. The built-in commands expl server login, logout, status and skill do not report an unknown flag or an extra argument. expl server token and the generated commands reject them (exit code 2).

<a id="env"></a>

## Environment variables

| Variable | Used for | Order of precedence |
| --- | --- | --- |
| EXPL_SERVER_URL | The server that expl server calls | `--url`, then EXPL_SERVER_URL, then the server you signed in to most recently, then https://exploratory.io. See [The server URL](/en/cli/server/login#url). |
| EXPL_SERVER_TOKEN | An API key | Used before a saved login. See [API keys](/en/cli/server/token). |
| EXPL_PROJECT | The project that Desktop commands work on | Not used with expl server. See [Choose a project](/en/cli/desktop/guides/projects). |

<a id="completion"></a>

## Shell completion

expl completion bash, expl completion zsh and expl completion powershell print a completion script. Run the script to turn completion on.

| Shell | To turn it on in the current session | To keep it for later sessions |
| --- | --- | --- |
| bash | `eval "$(expl completion bash)"` | Add that line to \~/.bashrc |
| zsh | `eval "$(expl completion zsh)"` | Add that line to \~/.zshrc |
| PowerShell | expl completion powershell \| Out-String \| Invoke-Expression | Add that line to $PROFILE |

<a id="server"></a>

## Flags only for expl server

| Flag | What it does |
| --- | --- |
| `--url <url>` | The server to call. |
| `--with-token` | Used with expl server login. Reads an API key (asked for without showing it in a terminal, or from standard input) and saves it. `--token` was removed; use EXPL_SERVER_TOKEN. |
| `--output <file>`, -o \<file\> | Where to save a file result, such as a data frame export or a chart image. With `--json`, a saved file prints the path (saved) and the size (bytes) as JSON. `--output` - is not JSON: it writes the file itself to standard output. |
| `--no-browser` | Do not open a browser while signing in. |

For how to use `--no-browser` and `--with-token`, see [Sign in](/en/cli/server/login). For API keys and EXPL_SERVER_TOKEN, see [API keys](/en/cli/server/token).

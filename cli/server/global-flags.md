# Global flags

Flags you can add to any command. You can place them before or after the command.

<a id="all"></a>

## Global flags

| Flag | What it does | With expl server |
| --- | --- | --- |
| --project \<id\|name\> | The project to work on. | Not used. |
| --json | Print the result as JSON, as the tool returned it. | The same. |
| --yes, -y | Skip the confirmation of an operation that is hard to undo. | The same. |
| --no-wait | Do not wait for a long operation; print its ids and exit. | The same. |
| --timeout \<seconds\> | The longest time to wait. Without it, a call waits up to 120 seconds for the answer, and waiting for a long operation to finish has no overall limit. | The longest time for one HTTP request to the server. The default is 300 seconds. |
| --quiet, -q | No progress output. | The same. |
| --verbose | Print what is sent and received to standard error. Tokens are never printed. | The same. |
| --input \<file\|-\> | Give the whole input as JSON from a file or standard input. | The same. |
| --output \<file\> | Where to save an image result. | See the table below. |
| --help, -h | Print help. | The same. |
| --version | Print the version. | The same. |

Review the output of --verbose before you paste it anywhere.

<a id="server"></a>

## Flags only for expl server

| Flag | What it does |
| --- | --- |
| --url \<url\> | The server to call. |
| --with-token | Used with expl server login. Reads an API key (asked for without showing it in a terminal, or from standard input) and saves it. --token was removed; use EXPL_SERVER_TOKEN. |
| --output \<file\>, -o \<file\> | Where to save a file result, such as a data frame export or a chart image. |
| --no-browser | Do not open a browser while signing in. |

- [Sign-in and status](login.md) - How to use --no-browser and --with-token.
- [API keys](token.md) - How to use API keys and EXPL_SERVER_TOKEN.

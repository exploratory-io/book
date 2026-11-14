# Global flags

Flags you can add to any command. You can place them before or after the command.

<a id="all"></a>

## Global flags

| Flag | What it does |
| --- | --- |
| --project \<id\|name\> | The project to work on |
| --json | Print the result as JSON, as the tool returned it |
| --yes, -y | Skip the confirmation of an operation that is hard to undo |
| --no-wait | Do not wait for a long operation; print its ids and exit |
| --timeout \<seconds\> | Longest time to wait. Without it, a tool call waits up to 120 seconds for the answer, and waiting for a long operation to finish has no overall limit |
| --quiet, -q | No progress output |
| --verbose | Print what is sent and received to standard error (tokens are never printed) |
| --input \<file\|-\> | Give the whole input as JSON from a file or standard input |
| --output \<file\> | Where to save an image result, such as chart get-image |
| --help, -h | Help |
| --version | Version |

Review the output of --verbose before you paste it anywhere.

For shell completion, expl completion bash, expl completion zsh and expl completion powershell print a completion script.

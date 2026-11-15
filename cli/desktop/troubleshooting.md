# Troubleshooting

Find a fix by symptom.

<a id="symptoms"></a>

## Symptoms and fixes

| What you see | What to do |
| --- | --- |
| expl: command not found | Open a new terminal and run it again. See also the installation page. |
| The command is refused even though Desktop is running, and the message points to MCP / CLI | The CLI is off by default. In System Settings, choose MCP / CLI, turn on Enable CLI in the CLI section and choose Save. |
| Exit code 3 | Start Exploratory Desktop and run it again. |
| Exit code 4 | Sign in to Exploratory Desktop. |
| PROJECT_NOT_OPEN | Open the project: expl project open \<id\> |
| Odd results | Add --verbose to see what is sent and received. Review the output before you paste it anywhere. |

<a id="windows"></a>

## Windows

In Windows PowerShell 5.1, a value that contains both " and a space breaks when you pass it directly. This is a PowerShell 5.1 bug and affects other commands such as git and node too. Pass such a value in the --input JSON, or use PowerShell 7.3 or later.

When you pipe into --input - in Windows PowerShell 5.1, run the line below first. Otherwise Japanese text becomes ?.

```sh
$OutputEncoding = [Text.UTF8Encoding]::new($false)
```

<a id="more"></a>

## Related

- [Exit codes](exit-codes.md) - The list of exit codes.

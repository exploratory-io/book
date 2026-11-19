---
title: "Troubleshooting"
---

Find a fix by symptom.

<a id="first"></a>

## Check the state first

Run expl status. Exit code 0 from expl tools list does not mean that Desktop is connected (see [All commands](/en/cli/desktop/commands#cmd-check)). To see what is sent and received, add `--verbose`; it prints to standard error. Review the output before you paste it anywhere.

<a id="contact"></a>

## When you contact support

Send these to support@exploratory.io: the output of `expl --version`, the command you ran, the exit code and the message. Hide any token or API key.

<a id="symptoms"></a>

## Symptoms and fixes

| What you see | What to do |
| --- | --- |
| expl: command not found | Open a new terminal and run it again. See also [Installation](/en/cli/desktop/install). |
| The command is refused even though Desktop is running, and the message points to MCP / CLI | The CLI is off by default. In System Settings, choose MCP / CLI, turn on the switch on the CLI card and choose Save. |
| Exit code 3 | Start Exploratory Desktop and run it again. |
| Exit code 1 with PAIRING_PENDING | You did not answer the approval screen in Desktop within 2 minutes. Answer it and run the command again (see [Get started](/en/cli/desktop/get-started#steps)). |
| Exit code 4 with PAIRING_REQUIRED | You chose Don't allow on the approval screen. For 5 minutes running the command again does not show the screen and is declined at once. Run it again after 5 minutes and allow it on the screen. |
| Exit code 4 | See the code at the end of the message in [Exit codes and errors](/en/cli/desktop/exit-codes#action): NOT_SIGNED_IN, UNAUTHORIZED, PAIRING_REQUIRED, CHANNEL_DISABLED or PERMISSION_DENIED. |
| PROJECT_NOT_OPEN | Open the project: expl project open \<id\> |
| A message names a tool, such as get_data_frame | Run expl tools describe \<tool_name\> to see the command for that tool. |
| Odd results | Add `--verbose` to see what is sent and received. Review the output before you paste it anywhere. |

<a id="windows"></a>

## Windows

In Windows PowerShell 5.1, a value that contains both `"` and a space breaks when you pass it directly. This is a PowerShell 5.1 bug and affects other commands such as git and node too. Pass such a value in the `--input` JSON, or use PowerShell 7.3 or later.

When you pipe into `--input` - in Windows PowerShell 5.1, run the line below first. Otherwise Japanese text becomes ?.

```sh
$OutputEncoding = [Text.UTF8Encoding]::new($false)
```

<a id="more"></a>

## Related

- [Exit codes and errors](/en/cli/desktop/exit-codes) - The list of exit codes.

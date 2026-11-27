---
title: "Confirmation and long-running operations"
---

An operation that is hard to undo asks first. By default, expl waits for a long operation to finish.

<a id="confirm"></a>

## Confirming an operation that is hard to undo

An operation with HIGH risk (publishing, deleting and so on) asks first. The RISK column of expl tools list shows which ones.

| Situation | What happens |
| --- | --- |
| In a terminal, without `--yes` | It asks Continue? \[y/N\]. y or yes (any case) runs it; anything else cancels (exit code 1). |
| Not in a terminal (script, CI, AI agent, or output sent to a file or a pipe), without `--yes` | Nothing runs; exit code 2. |
| With `--yes` | It runs without asking. |

`--yes` (or a y at the prompt) counts as the user's confirmation.

<a id="wait"></a>

## Long operations

By default expl waits until the operation finishes and writes progress to standard error. Give `--timeout <seconds>` to set an overall limit.

Without `--timeout`, a call waits up to 120 seconds for the answer, and waiting for a long operation to finish has no overall limit.

With `--no-wait`, expl prints the execution_id and operation_id and exits at once. Check the state later with this command.

```sh
expl execution get <execution_id> --operation-id <operation_id>
```

Replace \<execution_id\> and \<operation_id\> with the values printed by `--no-wait`.

When `--timeout` passes, expl shows how to check and exits with code 1 (the operation continues). Ctrl+C while waiting requests cancellation of the operation and exits (exit code 130). The request can fail, so check the state with expl execution get when it matters.

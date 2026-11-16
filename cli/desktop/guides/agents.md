# Use from AI agents

What an AI agent should know before it runs expl. An agent that can run shell commands can use expl directly. No MCP registration is needed.

<a id="use"></a>

## How to use expl

1. Check the connection first: run expl status. Exit code 0 from expl tools list does not mean that Desktop is connected.
2. Find commands instead of guessing names: run expl tools list --json, then expl tools describe \<tool_name\> for the arguments of one command.
3. Add --json and read the result from standard output. Progress, warnings and confirmations go to standard error, so they do not break the JSON.
4. Read the exit code. 3 means Desktop cannot be reached, and 4 means authentication, approval or permission.
5. Outside a terminal, an operation that is hard to undo does nothing without --yes (exit code 2). Ask the user before you add --yes, and add it only for an operation the user has decided to run.
6. When an error message names a tool, such as get_data_frame, run expl tools describe \<tool_name\> to see the command for that tool.

For the list of exit codes, see [Exit codes](../exit-codes.md). For what --yes does, see [Confirmation and long-running operations](confirmation.md).

<a id="other"></a>

## Other ways

- [MCP Desktop](../../../mcp/desktop/desktop.md) - Work with Desktop projects from an AI app.
- [MCP Server](../../../mcp/server/server.md) - Connect directly from an AI app.
- [Use with Server](../../server/guides/agents.md) - For reading content on exploratory.io.

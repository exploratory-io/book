---
title: "Use from AI agents"
---

What an AI agent should know before it runs expl server. An agent that can run shell commands can use expl directly. No MCP setup is needed.

<a id="use"></a>

## How to use expl

1. Check the connection first: run expl server status. Exit code 0 from expl server tools list does not mean the connection works.
2. Find commands instead of guessing names: run `expl server tools list --json`, then expl server tools describe \<tool_name\> for the arguments of one command.
3. Add `--json` and read the result from standard output. Progress and warnings go to standard error, so they do not break the JSON.
4. Read the exit code. 3 means the server cannot be reached, and 4 means authentication or permission.
5. Outside a terminal, an operation that is hard to undo does nothing without `--yes` (exit code 2). Ask the user before you add `--yes`, and add it only for an operation the user has decided to run. expl server token revoke is an exception: it sends the revocation without asking and without `--yes`, so confirm the key and the user's intention to revoke it before you run it.
6. In CI, sign in with an API key through the environment variable EXPL_SERVER_TOKEN.
7. When an error message names a tool, such as chart_query, run expl server tools describe \<tool_name\> to see the command for that tool.

For listing and describing commands, see [Inspect commands](/en/cli/server/commands#inspect-commands). For the exit codes, see [Exit codes and errors](/en/cli/server/exit-codes). For using an API key in CI, see [Automation](/en/cli/server/guides/automation).

<a id="choose"></a>

## Choose expl or MCP Server

MCP is a shared standard for AI tools to connect to outside services. You can use Exploratory from AI with either.

| You want | Use |
| --- | --- |
| Scripts, CI, a shell-based agent | expl |
| An agent that works through MCP | MCP Server (you register the server URL in your AI tool) |

To read published content from an AI tool, see [MCP Server](/en/mcp/server). To work with projects in Exploratory Desktop, see [Use with Desktop](/en/cli/desktop/guides/agents).

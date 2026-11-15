# AI agents

An AI agent that can run shell commands can use expl directly. No MCP setup is needed.

<a id="choose"></a>

## Choose expl or MCP Server

MCP is a shared standard for AI apps to connect to outside services. You can use Exploratory from AI with either.

| You want | Use |
| --- | --- |
| Scripts, CI, a shell-based agent | expl |
| An agent that works through MCP | MCP Server (the Exploratory plugin) |

- [MCP Server](../../../mcp/server/server.md) - Read published content from an AI app.

<a id="skill"></a>

## Teach the agent with a skill

A skill is a description file (SKILL.md) that teaches an AI agent how to use a tool. expl prints a skill that describes itself. Save it where your agent reads skills. For Claude Code:

```sh
mkdir -p ~/.claude/skills/exploratory-expl-server
```

```sh
expl server skill > ~/.claude/skills/exploratory-expl-server/SKILL.md
```

expl server skill is for Exploratory Server. When expl can reach the server, the output also carries the latest guidance from it, so prefer this command. The skill for Desktop is described on the Desktop page.

- [Skills](../skill.md) - Describes how to save the skill.
- [Use with Desktop](../../desktop/guides/agents.md) - Describes how to save the skill printed by expl skill.

<a id="tips"></a>

## Tips for agents

- Use --json and read the exit code.
- Outside a terminal, an operation that is hard to undo does nothing without --yes (exit code 2). Add --yes only for an operation you have decided to run.
- Run expl server tools list to see what is available instead of guessing command names.

- [Exit codes](../exit-codes.md) - The list of exit codes.

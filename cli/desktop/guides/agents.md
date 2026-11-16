# Use from AI agents

An AI agent that can run shell commands can use expl directly. No MCP registration is needed.

<a id="skill"></a>

## Teach the agent with a skill

Skills are optional. expl works without one: expl --help and expl tools describe show how to use it.

A skill is a description file (SKILL.md) that teaches an AI agent how to use a tool. expl skill prints a skill for Desktop. For Claude Code:

```sh
mkdir -p ~/.claude/skills/exploratory-expl
```

```sh
expl skill > ~/.claude/skills/exploratory-expl/SKILL.md
```

<a id="tips"></a>

## Tips for agents

- Use --json and read the exit code.
- Outside a terminal, an operation that is hard to undo does nothing without --yes (exit code 2). Add --yes only for an operation you have decided to run.
- Run expl tools list to see what is available instead of guessing command names.

<a id="other"></a>

## Other ways

- [MCP Server](../../../mcp/server/server.md) - Connect directly from an AI app.
- [Use with Server](../../server/guides/agents.md) - For reading content on exploratory.io.

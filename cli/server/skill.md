# Skills

Print the skill file that teaches an AI agent how to use expl.

<a id="what"></a>

## What a skill is

A skill is a description file (SKILL.md) that teaches an AI agent how to use a tool. The agent reads skills from the place where you save them.

<a id="save"></a>

## Save the skill

For Claude Code, save it with these two commands.

```sh
mkdir -p ~/.claude/skills/exploratory-expl-server
```

```sh
expl server skill > ~/.claude/skills/exploratory-expl-server/SKILL.md
```

expl server skill is for Exploratory Server; expl skill is for Exploratory Desktop. When expl can reach the server, the output also carries its latest guidance, so prefer this command over a copy of the file.

- [AI agents](guides/agents.md) - Besides skills, there are tips for agents.

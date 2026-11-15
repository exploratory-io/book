# Exploratory CLI: Desktop

expl operates the Exploratory Desktop running on this computer, from your terminal.

<a id="target"></a>

## What this is for

> Every command on this page starts with expl and works on the Exploratory Desktop running on this computer. There is no sign-in step: it works when Desktop is running, you are signed in, and you have turned on the CLI in Settings > MCP / CLI and saved.
>
> To read content on exploratory.io, see [Server commands](../server/server.md). To connect from an AI app, see [MCP Server](../../mcp/server/server.md).

<a id="start"></a>

## Get started

### 0. Turn on the CLI

In Desktop, open Settings > MCP / CLI, turn on the CLI and save. For the steps, see [Turn on the CLI first](install.md#enable).

### 1. Check the version

```sh
expl --version
```

expl comes with Desktop. If it is not found, see the installation page.

### 2. Check the connection to Desktop

```sh
expl status
```

It shows the Desktop version and the signed-in user. If Desktop is not running, it exits with code 3.

### 3. See your projects

```sh
expl project list
```

- [Quickstart](quickstart.md) - Run your first commands in order.

<a id="commands"></a>

## Desktop commands (expl)

The commands you will use most. For the generated commands, check the arguments with expl \<command\> --help. For built-in commands such as project use, see how they are written in this table.

| Command | Purpose |
| --- | --- |
| expl status | The Desktop version and the signed-in user |
| expl tools list | All available commands (read-only or not, and risk) |
| expl tools describe \<command\> | Arguments, types, required or not, allowed values (put a two-word command in quotes) |
| expl project list | List projects |
| expl project use \<id\|name\> | Choose the project later commands work on |
| expl project open \<id\> | Open a project |

- [Common commands](commands.md) - Includes data, chart, note and dashboard commands.

<a id="difference"></a>

## How it differs from Server

Server commands (expl server) read published content. Desktop commands can also create, change and publish.

An operation that is hard to undo asks for confirmation before it runs.

- [Confirmation and long-running operations](guides/confirmation.md) - How confirmation works and how to not wait.

<a id="records"></a>

## What is sent and recorded

Commands go to the Desktop app over a local connection on your computer. Desktop keeps a log of each tool call on your computer (tool name, parameter names without their values, result, duration) and deletes it after 90 days.

While you are signed in and AI features are on, Desktop also sends one usage record for each tool call to the exploratory.io server you are signed in to, as it does for the Desktop MCP (never for local data catalog tools). A record holds the tool name and its arguments (which can include formulas and values you entered), success or failure with the error type and message, the size of the result (not the content), the duration, the Desktop version, the client name and version, and the session and item IDs.

expl itself sends no usage analytics.

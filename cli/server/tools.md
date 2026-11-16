# Inspect commands

Inspect the commands the server offers and their flags.

<a id="list"></a>

## List the commands

```sh
expl server tools list
```

The command list comes from the server each time. A new operation on the server does not need a new version of expl. When the server cannot be reached or you are not signed in, expl shows the list it saved last time, or an empty list when none is saved.

Exit code 0 from tools list does not mean that the connection works. To check the connection, run expl server status.

<a id="describe"></a>

## Describe one command

```sh
expl server tools describe <command>
```

Replace \<command\> with the name of a command from the list. Wrap a command of two words in quotes, as in `expl server tools describe "chart get-data"`. The tool name, such as `chart_get_data`, also works.

It shows what the command does and the flags it takes. Check here instead of guessing command names.

<a id="form"></a>

## The shape of a command

search and fetch take no verb: expl server search \<query\> and expl server fetch \<id\>. Other commands put a noun and a verb after server, as in expl server dataset query.

Each command also has the name of the tool behind it, the one an MCP client sees. expl server call \<tool_name\> runs a command by that name, for example expl server call dataframe_preview \<id\>.

To find every command by purpose, see [All commands](commands.md).

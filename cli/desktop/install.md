# Installation

expl comes with Exploratory Desktop. There is nothing else to install.

<a id="bundled"></a>

## Bundled with Desktop

When you start the production app, it puts expl on your PATH (the list of folders where commands are found) if it is not there yet. Use it from a newly opened terminal. You do not need to install Node.js.

On macOS this happens only when the app is in /Applications or ~/Applications. A development build does not install it.

Open a new terminal and run this.

```sh
expl --version
```

<a id="where"></a>

## Where it goes

| OS | Location |
| --- | --- |
| macOS | /usr/local/bin/expl |
| Windows | \<install folder\>\\cli is added to your user PATH. Administrator rights are not needed. |

The same program is also installed as exploratory, and as exploratory-mcp for MCP. If another command already uses one of those names, only that name is not installed.

<a id="two"></a>

## When you also installed it with npm

If you have both an npm copy and the Desktop copy of expl, check which one runs.

### macOS and Linux

**macOS and Linux**

```sh
which -a expl
```

Shows every copy, in the order they run.

### Windows

**Windows**

```sh
where expl
```

<a id="remove"></a>

## Remove

| OS | How |
| --- | --- |
| macOS | rm /usr/local/bin/expl /usr/local/bin/exploratory /usr/local/bin/exploratory-mcp (add sudo if administrator rights are needed). If the app stays in /Applications, it is installed again at the next start. |
| Windows | Open "Edit the system environment variables" and remove \<install folder\>\\cli from Path in the user variables. It is added again at the next start. |

- [Quickstart](quickstart.md) - Connect to Desktop and run your first commands.

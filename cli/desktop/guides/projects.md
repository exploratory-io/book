# Choose a project

A command that needs a project works on one project. Which one is decided in a fixed order.

<a id="order"></a>

## The order

| # | How | Example |
| --- | --- | --- |
| 1 | --project \<id or name\> | expl dashboard list --project "Sales Analysis" |
| 2 | The EXPL_PROJECT environment variable | EXPL_PROJECT="Sales Analysis" |
| 3 | The default set with expl project use | expl project use "Sales Analysis" |

The one higher in the list wins.

<a id="name"></a>

## Choosing by name

A name must match exactly. If several projects have the same name, expl stops with an error and lists the candidate ids. Use one of those ids.

<a id="open"></a>

## When the project is not open

If the project is not open in Desktop, expl returns PROJECT_NOT_OPEN. Open it with this command.

```sh
expl project open <id>
```

Replace \<id\> with an id from expl project list.

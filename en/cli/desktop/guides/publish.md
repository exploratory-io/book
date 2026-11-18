---
title: "Publish"
---

Publish a note, a dashboard or a data frame from Desktop to the server, see what is published, and cancel the publication of a note or dashboard.

<a id="before"></a>

## Before you start

- Exploratory Desktop is running, the project is open ([Choose a project](/en/cli/desktop/guides/projects)) and you are signed in (expl status shows the signed-in user).
- Publishing and cancelling work only when Allow create, edit and delete is on in System Settings > MCP / CLI.
- Publishing makes the content readable by anyone who has the URL, and cancelling a publication cannot be undone. So both ask for confirmation first. In a terminal, expl asks Continue? \[y/N\]. From a script or an AI agent, add `--yes`, after you have checked the target. See [Confirmation and long-running operations](/en/cli/desktop/guides/confirmation).

<a id="steps"></a>

## Steps

### 1. Find the target and the team

```sh
expl note list
expl dashboard list
expl team list
```

note list returns the note ids, and dashboard list the dashboard ids. team list returns the teams you belong to; a team name is only needed to publish into a team the first time.

### 2. Publish

```sh
expl note publish <note_id>
expl dashboard publish <dashboard_id>
```

`--tags` adds tags (repeat the flag for several), `--team <team name>` sets the team on the first publication, and `--change-description` writes the comment of a republication. Publishing again updates the same URL.

```sh
expl note publish <note_id> --tags sales --tags weekly --team <team name> --yes
```

To publish a data frame, use expl dataframe publish \<dataframe_id\>. `--step-name` chooses the step to publish; without it, the last enabled step is used.

expl published list shows the public URL (publishedUrl). If the result has outputOlderThanSource set to true, the published content is older than the current body.

A dashboard can be published only after Desktop has rendered it. When No rendered output appears, open the dashboard once in Exploratory Desktop so that it renders, and run the command again.

### 3. See what is published

```sh
expl published list
```

The result lists the notes, dashboards and data published from the project, with id, type, title, URL and team. `--verify` checks on the server that each one exists; it is slow, so use it only when you need it.

### 4. Cancel a publication

```sh
expl published unpublish <id>
```

\<id\> is the id from expl published list. The public URL stops working. A published data frame is not cancelled by this command.

<a id="trouble"></a>

## If it fails

| What you see | What to do |
| --- | --- |
| PERMISSION_DENIED | Turn on Allow create, edit and delete in the system settings. See [Exit codes and errors](/en/cli/desktop/exit-codes). |
| Exit code 2 and nothing runs | The command needs confirmation and is not in a terminal. Add `--yes` after you have checked the target. |
| Exit code 1 at Continue? | You answered anything other than y. Run it again and answer y. |
| No rendered output | Open the dashboard once in Desktop, then run the command again. |
| The team is not found | Use a name from expl team list. |

For the arguments of any command, run `expl <command> --help` or `expl tools describe "<command>"`.

<a id="related"></a>

## Related pages

- [Confirmation and long-running operations](/en/cli/desktop/guides/confirmation)
- [Write notes](/en/cli/desktop/guides/write-notes)
- [Duplicate dashboards](/en/cli/desktop/guides/duplicate-dashboard)
- [Desktop commands](/en/cli/desktop/commands)

To do the same through MCP, see Publish in [Use](/en/mcp/desktop/use#examples).

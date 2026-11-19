---
title: "Duplicate dashboards"
---

Duplicate a dashboard with a different title. jq (a command that processes JSON) reshapes the definition you get into the shape that create takes.

<a id="before"></a>

## Before you start

- Exploratory Desktop is running and the project is open ([Choose a project](/en/cli/desktop/guides/projects)). Check with expl status.
- You know the id of the original dashboard (expl dashboard list).
- dashboard create works only when Allow create, edit and delete is on in System Settings > MCP / CLI.
- jq is installed. The commands on this page are written for a bash shell.

<a id="steps"></a>

## Three steps

### 1. Get the original dashboard

```sh
expl dashboard get d123 --json > base.json
```

Replace d123 with the id of the original dashboard.

### 2. Reshape it with jq

The output of get (pages\[\].layout_rows) and the input of create (pages\[\].rows) have different shapes, so reshape it with jq.

```sh
cat > dup.jq <<'JQ'
.dashboard | {
  title: $title,
  pages: [.pages[] | {name, rows: [.layout_rows[] | {height: .options.height, panels: [.panels[] |
    if .type == "text" then {text, width: .widthRatio}
    elif .analysisId then {analytics: .analysisId, outputType: .id, title: .name, width: .widthRatio}
    else {chart: .id, title: .name, width: .widthRatio} end]}]}],
  variables: [.variables[].name],
  settings
}
JQ
```

This jq reads an analytics panel by `.analysisId` (the analytics id) and passes the output type id (`.id`) as `outputType`. It carries over the panel title, the width and the rows only. It does not carry over `mode` (create works it out again from the number of rows), a page's `headers` or `columns` (a page laid out in columns), or a panel's display settings such as the title color. If the original uses them, check the copy in Desktop and set them again.

### 3. Create the copies

```sh
for region in east west north; do
  jq --arg title "Sales - $region" -f dup.jq base.json \
    | expl dashboard create --input - --json \
    | jq -r '.dashboardId' >> created.txt
done
```

The ids of the dashboards you created are saved in created.txt.

<a id="publish"></a>

## When you publish the copies

```sh
while read id; do expl dashboard publish "$id" --yes; done < created.txt
```

Desktop must have finished rendering. If you see No rendered output, open the dashboard once in Exploratory Desktop so that it renders, then run it again.

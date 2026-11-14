# Duplicate a dashboard

Duplicate a dashboard with a different title. jq (a command that processes JSON) reshapes the definition you get into the shape that create takes.

<a id="steps"></a>

## Four steps

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
    elif .type == "analytics" then {analytics: .id, width: .widthRatio}
    else {chart: .id, width: .widthRatio} end]}]}],
  variables: [.variables[].name],
  settings
}
JQ
```

### 3. Create the copies

```sh
for region in east west north; do
  jq --arg title "Sales - $region" -f dup.jq base.json \
    | expl dashboard create --input - --json \
    | jq -r '.dashboardId' >> created.txt
done
```

The ids of the dashboards you created are saved in created.txt.

### 4. Publish them

```sh
while read id; do expl dashboard publish "$id" --yes; done < created.txt
```

Desktop must have finished rendering. If you see No rendered output, wait a little or open it with expl note open \<id\>, then run it again.

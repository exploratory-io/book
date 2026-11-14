# ダッシュボードを複製する

似たダッシュボードを、タイトルだけ変えて複製します。jq（JSON を加工するコマンド）で、取得した定義を作成の入力の形に詰め替えます。

<a id="steps"></a>

## 4 つの手順

### 1. 元のダッシュボードを取得する

```sh
expl dashboard get d123 --json > base.json
```

d123 は、元のダッシュボードの id に置き換えます。

### 2. jq で詰め替える

get の出力（pages\[\].layout_rows）と create の入力（pages\[\].rows）は形が違うので、jq で詰め替えます。

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

### 3. 作成する

```sh
for region in east west north; do
  jq --arg title "Sales - $region" -f dup.jq base.json \
    | expl dashboard create --input - --json \
    | jq -r '.dashboardId' >> created.txt
done
```

作ったダッシュボードの id が created.txt に残ります。

### 4. パブリッシュする

```sh
while read id; do expl dashboard publish "$id" --yes; done < created.txt
```

パブリッシュするには、Desktop が描画を終えている必要があります。No rendered output と出たときは、少し待つか、expl note open \<id\> で開いてから、もう一度実行します。

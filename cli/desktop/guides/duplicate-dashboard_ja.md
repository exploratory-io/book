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
    elif .analysisId then {analytics: .analysisId, outputType: .id, title: .name, width: .widthRatio}
    else {chart: .id, title: .name, width: .widthRatio} end]}]}],
  variables: [.variables[].name],
  settings
}
JQ
```

この jq は、分析のパネルを `.analysisId`（分析の id）で見分け、出力の種類の id（`.id`）を `outputType` に渡します。引き継ぐのはパネルのタイトル、幅、行だけです。`mode`（create が行の数からもう一度決めます）、ページの `headers` と `columns`（列で組んだページ）、パネルのタイトルの色などの表示設定は引き継ぎません。元のダッシュボードで使っている場合は、コピーを Desktop で開いて確かめ、設定し直してください。

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

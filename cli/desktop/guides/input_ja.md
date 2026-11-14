# 引数と JSON を渡す

コマンドの入力は、型に応じたフラグで渡します。入力全体を JSON で渡すこともできます。

<a id="kinds"></a>

## 型ごとの渡し方

| 入力の型 | 渡し方 | 例 |
| --- | --- | --- |
| 文字列、数、選択肢 | --kebab-case \<値\> または --kebab-case=\<値\> | --title "Sales 2026" |
| 真偽値 | --flag または --no-flag | --include-data |
| 値の配列 | フラグを繰り返す | --tag sales --tag weekly |
| オブジェクト、オブジェクトの配列 | JSON 文字列、または @ファイル | --pages @pages.json |
| 長い文字列 | @ファイル（中身が値になります） | --content @report.md |

<a id="json"></a>

## 入力全体を JSON で渡す

```sh
expl dashboard create --input dashboard.json
```

```sh
cat dashboard.json | expl dashboard create --input -
```

- は標準入力から読みます。

- --input とフラグを両方渡すと、フラグが勝ちます。
- 知らないフラグはエラーです（終了コード 2）。近い名前を候補として示します。
- グローバルフラグと同じ名前の入力と、@ で始まる文字列そのものは、--input の JSON で渡してください。

<a id="id"></a>

## id は最初の引数で渡せます

必須の id が 1 つだけのコマンドは、その id を最初の引数で渡せます。--chart-id c789 のようにフラグで渡しても同じです。id が足りないときは、expl が見つけられる候補を示して、終了コード 2 で終了します。

```sh
expl dashboard get d123
```

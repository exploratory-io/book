---
title: "プロジェクトを選ぶ"
---

プロジェクトが要るコマンドは、1 つのプロジェクトに対して動きます。どのプロジェクトを使うかは、次の順で決まります。

<a id="order"></a>

## 決まる順

| # | 指定 | 例 |
| --- | --- | --- |
| 1 | `--project <id または名前>` | `expl dashboard list --project "Sales Analysis"` |
| 2 | 環境変数 EXPL_PROJECT | `EXPL_PROJECT="Sales Analysis"` |
| 3 | expl project use で決めた既定のプロジェクト | `expl project use "Sales Analysis"` |

上にあるものが優先されます。

例外があります。プロジェクトの id を位置引数に取るコマンドでは、その id が優先されます。それ以外のコマンドでは、`--project` が `--input` の JSON の project_id より優先されます。`--project` がなければ、`--input` の JSON の project_id がそのまま使われます。プロジェクトが省略できるコマンドは、EXPL_PROJECT と、expl project use で決めた既定を使いません。expl lang は、この 3 つのどれも指定されていないとき、開いているプロジェクトも使います。

<a id="name"></a>

## 名前で指定するとき

名前は完全一致で探します。同じ名前のプロジェクトが複数あるときはエラーになり、id の候補を示します。その id を指定してください。

<a id="open"></a>

## プロジェクトが開いていないとき

プロジェクトが Desktop で開いていないと、PROJECT_NOT_OPEN になります。次のコマンドで開けます。

```sh
expl project open <id>
```

\<id\> は、expl project list で見つけた id に置き換えます。

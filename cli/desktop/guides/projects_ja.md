# プロジェクトを選ぶ

プロジェクトが要るコマンドは、1 つのプロジェクトに対して動きます。どのプロジェクトかは、決まった順で決まります。

<a id="order"></a>

## 決まる順

| # | 指定 | 例 |
| --- | --- | --- |
| 1 | --project \<id または名前\> | expl dashboard list --project "Sales Analysis" |
| 2 | 環境変数 EXPL_PROJECT | EXPL_PROJECT="Sales Analysis" |
| 3 | expl project use で決めた既定のプロジェクト | expl project use "Sales Analysis" |

上にあるものが勝ちます。

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

# 出力と言語

標準出力には結果だけが出ます。人が読む形と JSON を切り替えられ、expl 自身の文言は Desktop の言語に従います。

<a id="streams"></a>

## 標準出力と標準エラー

標準出力には結果だけを出します。進捗、警告、確認、エラーの説明は標準エラーに出ます。

<a id="format"></a>

## 人が読む形と JSON

既定は人が読む形です。--json を付けると、結果を 1 つの JSON で出します。

失敗したときは、--json では標準出力に { "success": false, "error_code": ..., "message": ... } の形で出ます。警告は --json でも標準エラーに 1 行ずつ出ます。

```sh
expl dashboard get d123 --json
```

<a id="lang"></a>

## 言語

expl 自身が書く文言は、Desktop の言語に従います。expl lang ja または expl lang en で切り替えます。言語を渡さずに実行すると、いまの言語を表示します（例: expl lang --project \<id\>）。対象のプロジェクトを決められないとき（--project、EXPL_PROJECT、既定のプロジェクト、開いているプロジェクトのどれもないとき）は、終了コード 2 で終わります。

```sh
expl lang ja
```

機械が読む出力は、言語で変わりません。--json の構造と error_code、終了コード、フラグ名は同じです。変わるのは、JSON の message の文言です。

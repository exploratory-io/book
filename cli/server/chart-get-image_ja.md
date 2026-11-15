# expl server chart get-image

チャートの画像（PNG）を取得します。形、傾向、配置を確認するための機能です。

<a id="examples"></a>

## 例

### チャートの画像を取得する

**ターミナル**

```sh
expl server chart get-image <id> --chart <chart> --json
```

\<id\> はノートなどの id、\<chart\> は fetch の結果にあるチャートの名前に置き換えます。

実行結果は、ダッシュボード dE5fG6hI7j のチャート iJ6kL7mN（売上推移）で実行したものです。画像の保存先を示す image_path の行は省略しています。公開時に画像が保存されていないチャートは、NOT_FOUND（"This chart has no stored image"）になります。その場合は chart get-data を使います。

**実行結果**

```text
{
  "success": true,
  "item": {
    "id": "dE5fG6hI7j",
    "type": "dashboard",
    "title": "売上とマーケティング費用のダッシュボード"
  },
  "summary": "Returned the image of chart \"売上推移\" (600x400).",
  "result": {
    "chart": {
      "name": "iJ6kL7mN",
      "title": "売上推移",
      "type": "line"
    },
    "data_shared": true,
    "image": {
      "mime_type": "image/png",
      "width": 600,
      "height": 400,
      "original_width": 600,
      "original_height": 400,
      "bytes": 41970,
      "resized": false,
      "captured_at": "2022-06-24T08:51:53.397Z",
      "may_be_stale": true
    },
    "context": {
      "publication_version": "2022-06-24T08:51:53.397Z",
      "data_as_of": "2026-11-14T22:02:21.534Z",
      "parameters": {
        "applied": true,
        "values": [
          {
            "name": "Start_Date",
            "display_name": "Start_Date",
            "value": [
              "2017-01-01"
            ]
          },
          {
            "name": "End_Date",
            "display_name": "End_Date",
            "value": [
              "2020-12-31"
            ]
          },
          {
            "name": "Market",
            "display_name": "Market",
            "value": []
          }
        ],
        "note": "Values as published. A viewer who changes the parameters in the browser sees different results."
      },
      "dashboard_filters": "none"
    }
  },
  "warnings": [
    "The image is the chart as saved when it was published. Read exact numbers with chart_get_data, not from the image.",
    "The data was refreshed at 2026-11-14T22:02:21.534Z, after this image was captured at 2022-06-24T08:51:53.397Z. The image may not show the current numbers; use chart_get_d…"
  ],
  "url": "https://exploratory.io/dashboard/aB3cD4eF5g/dE5fG6hI7j"
}
```

<a id="usage"></a>

## 書式

```text
expl server chart get-image <id> [flags]
```

\[ \] は省略できる指定、\< \> は自分の値に置き換える部分です。フラグは -- で始まる追加の指定です。

<a id="flags"></a>

## 引数とフラグ

| 名前 | 型 | 条件 | 説明 |
| --- | --- | --- | --- |
| `--id` | 文字列 | 必須 | チャートを含むノート、ダッシュボード、スライドの id です。チャート単体で公開したものは、その id です。コマンドのすぐあとに書くか、--id で渡します。 |
| `--chart` | 文字列 |  | ノート、ダッシュボード、スライドの中のチャートの名前です。fetch の結果の metadata.charts\[\].name にあります。 |

<a id="paging"></a>

## 続きを取得する

ページ送りはありません。

<a id="output"></a>

## 出力

画像は、公開したときに保存されたもので、描き直されません。そのため、データより古いことがあります。結果の result.image.may_be_stale で確かめます。画像は、expl を動かしているコンピューターの一時フォルダなどに保存され、結果の image_path がその場所を示します。保存先は --output で指定できます。正確な数値は、画像ではなく chart get-data で読みます。

<a id="trouble"></a>

## トラブルシューティング

| 表示される内容 | 対処 |
| --- | --- |
| may_be_stale の警告が出る | 画像が、データの更新より古い可能性があります。最新の数値は chart get-data で確認します。警告は標準エラーに出ます。 |
| Run "expl server login". | サインインしていないか、トークンが拒否されています。expl server login を実行します。 |

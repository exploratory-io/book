# expl server chart get-image

Get a chart as a PNG image, to see its shape, trend and layout.

<a id="examples"></a>

## Examples

### Get a chart image

**Terminal**

```sh
expl server chart get-image <id> --chart <chart> --json
```

Replace \<id\> with the id of the note and \<chart\> with a chart name from the result of fetch.

The result below was run on the chart iJ6kL7mN (sales trend) in the dashboard dE5fG6hI7j. The image_path line (where the image is saved) is left out. A chart published without a stored image returns NOT_FOUND ("This chart has no stored image"); use chart get-data for it.

**Result**

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

## Usage

```text
expl server chart get-image <id> [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--id` | string | Required | The id of the note, dashboard or slide that holds the chart, or of a chart published on its own. Write it right after the command or pass it with --id. |
| `--chart` | string |  | The name of a chart inside a note, dashboard or slide. It is metadata.charts\[\].name in the result of fetch. |

<a id="paging"></a>

## More results

There is no paging.

<a id="output"></a>

## Output

The image is the one saved when the item was published; it is not drawn again, so it can be older than the data. Check result.image.may_be_stale. The image is saved on the computer that runs expl, and image_path in the result gives the location. Use --output to choose where to save it. Read exact numbers with chart get-data, not from the image.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| A may_be_stale warning appears | The image may be older than the latest data update. Check the latest numbers with chart get-data. The warning is printed to standard error. |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |

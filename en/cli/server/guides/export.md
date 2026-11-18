---
title: "Save results to a file"
---

Save the result of a filter or aggregation on a data item as a CSV or Parquet file, and get a download link.

<a id="steps"></a>

## Save to a file

dataframe export filters and aggregates with the same inputs as dataset query and saves the result as a file. Use it when the result is too large for dataset query.

```sh
expl server dataframe export <dataset_id> --mode rows --limit 5 --json
```

Replace \<dataset_id\> with the id of a data item. The result below was run on the data Sales Orders (id hI6jK7lM8n). The download_url line (the download link) is trimmed, so the JSON below is an excerpt, not a complete JSON.

**Result**

```text
{
  "success": true,
  "item": {
    "id": "hI6jK7lM8n",
    "type": "data",
    "title": "Sales Orders"
  },
  "summary": "Saved 5 rows (0.0 MB, CSV). The link expires at 2026-11-12T11:01:46.125Z.",
  "result": {
    "format": "csv",
    "rows": 5,
    "bytes": 687,
    "source": "full",
    "dataset_version": "20261112T092646Z-72836d02",
    "data_as_of": "2026-11-12T08:12:13.528Z",
    "expires_at": "2026-11-12T11:01:46.125Z",
… (trimmed)
    "query": {
      "mode": "rows",
      "limit": 5
    }
  },
  "warnings": [],
  "url": "https://exploratory.io/data/aB3cD4eF5g/hI6jK7lM8n"
}
```

The download link expires in 15 minutes and works only for the same signed-in user. Choose the format with `--format`. The default is csv (UTF-8 with BOM, which opens correctly in Excel). Use `--output` to choose where to save the file.

The example above creates the file on the server and returns a download link. Nothing is saved on your computer. To save it on your computer, add `--output`:

```sh
expl server dataframe export <dataset_id> --mode rows --limit 5 --output rows.csv --json
```

When the file is saved, the result shows saved (the path) and bytes.

> If result shows rows and expires_at, the file is saved on the server. If saved and bytes are shown, it is saved on your computer too.

<a id="egress"></a>

## When downloading is not allowed

For data whose publisher does not allow downloading it as a file, dataframe export fails with DATA_EGRESS_LIMIT.

```sh
expl server dataframe export <dataset_id> --mode rows --limit 5 --json
```

The result below was run on the data with the id US-Home-Sales-1963-2016-gH3iJ4kL5m.

**Result**

```text
{
  "success": false,
  "error_code": "DATA_EGRESS_LIMIT",
  "message": "The publisher does not allow downloading this data as a file.",
  "details": {
    "url": "https://exploratory.io/data/aB3cD4eF5g/US-Home-Sales-1963-2016-gH3iJ4kL5m"
  },
  "suggested_actions": [
    "Use fetch or dataframe_get_schema for what the publisher shares",
    "Ask the user to open the URL in the browser"
  ]
}
```

In this case, use fetch or dataframe get-schema for what the publisher shares, or open the URL in the browser.

A message can name a tool, such as dataframe_get_schema. Run expl server tools describe \<tool_name\> to see the command for that tool.

> If error_code is DATA_EGRESS_LIMIT, this data cannot be saved as a file.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| DATA_EGRESS_LIMIT | The publisher does not allow downloading this data as a file. Use fetch or dataframe get-schema for what the publisher shares, or open the URL in the browser. |
| SERVER_BUSY | Another export of yours is running, or you reached the hourly export limit. One export can run at a time per user. Try again in a few seconds; for the hourly limit, wait up to an hour. |
| `Run "expl server login".` | You are not signed in, or the saved login or API key was rejected. Run expl server login. |

Every flag is described in [dataframe export](/en/cli/server/commands#dataframe-export), and how to filter and aggregate in [dataset query](/en/cli/server/commands#dataset-query).

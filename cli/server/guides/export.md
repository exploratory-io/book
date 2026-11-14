# Save results to a file

Save the result of a filter or aggregation on a data item as a CSV or Parquet file, and get a download link.

<a id="steps"></a>

## Two steps

### 1. Save to a file

dataframe export filters and aggregates with the same inputs as dataset query and saves the result as a file. Use it when the result is too large for dataset query.

```sh
expl server dataframe export <dataset_id> --mode rows --limit 5 --json
```

Replace \<dataset_id\> with the id of a data item. The result below was run on the data Sales Orders (id llS6nQK3aH). The download_url line (the download link) is trimmed.

**Result**

```text
{
  "success": true,
  "item": {
    "id": "llS6nQK3aH",
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
  "url": "https://exploratory.io/data/GMq1Qom5tS/llS6nQK3aH"
}
```

The download link expires in 15 minutes and works only for the same signed-in user. Choose the format with --format. The default is csv (UTF-8 with BOM, which opens correctly in Excel). Use --output to choose where to save the file.

> If result shows rows and expires_at, the file is saved.

### 2. When downloading is not allowed

For data whose publisher does not allow downloading it as a file, dataframe export fails with DATA_EGRESS_LIMIT.

```sh
expl server dataframe export <dataset_id> --mode rows --limit 5 --json
```

The result below was run on the data with the id US-Home-Sales-1963-2016-rdf5jJK9vj.

**Result**

```text
{
  "success": false,
  "error_code": "DATA_EGRESS_LIMIT",
  "message": "The publisher does not allow downloading this data as a file.",
  "details": {
    "url": "https://exploratory.io/data/GMq1Qom5tS/US-Home-Sales-1963-2016-rdf5jJK9vj"
  },
  "suggested_actions": [
    "Use fetch or dataframe_get_schema for what the publisher shares",
    "Ask the user to open the URL in the browser"
  ]
}
```

In this case, use fetch or dataframe get-schema for what the publisher shares, or open the URL in the browser.

> If error_code is DATA_EGRESS_LIMIT, this data cannot be saved as a file.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| DATA_EGRESS_LIMIT | The publisher does not allow downloading this data as a file. Use fetch or dataframe get-schema for what the publisher shares, or open the URL in the browser. |
| SERVER_BUSY | Another export of yours is running, or you reached the hourly export limit. One export can run at a time per user. Try again in a few seconds; for the hourly limit, wait up to an hour. |
| Run "expl server login". | Sign-in is missing, or the saved login or API key was rejected. Run expl server login. |

- [dataframe export](../dataframe-export.md) - Describes every flag.
- [dataset query](../dataset-query.md) - Describes how to filter and aggregate.

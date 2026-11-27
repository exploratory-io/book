---
title: "Read notes"
---

Find a published note, read its text and get the numbers of its charts.

<a id="search"></a>

## Search

Write the search words right after the command. The result is a table for people; `--json` prints JSON.

```sh
expl server search "sales" --limit 3 --json
```

`--limit` sets the maximum number of results, up to 50.

To list your own content, leave the search words empty and add `--scope` mine.

```sh
expl server search "" --scope mine --limit 50 --json
```

When has_more in the result is true, there are more results. Pass next_offset to `--offset` to get the next page.

<a id="id"></a>

## Find the id

Each item in the search result has an id and a URL. Pass the id to fetch and the other commands. Use the URL to point a person to the content.

<a id="read"></a>

## Read the text

```sh
expl server fetch <id> --json
```

Replace \<id\> with an id from the search result. The result below was run on the dashboard Sales Orders Dashboard (id pQ9rS0tU1v). Total Sales (440,826,130) is the value of the Total Sales Number chart. Long output is trimmed.

**Result**

```text
{
  "id": "pQ9rS0tU1v",
  "title": "Sales Orders Dashboard",
  "text": "# Sales Orders Dashboard\n\n### Total Sales\n\n**Chart: Total Sales** (chart: `cD4eF5gH`, type: singlevalue)\n\nValues: sum of sales\n\n| sales |\n| --- |\n| 440826130 |…,
  "url": "https://exploratory.io/dashboard/aB3cD4eF5g/pQ9rS0tU1v",
  "metadata": {
    … (trimmed),
    "charts": [
      {
        "name": "cD4eF5gH",
        "title": "Total Sales",
        "type": "singlevalue",
        "values": [
          {
            "column": "sales",
            "label": "sales",
            "aggregation": "sum"
          }
        ],
        "row_count": 1,
        "queryable": true
      },
      … (trimmed)
    ],
    "context": {
      "publication_version": "2026-11-12T08:22:40.602Z",
      "data_as_of": "2026-11-12T08:13:36.612Z",
      "parameters": null,
      "dashboard_filters": "none"
    },
    "type": "dashboard",
    "author": "Alex Kim",
    "team": null,
    "created_at": "2026-11-12T08:13:36.316Z",
    "updated_at": "2026-11-12T08:22:40.602Z",
    "refreshed_at": "2026-11-12T08:13:36.612Z",
    "tags": [],
    … (trimmed)
  }
}
```

A note, dashboard or slide returns its text, the first rows of each embedded chart and the explanation of each analytics. The list of headings is in metadata.toc when the note is long enough to return one.

<a id="long"></a>

## Read a long note

You do not have to read a long note in full. To read one heading, pass a heading id from metadata.toc to `--section`.

```sh
expl server fetch <id> --section s2 --json
```

Replace s2 with a heading id from metadata.toc. If metadata.toc is not returned, add `--include-toc` to the command, or search with `--query` first and use a heading id shown in the result.

To find a topic, pass words to `--query`. It returns the paragraphs that contain any of the space-separated words, each with its heading path.

```sh
expl server fetch <id> --query "sales forecast" --json
```

When a long note is cut off, pass the value of metadata.range.next_cursor to `--cursor` to read on.

<a id="charts"></a>

## Get the numbers of a chart

The names of the charts in a note or dashboard are in metadata.charts in the result of fetch. Pass a name to `--chart` to get the numbers of that chart.

```sh
expl server chart get-data <id> --chart <chart> --limit 5 --json
```

Replace \<id\> with the id of the note and \<chart\> with the chart name. The result below is for the chart qR0sT1uV (Monthly Sales Trend) in the dashboard with the id pQ9rS0tU1v. Long output is trimmed.

**Result**

```text
{
  "success": true,
  "item": {
    "id": "pQ9rS0tU1v",
    "type": "dashboard",
    "title": "Sales Orders Dashboard"
  },
  "summary": "Returned 5 of 22 rows of chart \"Monthly Sales Trend\".",
  "result": {
    "chart": {
      "name": "qR0sT1uV",
      "title": "Monthly Sales Trend",
      "type": "line",
      "data_granularity": "aggregated",
      "encoding": [
        {
          "role": "x",
          "column": "order_date",
          "label": "order_date",
          "aggregation": "monthname_with_year",
          "csv_column": "order_date"
        },
        {
          "role": "y",
          "column": "sales",
          "label": "sales",
          "aggregation": "sum",
          "csv_column": "sales"
        }
      ],
      "filters": [],
      "filter_logic": "and",
      "unsupported": []
    },
    "context": {
      "publication_version": "2026-11-12T08:22:40.602Z",
      "data_as_of": "2026-11-12T08:13:36.612Z",
      "parameters": null,
      "dashboard_filters": "none"
    },
    "data_shared": true,
    "columns": [
      "order_date",
      "sales"
    ],
    "rows": [
      [
        "2025-01",
        17994220
      ],
      [
        "2025-02",
        14191900
      ],
      [
        "2025-03",
        20790580
      ],
      [
        "2025-04",
        20476270
      ],
      [
        "2025-05",
        16507690
      ]
    ],
    "offset": 0,
    "returned": 5,
    "has_more": true,
    "row_count": 22
… (trimmed)
```

The result explains the numbers (aggregation, filters, parameter values and the data date). Pass this on when you report the numbers.

To see the shape of a chart, get its image. The image is the one saved at publish time and can be older than the data. Read exact numbers with chart get-data, not from the image.

```sh
expl server chart get-image <id> --chart <chart> --json
```

To get the result of an analytics, pass its name from metadata.blocks in the result of fetch to `--analytics`.

```sh
expl server analytics get-result <id> --analytics <analytics> --limit 3 --json
```

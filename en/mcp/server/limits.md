---
title: "Limits and errors"
---

What it cannot do, how to read the numbers, the limits, and what to do about errors.

<a id="cannot"></a>

## What it does not do

- Create, edit, publish or delete content other than Pages you or your team own.
- Recompute a chart or analytics for parameter values other than the published ones.
- Read content that is not published to Exploratory Server, such as projects that exist only in Exploratory Desktop. Use the separate [Desktop MCP](/en/mcp/desktop) for those.

<a id="numbers"></a>

## Numbers and their conditions

- Numbers are the values as published.
- A chart published on its own returns a sample of the rows it was drawn from (up to 10,000), not aggregated values. Do not add the rows up as a total.
- A viewer who changes parameters in the browser sees different results. MCP does not return those results.
- Each chart and analytics result states the conditions of its computation: the aggregation, the chart filters, context.parameters and context.data_as_of.
- query_dataset returns dataset.version and dataset.updated_at.

<a id="limits"></a>

## Limits

| Item | Limit |
| --- | --- |
| query_dataset: rows | Up to 1,000 rows (needs columns) |
| query_dataset: aggregate | Up to 500 rows |
| dataframe_preview, chart_get_data | Up to 100 rows per call |
| query_dataset: queries | Up to 5 per call |
| chart_query: queries | Up to 10 per call (the default; an on-premises server can change it) |
| Data items in a join | 2 to 5 |
| A metric alias | Starts with a letter or _; ASCII letters, digits and _ only. Japanese is not allowed |
| A dataset alias in a join | Lowercase, up to 16 characters |
| dataframe_export | The link is valid for 15 minutes. One export at a time per user. The number of exports per hour is limited |
| A chart published on its own | A sample of the rows it was drawn from (up to 10,000), not the values of the whole chart; 100 rows per call |

<a id="errors"></a>

## Errors and what to do

A tool that fails returns a result with isError: true and a JSON body. The body has error_code and message, and sometimes url and details. For a bad argument, details.field names the argument.

| error_code | What to do |
| --- | --- |
| NOT_FOUND | The content does not exist or you cannot view it. Open its URL in your browser and check whether the same account can view it. If not, ask the owner to check the sharing settings |
| CHANNEL_DISABLED | The publisher turned off MCP access for this content. Ask the publisher to check the MCP access setting of the content |
| DATA_EGRESS_LIMIT | The publisher does not share the rows of this data. Use its charts, analytics or summary instead |
| PERSONALIZED_CONTENT | The content shows different data to each viewer. Open its URL in the browser |
| CONTENT_UPDATING | The content is being republished. Try again in a few seconds |
| UNSUPPORTED_OPERATION | The content cannot be read this way (for example, data with no queryable source). Check which operations the content supports, and ask for a form it does support, such as its charts or summary |
| INVALID_PARAMETER | Fix the argument named in details.field |
| RESULT_TOO_LARGE | The result is too large. Add filters, select fewer columns, or aggregate |
| SERVER_BUSY | The server is busy, another export of yours is running, or you reached the hourly export limit. See below |

For SERVER_BUSY:

- Try again in a few seconds.
- If it happens twice in a row, stop and try again later.
- For the hourly export limit, wait up to an hour.

query_dataset and chart_query report a bad query differently. They return error.code, error.message, error.field and error.retryable, with their own codes. chart_query adds CHART_NOT_FOUND, CHART_DATA_UNAVAILABLE (the reason is in error.reason: no_data, too_large or updating) and CHART_UNPIVOT_UNAVAILABLE. For example:

- DATASET_NOT_FOUND
- ACCESS_DENIED
- CHANNEL_DISABLED
- DATASET_ACCESS_DENIED (joins)
- DATASET_NOT_QUERYABLE
- INVALID_COLUMN
- INVALID_FILTER
- AMBIGUOUS_COLUMN
- JOIN_TYPE_MISMATCH
- QUERY_LIMIT_EXCEEDED
- QUERY_TIMEOUT

When the query engine is busy, it returns RATE_LIMIT_EXCEEDED or QUERY_ENGINE_UNAVAILABLE. Try again in a few seconds. When result.has_more is true, narrow the filters, aggregate, or use dataframe_export.

The Page tools return the same error.code shape. The main codes:

- PAGES_NOT_ALLOWED: Pages are not enabled on this server, or your plan cannot publish or change Pages
- MAX_NUM_OF_PAGES_EXCEEDED: you reached your plan's number of Pages. Delete a Page or change your plan
- MAX_STORAGE_SIZE_EXCEEDED: your plan's storage is full
- PAGE_HTML_REJECTED: the HTML breaks a rule of get_page_guide. Fix what error.message names

Calling page_publish, page_update or page_delete on a connection without page:write returns error_code INSUFFICIENT_SCOPE. For a browser sign-in, disconnect and connect again. An API key cannot write Pages.

dataframe_export uses error_code like the other tools. For a bad query, it returns INVALID_PARAMETER. The query's own code is in details.code.

<a id="rate"></a>

## Rate limit

If you send more than 120 requests in a minute, you get HTTP 429 with RATE_LIMITED. Wait one minute.

If one address sends more than 30 refused API keys within 15 minutes (counted per IPv4 address, or per IPv6 /64 range), you get HTTP 429 with the message "Too many failed API key attempts. Try again later." A valid key is not counted. Fix the key and try again later.

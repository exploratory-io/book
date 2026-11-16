# Examples

Examples of what to ask your AI, with the tools it uses and a few tips.

<a id="find"></a>

## Find data

```text
Find the "Sales Orders" data on Exploratory.
```

The AI calls search with scope: "all" and shows the matching data with its URL. To read one, it calls fetch with the id.

<a id="data"></a>

## Aggregate data

```text
What columns does the "Sales Orders" data on Exploratory have, and which 5 regions have the highest sales?
```

Describe the data and your question. The AI checks the columns and aggregation rules before calculating. Review the calculation conditions (aggregation, filters) and the data date alongside the result.

<a id="chart"></a>

## Get the numbers of a chart

```text
Tell me the numbers of the chart "Monthly Sales Trend" in the dashboard "Sales Orders Dashboard".
```

The AI looks up the chart name in the dashboard and gets the numbers. For charts in notes, dashboards and slides, it can also filter, sort or aggregate them with chart_query. The numbers are the values as published.

To run the same operations from a terminal, see [Exploratory CLI](../../cli/server/server.md).

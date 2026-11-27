---
title: "Use the Data Catalog"
sidebarTitle: "Use"
description: "The three ways to use published data (import into Desktop, the server screen, and AI) and how to choose between them."
---

Data you publish to the Data Catalog can be used in three ways. The same data can be imported into Desktop by an analyst, checked in the browser by the team, and queried by an AI agent.

| Way | Where | What you can do | Page |
| --- | --- | --- | --- |
| Import into Desktop | Exploratory Desktop | Filter, choose columns, join, and aggregate, then import as a data frame. After importing, "Update" reloads the latest data | [Import](/en/data-catalog/import) |
| Server screen | exploratory.io (browser) | Find data in the list and check its contents in Summary, Table, wrangling steps, and the access log. Set access from MCP and the API | [Server screen](/en/data-catalog/server-ui) |
| AI | AI tools such as Claude (MCP) | Ask questions about the data and get aggregated answers. Have the AI import server data into a Desktop project | [Use it with AI](/en/data-catalog/ai) |

## Which one to use

**To keep analyzing on your own, import into Desktop.** You can narrow the rows and columns and join other data before importing, so the project holds only what you need. For example, from the Sales Analysis data you can take only the 2025 EC orders, join Products, and import monthly sales by category.

**To share and manage data with the team, use the server screen.** Anyone can check the contents and the wrangling steps in the browser without Desktop. The access log shows who accessed the data and when.

**To get answers to questions, use AI.** When you ask something like "What were 2025 sales by region?", the AI aggregates the data on the server and answers from the result. Because the AI reads the approved semantic information (what each column means and how to aggregate it), it is less likely to, for example, average a column that should be summed. See [Semantic information](/en/data-catalog/semantics) for how to create it.

## Before you start

For any of these, publish the data to the Data Catalog first. The server screen and AI need the data to be published to the server. Data published only locally can be used from Desktop and the Desktop MCP on this PC. See [Publish](/en/data-catalog/publish) for the steps.

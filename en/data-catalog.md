---
title: "Data Catalog"
sidebarTitle: "Data Catalog"
description: "Find the data you have published in one list, import it into other projects, refresh it on a schedule, and use it from AI agents."
---

The Data Catalog is a place to keep published data together, find it, and reuse it. If you set a refresh schedule, the data is refreshed at the times you set. AI agents can also find it. The Data Catalog was added in Exploratory v17.

The Data Catalog offers four values.

- **Prepare**: Publish data that a person has checked, with its wrangling steps kept
- **Understand**: Tell AI what the data means and what its business rules are, with semantics
- **Access**: Get only the data you need with queries
- **Control**: Manage MCP access for each data item, and check usage in the access log

There are two kinds of Data Catalog.

- **Server**: Data published to Exploratory Server (exploratory.io). You can share it with your team members
- **Local**: Data saved on this PC. You can list, search, refresh on a schedule, and use it from AI agents without putting it on the server

You register data in both from the publish dialog of a data frame.

For details, see these pages.

- [Publish to the Data Catalog](/en/data-catalog/publish)
- [Local Data Catalog](/en/data-catalog/local)
- [Import from the Data Catalog](/en/data-catalog/import)
- [Server Data Catalog and AI](/en/data-catalog/server)

## If Something Goes Wrong

- **It does not appear in the catalog**: Check that the account you are signed in with is the same one you published with. On the server, it appears after publishing succeeds. Also check that the progress panel has finished
- **There is no "Generate / improve with AI" button, or you get an error when you click it**: Only the data owner can edit semantics. It also does not work when the AI feature is off on the server, or when you have not agreed to the terms of use of the AI feature. Ask the owner or the server administrator

## Getting Started Guide

A note explains the steps with screenshots, from publishing to using the data from the server MCP and the Desktop MCP. See [Getting Started: Data Catalog](https://exploratory.io/note/exploratory/Getting-Started-Data-Catalog-ypQ4SEG4). The ideas behind the Data Catalog are explained in [Introduction to Exploratory Data Catalog - Built for Humans and AI Agents](https://exploratory.io/note/kanaugust/uTX9WoA2tT).

## Server and Local

| | Server | Local |
| --- | --- | --- |
| Where it is stored | Exploratory Server | This PC |
| Sharing | Shareable with team members | This PC only |
| What search covers (import dialog) | Name, description, tags, author | Name, description, tags, columns |
| Refresh schedule | Runs on the server | Runs on this PC (even when the app is closed, if registered with the OS) |

On the "Server" tab of the import dialog, you can browse server data by "Owned by Me", "Owned by Team", and "Shared with Me". For publishing steps and sharing settings, see [Sharing Data](/en/share/data).

---
title: "Import from the Data Catalog (Desktop)"
sidebarTitle: "Import"
description: "How to bring catalog data into a Desktop project as a data frame while filtering, choosing columns, joining, and aggregating."
---

In the "Import from Data Catalog" dialog, you can do more than bring published data in as it is. Before importing, you can filter it, join it with other data, and aggregate it. Server data and local data are handled on the same screen.

## Open the dialog

1. Open the project to import into
2. Click the "+" next to the "Data Frames" heading in the left pane
3. In the menu that opens, choose "Data Catalog"
4. At the top of the "Import from Data Catalog" dialog, choose the "Server" or "Local" tab, depending on where the data is

In the next image, ❶ is the "+" of step 2, and ❷ is "Data Catalog" of step 3.

![](images/en/dc-import-menu.png)

"Server" is the data catalog of Exploratory Server, and "Local" is the data catalog on this PC. The "Local" tab shows how many data items it holds. The tab you opened last is used the next time you open the dialog. In the image, the "Local" tab lists three data items: "Orders", "Products" and "Customers". "Orders", which is already imported, is marked "Imported". In the image, ❶ is the "Server" and "Local" tabs, and ❷ is the name of the data to import (Orders).

![](images/en/dc-import-dialog.png)

To replace the original data of an existing data frame with catalog data, switch the data source of that data frame. The dialog is then titled "Replace Data Source with Data Catalog", and the import button is "Replace".

## Search and choose the data

- **Server**: Search by name, description, tags, and author in the search box. The default sort is "Most relevant". You can browse by "Owned by Me", "Owned by Team", and "Shared with Me"
- **Local**: Search by name, description, tags, and columns in the search box. Matching tags and columns appear under the data name. You can sort by updated date or name. Data you have already imported is marked "Imported"

Click a data name to switch to a dialog that shows the contents of that data. Click "‹" at the top left to return to the list.

On the Local tab, the following data cannot be imported. The dialog shows the reason.

- Data whose full data is not saved: Publish it again from the original project
- Data whose last update failed: Fix the cause and update it again

## Check the contents

When you choose data, the screen switches to one that shows the contents of the data in the "Table". You can switch the view with "Table" and "Aggregate" at the top. At the bottom, a sentence says how many rows will be imported, for example, with 50,000 rows, "Import 50,000 rows of data." The sentence changes when you set filters, choose columns, join, or aggregate.

## Filter the rows

1. Click "+ Filter" above the table
2. In the "Column" box that opens, choose a column from "Select a column..."
3. Set the condition to match the column you chose
4. The filters you add are listed above the table. "Clear all" removes all the filters at once

In the image, ❶ is the "+ Filter" button of step 1, and ❷ is the "Select a column..." box of step 2.

![](images/en/dc-import-filter-add.png)

Only the rows that match are imported. The note at the bottom becomes "Import 9,135 rows that match the filter."

The next image shows an example with two filters, "order_date: 2025-01-01 to 2025-12-31" and "channel: EC", that narrow 50,000 rows to 9,135. In the image, ❶ is the "+ Filter" button, and ❷ is the filters you added with "Clear all".

![](images/en/dc-import-filter.png)

The following filters cannot be used for import. In that case, remove the filter, or filter in a step after importing.

- A filter on a duration column, or a text comparison by order (greater than or less than)
- A filter that uses a parameter that does not exist in the project (create the parameter, or change the filter)

## Choose the columns

1. Click "Columns" above the table. After you choose 5 of the 13 columns, it changes to "Columns 5/13"
2. Check the columns to import. The search box narrows the column names. "Select all" and "Clear all" are also available

The image shows a state where 5 of the 13 columns are chosen. "sales" is typed in the search box, and the "sales" column is chosen. In the image, ❶ is the "Columns" button and ❷ is the check mark of the chosen "sales" column.

Only the chosen columns are imported. The note at the bottom becomes, for example, "Import all 50,000 rows, with 5 of 13 columns." When a filter is also set, it becomes "Import 9,135 rows that match the filter, with 5 of 13 columns." At least one column must stay selected. A column used as a join key cannot be removed.

![](images/en/dc-import-columns.png)

## Join other catalog data

A join connects columns of other data in the Data Catalog to the data you import, by key.

1. Click "Join data" above the table

In the image, ❶ is the "Join data" button.

![](images/en/dc-import-join-open.png)

2. In the "Join data to “Orders”" dialog, choose the "Data to join". You can search with "Search the data catalog". "Data with a common column" is listed first
3. Under "Key columns", choose a column on each side. "Add a key" adds more keys. When the key types differ, a note says they are compared as text
4. Under "Rows with no match", choose how to keep rows. "Keep all rows of Orders" (a left join) keeps rows with no partner, and the joined columns are empty. "Keep only rows found in both" (an inner join) keeps only rows whose key is found in both data
5. In the "Data to join: “Products”" section, you can choose the columns, filters, and aggregation of the data to join, before joining
6. Check the match rate and the number of rows after the join at the bottom of the screen, then click "Join". In the image, it reads "100% of Orders (9,135 rows) found a match in Products · 9,135 rows after the join"

The next image shows the dialog that joins "Products" to "Orders" with product_id as the key, before you click "Join". The numbers match the steps as follows.

- Pink ❶: the "Data to join" (Products) of step 2
- Green ① on the screen: "Key columns" of step 3
- Green ② on the screen: "Rows with no match" of step 4
- Green ③ on the screen: "Data to join: “Products”" of step 5
- Pink ❷: the match rate and the "Join" button of step 6

![](images/en/dc-import-join.png)

After joining, "Steps" appears on the left of the screen and lists the original data and the join step. The pencil icon on the join step changes the join settings.

When few rows match, or when duplicate keys make the rows grow, the screen shows a warning. If the rows grow, first aggregate the data to join by the key. Then the row count stays the same.

When you import with a join, the note at the bottom becomes "Import 9,135 rows, joined from Products." The data to join must also have its full data saved.

## Aggregate and import

An aggregation puts each group into one row before importing.

1. Above the table, switch from "Table" to "Aggregate"
2. Put the columns to group by in "Group by". For a date or date-time column, you can choose a time unit (day, week, month, quarter, year)
3. Put the columns to aggregate in "Values" and choose the function. The functions are Count, Sum (Total), Mean (Average), Median, Min, Max, Unique Count, and Standard Deviation

For example, grouping by "region" gives 8 rows (one per group), as in the image. In the image, ❶ is the column put in "Group by" (region) in step 2, and ❷ is the list of functions for "Values" in step 3.

![](images/en/dc-import-aggregate-setup.png)

The aggregation covers the rows left after filtering. In this example, the note at the bottom becomes "Import 8 rows (one per group) of the summary. Totals and subtotals are not imported."

The next image shows an example that groups the joined data by "category" and "order_date" (by month) and totals "sales" with Sum. When you aggregate joined data, the note at the bottom becomes "Import 60 rows (one per group), aggregated from Orders + Products." In the image, ❶ is the switch to "Aggregate" in step 1, and ❷ is the "Group by" and "Values" boxes in steps 2 and 3.

![](images/en/dc-import-aggregate.png)

An aggregation that has columns (a pivot table) cannot be imported. In that case, remove the columns from "Columns".

## Import

1. Check the settings and click "Import"

In the image, ❶ is the "Import" button.

![](images/en/dc-import-button.png)

2. In the "Create Data Frame" dialog, enter a name for the data frame and click "Create"

In the image, ❶ is the name box (the example uses "2025 EC Monthly Sales by Category") and ❷ is the "Create" button.

![](images/en/dc-import-name.png)

The imported data is added to the project as a data frame. It appears in the Steps panel on the right as a "Data Catalog" step, as the image shows. The image is an example where a data frame of 60 rows and 3 columns (category, order_date, sales) was created, and ❶ is the "Data Catalog" step added to the Steps panel.

![](images/en/dc-import-result.png)

## Update after importing

1. Select the imported data frame, and click the "Data Catalog" step in the Steps panel on the right to open it
2. In the dialog that opens, click "Update"

"Update" reads the latest data again with the same filters, columns, joins, and aggregation. The dialog lists the steps of the import on the left (Orders, Join “Products”) and the aggregation settings on the right. In the image, ❶ is the "Update" button.

![](images/en/dc-import-update.png)

To ask an AI that is connected to the Desktop MCP to import the data, see [Use it with AI](/en/data-catalog/ai).

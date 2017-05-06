# Bind Rows
Bind multiple data frames by row.

## How to Access This Feature

### From + (plus) Button
![](images/command-bind-rows-df-menu.png)

* Click "+" button and select "Other" - > "Bind ..." -> "Rows"

## Bind multiple data frames by row

![](images/bind_rows.png)

1. Select Data Frames that you want to bind.
2. Column Name for Data Frame ID - Data frames identifier. When .id is supplied, a new column of identifiers is created to link each row to its original data frame. The labels are taken from the named arguments to bind_rows(). When a list of data frames is supplied, the labels are taken from the names of the list. If no names are found a numeric sequence is used instead.

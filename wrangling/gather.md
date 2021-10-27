# Gather (Unpivot)

Takes multiple columns and collapses into key-value pairs, duplicating all other columns as needed.

## How to Access This Feature

## From + (plus) Button
![](images/command-gather-df-menu.png)
* Click "+" button and select "Gather".

### From Column Menu
![](images/command-gather-column-menu.png)

* You can also select columns to gather first, and then select "Gather (Unpivot)" from the column menu of one of the selected columns.

## Gather (Unpivot) Columns into Key/Value Column Pair

![](images/gather.png)


1. Select Columns to Gather
  * Select "Include" or "Exclude" depending on whether you are specifying the columns to gather or the columns not to gather.
  * Select the rule for specifying the columns.
  * Fill the rest of parameters in "Select Column" section.

2. Specify names of Key/Value Columns to create by typing the names in "Key Column" and "Value Column" text fields.
3. Specify parameters in the "Parameters" section.
  * Remove NA - Select TRUE to remove NA rows from the result
  * Guess column data type - Select TRUE to automatically guess the most possible data type for the key column.
4. Click "Run" to gather columns into key/value column pair.

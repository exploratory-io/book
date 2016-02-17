# Nest

Nest a set of columns together as a list column.  

**Syntax**  
nest(```<column(s)>``` [, .key = ```<text>```])

**Arguments**  
- .key - set a name for a newly created column to hold the list.

### Example

#### Sample Data  

year | product | type | sales
-----|---------|------|------
2013 | iPhone  |    5 |   100
2013 |   iPad  | mini |    50
2015 | iPhone  |    6 |   200

This will create a new column that is a list of data frames and each row of the data frame holds 'product', 'type', 'sales' values.
```
nest(product, type, sales, .key = a)  
```
Result:

year | a |
-----|---------|
2013 | list()  |
2015 | list()  |


# Unnest

Unnest a list column or a list of data frames by making each element of the list to be presented in its own row.

**Syntax**  
unnest(```<column(s)>``` [, .drop = ```<logical>```])

**Arguments**  
- .drop - set whether addtional list columns to be dropped or not.

### Example

#### Sample Data with a list column

|issue_id |assignee |
|---------|-------- |
|720      |   list(Kan, Kei)|
|721      |   list(Kan, Marie, Simon)|

Unnest 'assignee' column which is a list. This will give each value of the list its own row.
```
unnest() or unnest(assignee)  
```
Result: 

|issue_id |assignee |
|---------|-------- |
|720      |   Kan   |
|720      |   Kei   |
|721      |   Kan   |
|721      |   Marie   |
|721      |   Simon   |

#### Sample Data with a list of Data Frames:

|issue_id |assignee |
|---------|-------- |
|720      |   list(name = Kan, id = 105, country = US )|
|721      |   list(name = Kei, id = 106, country = Japan )|

Unnest 'assignee' column which is a list of data frames. This will create columns for each column of the nested data frame.

```
unnest()   
```
Result: 

|issue_id | name | id | country |
|---------|------|----|---------|
|720      |   Kan| 105|   US    |
|721      |   Kei| 106|   Japan    |
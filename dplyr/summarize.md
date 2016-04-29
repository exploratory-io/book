# Summarize - Aggregate

Summarize multiple values to a single value. Make sure you have grouped the data set using group_by() already.

**Syntax**  

summarize(```<new_column>``` = ```<aggregate_expression>```, ...)  


**Example**  

Create a new column 'avg' to store average values of 'revenue' for each group.
```
summarise(avg = mean(revenue))  
```

Create new columns 'avg' for 'average of revenue' and 'total' for 'sum of revenue' for each group.

```
summarize(avg = mean(revenue), total = sum(revenue))  
```
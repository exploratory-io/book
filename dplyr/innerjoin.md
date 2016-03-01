# Inner Join

Return all rows from the current data set where there are matching values in the current, and all columns from the current and the target.

**Syntax**  

- inner_join(```<data_set>```, [by = "```<column(s)>```"])  
- inner_join(```<data_set>```, [by = c("```<source_column>```" = "```<target_column>```")])

**Arguments**  

- by - Set either a common column name or different column names from each data set to join them.

**Example**  

Join with AIRPORT data set using all variables with common names.

```
inner_join(AIRPORT)  
```

Join with AIRPORT data set using CODE columns.
```
inner_join(AIRPORT, by = "CODE")  
```

Join with AIRPORT data set using DEST column from the original data set and CODE from the target.
```
inner_join(AIRPORT, by = c("DEST" = "CODE")  
```


Now, just for a sake of understanding of what are the other join types, we can try ```inner_join()``` and ```full_join()``` commands.

First, ```inner_join()``` command.

```
inner_join(carrier_lookup, by=c("CARRIER" = "code"))
```


![](images/flight-inner-join.png)

```
full_join(carrier_lookup, by=c("CARRIER" = "code"))
```

![](images/flight-full-join.png)

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

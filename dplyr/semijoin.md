# Semi Join

Return all rows from the current data set where there are matching values in the target data set, keeping just columns from the current.

**Syntax**  

- semi_join(```<data_set>```, [by = "```<column(s)>```"])  
- semi_join(```<data_set>```, [by = c("```<source_column>```" = "```<target_column>```")])

**Arguments**  

- by - Set either a common column name or different column names from each data set to join them.

**Example**  

Join with AIRPORT data set using all variables with common names.
```
semi_join(AIRPORT)  
```
Join with AIRPORT data set using CODE columns.
```
semi_join(AIRPORT, by = "CODE")  
```

Join with AIRPORT data set using DEST column from the original data set and CODE from the target.
```
semi_join(AIRPORT, by = c("DEST" = "CODE")  
```
 
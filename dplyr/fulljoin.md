# Full Join

Return all rows and all columns from both the current data set and the target data set.

**Syntax**  

- full_join(```<data_set>```, [by = "```<columns>```"])  
- full_join(```<data_set>```, [by = c("```<source_column>```" = "```<target_column>```")])

**Arguments**  

- by - Set either a common column name or different column names from each data set to join them.

**Example**  

Join with AIRPORT data set using all variables with common names.

```
full_join(AIRPORT)  
```

Join with AIRPORT data set using CODE columns.
```
full_join(AIRPORT, by = "CODE")  
```
 
Join with AIRPORT data set using DEST column from the original data set and CODE from the target.
```
full_join(AIRPORT, by = c("DEST" = "CODE")  
``` 
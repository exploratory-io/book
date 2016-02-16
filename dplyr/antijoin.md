# Anti Join

Return all rows from the current data set where there are not matching values in the target, keeping just columns from the current.

**Syntax**  

- anti_join(```<data_set>```, [by = "```<column(s)>```"])  
- anti_join(```<data_set>```, [by = c("```<source_column>```" = "```<target_column>```")])

**Arguments**  

- by - Set either a common column name or different column names from each data set to join them.

**Example**  

Join with AIRPORT data set using all variables with common names.

```
anti_join(AIRPORT)  
```

Join with AIRPORT data set using CODE columns.

``` 
anti_join(AIRPORT, by = "CODE")  
```


Join with AIRPORT data set using DEST column from the original data set and CODE from the target.

```
anti_join(AIRPORT, by = c("DEST" = "CODE")  
```

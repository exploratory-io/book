# Left Join

Return all rows from the current data set, and all columns from the current and the target. Rows in the current with no match in the target will have NA values in the new columns. If there are multiple matches between the current and the target, all the matches are returned.

**Syntax**  

- left_join(```<data_set>```, [by = "```<column(s)>```"])  
- left_join(```<data_set>```, [by = c("```<source_column>```" = "```<target_column>```")])

**Arguments**  

- by - Set either a common column name or different column names from each data set to join them.

**Example**  

Join with AIRPORT data set using all variables with common names.
```
left_join(AIRPORT)  
```

Join with AIRPORT data set using CODE columns.
```
left_join(AIRPORT, by = "CODE")  
```

Join with AIRPORT data set using DEST column from the original data set and CODE from the target.
```
left_join(AIRPORT, by = c("DEST" = "CODE")  
```

Join with AIRPORT data using DEST and MONTH columns from the original data set and CODE and MON from the target respectively.

```
left_join(AIRPORT, by = c("DEST" = "CODE", "MONTH" = "MON")  
```

 
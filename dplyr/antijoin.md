# Anti Join

Return all rows from the current data set where there are not matching values in the target, keeping just columns from the current.

**Syntax**  
anti_join(```<data_set>```, [by = "```<column(s)>```"])  
anti_join(```<data_set>```, [by = c("```<source_column>```" = "```<target_column>```")])

**Arguments**  
- by - Set either a common column name or different column names from each data set to join them.

**Example**  
anti_join(AIRPORT)  
_Join with AIRPORT data set using all variables with common names._  
anti_join(AIRPORT, by = "CODE")  
_Join with AIRPORT data set using CODE columns._  
anti_join(AIRPORT, by = c("DEST" = "CODE")  
_Join with AIRPORT data set using DEST column from the original data set and CODE from the target._  
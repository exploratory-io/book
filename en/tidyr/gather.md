# Gather (Un-Pivot)

Collapses multiple columns into key-value pairs, duplicating all other columns as needed.

**Syntax**  

gather(```<key_column_name>```, ```<value_column_name>```, ```<column(s)>```, na.rm = ```<logical>```, convert = ```<logical>```)

**Arguments**  

- key, value - Names of key and value columns to create in output.  
- na.rm - The default is FALSE. Set TRUE to remove NA rows from the result.  
- convert - The default is FALSE. Set TRUE to automatically guess the most possible data type for the key column.

**Example**  

Takes the 2nd column to the 50th column into two new columns, COUNTRY and POPULATION.

```
gather(COUNTRY, POPULATION, 2:50, na.rm = FALSE)  
```

Takes all the columns other than YEAR column into two new columns, COUNTRY and POPULATION.
```
gather(COUNTRY, POPULATION, -YEAR)  
```
# Spread

Spread a key-value pair across multiple columns. Missing values will be replaced with NA.

**Syntax**  
spread(```<key_column>```, ```<value_column>```, fill = ```<text>```, convert = ```<logical>```, drop = ```<logical>```)

**Arguments**  
- key, value - columns to spread.  
- fill - text to fill NA.
- convert - The default is FALSE. Set TRUE to automatically guess the most possible data type for the key column.   
- drop - The default is TRUE. Set FALSE to keep the levels that don’t appear in the data, filling in missing combinations with the text set with 'fill' argument.

**Example**  

Spread a COUNTRY-POPULATION pair across multiple columns of COUNTRY.
```
spread(COUNTRY, POPULATION)  
```
 
Spread a COUNTRY-POPULATION pair across multiple columns of COUNTRY, and fill with "NA" text for missing values.
```
spread(COUNTRY, POPULATION, fill = “NA")  
```
 
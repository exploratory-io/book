# Separate

Given either regular expression or a vector of character positions, separate() turns a single character column into multiple columns. It will separate by non-alphanumeric values and remove the original column by default.

**Syntax**  
separate(```<column_text_date>```, into = c("```<column_name(s)>```"), sep = ```<text>```, remove=```<logical>```, convert=```<logical>```, extra = ```"warn"("warn"|"drop"|"merge")```, fill = ```"warn"("warn"|"right"|"left")```)

**Arguments**
- into - new column names  
- sep - separating text  
- remove - The default is TRUE. Set FALSE to drop the original columns.
- convert - The default is FALSE. Set TRUE to automatically guess the most possible data type for the key column.
- extra - The default is "warn". Set "drop" to drop any text beyond the number of the new columns, "merge" to merge the text with the value in the last column.
- fill - The default is "warn". A command to controls what happens when there are not enough pieces. "warn" is the default and fills from the right. "right" fills with missing values on the right. "left" fills with missing values on the left.

**Example**  

Separates NAME column into FIRSTNAME and LASTNAME columns by non-alphanumeric values. It will drop the rest if any.
```
separate(NAME, into = c("FIRSTNAME", "LASTNAME"), extra="drop")
```

Separates NAME column into FIRSTNAME and LASTNAME columns by non-alphanumeric values. It will keep NAME column.
```
separate(NAME, into = c("FIRSTNAME", "LASTNAME"), remove = FALSE)  
```

Separates NAME column into FIRSTNAME and LASTNAME columns by non-alphanumeric values. It will merge the rest into the last column.
```
separate(NAME, into = c("FIRSTNAME", "LASTNAME"), extra="merge")  
```

Separates NAME column into FIRSTNAME and LASTNAME columns by dash "-".
```
separate(NAME, into = c("FIRSTNAME", "LASTNAME"), sep = "-")  
```
 
Separates NAME column into FIRSTNAME and LASTNAME by a position of 2.
```
separate(NAME, into = c("FIRSTNAME", "LASTNAME"), sep = 2)  
```

Separate DATE into Year, Month, and Day columns and set the data type for each column based on the heuristics.

```
separate(DATE, into = c("Y", "M", "D"), convert = TRUE)  
```

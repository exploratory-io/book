# Bind Rows

Bind multiple data sets by row.

**Syntax**  

bind_rows(```<data_set(s)>```)

**Example**  

Add a data set 'DATA2015' to the existing data.
```
bind_rows(DATA2015)  
```
 
Add rows from a data set 'DATA2014' and 'DATA2015' to the existing data.
```
bind_rows(DATA2014, DATA2015)  
```
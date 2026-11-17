# Fill

Fills missing values in using the previous entry. This is convenient especially when values are not presented in some cells to avoid duplicated entries.

**Syntax**  
fill(```<column(s)>```)

**Example**  

Fills using the previous appearing value for POPULATION column.

```
fill(POPULATION)  
```

Fills using the previous appearing value for POPULATION and PRODUCTION columns.

```
fill(POPULATION, PRODUCTION)  
```

Fills using the previous appearing value for all the columns other than UNEMPLOYMENT column.
```
fill(-UNEMPLOYMENT)  
```
 
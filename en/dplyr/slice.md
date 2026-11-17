# Slice

Select rows by positions.

**Syntax**  

- slice(```<numeric>```)  
- slice(```<numeric>:<numeric>```)  

**Arguments**  

- n - position / nth row

**Example**  

Select only the first row.

```
slice(1)   : equivalent to -> filter(row_number() == 1)  
```

Select only rows starting from the 5th to the last.

```
slice(5:n())  : equivalent to -> filter(between(row_number(), 5, n()))  
```

Select only the last row

```
slice(n())   : equivalent to -> filter(row_number() == n())  
```

Select only the last 10 rows

```
slice(n()-10:n())  
```

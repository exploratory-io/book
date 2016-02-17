# N Tile - Bucket

Breaks the column values into n buckets. Missing values are left as is.

**Syntax**  

ntile(```<column>```, ```<number>```)

**Arguments**  

- number - set number of buckets.    

**Example**  

Breaks the column values into n buckets, and create a new column to have the n value.
```
mutate(<new_column> = ntile(<column_name>, n))  
```

Breaks the column values into 4 buckets to generate quartile.
```
mutate(quartile = ntile(<column_name>, 4))  
```
 
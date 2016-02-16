# sample_n

Sample n rows from the data set.

**Syntax**  

sample_n(```<number>```)  

**Auguments**  

- n - number

**Example**  

Select 100 randomly selected rows.

```
sample_n(100)  
```

Select 100 randomly selected rows from the data with a weight on CARRIER column.

```
sample_n(100, weight = CARRIER)  
```

Select randomly selected 20% of of data.

```
sample_frac(.2)  
```

Select randomly selected 20% of of data with a weight on CARRIER column.

```
sample_frac(.2, weight = CARRIER)  
```

# Sample Fraction

Sample n fraction of rows from the data set.

**Syntax**  

sample_frac(```<number>```)

**Auguments**  

- n - number between 0 and 1.

**Example**  

Select randomly selected 20% of of data.
```
sample_frac(.2)  
```

Select randomly selected 20% of of data with a weight on CARRIER column.
```
sample_frac(.2, weight = CARRIER)  
```

__  
# Rank

- min_rank
- dense_rank
- percent_rank


## min_rank

Ranks. Ties get min rank. Missing values are left as is.

**Syntax**  

min_rank(```<column_num>```)


**Example**  

Create a new column to have the rank number based on 'population' values.
```
mutate(population_rank = min_rank(population))  
```

Select rows whose rank numbers are less 10.
```
filter(min_rank(population) < 10)  
```

## dense_rank

Ranks with no gaps. Missing values are left as is.

**Syntax**  

dense_rank(```<column_num>```)


**Example**  

Create a new column to have the rank number based on 'population' values.
```
mutate(population_rank = dense_rank(population))  
```
 
Select rows whose rank numbers are less 10.
```
filter(dense_rank(population) < 10)  
```

## percent_rank

Ranks rescaled to [0, 1]. Missing values are left as is.

**Syntax**  

percent_rank(```<column_num>```)

**Example**  

Create a new column to have the percent rank number based on 'population' values.

```
mutate(population_rank = percent_rank(population))  
```

Select rows whose percent rank numbers are less .25.
```
filter(percent_rank(population) < .25)  
```


 
# Top N

Select the top n entries based on a given measure in each group.

**Syntax**  

top_n(```<number>```, ```<column_num>```)  
top_n(```<number>```, desc(```<column_num>```))

**Arguments**  

- number - set a number for Top / Bottom N


**Example**  

Select the top 10 countries based on POPULATION, assuming the data has already been grouped by COUNTRY.
```
top_n(10, POPULATION)  
```

Select the bottom 10 countries based on POPULATION, assuming the data has already been grouped by COUNTRY.
```
top_n(10, desc(POPULATION))  
``` 
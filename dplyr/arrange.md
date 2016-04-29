# Arrange - Sort

Sort rows by given column(s).

**Syntax**  

arrange(```<column(s)>```)  


**Example**  

Sort by POPULATION values in a ascending order.
```
arrange(POPULATION)  
```

Sort by POPULATION values in a descending order.
```
arrange(desc(POPULATION))  
```

Sort by POPULATION, PRODUCTION columns in a ascending order.

```
arrange(POPULATION, PRODUCTION)  
```

Sort by POPULATION, PRODUCTION columns in both descending order.

``` 
arrange(desc(POPULATION), desc(PRODUCTION))  
```

Sort by POPULATION values in a descending order.
```
arrange(desc(POPULATION))  
```

Sort by POPULATION, PRODUCTION columns in both descending order.
``` 
arrange(desc(POPULATION), desc(PRODUCTION))  
```


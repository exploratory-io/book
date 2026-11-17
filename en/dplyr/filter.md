# Filter

Select rows with conditions.

**Syntax**  

filter(```<condition>```)

**Example**  

Keep data whose revenue is less than 6000.

```
filter(revenue < 6000)  
```

Keep data whose revenue is less than 6000 AND region is "West".

```
filter(revenue < 6000 & region == “West")  
```

Keep data whose revenue is less than 6000 OR region is "West".

```
filter(revenue < 6000 | region == “West")  
```

Keep data whose revenue is between 1000 and 6000.

```
filter(between(revenue, 1000, 6000))  
```

Keep data whose revenue is NA.

```
filter(is.na(revenue))  
```


Keep data whose revenue is NOT NA

```
filter(!is.na(revenue))  
```

Keep data whose revenue is between 1000 and 6000.

```
filter(between(revenue, 1000, 6000))  
```


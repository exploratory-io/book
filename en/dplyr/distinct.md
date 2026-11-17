# distinct


Select distinct/unique rows.

**Syntax**  

- distinct()  
- distinct(```<column(s)>```, ...)  

**Example**  

Keep only unique/distinct rows based on all the columns.

```
distinct()  
```

Keep only unique/distinct rows based on CARRIER, TAIL_NUM, FL_NUM columns.

```
distinct(CARRIER, TAIL_NUM, FL_NUM)  
```
 
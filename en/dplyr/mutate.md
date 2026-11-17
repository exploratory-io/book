# Mutate - Create Expression

Mutate creates new column(s) with given expressions and preserves existing <column(s)>. You can use transmute to create new columns while removing the original ones.

**Syntax**  

mutate(```<new_column>``` = ```<expression>```, ...)

**Example**  

Create 'profit' column based on the calculation result of 'revenue - expense'.
```
mutate(profit = revenue - expense)  
```
 
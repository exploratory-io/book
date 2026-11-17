# Extract Number

Extract only the number from a given text. This is useful for strings that are supposed to be numbers with extra formatting (e.g. $1,200.34, -12%, X1, etc.).

**Syntax**  
extract_numeric(```<column>```)

**Example**  

Extract number from characters of "$56,500.00".

```
extract_numeric("$56,500.00")  

56500
```

Extract number from characters of "-45%".

```
extract_numeric("-45%")  

-45
```

Crate a new column to have only the extracted numbers from the original column.
```
mutate(<new\_column> = extract_numeric(<column>)  
```
 
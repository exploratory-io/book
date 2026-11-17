# Unite

Unite multiple columns together into one column with given uniting characters. It will concatenate values by “\_" and remove the original column by default. Multiple columns specified in the list can be combined together at once.

**Syntax**  

unite(```<new_column>```, ```<column(s)>```, [sep = ```<text>```, remove = ```<logical>```])

**Arguments**

- sep - text to connect text values.
- remove - remove the original columns when TRUE, keep them when FALSE. The default is TRUE.

**Example**  

Unite FIRSTNAME and LASTNAME into a new column called NAME using_ \_ _as a uniting character.
```
unite(NAME, "FIRSTNAME" "LASTNAME")  
```

Unite FIRSTNAME and LASTNAME into a new column called NAME using_ \_ _as a uniting character.
```
unite(NAME, "FIRSTNAME", "LASTNAME", sep = "-")  
```
 
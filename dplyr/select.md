# Select

Select <column(s)> by column names.


**Example**

## Basic

**Syntax**
select(```<column(s)>```,...)  

**Example**

```
select(-CARRIER_DELAY, -WEATHER_DELAY, -`NA`)
```

## Drop

**Syntax**
select(-```<column(s)>```,...)  

**Example**

```

```

## starts_with

**Syntax**
select(starts_with(```<text>```, ignore.case = ```<logical>```))  


**Example**



## ends_with

**Syntax**
select(ends_with(```<text>```, ignore.case = ```<logical>```)) 

**Example**

## contains

**Syntax**
select(contains(```<text>```, ignore.case = ```<logical>```))  


**Example**

## matches

**Syntax**
select(matches(```<text>```, ignore.case = ```<logical>```))  


**Example**

## num_range

**Syntax**
select(num_range(```<text>```, ```<start_num>:<end_num>```))  


**Example**

## one_of

**Syntax**
select(one_of(```<text1>```, ```<text2>```, ...))  



**Example**

## everything

**Syntax**
select(```<column>```, everything())  


**Example**



 select(X, Y)  
 _Select column X and Y._  
 select(-X,- Y)  
_Remove column X and Y._    
select(starts_with("X", ignore.case = TRUE))  
_Select only columns whose name starts with "X"_  
select(ends_with("ABR", ignore.case = TRUE))  
_Select only columns whose name ends with "ABR"_  
select(contains("ABR", ignore.case = TRUE))  
_Select only columns whose name contains with "ABR"_  
select(matches("[:digit:]+", ignore.case = TRUE))  
_Select only columns whose names contains digits (regular expression)_
select(num_range("X", 1:6))  
_Selects all columns (numerically) from X1 to X5. ￼￼_  
select(one_of("x", "y", "z”))  
_Selects columns provided inside the brackets._  
select(X, everything())  
_Reorder columns: keep the column “X" in the front_  
select(which(sapply(., is.numeric)))  
_Select only numeric columns._  
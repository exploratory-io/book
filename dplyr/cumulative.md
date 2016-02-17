# Cumulative Functions

- cumall
- cumany
- cumsum
- cummean
- cummax
- cummin
- cumprod



## cumall

Returns TRUE if all the values up to the current position are TRUE.

**Syntax**  

cumall(```<condition>```)

**Example**  

// X = [TRUE, TRUE, FALSE, TRUE, FALSE] (// X = c(TRUE, TRUE, FALSE, TRUE, FALSE) in R)  

```
cumall(X)  
```

_Returns TRUE, TRUE, FALSE, FALSE, FALSE_  


## cumany

Returns TRUE if any of the values up to the current posiiton is TRUE.

**Syntax**  

cumany(```<condition>```)

**Example**  

// X = [TRUE, TRUE, FALSE, TRUE, FALSE] (// X = c(TRUE, TRUE, FALSE, TRUE, FALSE) in R)  

```
cumany(X)  
```

_Returns TRUE, TRUE, TRUE, TRUE, TRUE_  


## cumsum

Returns the cumulative sums.

**Syntax**  

cumsum(```<column_num>```)


**Example**  

// X = [1, 2, 3, 2, 1] (// x = c(1,2,3,2,1) in R)  
```
cumsum(X)  
```

_Returns 1, 3, 6, 8, 9_  

## cummax

Returns the cumulative maxima.

**Syntax**  

cummax(```<column_num>```)

**Example**  
// X = c(1,2,3,2,1)  

```
cummax(X)  
```

_Returns 1, 2, 3, 3, 3_  

## cummin

**Summary**  
Returns the cumulative minima.

**Syntax**  
cummin(```<column_num>```)

**Arguments**

**Return Value**  
Numeric  

**Example**  
// X = [1, 2, 3, 2, 1] (// x = c(1,2,3,2,1) in R)  
cummin(X)  
_Returns 1, 1, 1, 1, 1_  

**Tags**  
cumulative minima  


## cumprod

**Summary**  
Returns the cumulative products.

**Syntax**  
cumprod(```<column_num>```)

**Arguments**

**Return Value**  
Numeric  

**Example**  
// X = [1, 2, 3, 2, 1] (// x = c(1,2,3,2,1) in R)  
cumprod(X)  
_Returns 1, 2, 6, 12, 12_  


## cummean

**Summary**  
Returns the cumulative mean (average).

**Syntax**  
cummean(```<column_num>```)

**Arguments**

**Return Value**  
Numeric   

**Example**  
// X = [1, 2, 3, 2, 1] (// X = c(1,2,3,2,1) in R)  
cummean(X)  
_Returns 1, 3, 6, 8, 9_  
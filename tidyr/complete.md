# Complete

Complete a data frame by adding missing combinations of data.

**Syntax**  
complete(```<column(s)>```, fill = ```<list>```)

**Arguments**  
- list - Set a value for NA. You can set for each column by setting them in a list format.


**Example**  

Sample data:

year | product | type | sales
-----|---------|------|------
2013 | iPhone  |    5 |   100
2013 |   iPad  | mini |    50
2015 | iPhone  |    6 |   200


Complete with all the combinations of year and product values.

```
complete(year, product)  
```
Result:

year | product | type | sales
-----|---------|------|------
2013 |    iPad |  mini|    50
2013 |  iPhone |     5|   100
2015 |    iPad |    NA|    NA
2015 |  iPhone |     6|   200

Returns all the combinations of year and product values and fill with 0 for NA for sales column.

```
complete(year, product, fill = list(sales = 0))  
```
Result:

year | product | type | sales
-----|---------|------|------
2013 |    iPad |  mini|    50
2013 |  iPhone |     5|   100
2015 |    iPad |    NA|     0
2015 |  iPhone |     6|   200


Returns all the combinations of year and product values plus fill missing years (2014).

```
complete(year = full_seq(year, period = 1), product)  
```

Result: 

year | product | type | sales
-----|---------|------|------
2013 |    iPad |  mini|    50
2013 |  iPhone |     5|   100
2014 |    iPad |    NA|    NA
2014 |  iPhone |    NA|    NA
2015 |    iPad |    NA|    NA
2015 |  iPhone |     6|   200


Returns all the combinations of year, product, and type values.
```
complete(year, product, type)  
```
Result: 

year | product | type | sales
-----|---------|------|------
2013 |    iPad |     5|    NA
2013 |    iPad |     6|    NA
2013 |    iPad |  mini|    50
2013 |  iPhone |     5|   100
2013 |  iPhone |     6|    NA
2013 |  iPhone |  mini|    NA
2015 |    iPad |     5|    NA
2015 |    iPad |     6|    NA
2015 |    iPad |  mini|    NA
2015 |  iPhone |     5|    NA
2015 |  iPhone |     6|   200
2015 |  iPhone |  mini|    NA

By using nesting() function you can set the combination of values to be the ones that really exist in data for some columns.

```
complete(year, nesting(product, type))  
```
Result: 

year | product | type | sales
-----|---------|------|------
2013 |    iPad |  mini|    50
2013 |  iPhone |     5|   100
2013 |  iPhone |     6|    NA
2015 |    iPad |  mini|    NA
2015 |  iPhone |     5|    NA
2015 |  iPhone |     6|   200
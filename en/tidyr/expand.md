# Expand

Expand a data frame by adding all the combination of given columns.

**Syntax**  

expand(```<column(s)>```)


**Example**  

Sample data:

year | product | type | sales
-----|---------|------|------
2013 | iPhone  |    5 |   100
2013 |   iPad  | mini |    50
2015 | iPhone  |    6 |   200


Returns all the combinations of year and product values.
```
expand(year, product)  
```
Result:

year | product 
-----|---------
2013 |    iPad 
2013 |  iPhone 
2015 |    iPad 
2015 |  iPhone 


Returns all the combinations of year and product values plus fill missing years (2014).

```
expand(year = full_seq(year, period = 1), product)  
```
Result: 

year | product 
-----|---------
2013 |    iPad 
2013 |  iPhone 
2014 |    iPad 
2014 |  iPhone 
2015 |    iPad 
2015 |  iPhone 


Returns all the combinations of year, product, and type values.
```
expand(year, product, type)  
```
Result:

year | product | type 
-----|---------|------
2013 |    iPad |     5
2013 |    iPad |     6
2013 |    iPad |  mini
2013 |  iPhone |     5
2013 |  iPhone |     6
2013 |  iPhone |  mini
2015 |    iPad |     5
2015 |    iPad |     6
2015 |    iPad |  mini
2015 |  iPhone |     5
2015 |  iPhone |     6
2015 |  iPhone |  mini

By using nesting() function you can set a certain combination of column values to be fixed and have them nested inside other columns.

```
expand(year, nesting(product, type))  
```
Result:  

year | product | type 
-----|---------|------
2013 |    iPad |  mini
2013 |  iPhone |     5
2013 |  iPhone |     6
2015 |    iPad |  mini
2015 |  iPhone |     5
2015 |  iPhone |     6
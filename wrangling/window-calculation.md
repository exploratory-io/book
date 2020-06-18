# Window (Table) Calculation


For Data Wrangling, the Window Calculation is available for Numeric, Date, and Time Columns.


## Types

Following 5 Calculation Types are available. 

### Cumulative (Running Total)

The "Cumulative" calculation calculates the current value based on the previous values in each group. This Calculation Type is supported for Numeric Columns.

There are following options available for summarize values. 

* Sum 
* Mean (Average)
* Min Value
* Max Value
* Product


### Percent (%) of Total

The "Percent of Total" calculates the ratio of values in each group. This Calculation Type is supported for Numeric Columns.


### Difference From 

The "Difference From" calculates the difference from the specified position. There are following 9 options where you compare the different from. This Calculation Type is supported for Numeric, Date, and Time Columns.

* Mean (Average) - Calculate the difference from the Mean value.
* Median - Calculate the difference from the Median value. 
* Mode - Calculate the difference from the Mode value.
* Min - Calculate the difference from the Min value.
* Max - - Calculate the difference from the Max value.
* First - Calculate the difference from the very first value. The first value will be always 0. 
* Last - Calculate the difference from the very last value. The last value will be always 0.
* previous - Calculate the difference from the previous value. 
* Next - Calculate the difference from the next value. 


### Percent (%) Difference From 

The "Percent (%) Difference From" calculates the difference ratio from the specified position. There are following 4 options where you compare the different from. This Calculation Type is supported for Numeric Columns.

* Mean (Average) - Calculate the difference from the Mean value.
* Median - Calculate the difference from the Median value. 
* Mode - Calculate the difference from the Mode value.
* Min - Calculate the difference from the Min value.
* Max - - Calculate the difference from the Max value.
* First - Calculate the difference from the very first value. The first value will be always 0. 
* Last - Calculate the difference from the very last value. The last value will be always 0.
* previous - Calculate the difference from the previous value. 
* Next - Calculate the difference from the next value. 


### Moving Calculation 

The "Moving Calculation" calculates values by summarizing the data points in the window (range) around each data point. This Calculation Type is supported for Numeric Columns.

Following options are available. 

* Summarize Values Using - Type of calculations to apply to data points in the window.
 * Sum (Total)
 * Mean (Average)
 * Median
 * Min Value
 * Max Value
 * Standard Deviation
 * Variance
 * Product
 * Rank


## Links

You can check out the following articles for more information. 

* [5 Most Practically Useful Window (Table) Calculations in R](https://blog.exploratory.io/5-most-practically-useful-window-table-calculations-in-r-7e2c7ca431d9)

# Window (Table) Calculation 

The Window Calculation is available on Pivot, Summarize Table, Bar, Line, and Area charts. 


## Types

The following Calculation Types are available. 

### Cumulative (Running Total)

The "Cumulative" calculation calculates the current value based on the previous values in each group. 

![](images/winfunc-cum-viz.png)

There are the following options available for summarizing values. The default value is `Sum`.

* Sum
* Sum Ratio - Sum of the ratio against the total. The last value in the group will be 100%.
* Mean (Average)
* Min Value
* Max Value
* Product

### Percent (%) of Total

The "Percent of Total" calculates the ratio of values in each group. There are the following options available. The default is `Sum (Total)`.

* Sum (Total)
* Mean (Average)
* Median
* Mode (Most Frequent)
* Min Value
* Max Value
* First Value
* Last Value
* Previous Value (LAG) - Shows the previous values in the group.
* Next Value (LEAD) - Shows the next values in the group.


There are the following options available. The default is `X Axis`.

* X Axis - Calculate the ratio for each X-Axis data point. The total percentages on each X value will be 100%.  
* Color - Calculate the ratio for each color value. The total percentage of each color value will be 100%. For example, in the following chart, the total percentage of blue bars is 100%, and the same for other colors. 
* All - Calculate the ratio based on all data points. The total percentage of all the data points will be 100%.

### Difference From 

The "Difference From" calculates the difference from the specified position. There are the following options where you compare the differences from. The default is `Mean`.

* Mean (Average)
* Median
* Mode (Most Frequent)
* Min Value
* Max Value
* First Value
* Last Value
* Previous Value (LAG) - Shows the previous values in the group.
* Next Value (LEAD) - Shows the next values in the group.
* Period Ago (TS_LAG) - Shows the value of a certain period ago. For example, the value last month. This option is available only if the Date or POSIXct column is assigned to the grouping column such as X-Axis, Row of the Pivot Table, etc. 
* Specific Value - Difference from a specific value that you give.


### Percent (%) Difference From 

The "Percent (%) Difference From" calculates the difference ratio from the specified position. There are the following options where you compare the differences from. The default is `Mean`.

* Mean (Average)
* Median
* Mode (Most Frequent)
* Min Value
* Max Value
* First Value
* Last Value
* Previous Value (LAG) - Shows the previous values in the group.
* Next Value (LEAD) - Shows the next values in the group.
* Period Ago (TS_LAG) - Shows the value of a certain period ago. For example, the value last month. This option is available only if the Date or POSIXct column is assigned to the grouping column such as X-Axis, Row of the Pivot Table, etc. 
* Specific Value - Difference from a specific value that you give.


### Value Of

The "Value Of" gets the values at the specific position. The following Default is `Previous Value`.

* Previous Value (LAG) - Shows the previous values in the group. 
* Next Value (LEAD) - Shows the next values in the group. 
* Period Ago (TS_LAG) - Shows the value of a certain period ago. For example, the value last month. This option is available only if the Date or POSIXct column is assigned to the grouping column such as X-Axis, Row of the Pivot Table, etc. 


### Moving Calculation 

The "Moving Calculation" calculates values by summarizing the data points in the window (range) around each data point. 

![](images/winfunc-moving-ave.png)

For example, in this chart, it is using Moving Calculation using Average for summarizing data. Each data point is calculated by the average of the target data point plus 4 previous (left) data points. The beginning 4 data points which are on the very left of the chart are empty because there are not enough data points to calculate for those. 

The following options are available. 

* Summarize Values Using - Type of calculations to apply to data points in the window. The default is `Average`.
 * Sum
 * Mean (Average)
 * Min Value
 * Max Value
 * Median 
 * Standard Deviation
 * Variance
 * Sum 
 * Product
* Window Size - Number of data points to include in each window. The default is 5.   
* Window Align - How to define the boundary of each window. For example, if you set `Right`, each window includes the target data point plus 4 left data points.    
 * Right
 * Center
 * Left
* Fill Value - Value to fill the empty data points. The default is empty. 


### Rank

The "Rank" calculates the rank of the values in the group. 

* Order
  * Ascending
  * Descending
* Rank Type
  * Min Rank
  * Dense Rank
  * Percent Rank

## Options

* Remove NA - Whether you want to remove NA values before applying a Window Calculation or not. 


## Links

You can check out the following articles for more information. 

* [Introducing Window Calculations with Chart in Exploratory Desktop](https://blog.exploratory.io/introducing-window-calculations-in-exploratory-desktop-67cb19f77eb)

* [5 Most Practically Useful Window (Table) Calculations in R](https://blog.exploratory.io/5-most-practically-useful-window-table-calculations-in-r-7e2c7ca431d9)

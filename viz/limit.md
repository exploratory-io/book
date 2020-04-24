# Limit Values

The Limit Values feature literally limits/filters output of the categorical values by the conditions.

Limit Values is supported in the following chart types.

* Bar (X-Axis)
* Scatter (With Aggregation) (X-Axis, Y-Axis)
* Boxplot (X-Axis)
* Violin (X-Axis)
* Error Bar (X-Axis)
* Area Map (Color)


## Overview

Suppose you have a Bar chart with a lot of bars. You may want to reduce the number of bars because there are too many bars and hard to compare. 


![](images/limit1.png)

You can definitely create a filter to reduce bars. But, it is not straightforward to define a filter based on the aggregated values (in this case, the size of bars) such as "Showing top 30 bars". Limit Values provides a set of ways to filter categories based on the aggregated values by category. For example, you can get the top 30 of bars by just setting "Top" with "30" results.  

![](images/limit3.png)


You can access Limit Value setting from the column menu.

![](images/limit2.png)




## Types 

There are 3 Limit Value types.



### Condition 

You can define a condition against the aggregated values of each category to filter. For example, you can define "Bars that have more than 5,000 rows.".

![](images/limit5.png)


Following options are available. 

* Based on: Values to compare. You can select a column that has values to compare and aggregation function. By default, it uses the same value column and its aggregation function used in the chart. You can also choose a different column and different aggregation function that is not even used in the chart. 
* Operator: The Operator of the condition. Following operators are available. 
    * equal to
    * not equal to
    * less than 
    * less than or equal to 
    * greater than 
    * greater than or equal to 
    * between 
    * not between 
* Value: Condition value 


### Top

You can show only the number of categories that have the highest values. For example, you can define "Top 30 Bars".

![](images/limit3.png)

Following options are available. 


* Number of Results: Number of categories to show. Default is 10.
* Based on: Values to compare. You can select a column that has values to compare and aggregation function. By default, it uses the same value column and its aggregation function used in the chart. You can also choose a different column and different aggregation function that is not even used in the chart. 

### Bottom


You can show only the number of categories that have the lowest values. For example, you can define "Bottom 30 Bars".

![](images/limit4.png)

Following options are available. 


* Number of Results: Number of categories to show. Default is 10.
* Based on: Values to compare. You can select a column that has values to compare and aggregation function. By default, it uses the same value column and its aggregation function used in the chart. You can also choose a different column and different aggregation function that is not even used in the chart. 



## Set Position

(Coming soon)

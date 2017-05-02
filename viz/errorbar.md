# Error Bar Chart

![](images/errorbar.png)

## Column Assignments


* X-Axis - Assign a column you want to show at X-Axis. If it's a Date / Time column assigned, you can select the aggregation level such as `Month`, `Week`, `Day`, etc. If you assign a Number column, you can choose either `As Number` to treat values as continuous values or `As Text` to treat values as categorical values.  
* Y-Axis - Assign a column you want to show at Y-Axis. If it's a Numeric column assigned, you can set the aggregation function such as `Sum`, `Mean (Average)`, etc. to aggregate the values. 
* Color - Take a look at [Color](color.md) section for more details.
* Sort - Assign a column to use for Sorting the X-Axis values. The default is based on either the alphabetic order or the factor level order for Factor type columns.
* Repeat By - You can assign a column to repeat the chart for each of its values. Take a look at [Small Multiple](small-multiple.md) section for more details.


## Range Type

You can select from one of the following range types. The default is `Standard Error`.

* Standard Error 
* Confidence Interval (95%)

## Graph Type

You can select from one of the following graph types. The default is `Bar`.

* Bar
* Marker


## Layout Configuration

Take a look at [Layout Configuration](viz/layout.md) on how to configure the layout and format. 

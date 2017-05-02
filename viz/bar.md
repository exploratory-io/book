# Bar Chart

![](images/bar.png)

## Column Assignments

* X-Axis - Assign a column you want to show at X-Axis. If it's a Date / Time column assigned, you can select the aggregation level such as `Month`, `Week`, `Day`, etc. If you assign a Number column, you can choose either `As Number` to treat values as continuous values or `As Text` to treat values as categorical values.  

* Y-Axis - Assign a column you want to show at Y-Axis. If it's a Numeric column assigned, you can set the aggregation function such as `Sum`, `Mean (Average)`, etc. to aggregate the values. You can also assign a Window Calculation from the gear icon on Y-Axis. Look at [Window Calculation](window-calc.md) section for details.  

* Color - Take a look at [Color](color.md) section for more details.

* Sort - Assign a column to use for Sorting the X-Axis values. The default is based on either the alphabetic order or the factor level order for Factor type columns.

* Repeat By - You can assign a column to repeat the chart for each of its values. Take a look at [Small Multiple](small-multiple.md) section for more details.

You can assign multiple columns to Y-Axis. Take a look at [Multiple Y-Axis](multi-y.md) section for more details.

## Orientation - Vertical vs. Horizontal

You can select from one of the following orientations. The default is `Vertical`.

### Vertical

![](images/bar-vertical.png)


### Horizontal

![](images/bar-horiz.png)

* In this orientation type, X-Axis goes vertically and Y-Axis goes horizontally in order to make it easy to switch between horizontal and vertical orientation.
* At this moment, the horizontal orientation doesn't support [Small Multiple](small-multiple.md). 


## Bar Type - Stacked vs. Grouped

You can select from one of the following bar types. The default is `Stacked`.

### Stacked

![](images/bar-stacked.png)

### Grouped

![](images/bar-grouped.png)

## Layout Configuration

Take a look at [Layout Configuration](layout.md) on how to configure the layout and format. 

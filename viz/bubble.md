# Scatter (With Aggregation) Chart

You can show the distribution of the data by circles. It is similar to the Scatter (No Aggregation) chart, but the Scatter (With Aggregation) chart can show the distribution of the aggregated data. 


![](images/bubble1.png)

## Column Assignments

* Group by - Assign a column you want to group by. 
* X-Axis - Assign a column you want to show at X-Axis. You can choose how to aggregate the data for each bubble such as sum, average. 
* Y-Axis - Assign a column you want to show at Y-Axis. You can choose how to aggregate the data for each bubble such as sum, average.  
* Size - Assign a column you want to apply the size on each bubble. You can assign a number based column only. 
* Color - Assign a column for color. If you assign a categorical column, it will be also used as a groupby column. Take a look at [Color](color.md) section for more details.
* Label - Assign a column you want to show in the balloon help that you see when you hover bubbles. 
* Sort By - Assign a column to use for Sorting the X-Axis values. The default is based on either the alphabetic order or the factor level order for Factor type columns. You can also select which aggreagation function for sorting from the Sort Setting dialog. The following aggregation functions are available.
  * Sum
  * Mean (Average)
  * Median
  * Min Value
  * Max Value
  * First 
  * Last
  * Standard Deviation
  * IQR (Interquartile Range)

* Repeat By - You can assign a column to repeat the chart for each of its values. Take a look at [Repeat By](small-multiple.md) section for more details.


## Trend Line

Take a look at [Trend Line](trend-line.md) section for more details.


## Reference Line

Take a look at [Reference Line](reference-line.md) section for more details.



## Highlight 

You can change the color of the specific markers such as bars, lines or circles that you pick to stand out from others. See [Highlight](highlight.md) for the detail. 


## Category 

You can categorize numeric values inside the chart. See [Category(Binning)](category.md) for the detail.

## Limit Values

You can use Limit Values to filter the categories by the aggregated values. See [Limit Values](limit.md) for the detail.


## Custom Function

You can use the Custom Function feature to define your own aggregation function. See [Custom Function](custom-function.md) for the detail.

## Show Detail

You can show the detailed data underlying the chart by clicking the chart figure. See [Show Detail](show-detail.md) for the detail.

## Layout Configuration

Take a look at [Layout Configuration](layout.md) on how to configure the layout and format. 

## Save as an Image

You can save the chart as an image file. See [Save as PNG/SVG](save.md) for more details.

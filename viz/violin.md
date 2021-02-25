## Violin Chart


You can show the distribution of the data with "Violin" like shapes. This chart is a combination of Density Plot and Boxplot. 


![](images/violin1.png)

## Column Assignments

* X-Axis - Assign a column you want to show the distribution. The column data should be numeric. 
* Color By - Assign a column for color. Take a look at [Color](color.md) section for more details.
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
* Include Outlier - You can uncheck to exclude the outlier values. 

## Highlight 

You can change the color of the specific markers such as bars, lines or circles that you pick to stand out from others. See [Highlight](highlight.md) for the detail. 


## Category 

You can categorize numeric values inside the chart. See [Category(Binning)](category.md) for the detail.

## Limit Values

You can use Limit Values to filter the categories by the aggregated values. See [Limit Values](limit.md) for the detail.




## Missing Value Handling

You can use the Missing Value Handling feature to control missing values. See [Missing Value Handling](missing-value-handling.md) for the detail.


## Layout Configuration

![](images/violin2.png)


* Show Data as Points - You can plot the data by dots on the plot area. 
![](images/violin3.png)
* Show Boxplot - You can show/hide the Boxplots inside the violins. 
* Show Average Line - You can show/hide the average lines inside the violins.


Take a look at [Layout Configuration](layout.md) on how to configure the layout and format. 

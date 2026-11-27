---
title: "Scatter (No Aggregation) Chart"
sidebarTitle: "Scatter (No Aggregation)"
---


![](images/scatter.png)


## Column Assignments

* X-Axis - Assign a column you want to show at X-Axis. If it is a date / time column assigned, the axis will be automatically in time series. If it is a number based column, the axis will be for the continuous values. If it is a text based column, the axis will be for discrete values. 
* Y-Axis - Assign a column you want to show at Y-Axis. The assigned column is handled in the same way as X-Axis.  
* Z-Axis - Assign a column you want to show at Z-Axis. By assigning Z-Axis, the chart becomes 3D Scatter chart. The assigned column is handled in the same way as X-Axis. Note that on Windows with some hardware and driver, 3D scatter chart may not work. In that case, you can install [DirectX 9 redistributable](http://www.microsoft.com/en-us/download/details.aspx?id=8109) to make it work. 
![](images/3d-scatter.png)
* Size - Assign a column you want to apply the size on each circle. You can assign a number based column only. 
* Color - Take a look at [Color](/en/viz/color) section for more details.
* Label - Assign a column you want to show in the balloon help that you see when you hover the marker such as dots. 
![](images/scatter-label.png)
If you check the `Show on plot` option, the column values directly come up in the plot area. 
![](images/scatter-label-on-plot.png)
* Repeat By - You can assign a column to repeat the chart for each of its values. Take a look at [Repeat By](/en/viz/small-multiple) section for more details.

You can assign multiple columns to Y-Axis. Take a look at [Multiple Y-Axis](/en/viz/multi-y) section for more details.

## Trend Line

Take a look at [Trend Line](/en/viz/trend-line) section for more details.


## Reference Line

Take a look at [Reference Line](/en/viz/reference-line) section for more details.



## Range

Take a look at [Range](/en/viz/range) section for more details.

## Circle for Color 

You can draw circles for each color group. It is useful to see the distributions of each group. You can access the Circles for Color feature from the Color property dialog that you can access by clicking the gear icon at the Color control. 

![](images/scatter-circles.png)

Following circle types are available.

* Circles - Circles without fill colors
* Filled Circles - Circles filled with colors


## Highlight 

You can change the color of the specific markers such as bars, lines or circles that you pick to stand out from others. See [Highlight](/en/viz/highlight) for the detail. 

## Rename Column Names

You can use the Rename Column Names feature to update column names if you assign multiple columns to Y-Axis. See [Rename Column Names](/en/viz/rename-column-names) for the detail.


## 'Others' Group

If you have many categories, you can reduce the number of categories by changing some category names to 'Others' using the 'Others' Group feature. See ['Others' Group](/en/viz/others-group) for the detail. 



## Axis Setting

You can use the Axis Setting feature to assign columns to Y1/Y2 axes if you assign multiple columns to Y-Axis. See [Axis Setting](/en/viz/dualy-setting) for the detail.

## Show Detail

You can show the detailed data underlying the chart by clicking the chart figure. See [Show Detail](/en/viz/show-detail) for the detail.



## Layout Configuration

Take a look at [Layout Configuration](/en/viz/layout) on how to configure the layout and format. 

## Note about 3D Scatter on Windows

On Windows with some hardware and driver, 3D scatter chart may not work. In that case, you can install [DirectX 9 redistributable](http://www.microsoft.com/en-us/download/details.aspx?id=8109) to make it work. 


## Save as an Image

You can save the chart as an image file. See [Save as PNG/SVG](/en/viz/save) for more details.

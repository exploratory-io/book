# Draw Lines Grouped By Labels

Trend Line feature is available for Scatter charts. You can draw Trend or Smooth Lines by selecting one of Trend Line types in the Trend Line Setting dialog. 

![](images/trend-dialog.png)

You can open this dialog by selecting `Trend Line` menu of Y-Axis properties. 

![](images/trend-toggle.png)


## Types

We support following 3 Trend Line types.

### Linear Regression  —  LM

This one uses Linear Regression (lm) internally and draw linear (straight) lines.

![](images/trend-liner.png)


### Polynomial  —  Loess

This one uses Local Polynomial Regression (loess) internally to draw trend lines. It is the best to use when the data size is small. This option will be automatically disabled if the data size is more than 1000 for the performance reason.  

![](images/trend-loess.png)

### Polynomial  —  GAM

This one uses Generalized Additive Model (GAM) internally to draw trend lines. It is the best to use when the data size is large.

![](images/trend-gam.png)


## Options

* Line Length - You can select one of following options. 
  * Data Range for Each Group - It draws the trend lines and ranges only for the X-Axis range for each group of Color
  ![](images/trend-length-each-group.png)

  * Data Range for All Groups - It draws the trend lines and ranges for the entire chart area.  
  ![](images/trend-length-all-groups.png)

* Show Confidence Interval - You can show/hide the confidence interval ranges. Default is checked. 

# Correlation by Column

Calculates Correlations among columns.

## Input Data
Input data should contain numeric columns.

  * Variable Columns - Numeric columns among which correlations are calculated.
  * Group By - Categorical column to group by. If you specify this, the analytics runs for each group.


## Properties
* Analytics Properties
  * Method - Method to calculate correlations. The default is "Pearson". This can be:
    * Pearson
    * Spearman
* Correlation - This section is about "Correlations" View.
  * Show Only Lower Triangle - Show only lower triangle of the matrix, avoiding showing correlations for same pairs twice.
  * Show Diagonal Values - Show values on diagonal of the matrix, which should always have correlation of 1.
* Significance - This section is about "Significance" View.
  * P Value Threshold to be Significant
  * Show Only Lower Triangle
  * Show Diagonal Values
* Data - This section is about "Data" View.
  * Show Data From
    * Positive Correlations
    * Negative Correlations

## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "Correlation by Columns" for Analytics Type.
4. Click Variable Columns and open Column Selector Dialog.
5. Select Numeric Columns that you want to calculate correlation.

![](images/cor_by_column_selection_dialog.png)

6. Click Run button to run the analytics.
7. Select view type (explained below) by clicking view type link to see each type of generated visualization.

### "Correlations" View
"Correlations" View displays correlations with Heatmap. Red color means it has positive correlation and Blue color means it has negative correlation. The darker the color, the stronger the correlation.

![](images/cor_by_column_matrix.png)

### "Significance" View
"Significance" View displays correlations with Scatter Plot. Gray color means it is not statistically significant. Red color means it has positive significant correlation and Blue color means it has negative significant correlation. You can check the p-values of the correlations by hovering the mouse pointer over the circles.

### "Scatter Matrix" View
"Scatter Matrix" View displays the actual data distributions for each variable combination.

![](images/cor_by_column_scattermatrix.png)

### "Data" View
"Data" View displays the correlations for all the pairs of the selected columns in a table. By default the table is sorted by the correlation values. You can click the Column Header to sort the table based on any of the other columns.

* Column 1 / Column 2
* Correlation
* P Value - P value from the t-test to determine the significance of the correlation.
* t Value - t value from the t-test to determine the significance of the correlation.

## R Package

The `Correlation by Column` uses `cor` function from  [`stats`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/cor.html) R Package under the hood.

## Exploratory R Package

For details about `stats` usage in Exploratory R Package, please refer to the [github repository](https://github.com/exploratory-io/exploratory_func/blob/master/R/stats_wrapper.R)

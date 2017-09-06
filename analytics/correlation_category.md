# Correlation by Category

Calculates Correlation by Category.

## Input Data
Input data should contain categorical columns and numeric columns.

  * Category Column - Categorical column that you want to see correlation.
  * Measured By Column - key column to aggregate measure.
  * Measure Column - Numeric column that is used to calculate correlation.

## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "Correlation by Categories" for Analytics Type.
4. Select Category Columns that you want to see correlation.
5. Select Measured By Columns that you want to summarize measure column.
6. Select Measure Column that you want to use to calculate correlation.
7. Click Run button to run the analytics.
8. Select view type (explained below) by clicking view type link to see each type of generated visualization.

### "Correlation Matrix" View
"Correlation Matrix" View displays correlation with Heatmap. Red color means it has positive correlation and Blue color means it has negative correlation. The darker the color, the stronger the correlation.

![](images/cor_by_category_matrix.png)

### "Positive Correlations" View
"Positive Correlations" View displays the positive correlation value for column pair.You can click Column Header for Correlation to sort the data by Correlation value.

![](images/cor_by_category_positive.png)

### "Negative Correlations" View
"Negative Correlations" View displays the negative correlation value for column pair.You can click Column Header for Correlation to sort the data by Correlation value.

![](images/cor_by_category_negative.png)

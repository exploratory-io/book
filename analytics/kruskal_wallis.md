# Kruskal-Wallis Test Analytics View

Runs Kruskal-Wallis Test, which checks whether samples in multiple groups originate from the same distribution.

## Input Data
Input data should contain following columns.

  * Target Variable - Numeric column whose distribution is to be tested.
  * Explanatory Variable(s) - Column with categorical values to categorize rows into groups.

## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "Kruskal-Wallis Test" for Type.
4. Select Target Variable column.
5. Select Explanatory Variable(s) columns.
6. Click Run button to run the analytics.
7. Select view type by clicking view type link to see each type of generated visualization.

### "Summary" View
"Summary" View displays the summary of the test result.

### "Error Bar" View
"Error Bar" View displays error bar chart of means of target variable for each category with 95% confidence interval.

### "Density Plot" View
"Density Plot" View displays distribution of the target variable values for each category.

### "Statistics" View
"Statistics" View displays statistics of data for each category, such as mean.

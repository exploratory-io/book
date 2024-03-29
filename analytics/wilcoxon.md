# Wilcoxon Test Analytics View

Runs Wilcoxon test (Rank Sum Test or Signed Rank Test), which checks if 2 groups are from populations that have a same distribution.

## Input Data
Input data should contain following columns.

  * Target Variable - Numeric column whose means should be calculated and compared between groups.
  * Explanatory Variable(s) - Column with 2 different values to categorize rows into 2 groups.

## Properties
  * Analytics Properties
    * Type of Alternative Hypothesis
      * Two Sided
      * Less
      * Greater
    * Expected Difference - Default is 0. If "Independent (Rank Sum Test)" is selected for "Independent/Paired", Null hypothesis is that there are exactly this much shift between distributions of the 2 groups. If "Paired (Signed Rank Test)" is selected, Null hypothesis is that value difference between paired samples have a symmetric distribution centered at this value.
    * Independent/Paired
      * Independent (Rank Sum Test)
      * Paired (Signed Rank Test)
    * Estimate Confidence Interval of Difference - If set to TRUE, confidence interval of median of difference between a sample from one group and a sample from the other group is calculated and reported in the Summary Table.
    * Confidence Level - Confidence level for the confidence interval explained above.

## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "Wilcoxon Test" for Type.
4. Select Target Variable column.
5. Select Explanatory Variable(s) columns.
6. Click Run button to run the analytics.
7. Select view type by clicking view type link to see each type of generated visualization.

### "Summary" View
"Summary" View displays the summary of the test result.
  * U Statistic - The statistic for the independent test (rank sum test).
  * W Statistic - The statistic for the paired test (signed rank test).
  * P Value
  * Difference - Estimated median of difference between a sample from one category and a sample from the other category.
  * Conf High - Upper bound of the confidence interval of the difference. The confidence level can be specified by the Confidence Level property.
  * Conf Low - Lower bound of the confidence interval of the difference. The confidence level can be specified by the Confidence Level property.
  * Base Level - The category which is the base of the difference.
  * Method
  * Number of Rows - Total number of rows used for the test.
  * Number of Rows for... - Number of rows for each value of the explanatory variable.

### "Difference" View
"Difference" View appears only when "Estimate Confidence Interval of Difference" property is set to TRUE. It displays error bar chart of the median of the differences between a sample from one category and a sample from the other category with 95% confidence interval.

### "Error Bar" View
"Error Bar" View displays error bar chart of means of target variable for each category with 95% confidence interval.

### "Density Plot" View
"Density Plot" View displays distribution of the target variable values for each category.

### "Statistics" View
"Statistics" View displays statistics of data for each category, such as mean.

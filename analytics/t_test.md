# T Test Analytics View

Runs t-test, which checks differences of means of variables between 2 groups.

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
    * Expected Mean or Difference in Means - Default is 0. Null hypothesis is that there are exactly this much difference between means of the 2 groups.
    * Paired - If TRUE, perform a paired t-test.
    * Assume Equal Variances - If TRUE, assume that variances are same between the 2 groups.
    * Confidence Level - Confidence level for confidence interval of difference of means between two groups reported in Summary Table.
  * Power Analysis
    * Difference to Detect - Size of difference between means of 2 groups that is considered to be meaningful. Used to calculate effect size, Cohen's d. If not specified, mean difference calculated from the data is used.
    * Standard Deviation - Assumed standard deviation of the Target Value. Used to calculate effect size, Cohen's d. If not specified, calculated from the data.
    * Probability of Type 1 Error (P Value) - Probability of type 1 error that can be tolerated. Default is 0.05.
    * Probability of Type 2 Error (1 - Power) - (Optional) Probability of type 2 error that can be tolerated. If a value is specified, required sample size is estimated and reported in the Summary Table. If not, probability of type 2 error with current condition of the test is reported in the Summary Table.

## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "T Test" for Type.
4. Select Target Variable column.
5. Select Explanatory Variable(s) columns.
6. Click Run button to run the analytics.
7. Select view type by clicking view type link to see each type of generated visualization.

### "Summary" View
"Summary" View displays a table that shows the summary of the test result.
  * t Ratio
  * P Value
  * Degree of Freedom
  * Difference - Difference between the means of the values from the 2 categories.
  * Conf High - Upper bound of the confidence interval of the difference. The confidence level can be specified by the Confidence Level property.
  * Conf Low - Lower bound of the confidence interval of the difference. The confidence level can be specified by the Confidence Level property.
  * Effect Size (Cohen's d)
  * Power - Power of the test. Calculated as 1 minus the probability of type 2 error explained below.
  * Probability of Type 2 Error - Possible maximum probability of committing type 2 error given the sample size, the confidence level, and the difference to detect.
    If the difference to detect is not specified, the actual difference from the data is used instead.
  * Number of Rows - Total number of rows used for the test.
  * Number of Rows for... - Number of rows for each value of the explanatory variable.

### "Difference" View
"Difference" View displays error bar chart of the difference between the means of the 2 categories with 95% confidence interval. If the confidence interval includes 0, the difference is statistically insignificant.

### "Error Bar" View
"Error Bar" View displays error bar chart of means of target variable for each category with 95% confidence interval.

### "Density Plot" View
"Density Plot" View displays distribution of the target variable values for each category.

### "Statistics" View
"Statistics" View displays statistics of data for each category, such as mean.

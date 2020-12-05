# ANOVA Analytics View

Runs ANOVA, which checks differences of means of variables among groups.

## Input Data
Input data should contain following columns.

  * Target Variable - Numeric column whose means should be calculated and compared between groups.
  * Explanatory Variable(s) - Column with categorical values to categorize rows into groups.

## Properties
  * Power Analysis
    * Effect Size to Detect (Cohen's f) - Effect size (Cohen's f) that is considered to be meaningful. If not specified, the value calculated from the data is used.
    * Probability of Type 1 Error (P Value) - Probability of type 1 error that can be tolerated. Default is 0.05.
    * Probability of Type 2 Error (1 - Power) - (Optional) Probability of type 2 error that can be tolerated. If a value is specified, required sample size is estimated and reported in the Summary Table. If not, probability of type 2 error with current condition of the test is reported in the Summary Table.

## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "ANOVA" for Type.
4. Select Target Variable column.
5. Select Explanatory Variable(s) columns.
6. Click Run button to run the analytics.
7. Select view type by clicking view type link to see each type of generated visualization.

### "Summary" View
"Summary" View displays the summary of the test result.

### "Prob. Distribution" View
"Prob. Distribution" View displays probability distribution of the test statistic (F value) under the null hypothesis, and where the test statistic for the performed test is placed in the distribution.

### "Error Bar" View
"Error Bar" View displays error bar chart of means of target variable for each category with 95% confidence interval.

### "Density Plot" View
"Density Plot" View displays distribution of the target variable values for each category.

### "Statistics" View
"Statistics" View displays statistics of data for each category, such as mean.

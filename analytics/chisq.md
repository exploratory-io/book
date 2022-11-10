# Chi-Square Test Analytics View

Runs Chi-Square Test, which checks differences of distributions of categorical variable among groups.

## Input Data
Input data should contain following columns.

  * Target Variable - The categorical column whose distribution should be compared among groups of rows categorized by the values of the explanatory variable.
  * Explanatory Variable - Another categorical column to categorize rows into groups.

## Analytics Properties
  * Pivot Table
    * Show Frequencies in ... - How to display the frequencies in Pivot Table view. One of the following.
      * Percentage (%)
      * Count
  * Difference
    * Show Difference from Expected in ... - How to display the differences from expected frequency in Difference view. One of the following.
      * % Difference
      * Difference
      * Standardized Difference
  * Power Analysis
    * Effect Size to Detect (Cohen's w) - Effect size (Cohen's w) that is considered to be meaningful. If not specified, the value calculated from the data is used.
    * Probability of Type 1 Error (P Value) - Probability of type 1 error that can be tolerated. Default is 0.05.
    * Probability of Type 2 Error (1 - Power) - (Optional) Probability of type 2 error that can be tolerated. If a value is specified, required sample size is estimated and reported in the Summary Table. If not, probability of type 2 error with current condition of the test is reported in the Summary Table.

## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "Chi-Square Test" for Type.
4. Select Target Variable column.
5. Select Explanatory Variable(s) columns.
6. Click Run button to run the analytics.
7. Select view type by clicking view type link to see each type of generated visualization.

### "Summary" View
"Summary" View displays the summary of the test result.

  * Chi-Square
  * P Value
  * Degree of Freedom
  * Association Coef. (Cramer's V) - Measure of association between the target variable and the explanatory variable. The value ranges from 0 (no association) and 1 (complete association).
  * Effect Size (Cohen's w)
  * Power
  * Probability of Type 2 Error
  * Number of Rows - The number of rows of the entire input data.

### "Prob. Distribution" View
"Prob. Distribution" View displays probability distribution of the test statistic (Chi-Square) under the null hypothesis, and where the test statistic for the performed test is placed in the distribution.

### "Pivot Table" View
"Pivot Table" View displays a table that shows frequencies of the rows that comes from each combination of the 2 categorical values.
The frequencies can be displayed either in count or in percentage, which can be configured by the "Show Frequencies in..." property.

### "Ratio" View
"Ratio" View displays a bar chart that shows percentages of the rows with each value of the Target Variable, for each Explanatory Variable value.

### "Contributions (%)" View
"Contributions (%)" View displays a scatter plot with circles each of which represents contribution to the Chi-Squared value from a combination of the 2 categorical variable values.

### "Differences" View
"Differences" View displays a scatter plot with circles each of which represents difference of the actual frequency from the expected frequency for a combination of the 2 categorical variable values.
The differences can be measured either in percentage, absolute count, or the standardized difference, which can be configured by "Calculation Method" property.

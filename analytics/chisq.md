# Chi-Square Test Analytics View

Runs Chi-Square Test, which checks differences of distributions of categorical variable among groups.

## Input Data
Input data should contain following columns.

  * Target Variable - Categorical column whose distribution should be compared between groups.
  * Explanatory Variable(s) - Column with categorical values to categorize rows into groups.

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


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


# Market Basket Analysis Analytics View

Find rules of what tend to occur at the same time from transaction data.

## Input Data
Input data should contain following columns.

  * Product - Set a column to find rules for. If it's purchasing data, this should be a column of product names.
  * Basket - Set a column to use as an id of transactions.

## Analytics Properties
  * Association Rules
    * Minimum Item Length - Minimum number of items on the left-hand side of the rules to find.
    * Maximum Item Length - Maximum number of items on the left-hand side of the rules to find.
    * Selection of Minimum Support Value - How minimum support value is set. This can be one of the following.
      * Search Automatically - Automatically search a minimum support value that finds some rules.
      * Specify Value - Manually specify the minimum support value.
    * Minimum Support Value - Minimum support value for the rules to find. Takes effect when "Specify Value" is chosen for "Selection of Minimum Support Value".
    * Maximum Support Value - Maximum support value for the rules to find.
    * Minimum Confidence Value - Minimum confidence value for the rules to find.
  * Graph
    * Number of Rules to Plot - Number of rules to plot in the Graph view.
    * Rules are Selected Based on... - Criteria to select rules to plot in the Graph view. One of the following.
      * Support
      * Confidence
      * Lift

## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "Market Basket Analysis" for Type.
4. Select Product column.
5. Select Basket column.
6. Click Run button to run the analytics.
7. Select view type by clicking view type link to see each type of generated visualization.


# Distance by Columns Analytics View

Calculate distances between each pair of columns among specified set of columns.

## Input Data
Input data should contain following columns.

  * Variable Columns - Set of numeric or logical columns. Distances for all posssible pairs among those columns are calculated.

## Analytics Properties
  * Method - Method to calculate distances
  * Show Only Lower Triangle - Show only lower triangle of the matrix, avoiding showing distances for same pairs twice.
  * Show Diagonal Values - Show values on diagonal of the matrix, which should always have distance of 0.
  * Number of Clusters - Number of clusters (by K-Means algorithm) used when clustring columns to display them on Similarity Map view.

## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "Distance by Columns" for Type.
4. Select Variable Columns.
5. Set Analytics Properties if necessary.
5. Click Run button to run the analytics.
6. Select view type by clicking view type link to see each type of generated visualization.


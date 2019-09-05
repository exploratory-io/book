# K-Means Clustering Analytics View

Cluster data (rows) by K-means algorithm.

## Input Data
Input data should contain following columns.

  * Variable Columns - Set of numeric columns to be the basis of clustering.
  * Subject Column - Value of the column is shown on the Scatter View as label of each dot, or as an item on mouse-over balloon. It is also used for color of Stack Bar View.

## Analytics Properties
  * K-Means Clustering 
    * Number of Clusters - Set an integer number to decide how many clusters (groups) should be there in the outcome.
    * Max Iteration Times - The default is 10. The maximum number of cluster update iteration.
    * Trial Times - The default is 1. How many random initial configuration should be tried. The best result is chosen as the outcome.
    * Algorithm - The default is Hartigan-Wong. This can be
      - Hartigan-Wong
      - Lloyd
      - Forgy
      - MacQueen
    * Random Seed - Seed used to generate random numbers. Specify this value to always reproduce the same result.
  * Data Preprocessing
    * Sample Data Size - Number of rows to sample before clustering them.
    * Normalize Variable Columns - Whether to normalize Variable Columns before clustering.
  * Error Bar
    * Type of Error Bar - Type of error bar. This can be...
      - Standard Error
      - 95 % Conf. Interval
      - 99 % Conf. Interval
      - 1 Standard Deviation
      - 2 Standard Deviation
      - 3 Standard Deviation
      - IQR
  * Line - Parallel Coordinates Plot
    * Sample Size - Number of sample observations (rows) to show on the Line view. This is the number of lines displayed on the chart.
  * Elbow Method
    * Find Optimal Number of Clusters - To run Elbow Method to find the optimal number of clusters, set this to TRUE.
    * Maximum Number of Clusters to Try - Maximum number of clusters to try while running Elbow Method.

## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "K-Means Clustering" for Type.
4. Select Variable Columns.
5. Click Run button to run the analytics.
6. Select view type by clicking view type link to see each type of generated visualization.


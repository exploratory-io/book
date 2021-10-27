# Principal Component Analysis Analytics View

Runs Principal Component Analysis, which converts data so that observations (rows) are expressed in a set of variables called principal components.
Principal components tries to keep as much information of the original data in as few variables as possible.

## Input Data
Input data should contain following columns.

  * Variable Columns - Set of numeric columns to convert into principal components.
  * Color By - Value of the column is used for color of each dot on the Scatter View.
  * Label Column - Value of the column is shown on the Scatter View as label of each dot, or as an item on mouse-over balloon.

## Analytics Properties
  * Data Preprocessing
    * Sample Data Size - Number of rows to sample before clustering them.
    * Random Seed - Seed used to generate random numbers. Specify this value to always reproduce the same result.
    * Normalize Variable Columns - Whether to normalize Variable Columns before running the analysis.

## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "Principal Component Analysis" for Type.
4. Select Variable Columns.
5. Click Run button to run the analytics.
6. Select view type (explained below) by clicking view type link to see each type of generated visualization.


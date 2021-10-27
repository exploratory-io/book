# Factor Analysis

Runs factor analysis, which tries to explain number of variables as observable results of potentially lower number of unobserved variables, called factors.

## Input Data
Input data should contain following columns.

  * Variable Columns - Set of observed numeric columns.
  * Color By - Value of the column is used for color of each dot on the Biplot.
  * Label Column - Value of the column is shown on the Biplot as the label of each dot, or as an item on the mouse-over balloon.

# Properties

  * Sample Data Size - Number of rows to sample before running factor analysis.
  * Factor Analysis
    * Number of Factors
    * Factoring Method
    * Type of Scores
    * Type of Rotation
  * Data Preprocessing
    * Random Seed - Seed used to generate random numbers. Specify this value to always reproduce the same result.

## R Package

Factor Analysis Analytics View uses the [psych](https://cran.r-project.org/web/packages/psych/index.html) R Package under the hood.

## Exploratory R Package

For details about `psych` usage in Exploratory R Package, please refer to the [github repository](https://github.com/exploratory-io/exploratory_func/blob/master/R/factanal.R)

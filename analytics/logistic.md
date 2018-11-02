# Logistic Regression Analytics View

Builds a logistic regression model to predict binary Target Variable column value from Predictor Variable(s) column values.

## Input Data
Input data should contain following columns.

  * Target Variable - Column that has binary values to be predicted by the logistic regression model.
  * Predictor Variable(s) - Column(s) that has values on which the prediction by logistic regression model is based.

## Analytics Properties

  * Sample Data Size - Number of rows to sample before building logistic regression model.
  * Max # of Categories for Predictor Vars - If categorical predictor column has more categories than this number, less frequent categories are combined into 'Other' category.
  * Adjust Imbalanced Data - Adjust imbalance of data in Target Variable (e.g. FALSE being majority and TRUE being minority.) by SMOTE (Synthetic Minority Over-sampling Technique) altorithm.
  * Random Seed - Seed used to generate random numbers. Specify this value to always reproduce the same result.
  * P Value Threshold to be Significant - P value must be smaller than this value for coefficients to be considered statistically significant.
  * Sort Variables by Coefficients - If set to TRUE, variables displayed in Coefficients View are sorted by coefficients.

## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "Logistic Regression Analysis" for Type.
4. Select Target Variable column.
5. Select Predictor Variable(s) columns.
6. Click Run button to run the analytics.
7. Select view type by clicking view type link to see each type of generated visualization.


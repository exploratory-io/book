# Decision Tree Analytics View

Builds a decision tree to predict Target Variable column value from Predictor Variable(s) column values.

## Input Data
Input data should contain following columns.

  * Target Variable - Column that has values to be predicted by the decision tree. It can be of categorical (binary or multi-class) or nuneric value.
  * Predictor Variable(s) - Column(s) that has values on which the prediction by decision tree is based.

## Analytics Properties

  * Sample Data Size - Number of rows to sample before building decision tree.
  * Max # of Categories for Target Variable - If categorical Target Variable column has more categories than this number, less frequent categories are combined into 'Other' category.
  * Max # of Categories for Predictor Vars - If categorical predictor column has more categories than this number, less frequent categories are combined into 'Other' category.
  * Adjust Imbalanced Data - Adjust imbalance of data in Target Variable (e.g. FALSE being majority and TRUE being minority.) by SMOTE (Synthetic Minority Over-sampling Technique) altorithm.
  * Random Seed - Seed used to generate random numbers. Specify this value to always reproduce the same result.

## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "Decision Tree" for Type.
4. Select Target Variable column that you want to predict with the decision tree.
5. Select Predictor Variable(s) columns to be the basis of the prediction by the decison tree.
6. Click Run button to run the analytics.
7. Select view type by clicking view type link to see each type of generated visualization.


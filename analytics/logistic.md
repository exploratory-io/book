# Logistic Regression Analytics View

Builds a logistic regression model to predict binary Target Variable column value from Predictor Variable(s) column values.

## Input Data
Input data should contain following columns.

  * Target Variable - A column that has logical values (TRUE/FALSE) to be predicted by the logistic regression model. (For how to convert other types of columns to logical type, take a look at the reference.)
  * Predictor Variable(s) - Column(s) that has values on which the prediction by logistic regression model is based.

## Analytics Properties

  * Coefficients
    * Metrics of Variables - Metric of variables to use on Y-axis of scatter plot on Coefficients View.
      * Odds Ratio
      * Coefficient
      * Average Marginal Effect
    * P Value Threshold to be Significant - P value must be smaller than this value for coefficients to be considered statistically significant.
    * Confidence Intervals for Marginal Effects - Enable/disable calculation of confidence interval for marginal effect. Default is FALSE. Note that this is a calculation that takes some time.
    * Sort Variables by Coefficients - If set to TRUE, variables displayed in Coefficients View are sorted by coefficients.
  * Binary Classification
    * Cut Point for TRUE/FALSE
  * Data Preprocessing
    * Sample Data Size - Number of rows to sample before building linear regression model.
    * Random Seed - Seed used to generate random numbers. Specify this value to always reproduce the same result.
    * Max # of Categories for Predictor Vars - If categorical predictor column has more categories than this number, less frequent categories are combined into 'Other' category.
  * Imbalanced Data Adjustment
    * Adjust Imbalanced Data - Adjust imbalance of data in Target Variable (e.g. FALSE being majority and TRUE being minority.) by SMOTE (Synthetic Minority Over-sampling Technique) altorithm.
    * Target % of Minority Data
    * Maximum % Increase for Minority Size
    * Neighbors to Sample for Populating Data
  * Evaluation
    * Test Mode - Enable/Disable Test Mode. In Test Mode, data is split into training data and test data, and test data is not used for building model, so that it can be used for later test, without bias.
    * Ratio for Test Data - A value between 0 and 1.
    * Data Splitting Method
      * Random - Specified ratio of data that is picked randomly is used as test data.
      * Reserve Order in Data - Specified ratio of data that appears last are used as test data.

## How to Use This Feature

1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "Logistic Regression Analysis" for Type.
4. Select Target Variable column.
5. Select Predictor Variable(s) columns.
6. Set Analytics Properties if necessary.
7. Click Run button to run the analytics.
8. Select view type by clicking view type link to see each type of generated visualization.

### "Summary" View
"Summary" View displays the summary of the created model.

### "Prediction" View
"Prediction" View plots how the predicted probability of the target variable being TRUE varies as each variable changes. This is so called partial dependence plot.

### "Importance" View
"Importance" View displays importances of variables for the prediction of the probability of the target variable being TRUE. Importances are calculated by permutation importance with log likelihood as the cost function.

### "Coefficients" View
"Coefficients" View displays coefficient estimates for all the predictor variables with Error Bars with P value as a color (i.e. If P Value < 0.05, the color is blue) 

### "Coefficients Table" View
"Coefficients Table" View displays more details for all the variables along with other metrics like Coefficient, Standard Error, t-Ratio, P-Value, etc. You can click on the column headers to sort the data with a help of bar visualization.

### "Collinearity" View
"Collinearity" View displays VIF (Variance Inflation Factor) of each predictor variables. VIF greater than 10 is commonly considered to be the indicator of problematic degree of multicollinearity.

### "Prediction Matrix" View
"Prediction Matrix" View displays a matrix where each column represents the instances in a predicted class while each row represents the instances in an actual class. It makes it easy to see how well the model is classifying the two classes. The darker the color, the higher the percentage value.

### "Probability" View
For binary classification, "Probability" View shows distribution of predicted probability of being TRUE, for the observations that are actually TRUE and for the observations that are actually FALSE.

### "Data" View
Data View shows original input data with additional columns of predicted probability.

## Reference

[データタイプをロジカル型に変換する方法](https://exploratory.io/note/GMq1Qom5tS/CGC0oYS8Gw)

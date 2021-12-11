# XGBoost

Build XGBoost Model

## Input Data
Input data should contain one numeric, logical, or categorical column for "Target Variable" and one or more columns as "Predictor Variable(s)".

  * Target Variable - Numeric, logical, or categorical column that you want to predict.

  * Predictor Variable(s) - The model is built to predict based on the values of those columns.

## Analytics Properties
  * XGBoost
    * Use Sparse Matrix
    * Max Levels for Tree Depth
    * Min Size for Terminal Node - If the sample size for a node of a dicision tree would fall below this size, the split is not done.
    * Min Improvement Rate by Split - If a split would not result in an improvement of at least this much rate, the split is not done.
    * Sample Rate for a Tree - The ratio of the sampling with replacement done before creating a decision tree.
    * Sample Rate of Columns for a Tree - Rate of sampling for selecting predictor columns for a decision tree.
    * Learning Rate for an Additional Tree - The rate of influence that the newly added decision tree has on the collective prediction outcome.
    * Random Seed
  * Learning
    * Iterations - Number of trees to create for the XGBoost model.
    * Number of Iterations for Early Stopping - Number of consequtive tree additions that cannot make an improvement over the best metric value thus far that will trigger early stopping.
    * Use Validation Data - Use validation data in addition to the training data to calculate the model quality metric to track the improvement of the model.
    * Ratio for Validation Data - Ratio of data to keep for validation. In Test Mode, this ratio is aplied on the training portion of the data.
    * Metric - Regression
      * Root Mean Square Error (RMSE)
      * Mean Absolute Error (MAE)
      * Normalized Discounted Cumulative Gain
      * Gamma Negative Log Likelihood
      * Gamma Deviance
    * Metric - Binary Classification
      * AUC
      * Misclassification Rate
      * Negative Log Likelihood
    * Metric - Multiclass Classification
      * Misclassification Rate
      * Negative Log Likelihood
  * Regression
    * Type of Output
      * linear
      * logistic
      * gamma
      * tweedie
  * Binary Classification
    * Cut Point for TRUE/FALSE
    * Type of Output
      * logistic
      * logitraw
  * Prediction
    * Max # of Variables - Maximum number of most important variables to display on the Prediction view.
  * Variable Importance
    * Method - Method of how to calculate variable importance.
      * Permutation - Importance of variable is measured by how much the prediction worsens when random permutation is applied to the variable, nullifying its contribution in prediction.
      * Impurity - Importance of variable is meassured by its contribution in reducing impurity while building the model.
  * Data Pre-processing
    * Sample Data Size - Number of rows to sample before building the model.
    * Max # of Categories for Target Variable - If categorical Target Variable column has more categories than this number, less frequent categories are combined into 'Other' category.
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
3. Select "XGBoost" for Analytics Type.
4. Select "Target Variable" column.
5. Select "Predictor Variable(s)" columns.
6. Click Run button to run the analytics.
7. Select view type (explained below) by clicking view type link to see each type of generated visualization.

### "Summary" View
"Summary" View displays metrics that describes the quality of the model.

If the Target Variable column is logical, you will see
- F Score - A measure of Test Accuracy. The score ranges between 0 and 1 and Higher is better.  It's harmonic mean of precision and recall.
- Accuracy Rate - Another measure of Test Accuracy, which is calculated as `(Total True Positive + total True Negative) / Total Population.`
- Misclassification Rate - The rate the model fails to classify correctly. (i.e. 1 - Accuracy Rate)
- Precision - (also called positive predictive value) is the fraction of relevant instances among the retrieved instances.
- Recall -  (also known as sensitivity) is the fraction of relevant instances that have been retrieved over the total amount of relevant instances.
- AUC - Area under ROC (Receiver Operating Characteristic) curve.
- Number of Rows

If the Target Variable column is numeric, you will see

- Root Mean Square errors - The Root Mean Square Error (RMSE) (also called the root mean square deviation, RMSD) is a frequently used measure of the difference between values predicted by a model and the values actually observed from the environment that is being modeled.
- R Squared - A statistical measure of how close the data are to the fitted regression line. It is also known as the coefficient of determination, or the coefficient of multiple determination for multiple regression. 1 (100%) indicates that the model explains all the variability of the response data around its mean.
- Number of Rows

### "Prediction" View
"Prediction" View shows how the predicted value or probability by the model changes when only one of the predictor changes, on average on sampled data points.

### "Importance" View
"Importance" View displays a bar chart that shows importance of each predictor variable.

### "Learning" View
"Learning" View displays a line chart that shows how the specified metrics of prediction quality improves (or degrades) as more trees are added to the XGBoost model.

### "Prediction Matrix" View
"Prediction Matrix" View displays a matrix where each column represents the instances in a predicted class while each row represents the instances in an actual class. It makes it easy to see how well the model is classifying the two classes. The darker the color, the higher the percentage value.

### "Probability" View
For binary classification, "Probability" View shows distribution of predicted probability of being TRUE, for the observations that are actually TRUE and for the observations that are actually FALSE.

### "ROC" View
For binary classification, "ROC" View displays Receiver Operating Characteristic Curve of the model. The area under this curve is the AUC, which indicates how well the model separates the TRUE class and the FALSE class.

### "Prediction Quality" View
When Target Variable is a number, "Prediction Quality" View shows a scatter plot with predicted values on X-axis, and actual values on Y-axis.

### "Data" View
Data View shows original input data with additional columns of predicted value and/or predicted probability.

## R Package

`XGBoost` Analytics View uses [`xgboost`](https://cran.r-project.org/web/packages/xgboost/index.html) R Package under the hood.

## Exploratory R Package

For details about `xgboost` usage in Exploratory R Package, please refer to the [github repository](https://github.com/exploratory-io/exploratory_func/blob/master/R/build_xgboost.R).

`exp_xgboost` is the function we call for the XGBoost Analytics View.

Name of the R function arguments for the parameters are as follows.

- Max Levels for Tree Depth - `max_depth`
- Min Size for Terminal Node - `min_child_weight`
- Min Improvement Rate by Split - `gamma`
- Sample Rate for a Tree - `subsample`
- Sample Rate of Columns for a Tree - `colsample_bytree`
- Learning Rate for an Additional Tree - `eta`
- Random Seed - `seed`
- Iterations - `nrounds`
- Number of Iterations for Early Stopping - `early_stopping_rounds`
- Use Validation Data - `validate`
- Ratio for Validation Data - `watchlist_rate`
- Metric - Regression - `eval_metric_regression`
- Metric - Binary Classification - `eval_metric_binary`
- Metric - Multiclass Classification - `eval_metric_multiclass`
- Type of Output (Regression) - `output_type_regression`
- Cut Point for TRUE/FALSE - `binary_classification_threshold`
- Type of Output (Binary Classification) - `output_type_binary`


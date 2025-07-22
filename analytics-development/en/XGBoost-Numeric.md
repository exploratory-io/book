const template = `

An XGBoost model has been created to predict <%= target %> based on the selected predictor variables.

# Variable Relationships

<% if (predictorColumns.length > 1) { %>
## Predictor Variable Importance

The following chart shows which predictor variables are relatively more important for predicting <%= target %>.

{{variable_importance}}

For details on how variable importance works, please refer to [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>

## Predictor Variable Effects

<% if (predictorColumns.length > 1) { %>
The following chart shows how the value of <%= target %> changes when the value of each predictor variable changes.
<% } else { %>
The following chart shows how the value of <%= target %> changes when the value of the predictor variable changes.
<% } %>

{{variable_effect}}

* The blue line (or points) shows predicted values for predictor variable values.
* The grey line shows actual observed values and their 95% confidence intervals.
* The vertical axis represents the value of <%= target %>.

Notes:

<% if (predictorColumns.length > 1) { %>

* Since this predicts the effect of each predictor variable alone while keeping other variables constant, there may be discrepancies between the actual observed average values and predicted values.
* For detailed calculation methods of predicted values, please refer to [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* Predictor variables are arranged in order of importance as shown in the "Predictor Variable Importance" section above.

<% } %>

<% if (has_category_columns) { %>
* For categorical (Character type, Factor type) predictor variables with more than <%= predictor_n %> unique values, the top <%= predictor_n - 1 %> most frequent values are retained and the rest are categorized as "Others". This can be changed in [Settings](//analytics/settings/max_categories_for_factor).
<% } %>

# Model Metrics

 <% if (test_mode) { %>
 Various metrics related to model prediction accuracy are summarized in the table below. Since we are currently in test mode, metrics for prediction accuracy are displayed for both training data and test data.
 <% } else { %>
 Various metrics related to model prediction accuracy are summarized in the table below.
 <% } %>

 {{summary}}

 The number of rows indicates the number of data rows used for model creation.

## Prediction Accuracy

For numeric type target variables, R-squared and RMSE are commonly used metrics to evaluate model prediction accuracy.

* R-squared
  * R-squared shows the proportion of variance in the target variable values that is explained by the predictor variables used in this model.
  * Values range from 0 to 1, where 1 means the model can perfectly predict the target variable values.
  * Generally, 0.8 or higher is interpreted as very high, 0.6-0.8 as high, 0.4-0.6 as moderate, 0.2-0.4 as low, and below 0.2 as very low model fit.
  * For more information about R-squared, please refer to [this note](https://exploratory.io/note/exploratory/R2-zVj7AqB3).

* RMSE
  * RMSE represents the root mean square error and measures the magnitude of error between predicted and actual values.
  * It is expressed in the same units as the target variable, making it easy to interpret, and smaller values indicate higher prediction accuracy.
  * It takes values of 0 or greater, and would be 0 for perfect prediction.
  * For more information about RMSE, please refer to [this note](https://exploratory.io/note/exploratory/RMSE-DjQ0KQd5).


For concepts and specific calculation methods of R-squared and RMSE, please refer to the following notes:

* R-squared - [Explanation Note](https://exploratory.io/note/exploratory/R2-zVj7AqB3)
* RMSE - [Explanation Note](https://exploratory.io/note/exploratory/RMSE-DjQ0KQd5)




{start_show_hide}
## Other Metric Descriptions

* R-squared
  * R-squared shows the proportion of variance in the target variable values that is explained by the predictor variables used in this model.
  * Values range from 0 to 1, where 1 means the model can perfectly predict the target variable values.
  * Generally, 0.8 or higher is interpreted as very high, 0.6-0.8 as high, 0.4-0.6 as moderate, 0.2-0.4 as low, and below 0.2 as very low model fit.
  * For more information about R-squared, please refer to [this note](https://exploratory.io/note/exploratory/R2-zVj7AqB3).

* RMSE
  * RMSE represents the root mean square error and measures the magnitude of error between predicted and actual values.
  * It is expressed in the same units as the target variable, making it easy to interpret, and smaller values indicate higher prediction accuracy.
  * It takes values of 0 or greater, and would be 0 for perfect prediction.
  * For more information about RMSE, please refer to [this note](https://exploratory.io/note/exploratory/RMSE-DjQ0KQd5).

* Number of Rows
  * Number of Rows indicates the total number of data used in the analysis (sample size).
  * The larger the sample size, the higher the statistical test power and the better the reliability of results.
  * If numeric columns in predictor variables contain missing values, those rows are removed before execution.

{end_show_hide}


<% if (!test_mode) { %>
## Predictions on Training Data
The following table shows the results of predictions made on the training data using the created prediction model.
<% } else { %>
## Predictions on Training and Test Data
The following table shows the results of predictions made on both training data and test data using the created prediction model.
<% } %>
{start_lazy_show_hide}
### Prediction Results
{{data}}
{end_lazy_show_hide}

## Relationship Between Actual and Predicted Values

<% if (!test_mode) { %>
As a result of prediction, there are discrepancies between the original actual values and predicted values. The following chart visualizes their relationship using a scatter plot. Each point represents each row.
<% } else { %>
As a result of prediction, there are discrepancies between the original actual values and predicted values. The following chart visualizes their relationship using a scatter plot. Each point represents each row. Training data is visualized in blue and test data in orange.
<% } %>

{start_lazy_show_hide}
### Chart
{{actual_predicted}}
{end_lazy_show_hide}

## Learning Iterations and Accuracy Improvement

The following chart shows the model learning process. The horizontal axis represents the number of learning iterations, and the vertical axis represents RMSE (prediction error). In XGBoost, RMSE decreases as the number of learning iterations increases. Initially, RMSE decreases rapidly, then tends to become more gradual. When the learning curve starts to flatten, it may be approaching the optimal number of learning iterations. Conversely, if the error continues to decrease, further increasing the number of learning iterations may improve performance.

{start_lazy_show_hide}
### Chart
{{learning_curve_numeric}}
{end_lazy_show_hide}

# Appendix

## Next Steps

* Variable Selection Optimization: Consider excluding predictor variables with low variable importance to simplify the model. This makes the model easier to interpret and reduces the risk of overfitting. For variable selection guidelines, please refer to [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
<% if (!repeat_by) { %>
* Group-by Analysis: By creating separate models for each group, you may be able to understand the determining factors of <%= target %> within each group in more detail. In that case, you can select a grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Outlier Verification: Check for outliers that may affect prediction accuracy and address them as necessary to potentially improve model reliability. For methods to remove outliers, please refer to [this note](https://exploratory.io/note/exploratory/Eep7kip3).
* Model Evaluation: Consider validating by splitting into training data and test data to more rigorously evaluate the prediction performance of this model.
* Parameter Tuning: You may be able to further improve model performance by adjusting XGBoost parameters (tree depth, learning rate, number of learning iterations, etc.).
<% if (!test_mode) { %>
* Model Evaluation: To more rigorously evaluate the prediction performance of this model, you can validate by splitting into training data and test data. In that case, set "Test Mode" to TRUE in the "Evaluation" section under [Settings](//analytics/settings/test_mode) and re-run.
<% } %>
* Prediction on New Data: When you want to make predictions on new data using the created model, add a "Predict with Model (Analytics View)" step to the data frame you want to make predictions on. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).

`;

module.exports = template; 
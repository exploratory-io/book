const template = `

A decision tree model was created to predict <%= target %> based on the selected explanatory variables.

# Variable Relationships

<% if (predictorColumns.length > 1) { %>
## Variable Importance

The following chart shows which explanatory variables are relatively more important for predicting <%= target %>.

{{variable_importance}}

For more information about the mechanism of variable importance, please see [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>


## Variable Effects

<% if (predictorColumns.length > 1) { %>
The following chart shows how the value of <%= target %> changes when the value of each explanatory variable changes.
<% } else { %>
The following chart shows how the value of <%= target %> changes when the value of the explanatory variable changes.
<% } %>

{{variable_effect}}

* The blue line (or points) shows predicted values for explanatory variable values.
* Gray lines show actual measured values and their 95% confidence intervals.
* The Y-axis represents the value of <%= target %>.

Important Notes:

<% if (predictorColumns.length > 1) { %>

* Since we predict the effect of each explanatory variable individually while holding other variables constant, discrepancies arise between the mean of actual values and predicted values.
* For details on the prediction value calculation method, please refer to [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* Explanatory variables are arranged in order of importance as shown in the "Variable Importance" section above.

<% } %>

<% if (has_category_columns) { %>
* For categorical (Character, Factor) explanatory variables with more than <%= predictor_n %> unique values, the top <%= predictor_n - 1 %> most frequent values are retained and the rest are grouped as "Others". This can be changed from [Settings](//analytics/settings/max_categories_for_factor) in Analytics.
<% } %>

# Decision Tree

The following visualizes the decision tree (a series of conditional branches) created based on the data. You can see the conditional branches created when predicting <%= target %>.

{{tree_structure}}

**How to Read the Decision Tree**

Each box is called a node, and the lines extending from them are called branches.

- **Conditional Branching**: Below each node, a condition (e.g., "Variable A < Value X") is displayed, and branching occurs left and right based on this condition.
 - Left branch is for when the condition is "yes (true)"
 - Right branch is for when the condition is "no (false)"
- **Information in Nodes**
 - **Top row**: The mean value of <%= target %> in the data contained in each node
 - **Bottom row**: The proportion of data contained in each node relative to the total (%)

 The top row value of the bottom-most nodes becomes the predicted value when using the decision tree model.

# Model Metrics

 <% if (test_mode) { %>
 Various metrics related to model prediction accuracy are summarized in the following table. Since we are currently in test mode, metrics for both training data and test data are displayed for prediction accuracy.
 <% } else { %>
 Various metrics related to model prediction accuracy are summarized in the following table.
 <% } %>

 {{summary}}

 Row count indicates the number of rows of data used for model creation.

## Prediction Accuracy

For numeric target variables, R-squared and RMSE are commonly used metrics to evaluate model prediction accuracy.

* R-squared
  * R-squared indicates the proportion of variance in the target variable values that is explained by the explanatory variables used in this model.
  * Values range from 0 to 1, where 1 means the model can perfectly predict the target variable values.
  * Generally, it is often interpreted as very high model fit for 0.8 or above, high for 0.6-0.8, moderate for 0.4-0.6, low for 0.2-0.4, and very low for less than 0.2.
  * For a note explaining R-squared, please see [here](https://exploratory.io/note/exploratory/R2-zVj7AqB3).

* RMSE
  * RMSE represents the root mean square error and measures the magnitude of error between predicted and actual values.
  * It is expressed in the same units as the target variable, making it easy to interpret, and smaller values mean higher prediction accuracy.
  * Takes values of 0 or above, and would be 0 for perfect prediction.
  * For a note explaining RMSE, please see [here](https://exploratory.io/note/exploratory/RMSE-DjQ0KQd5).


For concepts and specific calculation methods of R-squared and RMSE, please see the following notes:

* R-squared - [Explanation Note](https://exploratory.io/note/exploratory/R2-zVj7AqB3)
* RMSE - [Explanation Note](https://exploratory.io/note/exploratory/RMSE-DjQ0KQd5)


{start_show_hide}
## Explanation of Other Metrics

* R-squared
  * R-squared indicates the proportion of variance in the target variable values that is explained by the explanatory variables used in this model.
  * Values range from 0 to 1, where 1 means the model can perfectly predict the target variable values.
  * Generally, it is often interpreted as very high model fit for 0.8 or above, high for 0.6-0.8, moderate for 0.4-0.6, low for 0.2-0.4, and very low for less than 0.2.
  * For a note explaining R-squared, please see [here](https://exploratory.io/note/exploratory/R2-zVj7AqB3).

* RMSE
  * RMSE represents the root mean square error and measures the magnitude of error between predicted and actual values.
  * It is expressed in the same units as the target variable, making it easy to interpret, and smaller values mean higher prediction accuracy.
  * Takes values of 0 or above, and would be 0 for perfect prediction.
  * For a note explaining RMSE, please see [here](https://exploratory.io/note/exploratory/RMSE-DjQ0KQd5).

* Row Count
  * Row count indicates the total number of data (sample size) used in the analysis.
  * The larger the sample size, the higher the detection power of statistical tests and the better the reliability of results.
  * When numeric columns in explanatory variables contain missing values, those rows are removed before execution.

{end_show_hide}

## Relationship Between Actual and Predicted Values

<% if (!test_mode) { %>
As a result of prediction, there are discrepancies between the original actual values and predicted values. The following chart visualizes their relationship using a scatter plot. Each point represents each row.
<% } else { %>
As a result of prediction, there are discrepancies between the original actual values and predicted values. The following chart visualizes their relationship using a scatter plot. Each point represents each row. Training data is visualized in blue and test data in orange, separated by color.
<% } %>

{start_lazy_show_hide}
### Chart
{{actual_predicted}}
{end_lazy_show_hide}

## Prediction Results

The following table shows the results of predictions made on all data using the created predictive model.

{start_lazy_show_hide}
### Table
{{data}}
{end_lazy_show_hide}

# Appendix

## Next Steps

* Variable Selection Optimization: Consider excluding explanatory variables with low variable importance to simplify the model. This makes the model easier to interpret and reduces the risk of overfitting. For variable selection guidelines, please see [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
* Outlier Verification: By checking for outliers that may affect prediction accuracy and addressing them as necessary, the reliability of the model may improve. For methods to remove outliers, please see [this note](https://exploratory.io/note/exploratory/Eep7kip3).
* Parameter Tuning: By adjusting decision tree parameters (tree depth, minimum improvement rate for branching, etc.), you may be able to further improve model performance.
* Consideration of Ensemble Learning Methods: To capture patterns that cannot be captured by a single decision tree, it may be effective to consider ensemble learning methods such as Random Forest or XGBoost.
<% if (!test_mode) { %>
* Model Evaluation: To more rigorously evaluate the predictive performance of this model, you can validate it by splitting into training data and test data. In that case, set "Test Mode" to TRUE in the "Validation" section under [Settings](//analytics/settings/test_mode) and re-run the analysis.
<% } %>
* Prediction on New Data: When you want to use the created model to make predictions on new data, add a "Predict with Model (Analytics View)" step to the target data frame you want to predict. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).

`;
module.exports = template; 
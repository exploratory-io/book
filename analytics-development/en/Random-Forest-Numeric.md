const template =
`

A Random Forest model to predict <%= target %> has been created based on the selected explanatory variables.

# Relationship between Variables

<% if (predictorColumns.length > 1) { %>
## Explanatory Variable Importance

The following chart shows which explanatory variables are relatively more important for predicting <%= target %>.

{{variable_importance}}

For more information about the mechanism of variable importance, please refer to [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>

## Explanatory Variable Influence

<% if (predictorColumns.length > 1) { %>
The following chart shows how the value of <%= target %> changes as the value of each explanatory variable changes.
<% } else { %>
The following chart shows how the value of <%= target %> changes as the value of the explanatory variable changes.
<% } %>

{{variable_effect}}

* The blue line (or points) shows the predicted value for the explanatory variable value.
* The gray line shows the actual value and its 95% confidence interval.
* The vertical axis is the value of <%= target %>.

Notes:

<% if (predictorColumns.length > 1) { %>

* Assuming other variables are constant, this predicts the effect of the single explanatory variable, so there may be a discrepancy between the actual average and the predicted value.
* For details on how predicted values are calculated, please refer to [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* Explanatory variables are ordered by importance as shown in "Explanatory Variable Importance" above.

<% } %>
* If a categorical variable (Character type, Factor type) has more than 12 unique values, the 11 most frequent values are kept, and the rest are grouped as "Others". This can be changed in [Settings](//analytics/settings).

# Model Metrics

 <% if (test_mode) { %>
 The following table summarizes various metrics regarding the prediction accuracy of the model. Since it is currently in test mode, prediction accuracy metrics for both training and test data are displayed.
 <% } else { %>
 The following table summarizes various metrics regarding the prediction accuracy of the model.
 <% } %>

 {{summary}}

 The number of rows indicates the number of data rows used to create the model.

## Prediction Accuracy

When the target variable is numeric, R-squared and RMSE are commonly used metrics for evaluating model prediction accuracy.

* R-squared
  * R-squared indicates the proportion of the variability in the target variable that is explained by the explanatory variables used in this model.
  * Values range from 0 to 1, where 1 means the model can perfectly predict the values of the target variable.
  * Generally, R-squared values are often interpreted as very high above 0.8, high between 0.6 and 0.8, medium between 0.4 and 0.6, low between 0.2 and 0.4, and very low model fit below 0.2.
  * For a note explaining R-squared, please see [here](https://exploratory.io/note/exploratory/R2-zVj7AqB3).

* RMSE
  * RMSE represents the square root of the mean squared error and measures the magnitude of the error between predicted and actual values.
  * It is expressed in the same units as the target variable, making it easy to interpret. A smaller value means higher prediction accuracy.
  * It takes values of 0 or greater, and is 0 for perfect prediction.
  * For a note explaining RMSE, please see [here](https://exploratory.io/note/exploratory/RMSE-DjQ0KQd5).


For information on the concept and calculation methods of R-squared and RMSE, please see the following notes:

* R-squared - [Explanation Note](https://exploratory.io/note/exploratory/R2-zVj7AqB3)
* RMSE - [Explanation Note](https://exploratory.io/note/exploratory/RMSE-DjQ0KQd5)



{start_show_hide}
## Explanation of Other Metrics

* R-squared
  * R-squared indicates the proportion of the variability in the target variable that is explained by the explanatory variables used in this model.
  * Values range from 0 to 1, where 1 means the model can perfectly predict the values of the target variable.
  * Generally, R-squared values are often interpreted as very high above 0.8, high between 0.6 and 0.8, medium between 0.4 and 0.6, low between 0.2 and 0.4, and very low model fit below 0.2.
  * For a note explaining R-squared, please see [here](https://exploratory.io/note/exploratory/R2-zVj7AqB3).

* RMSE
  * RMSE represents the square root of the mean squared error and measures the magnitude of the error between predicted and actual values.
  * It is expressed in the same units as the target variable, making it easy to interpret. A smaller value means higher prediction accuracy.
  * It takes values of 0 or greater, and is 0 for perfect prediction.
  * For a note explaining RMSE, please see [here](https://exploratory.io/note/exploratory/RMSE-DjQ0KQd5).

* Number of Rows
  * Number of rows indicates the total number of data points (sample size) used in the analysis.
  * A larger sample size increases the power of statistical tests and improves the reliability of the results.
  * If numeric columns in the explanatory variables contain missing values, those rows are removed before execution.

{end_show_hide}

<% if (!test_mode) { %>
## Prediction on Training Data
Prediction results on the training data using the created prediction model are shown in the following table.
<% } else { %>
## Prediction on Training/Test Data
Prediction results on the training and test data using the created prediction model are shown in the following table.
<% } %>
{start_lazy_show_hide}
### Prediction Results
{{data}}
{end_lazy_show_hide}

## Relationship between Actual and Predicted Values

<% if (!test_mode) { %>
As a result of prediction, there is a discrepancy between the original actual values and predicted values. The following chart visualizes their relationship using a scatter plot. Each point represents a row.
<% } else { %>
As a result of prediction, there is a discrepancy between the original actual values and predicted values. The following chart visualizes their relationship using a scatter plot. Each point represents a row. Training data is shown in blue, and test data is shown in orange.
<% } %>

{start_lazy_show_hide}
### Chart
{{actual_predicted}}
{end_lazy_show_hide}

# Additional Information

## Next Steps

* Optimizing variable selection: Consider excluding explanatory variables with low variable importance to simplify the model. This will make the model easier to interpret and reduce the risk of overfitting. For guidelines on variable selection, please refer to [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
<% if (!repeat_by) { %>
* Group-wise analysis: Creating separate models for each group may provide a more detailed understanding of the determinants of <%= target %> within each group. In that case, you can select the grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Checking for outliers: Checking for outliers that may affect prediction accuracy and addressing them as necessary may improve model reliability. For information on how to remove outliers, please refer to [this note](https://exploratory.io/note/exploratory/Eep7kip3).
<% if (!test_mode) { %>
* Model evaluation: To more rigorously evaluate the prediction performance of this model, you can validate it by splitting the data into training and test sets. In that case, set "Test Mode" under the "Validation" section in [Settings](//analytics/settings) to TRUE and re-run.
<% } %>
* Prediction on new data: When you want to make predictions on new data using the created model, add the "Predict with Model (Analytics View)" step to the target data frame. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).

`;

module.exports = template; 
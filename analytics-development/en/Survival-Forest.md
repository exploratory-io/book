const template = `

We created a Survival Forest model to predict the survival curve of <%= event_status %> based on the selected explanatory variables.

# Survival Curve

The following chart shows the survival curves for each explanatory variable based on the model. This curve shows the predicted values of survival probability (probability of event non-occurrence) over time (unit: <%= time_unit%>).

{{survival_curve}}

# Variable Relationships

<% if (predictorColumns.length > 1) { %>
## Variable Importance

The following chart shows which explanatory variables are relatively more important for predicting survival curves related to <%= event_status %>.

{{variable_importance}}

For more information on how variable importance works, please refer to [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>

## Variable Effects

The following chart shows how the probability of <%= event_status %> occurrence changes when the values of each explanatory variable change at the time point when the period is <%= survival_period%>. The period can be changed in [Settings](//analytics/settings/survival_period).

{{variable_effect}}

* The blue line (or points) shows the predicted values when other variables are held constant at the time point when the period is <%= survival_period%>.
* The gray lines show the observed values and their 95% confidence intervals.

Notes:

<% if (predictorColumns.length > 1) { %>

* Since we predict the effect of each explanatory variable individually when other variables are held constant, there may be discrepancies between the mean of observed values and predicted values.
* For details on how predicted values are calculated, please refer to [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* The explanatory variables are arranged in order of importance as shown in "Variable Importance" above.

<% } %>

<% if (has_category_columns) { %>
* For categorical (Character type, Factor type) explanatory variables with more than <%= predictor_n %> unique values, the top <%= predictor_n - 1 %> most frequent values are retained and the rest are grouped as "Others". This can be changed in [Settings](//analytics/settings/max_categories_for_factor).
<% } %>

# Model Metrics

<% if (!test_mode) { %>
The metrics related to model prediction accuracy are summarized in the table below.
<% } else { %>
The metrics related to model prediction accuracy are summarized in the table below. Since we are currently in test mode, metrics for both training data and test data are displayed.
<% } %>

{{summary_chart}}

## Prediction Accuracy

* Concordance Index
  * The concordance index is a metric that indicates the model's predictive ability, representing the probability that the model can correctly predict the order of actual survival times between two randomly selected observations (rows).
  * Values range from 0.5 to 1, where 0.5 is equivalent to random prediction and 1 means perfect prediction.
  * Generally, 0.7 or higher is considered acceptable, and 0.8 or higher indicates good predictive performance.

* Time-dependent AUC
  * Time-dependent AUC is a metric that measures how well this model can classify TRUE and FALSE data at a specific time point.
  * Currently, the prediction period is set to <%= survival_period%>, so the predicted survival rate at the <%= survival_period%> elapsed time point is used for calculating the time-dependent AUC. The period can be changed in [Settings](//analytics/settings/survival_period).
  * Values range from 0.5 to 1, where 0.5 is random prediction (equivalent to coin flipping) and 1 means perfect classification of TRUE and FALSE data.
  * Generally, 0.6 or higher is considered acceptable, 0.8 or higher is good, and 0.9 or higher indicates excellent classification performance.
  * By checking AUC at multiple time points, you can evaluate the temporal stability of the model's predictive performance.


<% if (!test_mode) { %>
## Predictions on Training Data

The following table shows the results of predictions made on the training data using the created prediction model.
<% } else { %>
## Predictions on Training and Test Data

The following table shows the results of predictions made on training data and test data using the created prediction model.
<% } %>

{start_lazy_show_hide}
### Prediction Results
{{data}}
{end_lazy_show_hide}


## ROC Curve

<% if (!test_mode) { %>
The following chart shows the ROC curve that evaluates the model's classification performance at various TRUE/FALSE threshold values. The Y-axis represents the true positive rate (sensitivity), and the X-axis represents the false positive rate (1-specificity). The blue line is the ROC curve for this model, and the diagonal gray dotted line represents random prediction (AUC: 0.5). The more the ROC curve bulges toward the upper left, the higher the prediction accuracy, and the closer it is to the diagonal line, the lower the prediction accuracy.
<% } else { %>
The following chart shows the ROC curve that evaluates the model's classification performance at various TRUE/FALSE threshold values. The Y-axis represents the true positive rate (sensitivity), and the X-axis represents the false positive rate (1-specificity). The blue line is the ROC curve for this model on test data, and the orange line is for training data. The diagonal gray dotted line represents random prediction (AUC: 0.5). The more the ROC curve bulges toward the upper left, the higher the prediction accuracy, and the closer it is to the diagonal line, the lower the prediction accuracy.
<% } %>

{{roc_curve}}

For ROC curve calculation, the predicted survival rate at the <%= survival_period%> elapsed time point is used. The period can be changed in [Settings](//analytics/settings/survival_period).

# Appendix

## Next Steps

* Variable selection optimization: Consider excluding predictor variables with low variable importance to simplify the model. This makes the model easier to interpret and reduces the risk of overfitting. For variable selection guidelines, please refer to [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
<% if (!repeat_by) { %>
* Group-based analysis: Creating separate models for each group may help you understand the determinants of survival curves within each group in more detail. In that case, you can select a grouping variable for "Repeat by" and re-run the analysis.
<% } %>
* Outlier verification: Check for outliers that may affect prediction accuracy and address them as necessary to potentially improve model reliability. For methods on removing outliers, please refer to [this note](https://exploratory.io/note/exploratory/Eep7kip3).
<% if (!test_mode) { %>
* Model evaluation: To more rigorously evaluate the predictive performance of this model, you can validate it by dividing into training data and test data. In that case, set "Test Mode" to TRUE in the "Validation" section under [Settings](//analytics/settings/test_mode) and re-run the analysis.
<% } %>
* Predictions on new data: When you want to make predictions on new data using the created model, add a "Predict with Model (Analytics View)" step to the data frame containing the data you want to predict. For details, please refer to [this note](https://exploratory.io/note/exploratory/qIr9Hfa5).

`;

module.exports = template; 
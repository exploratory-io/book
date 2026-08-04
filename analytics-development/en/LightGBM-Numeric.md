const template = `
<% const info = typeof basic_info !== 'undefined' ? basic_info : {}; %>
<% const stats = typeof target_statistics !== 'undefined' ? target_statistics : {}; %>
<% const groups = typeof characteristic_groups !== 'undefined' ? characteristic_groups : { high: [], low: [] }; %>
<% const metrics = typeof numeric_metrics !== 'undefined' ? numeric_metrics : {}; %>
<% const errors = typeof numeric_errors !== 'undefined' ? numeric_errors : {}; %>
<% const suggestions = typeof improvement_suggestions !== 'undefined' ? improvement_suggestions : []; %>

# Summary

A LightGBM model was created to predict the numeric target **<%= target %>** from the selected explanatory variables.

## Data and model information

{{basic_info}}

## Target statistics

{{target_statistics}}



# Predictive Variables

## Variable importance

{{variable_importance}}

Importance uses the existing permutation importance calculated for the fitted model and is normalized so that the largest value is 100. The tooltip shows relative importance only. Importance describes predictive contribution, not causation.

## Variable values and predictions

{{variable_effect}}

This partial-dependence view shows how predicted values change as one explanatory variable changes while the other variables are held constant. The step-like shape reflects the decision-tree splits; it does not establish a causal relationship.

# Prediction Accuracy

<% if (test_mode) { %>
Metrics for training and test data are shown where available. The test data was not used to fit the tree.
<% } else { %>
Metrics below describe the fitted data. Enable Test Mode to evaluate performance on unseen data.
<% } %>

## Model metrics

{{summary}}

R-squared is the proportion of target variation explained by the model. RMSE weights large errors more heavily, while MAE is the typical absolute error. A positive mean error indicates under-prediction on average; a negative value indicates over-prediction.

## Actual and predicted values

{{actual_predicted}}

Points near the diagonal represent accurate predictions. In Test Mode, compare the training and test point clouds to identify generalization gaps.

## Prediction error distribution

{{prediction_error_distribution}}

Prediction error is defined as **actual − predicted**. The zero line represents no error and the additional reference line represents the mean error. Tails indicate rows that deserve investigation.

## Predicted value and prediction error

{{prediction_value_error}}

This chart checks whether errors change with the predicted value. A trend or widening spread can indicate bias or heteroscedasticity.

## Learning Progress

{start_lazy_show_hide}
### Chart
{{learning_curve_numeric}}
{end_lazy_show_hide}

# Prediction Results

{{data}}
`;
module.exports = template;

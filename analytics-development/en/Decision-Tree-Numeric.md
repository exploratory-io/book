const template = `
<% const info = typeof basic_info !== 'undefined' ? basic_info : {}; %>
<% const stats = typeof target_statistics !== 'undefined' ? target_statistics : {}; %>
<% const groups = typeof characteristic_groups !== 'undefined' ? characteristic_groups : { high: [], low: [] }; %>
<% const metrics = typeof numeric_metrics !== 'undefined' ? numeric_metrics : {}; %>
<% const errors = typeof numeric_errors !== 'undefined' ? numeric_errors : {}; %>
<% const suggestions = typeof improvement_suggestions !== 'undefined' ? improvement_suggestions : []; %>

# Summary

A decision tree model was created to predict the numeric target **<%= target %>** from the selected explanatory variables.

## Data and model information

{{basic_info}}

## Target statistics

{{target_statistics}}

# Characteristic Groups

Every terminal node is listed as a segment, ordered from the highest predicted value down. Conditions are the complete root-to-leaf paths, and the group size is based on training data.

{{characteristic_groups}}

<% if ((groups.high || []).length) { %>
The highest predicted group is **<%= groups.high[0].path || '—' %>**. <% if (groups.high[0].small) { %>Because this group has fewer than 30 rows, the interpretation should be treated as tentative.<% } %>
<% } %>
<% if ((groups.low || []).length) { %>
The lowest predicted group is **<%= groups.low[0].path || '—' %>**.
<% } %>

<% if ((groups.high || []).some(group => group.small) || (groups.low || []).some(group => group.small)) { %>
> Some characteristic groups contain fewer than 30 rows. Their estimates can be unstable, so interpret them together with the row count and test-data comparison.
<% } %>

# Decision Tree

The decision tree below represents the series of condition-based splits created by the model to predict the target. Follow the branches from the top node according to the conditions; when you reach a terminal node at the bottom, the prediction for that group is determined.

{{tree_structure}}

Each node shows the target mean, the number of rows, and the share of training data reaching that node. The value in a terminal node is the prediction used for rows satisfying its complete path. Test rows are not included when describing the fitted tree.

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

# Prediction Results

{{data}}

# Conditional Improvement Suggestions

<% if (!suggestions.length) { %>
No automatic warning was triggered by the available metrics. Consider validating the tree on unseen data and reviewing the largest errors.
<% } %>
<% suggestions.forEach(suggestion => { %>
<% if (suggestion.id === 'overfit_gap') { %>
* Training and test performance differ materially. Consider shallower depth, larger terminal nodes, or stronger pruning.
<% } else if (suggestion.id === 'weak_single_tree') { %>
* No predictor has measurable importance. Review the input variables and consider an ensemble model if a single tree cannot capture the pattern.
<% } %>
<% }) %>

For a stable analysis, inspect the characteristic groups and the largest prediction errors before changing model parameters.
`;
module.exports = template;

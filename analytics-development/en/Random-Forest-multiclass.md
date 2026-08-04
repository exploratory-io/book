const template = `
<% const info = typeof basic_info !== 'undefined' ? basic_info : {}; %>
<% const distribution = typeof target_distribution !== 'undefined' ? target_distribution : { categories: [] }; %>
<% const groups = typeof characteristic_groups !== 'undefined' ? characteristic_groups : { byCategory: {} }; %>
<% const metrics = typeof multiclass_metrics !== 'undefined' ? multiclass_metrics : {}; %>
<% const suggestions = typeof improvement_suggestions !== 'undefined' ? improvement_suggestions : []; %>

# Summary

A Random Forest model was created to predict the multi-category target **<%= target %>** from the selected explanatory variables.

## Data and model information

{{basic_info}}

## Target distribution

{{target_distribution}}

Rows and share per category. In test mode the training and the test data are shown separately.



# Predictive Variables

## Variable importance

<% if (with_boruta) { %>{{variable_importance_boxplot}}<% } else { %>{{variable_importance}}<% } %>

Importance uses the existing permutation importance calculated for the fitted model and is normalized so the largest bar is 100. Tooltips show relative importance only. Importance is predictive contribution, not causation.

## Variable values and category probabilities

{{variable_effect}}

Partial dependence shows category-specific predicted probabilities as one explanatory variable changes. The step pattern reflects decision-tree splits and does not establish causality.

# Prediction Accuracy

<% if (test_mode) { %>Training and test performance are compared where available. Test rows were not used to fit the tree.<% } else { %>Metrics describe the fitted data. Enable Test Mode to evaluate unseen data.<% } %>

## Overall metrics

{{summary}}

Macro F1 averages category F1 scores. Macro ROC AUC and Macro PR AUC average one-vs-rest category scores, so every category has equal weight regardless of its overall share.

## Per-category metrics

{{class_summary}}

Per-category ROC AUC and PR AUC use one-vs-rest comparisons: the selected category is positive and all other categories are negative. The overall share is the baseline for interpreting a category's precision–recall curve.

## Confusion matrix — total percentage

{{confusion_matrix_total}}

Each cell shows count and percentage of all evaluated rows.

## Confusion matrix — row percentage

{{confusion_matrix_row}}

Each actual-category row is normalized independently, making category-specific misses visible.

## Category probability distribution

{{multiclass_probability_density}}

The density is shown for each category's predicted probability. A strong model concentrates the probability for the actual category near 1.

## Category ROC curves

{{multiclass_roc}}

Each curve is one-vs-rest and includes the random baseline. Compare category AUCs rather than relying only on overall accuracy.

## Category Precision–Recall curves

{{multiclass_pr}}

Each curve has a baseline equal to that category's overall share. PR AUC is often more informative than ROC AUC for rare categories.

# Prediction Results

{{data}}
`;
module.exports = template;

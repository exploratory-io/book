const template = `
<% const info = typeof basic_info !== 'undefined' ? basic_info : {}; %>
<% const distribution = typeof target_distribution !== 'undefined' ? target_distribution : { categories: [] }; %>
<% const groups = typeof characteristic_groups !== 'undefined' ? characteristic_groups : { byCategory: {} }; %>
<% const metrics = typeof multiclass_metrics !== 'undefined' ? multiclass_metrics : {}; %>
<% const suggestions = typeof improvement_suggestions !== 'undefined' ? improvement_suggestions : []; %>

# Summary

A decision tree model was created to predict the multi-category target **<%= target %>** from the selected explanatory variables.

## Data and model information

{{basic_info}}

## Target distribution

{{target_distribution}}

Rows and share per category. In test mode the training and the test data are shown separately.

# Characteristic Groups

Every terminal node is listed as a segment, grouped by its dominant category and ordered by the within-group share. The group share, overall category share, and their ratio should be considered together; a small group can produce an unstable ratio.

{{characteristic_groups}}

<% Object.keys(groups.byCategory || {}).forEach(category => { const group = groups.byCategory[category]; %>
<% if (group) { %>For **<%= category %>**, the most characteristic available group is **<%= group.path || '—' %>**.<% if (group.small) { %> Its small row count requires caution.<% } %>
<% } %>
<% }) %>

<% if (Object.keys(groups.byCategory || {}).some(category => groups.byCategory[category].small)) { %>
> At least one characteristic group contains fewer than 30 rows. Keep the group visible, but interpret the category ratio cautiously.
<% } %>

# Decision Tree

The decision tree below represents the series of condition-based splits created by the model to predict the target. Follow the branches from the top node according to the conditions; when you reach a terminal node at the bottom, the prediction for that group is determined.

{{tree_structure}}

Each node shows counts and percentages for each category, the highest-probability category, and the share of training rows. The terminal-node probabilities are model predictions, not causal effects.

# Predictive Variables

## Variable importance

{{variable_importance}}

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

# Conditional Improvement Suggestions

<% if (!suggestions.length) { %>No automatic warning was triggered by the available metrics.<% } %>
<% suggestions.forEach(suggestion => { %>
<% if (suggestion.id === 'overfit_gap') { %>* Training and test performance differ materially. Reduce tree depth, increase terminal-node size, or strengthen pruning.<% } else if (suggestion.id === 'weak_single_tree') { %>* No predictor has measurable importance. Review input variables or consider an ensemble model.<% } %>
<% }) %>
`;
module.exports = template;

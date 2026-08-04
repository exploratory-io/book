const template = `

# 1. Summary

The CHAID decision tree predicts <%= target %> from <%= predictor_count %> explanatory variables. CHAID selects variables whose target distributions differ statistically, merges similar categories, and recursively splits the data into interpretable groups.

## Data and model overview

| Item | Value |
| :-- | :-- |
| Analysis method | CHAID decision tree |
| Target variable | <%= target %> (<%= target_type %>) |
| Categories | <%= target_category_count %> |
| Explanatory variables | <%= predictor_count %> |
| Variables used in splits | <%= split_variable_count %> |
| Rows used | <%= row_count === null ? 'Not available' : row_count %> |
| Branch nodes | <%= split_node_count %> |
| Terminal nodes | <%= terminal_node_count %> |
| Maximum observed depth | <%= observed_max_depth %> |
| Evaluation | <%= test_mode ? 'Test / training data' : 'Training data' %> |

## Target distribution

{{target_distribution}}


## CHAID analysis settings

| Setting | Value |
| :-- | :-- |
| Split significance level | <%= alpha_split %> |
| Merge significance level | <%= alpha_merge %> |
| Chi-square statistic | <%= chi_square %> |
| Bonferroni correction | <%= bonferroni %> |
| Re-splitting merged categories | <%= allow_resplit %> |
| Maximum depth | <%= max_depth %> |
| Minimum rows before split | <%= min_split %> |
| Minimum terminal-node rows | <%= min_bucket %> |
| Minimum child-node proportion | <%= min_node_proportion %> |
| Numeric binning | <%= numeric_binning %> |
| Initial numeric bins | <%= numeric_bins %> |
| Missing values | <%= missing %> |
| Target category limit | <%= target_n %> |
| Predictor category limit | <%= predictor_n %> |
| Maximum predictor categories | <%= max_categories %> |

<% if (!has_splits) { %>
No split was produced: no explanatory variable met the configured significance level, so the tree has no branches. With the current data and settings, no explanatory variable had a statistically clear relationship with the target.
<% } %>

# 2. Characteristic Groups

For each target category, the most characteristic terminal-node group is shown — the group with the highest share of that category. The overall ratio compares that share with the category's full-data percentage.

{{feature_groups_top}}

Small groups can be unstable on new data. Treat a high ratio as a description of this tree's segmentation, not as evidence of causality.

# 3. Decision Tree

The tree below shows how CHAID recursively creates groups with different target distributions. A node may have three or more branches, and numeric predictors are represented by the final intervals used for the split.

{{tree_structure}}

Each node shows its target composition, row count, and predicted class. Branch labels show the parent condition.

# 4. Split Details

## 4-1. Split information

The table below shows the test results that evaluate the relationship between each explanatory variable used to create the tree's splits and the target variable.

{{split_evidence}}

## 4-2. Category composition by branch

Each split's child-node target compositions are shown side by side so you can see why the split created different groups. Charts are built per split node (not per variable). Within each chart, the parent composition is shown first, followed by the children produced by that split.

{start_lazy_show_hide}
{{branch_category_composition}}
{end_lazy_show_hide}

Each bar shows the target composition within the group created by this split. The larger the differences in composition between groups, the more this split separates the target into distinct groups.

## 4-3. Category merging

<% if (has_category_merges) { %>
CHAID merges categories whose target compositions are not statistically different before it splits.

{{category_merges}}
<% } else { %>
No category merge was recorded for this model.
<% } %>

<% if (has_numeric_predictors) { %>
## 4-4. Numeric intervals

Numeric predictors are first converted into multiple intervals; intervals with similar target compositions are then merged.

{{numeric_intervals}}
<% } %>

# 5. Variable Importance

Permutation importance is calculated by shuffling one predictor at a time and measuring the increase in classification log loss. Positive values indicate that the shuffled predictor worsened predictions; the evaluation data is Test in Test Mode and Training otherwise.

{start_lazy_show_hide}
{{variable_importance}}
{end_lazy_show_hide}

This importance measures the contribution to predictive performance. Because it evaluates a different aspect than where a variable appears in the tree structure (see "Split Details"), the two orders may not match.

Variable importance does not indicate the direction of the relationship with the target or any causal effect.

# 6. Model Prediction Accuracy

The following sections use the same evaluation definitions as the CART decision tree. When test mode is enabled, training and test results are shown separately.

{{summary}}

{{class_summary}}

## Prediction matrix

{{confusion_matrix}}
<% if (has_ordered_error) { %>
## Category Error Distribution

The target is an ordered category, so predictions can be scored by how far they fall from the actual category on the ordinal scale: 0 means correct, and ±1, ±2, … count how many categories the prediction missed by. A distribution concentrated at 0 (and ±1) indicates small, mostly adjacent errors; mass at ±2 or beyond indicates large ordinal misclassifications.

{{category_error_distribution}}
<% } %>

# 7. Prediction Results

{start_lazy_show_hide}
### Table
{{data}}
{end_lazy_show_hide}

# 8. Improvement Suggestions

<% if (!has_splits) { %>
With the current settings, no split met the significance level. Check the split significance level, the minimum rows before splitting, and the initial numeric bin count. Relaxing the significance level can also increase the chance of treating chance differences as splits.
<% } %>
<% if (tree_too_complex) { %>
Many small nodes were created. Consider a stricter split significance level, more aggressive category merging, larger minimum node sizes, or a smaller maximum depth. Concretely: decrease "Significance Level for Split", decrease "Significance Level for Merge", increase "Min Size for Node before Split", increase "Min Size for Terminal Node", increase "Min Proportion for Child Node", and/or decrease "Max Tree Depth".
<% } %>
<% if (has_aggressive_merges) { %>
Many categories are being merged into the same group. Increasing the merge significance level makes it more likely that categories remain separate.
<% } %>
<% if (fine_numeric_bins) { %>
Numeric variables are split into many fine intervals. Consider reducing the initial bin count or increasing the minimum terminal-node rows.
<% } %>
<% if (has_many_small_nodes) { %>
Several terminal nodes have few rows. The category composition of those groups can change substantially on new data.
<% } %>
CHAID is well suited to discovering statistically distinct segments that are easy to interpret. When higher predictive performance is needed, compare with CART, Random Forest, XGBoost, LightGBM, CatBoost, and similar models.
<% if (has_ordered_error) { %>
When many predictions land two or more categories away from the actual value, review the Category Error Distribution and the ordered confusion matrix to locate groups with large prediction shifts.
<% } %>

`;
module.exports = template;

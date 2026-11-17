const template = `
<% const info = typeof basic_info !== 'undefined' ? basic_info : {}; %>
<% const distribution = typeof target_distribution !== 'undefined' ? target_distribution : { categories: [] }; %>
<% const metrics = typeof logical_metrics !== 'undefined' ? logical_metrics : {}; %>
<% const cut = typeof threshold_analysis !== 'undefined' && threshold_analysis ? threshold_analysis : null; %>
<% const cutObjective = cut ? cut.objective : (typeof threshold_objective !== 'undefined' ? threshold_objective : 'balanced_accuracy'); %>
<% const cutHasMinRecall = !!(cut && cut.minimum_recall_display); %>
<% const cutHasMinPrecision = !!(cut && cut.minimum_precision_display); %>
<% const cutMinRecall = cutHasMinRecall ? cut.minimum_recall_display : 'not set'; %>
<% const cutMinPrecision = cutHasMinPrecision ? cut.minimum_precision_display : 'not set'; %>
<% const cutMethodShort = cutObjective === 'f1' ? 'maximize the F1 score' : cutObjective === 'precision_at_recall' ? (cutHasMinRecall ? 'maximize precision at recall ' + cutMinRecall + ' or higher' : 'maximize precision under a recall floor') : cutObjective === 'recall_at_precision' ? (cutHasMinPrecision ? 'maximize recall at precision ' + cutMinPrecision + ' or higher' : 'maximize recall under a precision floor') : 'maximize balanced accuracy'; %>
<% const cutMethodShortLabel = cut && cut.available ? cutMethodShort : '—'; %>
<% const cutMethodSentence = cutObjective === 'f1' ? 'maximizes the F1 score, balancing precision against recall' : cutObjective === 'precision_at_recall' ? ('maximizes precision among the cut points that keep recall at ' + cutMinRecall + ' or higher') : cutObjective === 'recall_at_precision' ? ('maximizes recall among the cut points that keep precision at ' + cutMinPrecision + ' or higher') : 'maximizes balanced accuracy, so TRUE and FALSE are classified with comparable success'; %>

# Summary

A CatBoost model was created to predict the logical target **\`<%= target %>\`** from the selected explanatory variables.

## Data and model information

{{basic_info}}

## Target distribution

{{target_distribution}}

Rows and share. In test mode the training and the test data are shown separately.



# Predictive Variables

## Variable importance

{{variable_importance}}

The horizontal bars use the existing permutation importance calculated for the fitted model and are normalized so the largest importance is 100. Tooltips show relative importance only. Importance is predictive contribution, not causation.

## Variable values and predicted probability

{{variable_effect}}

This partial-dependence view shows how predicted TRUE probability changes as one explanatory variable changes. Decision-tree steps reflect split rules and should not be interpreted as causal effects.

# Prediction Accuracy

<% if (test_mode) { %>Compares the prediction performance on the training data used to build the model with the test data that was held out. The test results show whether the model predicts unseen data just as well.<% } else { %>Current metrics are calculated from predictions on the training data. To evaluate accuracy on unseen data, enable "Test Mode" from [Settings](chrome-extension://analytics/settings/test_mode).<% } %>

## Model metrics

{{summary}}

- ROC AUC and PR AUC evaluate how well the model discriminates across the whole range of cut points, not at one particular cut point. The other metrics are the result of classifying rows as TRUE or FALSE at the current cut point (<%= cut && cut.current_threshold_display ? cut.current_threshold_display : true_false_criteria %>). The cut point can be changed from [Settings](chrome-extension://analytics/settings/true_false_criteria).
<% if (test_mode) { %>- When evaluating the model's real prediction performance, focus on the results for the test data, which was not used to build the model. If the test metrics are much lower than the training ones, the model is likely overfitted to the training data and may not perform well on unseen data.
<% } %>- When the TRUE and FALSE counts are imbalanced, accuracy can be high simply by predicting the majority category. Read it together with balanced accuracy, recall, precision, and F1 score.
- Especially when TRUE cases are rare, PR AUC makes it easier to see the balance between finding TRUE cases and wrongly predicting TRUE.

{start_show_hide}
## Detailed Model Metrics

* ROC AUC
  * ROC AUC is one of the most commonly used metrics for evaluating the classification performance of a model that predicts TRUE and FALSE.
  * It evaluates, across different classification thresholds, how well the model assigns higher predicted probabilities to TRUE cases than to FALSE cases.
  * The value typically ranges from 0.5 to 1. A value of 0.5 indicates performance similar to random guessing, while a value of 1 indicates that the model can perfectly distinguish between TRUE and FALSE.
  * As a general guideline, a value of 0.6 or higher indicates some classification ability, 0.8 or higher indicates good performance, and 0.9 or higher indicates excellent performance.
  * ROC AUC stands for “Receiver Operating Characteristic Area Under the Curve” and represents the area under the ROC curve.

* PR AUC
  * PR AUC is the area under the Precision-Recall curve, which shows the relationship between Precision and Recall.
  * It summarizes Precision and Recall across different classification thresholds and measures how accurately and completely the model can identify TRUE cases.
  * The value ranges from 0 to 1. A value closer to 1 indicates that both Precision and Recall are high.
  * It is particularly useful when TRUE cases are rare or when there is a large imbalance between the number of TRUE and FALSE cases.
  * PR AUC stands for “Precision-Recall Area Under the Curve” and represents the area under the Precision-Recall curve.

* F1 Score
  * The F1 Score is the harmonic mean of Precision and Recall and measures the balance between the two.
  * The value ranges from 0 to 1. A value closer to 1 indicates that the model is both accurate when predicting TRUE and effective at finding actual TRUE cases.
  * Because it does not directly evaluate how well the model identifies FALSE cases, it is most suitable when detecting TRUE cases is the main priority.
  * It is particularly useful when TRUE cases are rare and Accuracy alone may not adequately represent model performance.

* Balanced Accuracy
  * Balanced Accuracy is the average of Recall and Specificity and evaluates how well the model correctly classifies both TRUE and FALSE cases.
  * The value ranges from 0 to 1. A value closer to 1 indicates that the model accurately classifies both TRUE and FALSE cases.
  * A value of 0.5 indicates performance similar to random guessing, while a value of 1 indicates perfect classification of both TRUE and FALSE.
  * Because it gives equal importance to both classes, it may be more appropriate than Accuracy when there is a large imbalance between TRUE and FALSE cases.

* Accuracy
  * Accuracy is the proportion of all predictions in which the model correctly predicts either TRUE or FALSE.
  * The value ranges from 0 to 1. A value closer to 1 indicates that the model correctly classifies a larger proportion of the data overall.
  * Although Accuracy is intuitive and easy to understand, it may overstate model performance when there is a large imbalance between TRUE and FALSE cases.
  * For example, if most cases are FALSE, a model may achieve high Accuracy simply by predicting every case as FALSE. For this reason, Accuracy should be evaluated together with metrics such as Recall, Precision, and Balanced Accuracy.

* Error Rate
  * Error Rate is the proportion of all predictions in which the model incorrectly predicts either TRUE or FALSE.
  * It is calculated as “1 − Accuracy” and ranges from 0 to 1. A value closer to 0 indicates fewer incorrect predictions.
  * Because it is the inverse of Accuracy, it may not adequately represent model performance when there is a large imbalance between TRUE and FALSE cases.
  * To understand the types of errors being made, Error Rate should be evaluated together with metrics such as Precision, Recall, and Specificity.

* Precision
  * Precision is the proportion of cases predicted as TRUE that are actually TRUE.
  * The value ranges from 0 to 1. A value closer to 1 indicates that a TRUE prediction is more likely to be correct.
  * Precision is especially important when false positives—cases that are actually FALSE but are predicted as TRUE—need to be minimized.
  * For example, Precision is important when each TRUE prediction leads to additional cost or follow-up work.

* Recall
  * Recall is the proportion of actual TRUE cases that are correctly predicted as TRUE.
  * The value ranges from 0 to 1. A value closer to 1 indicates that the model is less likely to miss actual TRUE cases.
  * Recall is especially important when false negatives—cases that are actually TRUE but are predicted as FALSE—need to be minimized.
  * For example, Recall is important when the goal is to identify as many important cases as possible without missing them.

* Specificity
  * Specificity is the proportion of actual FALSE cases that are correctly predicted as FALSE.
  * The value ranges from 0 to 1. A value closer to 1 indicates that the model is less likely to incorrectly classify actual FALSE cases as TRUE.
  * Specificity is especially important when false positives—cases that are actually FALSE but are predicted as TRUE—need to be minimized.
  * While Recall measures the model’s ability to correctly classify actual TRUE cases, Specificity measures its ability to correctly classify actual FALSE cases.

{end_show_hide}

## Confusion matrix — total percentage

<% if (test_mode) { %>The table below summarizes how many of the model's predictions for each row of the training and test data matched, or differed from, the actual value. The numbers are the row count of each combination and its **percentage of all data (%)**.<% } else { %>The table below summarizes how many of the model's predictions for each row of the training data matched, or differed from, the actual value. The numbers are the row count of each combination and its **percentage of all data (%)**.<% } %>

{{confusion_matrix_total}}

## Confusion matrix — row percentage

<% if (test_mode) { %>The table below summarizes how many of the model's predictions for each row of the training and test data matched or differed from the actual value. The numbers are the row count of each combination and its **percentage within each actual value (%)**.<% } else { %>The table below summarizes how many of the model's predictions for each row of the training data matched or differed from the actual value. The numbers are the row count of each combination and its **percentage within each actual value (%)**.<% } %>

{{confusion_matrix_row}}

## Predicted probability distribution

Shows the TRUE probability the model predicted for each row, split into the group whose actual value is TRUE and the group whose actual value is FALSE. Comparing the two distributions shows how well the model separates TRUE from FALSE.

{{probability_distribution}}

- The more the actual TRUE group (blue) sits toward 1 on the right and the actual FALSE group (orange) sits toward 0 on the left, with little overlap between the two distributions, the better the model discriminates.
- Where the two distributions overlap, false positives (FALSE predicted as TRUE) and misses (TRUE predicted as FALSE) are more likely.
- The vertical axis is density, which compares the shape of the distributions, not the number of rows. The height of the curves therefore cannot be used to compare the TRUE and FALSE row counts.

## ROC curve

The ROC curve shows how the share of TRUE cases that are correctly found and the share of FALSE cases that are wrongly judged TRUE change as the cut point for judging TRUE changes. The vertical axis, the true positive rate, is the share of actual TRUE rows correctly judged TRUE, which is the same as recall. The horizontal axis, the false positive rate, is the share of actual FALSE rows wrongly judged TRUE, that is 1 − specificity.

{{roc_curve}}

<% if (test_mode) { %>- The blue line is the result on the training data and the orange line is the result on the test data. The closer the curve is to the top-left, the better the model finds TRUE cases while holding down false positives on FALSE cases, which indicates stronger classification performance. The grey diagonal represents performance equivalent to a random prediction.
- When evaluating the real prediction performance, focus on the test curve. If the test curve is well below the training curve, performance may be dropping on unseen data.
<% } else { %>- The blue line is the result on the training data. The closer the curve is to the top-left, the better the model finds TRUE cases while holding down false positives on FALSE cases, which indicates stronger classification performance. The grey diagonal represents performance equivalent to a random prediction.
<% } %>- ROC AUC is the area under the ROC curve. Values near 1 separate TRUE and FALSE well; 0.5 is about as good as random classification.

## Precision–Recall curve

The PR curve shows how precision and recall change as the cut point for judging TRUE changes. The vertical axis, precision, is the share of rows predicted TRUE that are actually TRUE. The horizontal axis, recall, is the share of actual TRUE rows that are correctly predicted TRUE.

{{pr_curve}}

<% if (test_mode) { %>- The blue line is the result on the training data and the orange line is the result on the test data. The closer the curve is to the upper-right, the more TRUE cases the model finds while wrongly predicting TRUE less often, which indicates stronger model performance.
<% } else { %>- The blue line is the result on the training data. The closer the curve is to the upper-right, the more TRUE cases the model finds while wrongly predicting TRUE less often, which indicates stronger model performance.
<% } %>- In general, raising recall lowers precision and raising precision lowers recall, so the curve shows that trade-off.
- PR AUC is the area under the PR curve. When TRUE cases are rare, it tends to capture the balance between finding TRUE cases and false positives more clearly than ROC AUC.

# Cut Point Analysis

A row is predicted TRUE when its predicted probability is at or above the cut point, and FALSE when it is below. Changing the cut point moves recall (how easily TRUE is found), precision (how accurate TRUE predictions are), specificity (how correctly FALSE is judged), and the other metrics.

## Recommended cut point

<% if (cut && cut.available) { %>The values below show the current cut point that separates TRUE from FALSE, and the recommended cut point calculated assuming \`<%= cutMethodShort %>\`.<% } %>

<% if (cut && cut.available) { %>
{{threshold_recommendation}}
<% } else if (cut && (cut.status === 'missing_minimum_recall' || cut.status === 'missing_minimum_precision')) { %>
The <%= cut.status === 'missing_minimum_recall' ? 'Minimum Recall' : 'Minimum Precision' %> property is empty. Enter a value and run again.
<% } else if (cut && cut.recommended_is_above_max) { %>
Predicting FALSE for every row scores best here, so this model does not separate TRUE from FALSE. Review the explanatory variables and the data.
<% } else if (cut && (cut.status === 'no_threshold_for_minimum_recall' || cut.status === 'no_threshold_for_minimum_precision')) { %>
No cut point reaches the required <%= cut.status === 'no_threshold_for_minimum_recall' ? 'recall' : 'precision' %> of <%= cut.status_value_display %>.<% if (cut.best_achievable_display) { %> The best this data reaches is <%= cut.best_achievable_display %>.<% } %> Lower the requirement or improve the model, then run again.
<% } else { %>
A recommended cut point needs both TRUE and FALSE rows in the evaluated data, so none is available here.
<% } %>

<% if (cut && cut.available) { %>
The recommended cut point is calculated based on the \`Recommendation Method\`. You can change the \`Recommendation Method\` from [Settings](chrome-extension://analytics/settings/threshold_objective).
<% } %>

<% if (cut && cut.available) { %>
## Current versus recommended cut point

<% if (cut.is_same_as_current) { %>
The current cut point already is the recommended one, so none of these metrics change.
<% } else { %>
Moving the cut point from <%= cut.current_threshold_display %> to <%= cut.recommended_threshold_display %> <% if (cut.by_id.recall.delta > 0) { %>raises recall from <%= cut.by_id.recall.current_display %> to <%= cut.by_id.recall.recommended_display %><% } else if (cut.by_id.recall.delta < 0) { %>lowers recall from <%= cut.by_id.recall.current_display %> to <%= cut.by_id.recall.recommended_display %><% } else { %>leaves recall at <%= cut.by_id.recall.current_display %><% } %>. At the same time the rows predicted TRUE <% if (cut.by_id.predicted_positive.delta > 0) { %>grow from <%= cut.by_id.predicted_positive.current_display %> to <%= cut.by_id.predicted_positive.recommended_display %><% } else if (cut.by_id.predicted_positive.delta < 0) { %>shrink from <%= cut.by_id.predicted_positive.current_display %> to <%= cut.by_id.predicted_positive.recommended_display %><% } else { %>stay at <%= cut.by_id.predicted_positive.current_display %><% } %>, and precision <% if (cut.by_id.precision.delta > 0) { %>rises from <%= cut.by_id.precision.current_display %> to <%= cut.by_id.precision.recommended_display %><% } else if (cut.by_id.precision.delta < 0) { %>falls from <%= cut.by_id.precision.current_display %> to <%= cut.by_id.precision.recommended_display %><% } else { %>stays at <%= cut.by_id.precision.current_display %><% } %>.
<% } %>

### Predicted counts

{{threshold_prediction_counts}}

### Prediction metrics

{{threshold_comparison}}

<% } %>

<% if (cut && cut.has_curve) { %>
## Cut point chart

This chart shows how recall, precision, balanced accuracy and the other metrics change as the cut point that classifies a predicted probability as TRUE or FALSE moves.

{{threshold_chart}}

Lowering the cut point classifies more rows as TRUE, so recall tends to rise. Because FALSE rows are also more likely to be predicted TRUE, precision and specificity can fall at the same time.

<% if (cut && cut.available) { %>Comparing the current and recommended cut points shows how much missed TRUE cases can be reduced, and how much wrong TRUE predictions increase instead. <% } %>Metrics such as specificity and F1 score can be added to the chart from Cut Point Analysis in the settings.
<% } %>

## Learning Progress

{start_lazy_show_hide}
### Chart
{{learning_curve_logical}}
{end_lazy_show_hide}

# Prediction Results

{{data}}

`;
module.exports = template;

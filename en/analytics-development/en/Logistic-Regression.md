const template =
`
<% const info = typeof basic_info !== 'undefined' ? basic_info : {}; %>
<% const distribution = typeof target_distribution !== 'undefined' ? target_distribution : { categories: [] }; %>
<% const groups = typeof characteristic_groups !== 'undefined' ? characteristic_groups : { high: [] }; %>
<% const metrics = typeof logical_metrics !== 'undefined' ? logical_metrics : {}; %>
<% const suggestions = typeof improvement_suggestions !== 'undefined' ? improvement_suggestions : []; %>
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

A Logistic Regression model was created to predict the logical target **\`<%= target %>\`** from the selected explanatory variables.

## Data and model information

{{basic_info}}

## Target distribution

{{target_distribution}}

Rows and share. In test mode the training and the test data are shown separately.

# Multicollinearity

<% if (has_perfect_collinearity) { %>
{{multicollinearity:0.6}}

In this model, "<%= perfect_collinearity_variables %>" column creates a problem of [perfect multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be perfectly calculated by a formula using other predictor variables), resulting in infinite VIF scores and preventing the generation of charts for testing multicollinearity. To resolve the multicollinearity issue, please exclude "<%= perfect_collinearity_variables %>" column from the predictor variables and re-run the analysis.
<% } else if (max_vif > 10) { %>
{{multicollinearity}}
 <% if (perfect_collinearity_groups && perfect_collinearity_groups.length > 0) { %>
<%= perfect_collinearity_groups.join(', ') %> have a problem of [perfect multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be perfectly calculated by a formula using other predictor variables), resulting in infinite VIF scores and preventing the generation of charts for testing multicollinearity. To resolve the multicollinearity issue, please exclude <%= perfect_collinearity_groups.join(', ') %> from the predictor variables and re-run the analysis.
For other groups, this model shows signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple predictor variables). When predictor variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.
To resolve this issue, exclude one predictor variable with low necessity from those with VIF values exceeding 10, re-run the analysis, and repeat this process until no predictor variables have VIF values exceeding 10.
  <% } else { %>
This model shows signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple predictor variables). When predictor variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.
To resolve this issue, exclude one predictor variable with low necessity from those with VIF values exceeding 10, re-run the analysis, and repeat this process until no predictor variables have VIF values exceeding 10.
  <% } %>
<% } else { %>
{{multicollinearity}}
    <% if (perfect_collinearity_groups && perfect_collinearity_groups.length > 0) { %>
<%= perfect_collinearity_groups.join(', ') %> have a problem of [perfect multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be perfectly calculated by a formula using other predictor variables), resulting in infinite VIF scores and preventing the generation of charts for testing multicollinearity. To resolve the multicollinearity issue, please exclude <%= perfect_collinearity_groups.join(', ') %> from the predictor variables and re-run the analysis.
For other groups, this model does not show signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple predictor variables). (When predictor variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.)
    <% } else { %>
This model does not show signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple predictor variables). (When predictor variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.)
    <% } %>
<% } %>


# Variable Relationships

<% if (predictorColumns.length > 1) { %>
## Variable Importance

The following chart shows which predictor variables are relatively more important for predicting <%= target %>.

{{variable_importance}}

For more information about how variable importance works, please see [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>

## Effect of Predictor Variables

<% if (predictorColumns.length > 1) { %>
The following chart shows how the value of <%= target %> changes when the probability of each predictor variable changes while other variables remain constant.
<% } else { %>
The following chart shows how the probability of <%= target %> changes when the value of the predictor variable changes.
<% } %>

{{variable_effect}}

* The blue line (or points) shows the predicted values for the predictor variable values.
* The gray lines show the actual values and their 95% confidence intervals.
* The vertical axis represents the probability of <%= target %>.

Notes:

<% if (predictorColumns.length > 1) { %>

* Since this predicts the effect of each predictor variable individually while other variables remain constant, there may be discrepancies between the mean of actual values and predicted values.
* For details on how predicted values are calculated, please see [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* For differences in interpretation between simple regression and multiple regression analysis, please see [this note](https://exploratory.io/note/exploratory/BDI7AeE5).
* Predictor variables are arranged in order of importance as shown in the "Variable Importance" section above.

<% } %>

<% if (has_category_columns) { %>
* For categorical (Character, Factor) predictor variables with more than <%= predictor_n %> unique values, the top <%= predictor_n - 1 %> most frequent values are retained and the rest are grouped as "Others". This can be changed in [Settings](//analytics/settings/max_categories_for_factor).
<% } %>

<% if (is_variable_odds_ratio) { %>
# Coefficient & Significance

The coefficients (odds ratios), p-values for determining significance, and confidence intervals are listed for each variable.

{{coefficient_table}}

<% if (has_category_columns) { %>
_For categorical (Character, Factor) predictor variables with more than <%= predictor_n %> unique values, the top <%= predictor_n - 1 %> most frequent values are retained and the rest are grouped as "Others". This can be changed in [Settings](//analytics/settings/max_categories_for_factor)._
<% } %>

## Interpretation of Odds Ratios

Shows how many times the odds of <%= target %> (likelihood of becoming TRUE) increase (or decrease) when each predictor variable's value changes by 1 unit.

### Examples of Odds Ratio Interpretation

<% variables.forEach(variable => { %>
<% if (variable.type == 'numeric') { %>
When other variables remain constant, a 1-unit increase in <%= variable.variable %> makes the odds of <%= target %> (ratio of TRUE / FALSE) approximately <%= variable.odds_ratio %> times.
<% } else if (variable.type == 'logical') { %>
When other variables remain constant, when <%= variable.variable %> is TRUE, the odds of <%= target %> (ratio of TRUE / FALSE) become approximately <%= variable.odds_ratio %> times compared to FALSE.
<% } else { %>
When other variables remain constant, "<%= variable.variable %>" makes the odds of <%= target %> (ratio of TRUE / FALSE) approximately <%= variable.odds_ratio %> times compared to the base level "<%= variable.base_level %>". For details on base levels, please refer to [this note](https://exploratory.io/note/exploratory/Pxa6FmO2).
<% } %>
<% }) %>

For information on interpreting coefficients by data type in statistical prediction models, please see [this note](https://exploratory.io/note/exploratory/KOC5WYt3).

## Significance Testing Using P-values

At a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), predictor variables with p-values greater than <%= baseline_p_pct %>% (<%= baseline_p %>) cannot be considered statistically significant in their relationship with <%= target %>. Conversely, predictor variables with p-values less than <%= baseline_p_pct %>% (<%= baseline_p %>) can be considered statistically significant in their relationship with <%= target %>.

_The current significance level (p-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed in [Settings](//analytics/settings)._


## Visualization of Odds Ratios and Confidence Intervals

The following chart visualizes the odds ratios and significance for each variable.

{{coefficient}}

* The center point of each error bar represents the odds ratio value, and the upper and lower lines represent its 95% confidence interval. Predictor variables with significant relationships with <%= target %> and positive relationships are shown in blue, those with negative relationships are shown in red. Predictor variables shown in gray do not have significant relationships with <%= target %>.
* An odds ratio of 1 means that the odds (ratio of TRUE / FALSE) do not change even when the predictor variable's value changes, indicating no relationship with <%= target %>.
* The 95% confidence interval for odds ratios means "there is high probability (95% confidence) that the true odds ratio lies within this range." Therefore, predictor variables whose confidence intervals include 1 cannot be considered statistically significant because there is a possibility of no relationship with <%= target %>. Conversely, predictor variables whose confidence intervals do not include 1 can be considered statistically significant because there is almost no possibility of no relationship with <%= target %>.
* Significance can be determined using either p-values or confidence intervals, and both methods yield the same results.

_The above explanation of confidence intervals is intuitive; more precisely, it means "if we repeatedly sample from the same population and calculate 95% confidence intervals each time, 95% of those intervals will contain the true odds ratio."_

### Notes

* Odds ratios represent the change ratio of odds (ratio of TRUE / FALSE), not the change ratio of probability.
* When the odds ratio is greater than 1, the probability of <%= target %> becoming TRUE increases; when less than 1, it decreases.
* These odds ratio values represent the amount of change when each predictor variable changes by 1 point. When predictor variables have different units, you cannot use these odds ratio values to compare the strength of relationships with <%= target %>. To compare the strength of relationships between predictor variables, please refer to the "Variable Importance" section above.

<% } %>

<% if (is_variable_average_marginal_effect) { %>

# Variable Coefficients (Average Marginal Effect) and Significance

The coefficients (average marginal effects), p-values for determining significance, and confidence intervals are listed for each variable.

{{coefficient_table}}

<% if (has_category_columns) { %>
_For categorical (Character, Factor) predictor variables with more than <%= predictor_n %> unique values, the top <%= predictor_n - 1 %> most frequent values are retained and the rest are grouped as "Others". This can be changed in [Settings](//analytics/settings/max_categories_for_factor)._
<% } %>

## Interpretation of Average Marginal Effects

Shows how much the probability of <%= target %> changes on average when each predictor variable's value changes by 1 unit.

### Examples of Average Marginal Effect Interpretation

<% variables.forEach(variable => { %>
<% if (variable.type == 'numeric') { %>

* When other variables remain constant, a 1-unit increase in <%= variable.variable %> <% if (variable.marginal_effect_pct > 0) { %>increases the probability of <%= target %> becoming TRUE by about <%= variable.marginal_effect_pct %> percentage points on average<% } else { %>decreases the probability of <%= target %> becoming TRUE by about <%= variable.marginal_effect_pct * -1 %> percentage points on average<% } %>.

<% } else if (variable.type == 'logical') { %>

* When other variables remain constant, when <%= variable.variable %> is TRUE, there is about a <%= variable.marginal_effect_pct %> percentage point difference in the probability of <%= target %> becoming TRUE on average compared to FALSE.

<% } else { %>

* When other variables remain constant, "<%= variable.variable %>" has about a <%= variable.marginal_effect_pct %> percentage point difference in the probability of <%= target %> becoming TRUE on average compared to the base level "<%= variable.base_level %>". For details on base levels, please refer to [this note](https://exploratory.io/note/exploratory/Pxa6FmO2).

<% } %>
<% }) %>

_A percentage point is an absolute change in probability. For example, if the original probability is 30% and the average marginal effect is 5 percentage points, the new probability is 35%. Please note that this is different from a relative change (a % increase)._

For information on interpreting coefficients by data type in statistical prediction models, please see [this note](https://exploratory.io/note/exploratory/KOC5WYt3).

## Significance Testing Using P-values

At a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), predictor variables with p-values greater than <%= baseline_p_pct %>% (<%= baseline_p %>) cannot be considered statistically significant in their relationship with <%= target %>. Conversely, predictor variables with p-values less than <%= baseline_p_pct %>% (<%= baseline_p %>) can be considered statistically significant in their relationship with <%= target %>.

_The current significance level (p-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed in [Settings](//analytics/settings)._

## Visualization of Average Marginal Effects

The following chart visualizes the average marginal effects and significance for each variable.

{{coefficient}}

* Each point represents the value of the average marginal effect. Predictor variables that have a significant and positive relationship with <%= target %> are shown in blue, and those with a negative relationship are in red. Gray predictor variables are not considered to have a significant relationship with <%= target %>.
* An average marginal effect of 0 means that a change in the predictor variable's value does not change the probability of <%= target %> becoming TRUE, indicating no relationship with <%= target %>.
* Significance is determined by the p-value.

### Notes

* The average marginal effect directly shows the amount of change in probability, making it more intuitive to understand than odds ratios. However, since the average marginal effect represents an average effect across all data, the actual marginal effect for individual observations (the change in probability for a one-unit change in the predictor variable at that observation) may differ. For example, even if the average marginal effect of income is 3 percentage points, the effect of an income increase might be 5 percentage points for low-income individuals and 1 percentage point for high-income individuals. Please be aware that the marginal effect can vary significantly depending on the values of the predictor variables and other variables.
* A positive average marginal effect increases the probability of <%= target %> becoming TRUE, while a negative value decreases it.
* These average marginal effect values are the change for a 1-point change in each predictor variable. If predictor variables have different units, you cannot compare the strength of their relationship with <%= target %> using these values. To compare the strength of relationships between predictor variables, please refer to the "Variable Importance" section above.

<% } %>

<% if (is_variable_coefficient) { %>

# Coefficient & Significance

The coefficients, p-values for determining significance, and confidence intervals are listed for each variable.

{{coefficient_table}}

<% if (has_category_columns) { %>

For categorical (Character, Factor) predictor variables with more than <%= predictor_n %> unique values, the top <%= predictor_n - 1 %> most frequent values are retained and the rest are grouped as "Others". This can be changed in [Settings](//analytics/settings/max_categories_for_factor).

<% } %>

## Interpretation of Coefficients

Shows how much the likelihood (log odds) of <%= target %> changes when each predictor variable's value changes by 1 unit.

### Examples of Coefficient Interpretation

<% variables.forEach(variable => { %>

<% if (variable.type == 'numeric') { %>

When other variables remain constant, a 1-unit increase in <%= variable.variable %> changes the likelihood (log odds) of <%= target %> by approximately <%= variable.coefficient %>.

<% } else if (variable.type == 'logical') { %>

When other variables remain constant, when <%= variable.variable %> is TRUE, the likelihood (log odds) of <%= target %> changes by approximately <%= variable.coefficient %> compared to FALSE.

<% } else { %>

When other variables remain constant, "<%= variable.variable %>" changes the likelihood (log odds) of <%= target %> by approximately <%= variable.coefficient %> compared to the base level "<%= variable.base_level %>". For details on base levels, please refer to [this note](https://exploratory.io/note/exploratory/Pxa6FmO2).

<% } %>

<% }) %>

For information on interpreting coefficients by data type in statistical prediction models, please see [this note](https://exploratory.io/note/exploratory/KOC5WYt3).

## Significance Testing Using P-values

At a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), predictor variables with p-values greater than <%= baseline_p_pct %>% (<%= baseline_p %>) cannot be considered statistically significant in their relationship with <%= target %>. Conversely, predictor variables with p-values less than <%= baseline_p_pct %>% (<%= baseline_p %>) can be considered statistically significant in their relationship with <%= target %>.

_The current significance level (p-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed in [Settings](//analytics/settings)._

## Visualization of Coefficients and Confidence Intervals

The following chart visualizes the coefficients and significance for each variable.

{{coefficient}}

* The center point of each error bar represents the coefficient value, and the upper and lower lines represent its 95% confidence interval. Predictor variables with significant and positive relationships with <%= target %> are shown in blue, and those with negative relationships are in red. Predictor variables shown in gray do not have a significant relationship with <%= target %>.

* A coefficient of 0 means that a change in the predictor variable's value does not change the likelihood (log odds) of <%= target %>, indicating no relationship with <%= target %>.

* The 95% confidence interval for coefficients means "there is high probability (95% confidence) that the true coefficient lies within this range." Therefore, predictor variables whose confidence intervals include 0 cannot be considered statistically significant because there is a possibility of no relationship with <%= target %>. Conversely, predictor variables whose confidence intervals do not include 0 can be considered statistically significant because there is almost no possibility of no relationship with <%= target %>.

* Significance can be determined using either p-values or confidence intervals, and both methods yield the same results.

The above explanation of confidence intervals is intuitive; more precisely, it means "if we repeatedly sample from the same population and calculate 95% confidence intervals each time, 95% of those intervals will contain the true coefficient."

### Notes

* Coefficients represent the change in likelihood (log odds) and do not directly indicate the change in probability.
* A positive coefficient tends to increase the probability of <%= target %> becoming TRUE, while a negative coefficient tends to decrease it.
* These coefficient values are the change for a 1-point change in each predictor variable. If predictor variables have different units, you cannot use these coefficient values to compare the strength of their relationship with <%= target %>. To compare the strength of relationships between predictor variables, please refer to the "Variable Importance" section above.

<% } %>

# Prediction Accuracy

<% if (test_mode) { %>Compares the prediction performance on the training data used to build the model with the test data that was held out. The test results show whether the model predicts unseen data just as well.<% } else { %>Current metrics are calculated from predictions on the training data. To evaluate accuracy on unseen data, enable "Test Mode" from [Settings](chrome-extension://analytics/settings/test_mode).<% } %>

## Model metrics

{{summary}}

- ROC AUC and PR AUC evaluate how well the model discriminates across the whole range of cut points, not at one particular cut point. The other metrics are the result of classifying rows as TRUE or FALSE at the current cut point (<%= cut && cut.current_threshold_display ? cut.current_threshold_display : true_false_criteria %>). The cut point can be changed from [Settings](chrome-extension://analytics/settings/true_false_criteria).
<% if (test_mode) { %>- When evaluating the model's real prediction performance, focus on the results for the test data, which was not used to build the model. If the test metrics are much lower than the training ones, the model is likely overfitted to the training data and may not perform well on unseen data.
<% } %>- When the TRUE and FALSE counts are imbalanced, accuracy can be high simply by predicting the majority category. Read it together with balanced accuracy, recall, precision, and F1 score.
- Especially when TRUE cases are rare, PR AUC makes it easier to see the balance between finding TRUE cases and wrongly predicting TRUE.

## Significance

An F-test was conducted to test the significance of the model. The null hypothesis is that "all coefficients in the model are 0," meaning that the predictor variables used in the model have no relationship with the target variable <%= target %>. If the p-value is higher than the significance level of <%= baseline_p_pct %>%, the relationship between the selected predictor variables and <%= target %> cannot be considered statistically significant. Conversely, if the p-value is lower than <%= baseline_p_pct %>%, it can be considered significant.

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

* P-value
  * P-value shows the probability that observed data is equally or more extreme than the null hypothesis (no relationship between predictor and target variables).
  * Generally, values less than 5% (0.05) are considered statistically significant.
  * Values range from 0 to 1, with smaller p-values indicating higher statistical significance.

* Log Likelihood
  * Log likelihood quantifies how well the model fits the data.
  * Usually takes negative values, with values closer to 0 indicating better model fit.
  * Difficult to interpret alone; used in calculating AIC and BIC for model comparison.

* AIC
  * AIC (Akaike Information Criterion) is a metric that evaluates the balance between model complexity and fit.
  * Smaller values indicate better models, helping to select optimal models while preventing overfitting.
  * Used when comparing different models on the same dataset; usually takes positive values.

* BIC
  * BIC (Bayesian Information Criterion) is a model selection criterion similar to AIC but with stricter correction for sample size.
  * It tends to select simpler models than AIC, with smaller values indicating better models.
  * Useful for analyses with large sample sizes or when the true model is considered relatively simple.

* Residual Deviance
  * Residual deviance measures the difference (residuals) between actual results and model predictions.
  * Smaller values indicate better model fit.
  * Large values compared to degrees of freedom suggest poor model fit.

* Residual Degrees of Freedom
  * Residual degrees of freedom is calculated as "number of data points - number of model parameters" and shows the remaining information content considering model complexity.
  * Always takes positive integer values, with larger values improving estimation accuracy.
  * Used together with residual deviance to evaluate model fit.

* Null Model Deviance
  * Null model deviance shows the deviance of a model without predictor variables (intercept only).
  * By comparing with the model deviance, you can evaluate the degree of model improvement from adding predictor variables.
  * The difference with model deviance is more important than the value itself.

* Null Model Degrees of Freedom
  * Null model degrees of freedom is the degrees of freedom for the null (intercept only) model, usually number of data points - 1.
  * By comparing with model degrees of freedom, you can confirm the degrees of freedom used by adding predictor variables.
  * Used as a reference value for model comparison.

* VIF (Maximum)
  * VIF (Variance Inflation Factor) is a metric indicating the degree of multicollinearity between predictor variables.
  * Generally, variables with VIF of 10 or higher are considered to have multicollinearity problems.
  * Values are 1 or greater, with values closer to 1 indicating less multicollinearity.

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

# Prediction Results

{{data}}

# Appendix

## Next Steps

* Variable selection optimization: Excluding variables that are not statistically significant (p-values of <%= baseline_p_pct %>% or higher) to simplify the model can make model interpretation easier and reduce the risk of overfitting. For variable selection guidelines, please see [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
<% if (!repeat_by) { %>
* Group-wise analysis: Creating separate models for each group may allow for more detailed understanding of the determinants of <%= target %> within each group. In this case, you can select the grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Consideration of non-linear relationships: Predictor variables that have non-linear relationships with <%= target %> can be modeled more accurately by transforming the data.
* Checking for outliers: Checking for outliers that may affect prediction accuracy and addressing them as necessary can improve model reliability. For methods to remove outliers, please see [this note](https://exploratory.io/note/exploratory/Eep7kip3).
<% if (!test_mode) { %>
* Model evaluation: To more rigorously evaluate the predictive performance of this model, you can validate it by dividing into training and test data. In this case, set "Test Mode" to TRUE in the "Validation" section under [Settings](//analytics/settings/test_mode) and re-run.
<% } %>
* Prediction on new data: When you want to use the created model to make predictions on new data, add a "Predict with Model (Analytics View)" step to the target data frame. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).
`;

module.exports = template;

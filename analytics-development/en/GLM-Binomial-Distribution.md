const template =
`

A generalized linear model (binomial distribution) was created to predict <%= target %> based on the selected explanatory variables.

<% if (predictorColumns.length > 1) { %>
# Multicollinearity

<% if (has_perfect_collinearity) { %>
{{multicollinearity:0.6}}

In this model, <%= perfect_collinearity_variables %> creates a problem of perfect [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be completely calculated by a formula from other explanatory variables), causing their VIF scores to become infinite and preventing the generation of a chart for testing multicollinearity. To resolve the multicollinearity problem, please exclude <%= perfect_collinearity_variables %> from the explanatory variables and re-run the analysis.
<% } else if (max_vif > 10) { %>
{{multicollinearity}}

This model shows signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlations between multiple explanatory variables). When explanatory variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effects of individual variables.
To resolve this problem, please remove explanatory variables with VIF values exceeding 10 one by one, starting with those that are less important, and re-run the analysis until no explanatory variables have VIF values exceeding 10.

<% } else { %>
{{multicollinearity}}

This model shows no signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlations between multiple explanatory variables). (When explanatory variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effects of individual variables.)
<% } %>
<% } %>


# Variable Relationships

<% if (predictorColumns.length > 1) { %>
## Variable Importance

The following chart shows which explanatory variables are relatively more important for predicting <%= target %>.

{{variable_importance}}

For more information about the mechanism of variable importance, please see [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>

## Variable Effects

<% if (predictorColumns.length > 1) { %>
The following chart shows how the probability of <%= target %> changes when the value of each explanatory variable changes, while other variables remain constant.
<% } else { %>
The following chart shows how the probability of <%= target %> changes when the value of the explanatory variable changes.
<% } %>

{{variable_effect}}

* The blue line (or dots) shows predicted values for explanatory variable values.
* Gray lines show actual values and their 95% confidence intervals.
* The vertical axis represents the probability of <%= target %>.

Important Notes:

<% if (predictorColumns.length > 1) { %>

* Since we predict the effect of each explanatory variable individually while keeping other variables constant, there will be discrepancies between the average of actual values and predicted values.
* For details on how predicted values are calculated, please see [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* For the differences in interpretation between simple and multiple regression analysis, please see [this note](https://exploratory.io/note/exploratory/BDI7AeE5).
* Explanatory variables are arranged in order of importance as shown in "Variable Importance" above.

<% } %>
* For categorical (Character, Factor) explanatory variables with more than 12 unique values, the top 11 most frequent values are retained and the rest are grouped as "Others". This can be changed from [Settings](//analytics/settings) in Analytics.

# Variable Coefficients (Odds Ratios) and Significance

Coefficients (odds ratios), P-values for determining their significance, and confidence intervals are listed for each variable.

{{coefficient_table}}

## Interpretation of Odds Ratios

This shows how many times the odds of <%= target %> (probability of TRUE) increase (or decrease) when the value of each explanatory variable changes by 1 unit.

### Examples of Odds Ratio Interpretation

<% variables.forEach(variable => { %>
<% if (variable.type == 'numeric') { %>
When other variable values are constant, a 1-unit increase in <%= variable.variable %> results in the odds of <%= target %> (TRUE ratio / FALSE ratio) becoming approximately <%= variable.odds_ratio %> times.
<% } else if (variable.type == 'logical') { %>
When other variable values are constant, when <%= variable.variable %> is TRUE compared to FALSE, the odds of <%= target %> (TRUE ratio / FALSE ratio) become approximately <%= variable.odds_ratio %> times.
<% } else { %>
When other variable values are constant, "<%= variable.variable %>" has odds of <%= target %> (TRUE ratio / FALSE ratio) approximately <%= variable.odds_ratio %> times compared to the base level "<%= variable.base_level %>". For details on base levels, please refer to [this note](https://exploratory.io/note/exploratory/Pxa6FmO2).
<% } %>
<% }) %>

For coefficient interpretation methods by data type in statistical prediction models, please see [this note](https://exploratory.io/note/exploratory/KOC5WYt3).

## Significance Testing Using P-values

Under a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), explanatory variables with P-values greater than <%= baseline_p_pct %>% (<%= baseline_p %>) cannot be said to have a statistically significant relationship with <%= target %>. Conversely, explanatory variables with P-values less than <%= baseline_p_pct %>% (<%= baseline_p %>) can be said to have a statistically significant relationship with <%= target %>.

_The current significance level (P-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed from [Settings](//analytics/settings) in Analytics._


## Visualization of Odds Ratios and Confidence Intervals

The following chart visualizes the odds ratios and significance of each variable.

{{coefficient}}

* The center point of each error bar represents the odds ratio value, and the upper and lower lines represent its 95% confidence interval. Explanatory variables with a significant relationship to <%= target %> and a positive relationship are shown in blue, those with a negative relationship are shown in red. Explanatory variables shown in gray cannot be said to have a significant relationship with <%= target %>.
* An odds ratio of 1 means that changes in the explanatory variable value do not change the odds of TRUE vs FALSE (TRUE ratio / FALSE ratio), indicating no relationship with <%= target %>.
* The 95% confidence interval of odds ratios means "there is high confidence (95% confidence) that the true odds ratio is within this range." Therefore, explanatory variables whose confidence intervals include 1 may have no relationship with <%= target %> at all, so they cannot be said to be statistically significant. Conversely, explanatory variables whose confidence intervals do not include 1 have almost no possibility of having no relationship with <%= target %>, so they can be said to be statistically significant.
* Significance can be determined by either P-values or confidence intervals. Either method will yield the same results.

_The above explanation of confidence intervals is an intuitive explanation; more precisely, it means "if samples are repeatedly taken from the same population and 95% confidence intervals are calculated each time, 95% of those intervals will contain the true odds ratio."_

**Important Notes**

* Odds ratios are change ratios of odds (TRUE ratio / FALSE ratio), not probability change ratios.
* When odds ratios are greater than 1, the probability of <%= target %> being TRUE increases; when less than 1, it decreases.
* These odds ratio values are change amounts when each explanatory variable value changes by 1 point. When explanatory variables have different units, their odds ratio values cannot be used to compare the strength of relationship with <%= target %>. To compare the strength of relationships between explanatory variables, please refer to "Variable Importance" above.

# Model Metrics

<% if (!test_mode) { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below.
<% } else { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below. Since test mode is currently enabled, metrics for both training data and test data are displayed for prediction accuracy.
<% } %>

{{summary}}

## Prediction Accuracy

For logical-type target variables (TRUE/FALSE), AUC is commonly used as a metric to evaluate model prediction accuracy.

* AUC
  * This is a commonly used metric for evaluating the prediction accuracy of models that predict logical-type target variables.
  * It measures how well this model can classify TRUE and FALSE data.
  * Values range from 0.5 to 1, where 0.5 represents random prediction (equivalent to coin flipping) and 1 represents perfect classification of TRUE and FALSE data.
  * Generally interpreted as: 0.6+ acceptable, 0.8+ good, 0.9+ excellent classification performance.
  * AUC stands for Area Under the Curve, meaning the area under the ROC curve (the Curve).

Reference Information:

* For detailed explanation of AUC, please see [this note](https://exploratory.io/note/exploratory/AUC-RZG7gbI6).
* Accuracy, error rate, F1 score, precision, and recall are affected by the TRUE/FALSE threshold setting. The current threshold is set to <%= true_false_criteria %>, but this can be changed from [Settings](//analytics/settings) in Analytics.

## Significance

An F-test was performed for model significance testing. The null hypothesis is "all coefficients in the model are 0," meaning the explanatory variables used in the model have no relationship with the target variable <%= target %>. If the P-value is higher than the significance level of <%= baseline_p_pct %>%, the relationship between the selected explanatory variables and <%= target %> cannot be said to be statistically significant. Conversely, if the P-value is lower than <%= baseline_p_pct %>%, it can be said to be significant.


{start_show_hide}
## Detailed Explanation of Other Metrics

* F1 Score
  * F1 score is the harmonic mean of precision and recall, providing a metric for model prediction accuracy that considers the balance of both.
  * Values range from 0 to 1, where closer to 1 indicates an excellent model with balanced precision and recall.
  * Particularly useful when there are large differences in the proportions of TRUE and FALSE in the original data.

* Accuracy
  * Accuracy shows the proportion of correct predictions among all predictions.
  * Values range from 0 to 1, where closer to 1 means more cases can be correctly classified.
  * May be misleading when there are large differences in the proportions of TRUE and FALSE in the original data.

* Error Rate
  * Error rate is the proportion of incorrect predictions among all predictions, calculated as 1-accuracy.
  * Values range from 0 to 1, where closer to 0 means fewer misclassifications.
  * Like accuracy, interpretation requires caution when there are large differences in TRUE and FALSE proportions.

* Precision
  * Precision shows "the proportion of actual TRUE among those predicted as TRUE."
  * Values range from 0 to 1, where closer to 1 means higher "accuracy of things predicted as TRUE actually being TRUE."
  * A metric emphasized when wanting to minimize false positives (predicting TRUE when actually FALSE).

* Recall
  * Recall shows "the proportion correctly predicted as TRUE among those actually TRUE."
  * Values range from 0 to 1, where closer to 1 means higher "ability to not miss actual TRUE cases."
  * A metric emphasized when wanting to minimize false negatives (predicting FALSE when actually TRUE).

* P-value
  * P-value shows the probability that observed data is as extreme or more extreme than the null hypothesis (no relationship between explanatory and target variables).
  * Generally considered statistically significant if less than 5% (0.05).
  * Values range from 0 to 1, where smaller P-values indicate higher statistical significance.

* Row Count (TRUE)
  * Shows the number of rows where the target variable is TRUE.
  * If TRUE is extremely few, bias may occur in model learning and evaluation.

* Row Count (FALSE)
  * Shows the number of rows where the target variable is FALSE.
  * If FALSE is extremely few, bias may occur in model learning and evaluation.

* Row Count
  * Row count is the total number of data used in analysis (sample size).
  * Larger data increases model reliability.
  * Generally, a sample size of at least 10 times the number of explanatory variables is recommended.

* Log Likelihood
  * Log likelihood quantifies how well the model fits the data.
  * Usually takes negative values, where closer to 0 indicates higher model fit.
  * Difficult to interpret alone; used in calculating AIC and BIC for model comparison.

* AIC
  * AIC (Akaike Information Criterion) evaluates the balance between model complexity and fit.
  * Smaller values indicate better models, helping select optimal models while preventing overfitting.
  * Used when comparing different models on the same dataset; usually takes positive values.

* BIC
  * BIC (Bayesian Information Criterion) is a model selection metric like AIC, but with stricter correction by sample size.
  * Tends to select simpler models than AIC; smaller values indicate better models.
  * Useful for large sample size analyses or when the true model is considered relatively simple.

* Residual Deviance
  * Residual deviance measures the difference (residuals) between actual results and model predictions.
  * Smaller values indicate higher model fit.
  * Large values compared to degrees of freedom suggest poor model fit.

* Residual Degrees of Freedom
  * Residual degrees of freedom are calculated as "data count - model parameter count," showing remaining information considering model complexity.
  * Always takes positive integer values; larger values improve estimation precision.
  * Used with residual deviance to evaluate model fit.

* Null Model Deviance
  * Null model deviance shows the deviance of a model without explanatory variables (intercept only).
  * By comparing with model deviance, the improvement from adding explanatory variables can be evaluated.
  * The difference from model deviance is more important than the value itself.

* Null Model Degrees of Freedom
  * Null model degrees of freedom is the degrees of freedom for the null (intercept only) model, usually data count-1.
  * By comparing with model degrees of freedom, the degrees of freedom used by adding explanatory variables can be confirmed.
  * Used as a reference value in model comparison.

* VIF (Maximum)
  * VIF (Variance Inflation Factor) indicates the degree of multicollinearity between explanatory variables.
  * Generally, variables with VIF ≥ 10 are considered to have multicollinearity problems.
  * Values ≥ 1, where closer to 1 indicates less multicollinearity.

{end_show_hide}


<% if (!test_mode) { %>
## Predictions on Training Data

The following table shows the results of predictions made on training data using the created prediction model.
<% } else { %>
## Predictions on Training and Test Data

The following table shows the results of predictions made on training data and test data using the created prediction model.
<% } %>

{start_lazy_show_hide}
### Prediction Results
{{data}}
{end_lazy_show_hide}

## Prediction Matrix (Confusion Matrix)

<% if (!test_mode) { %>
This model predicted TRUE or FALSE for each row of <%= mode %> data. The following table summarizes how many of these were actually TRUE or FALSE in the measured values as a correspondence table. The numbers represent the percentage of each combination in the total data.

<% } else { %>
This model predicted TRUE or FALSE for each row of <%= mode %> data. The following table summarizes how many of these were actually TRUE or FALSE in the measured values as a correspondence table. The numbers represent the percentage of each combination in the total data. Since test mode is currently enabled, results for both training data and test data are displayed.

<% } %>

{{confusion_matrix}}

## Distribution of Prediction Probabilities

This model predicted the probability of <%= target %> (values between 0 and 1) for each row of <%= mode %> data. The following chart visualizes the distribution of these probability values, separated into groups where actual values are TRUE (blue) and FALSE (orange).

{{probability_distribution}}

<% if (test_mode) { %>
* Since test mode is currently enabled, this shows the distribution of probabilities predicted on test data.
<% } %>
* The higher the prediction accuracy of the model, the more the group with actual TRUE values (blue line) should be biased toward the right (probabilities close to 1), and the group with actual FALSE values (orange line) should be biased toward the left (probabilities close to 0).
* The vertical dotted line shows the currently set probability threshold for classifying TRUE and FALSE. The default is 50% (0.5), but this can be changed from [Settings](//analytics/settings) in Analytics.
* From this distribution, you can visually confirm the model's classification performance and adjust the optimal TRUE/FALSE threshold.


## ROC Curve

<% if (!test_mode) { %>
The following chart shows the ROC curve that evaluates the model's classification performance at various TRUE/FALSE thresholds. The Y-axis represents true positive rate (sensitivity), and the X-axis represents false positive rate (1-specificity). The blue line is the ROC curve for this model, and the diagonal gray dotted line represents random prediction (AUC: 0.5). The more the ROC curve bulges toward the upper left, the higher the prediction accuracy; the closer to the diagonal, the lower the prediction accuracy.
<% } else { %>
The following chart shows the ROC curve that evaluates the model's classification performance at various TRUE/FALSE thresholds. The Y-axis represents true positive rate (sensitivity), and the X-axis represents false positive rate (1-specificity). The blue line is the ROC curve for this model on test data, and the orange line is for training data. The diagonal gray dotted line represents random prediction (AUC: 0.5). The more the ROC curve bulges toward the upper left, the higher the prediction accuracy; the closer to the diagonal, the lower the prediction accuracy.
<% } %>

{{roc_curve}}

# Supplementary Information

## Next Steps

* Variable Selection Optimization: Excluding statistically non-significant variables (P-values ≥ <%= baseline_p_pct %>%) to simplify the model can make interpretation easier and reduce overfitting risks. For variable selection guidelines, please see [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
<% if (!repeat_by) { %>
* Group-wise Analysis: Creating separate models for each group may provide more detailed understanding of <%= target %> determinants within each group. In that case, you can select a grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Examining Non-linear Relationships: Explanatory variables with non-linear relationships to <%= target %> can be modeled more accurately by transforming the data.
* Outlier Verification: Checking for outliers that may affect prediction accuracy and addressing them as necessary may improve model reliability. For methods to remove outliers, please see [this note](https://exploratory.io/note/exploratory/Eep7kip3).
<% if (!test_mode) { %>
* Model Evaluation: To evaluate this model's prediction performance more rigorously, you can verify by splitting into training data and test data. In that case, set "Test Mode" to TRUE under the "Validation" section in [Settings](//analytics/settings) and re-run.
<% } %>
* Prediction on New Data: When you want to make predictions on new data using the created model, add a "Predict with Model (Analytics View)" step to the target data frame. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).

`;

module.exports = template; 
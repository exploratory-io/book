const template =
`

A logistic regression model was created to predict <%= target %> based on the selected explanatory variables.

<% if (predictorColumns.length > 1) { %>
# Multicollinearity

<% if (has_perfect_collinearity) { %>
This model has a perfect [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) problem with <%= perfect_collinearity_variables %> (a state where values can be completely calculated by a formula from other explanatory variables), causing their VIF scores to become infinite and preventing the generation of a chart for testing multicollinearity. To resolve the multicollinearity problem, please exclude <%= perfect_collinearity_variables %> from the explanatory variables and re-run the analysis.
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

# Variable Coefficients (Odds Ratio) and Significance

Coefficients (odds ratio), P-values for determining their significance, and confidence intervals are listed for each variable.

{{coefficient_table}}

_For categorical (Character, Factor) explanatory variables with more than 12 unique values, the top 11 most frequent values are retained and the rest are grouped as "Others". This can be changed from [Settings](//analytics/settings) in Analytics._

## Odds Ratio Interpretation

This shows how many times the odds of <%= target %> (the probability of becoming TRUE) increase (or decrease) when the value of each explanatory variable changes by 1 unit.

### Examples of Odds Ratio Interpretation

<% variables.forEach(variable => { %>
<% if (variable.type == 'numeric') { %>
When other variable values are constant, a 1-unit increase in <%= variable.variable %> results in the odds of <%= target %> (TRUE ratio / FALSE ratio) becoming approximately <%= variable.odds_ratio %> times.
<% } else if (variable.type == 'logical') { %>
When other variable values are constant, when <%= variable.variable %> is TRUE compared to FALSE, the odds of <%= target %> (TRUE ratio / FALSE ratio) become approximately <%= variable.odds_ratio %> times.
<% } else { %>
When other variable values are constant, "<%= variable.variable %>" becomes approximately <%= variable.odds_ratio %> times the odds of <%= target %> (TRUE ratio / FALSE ratio) compared to the base level "<%= variable.base_level %>". For details on base levels, please refer to [this note](https://exploratory.io/note/exploratory/Pxa6FmO2).
<% } %>
<% }) %>

For coefficient interpretation methods by data type in statistical prediction models, please see [this note](https://exploratory.io/note/exploratory/KOC5WYt3).

## Significance Testing Using P-values

Under a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), explanatory variables with P-values greater than <%= baseline_p_pct %>% (<%= baseline_p %>) cannot be said to have a statistically significant relationship with <%= target %>. Conversely, explanatory variables with P-values less than <%= baseline_p_pct %>% (<%= baseline_p %>) can be said to have a statistically significant relationship with <%= target %>.

_The current significance level (P-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed from [Settings](//analytics/settings) in Analytics._


## Visualization of Odds Ratio and Confidence Intervals

The following chart visualizes the odds ratio and its significance for each variable.

{{coefficient}}

* The center point of each error bar represents the odds ratio value, and the upper and lower lines represent its 95% confidence interval. Explanatory variables with a significant relationship to <%= target %> and a positive relationship are shown in blue, those with a negative relationship are shown in red. Explanatory variables shown in gray cannot be said to have a significant relationship with <%= target %>.
* An odds ratio of 1 means that the odds of <%= target %> (TRUE ratio / FALSE ratio) do not change even if the value of the explanatory variable changes, indicating no relationship with <%= target %>.
* The 95% confidence interval of the odds ratio means "there is high confidence (95% confidence) that the true odds ratio is within this range." Therefore, explanatory variables whose confidence intervals include 1 may have no relationship with <%= target %> at all, so they cannot be said to be statistically significant. Conversely, explanatory variables whose confidence intervals do not include 1 have almost no possibility of having no relationship with <%= target %>, so they can be said to be statistically significant.
* Significance can be determined by either P-values or confidence intervals. Either method will yield the same results.

_The above explanation of confidence intervals is an intuitive explanation; more precisely, it means "if samples are repeatedly taken from the same population and 95% confidence intervals are calculated each time, 95% of those intervals will contain the true odds ratio."_

### Important Notes

* The odds ratio is the change ratio of odds (TRUE ratio / FALSE ratio), not the change ratio of probability.
* If the odds ratio is greater than 1, the probability of <%= target %> being TRUE increases, and if it is less than 1, it decreases.
* These odds ratio values represent the amount of change when each explanatory variable value changes by 1 point, and cannot be used to compare the strength of the relationship with <%= target %> if the explanatory variables have different units. To compare the strength of the relationship between explanatory variables, please refer to "Variable Importance" above.

# Model Metrics

<% if (!test_mode) { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below.
<% } else { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below. Since test mode is currently enabled, metrics for both training data and test data are displayed for prediction accuracy.
<% } %>

{{summary}}

## Prediction Accuracy

When the target variable is logical (TRUE/FALSE), AUC is a commonly used metric to evaluate model prediction accuracy.

* AUC
  * This is a widely used metric to evaluate the prediction accuracy of models that predict logical type target variables.
  * It measures how well this model can classify TRUE and FALSE data.
  * Values range from 0.5 to 1, where 0.5 means random prediction (equivalent to a coin toss), and 1 means the model can perfectly classify TRUE and FALSE data.
  * Generally interpreted as: 0.6 or higher is acceptable, 0.8 or higher is good, and 0.9 or higher is very good classification performance.
  * It is an abbreviation for Area Under the Curve, meaning the area under the ROC curve (the Curve).

Reference Information:

* For a detailed explanation of AUC, please see [this note](https://exploratory.io/note/exploratory/AUC-RZG7gbI6).
* Accuracy, misclassification rate, F1 score, precision, and recall are affected by the TRUE/FALSE boundary value setting. The current boundary value is set to <%= true_false_criteria %>, but this can be changed from [Settings](//analytics/settings) in Analytics.

## Significance

An F-test was performed for model significance testing. The null hypothesis is "all coefficients in the model are 0," meaning the explanatory variables used in the model have no relationship with the target variable <%= target %>. If the P-value is higher than the significance level of <%= baseline_p_pct %>%, the relationship between the selected explanatory variables and <%= target %> cannot be said to be statistically significant. Conversely, if the P-value is lower than <%= baseline_p_pct %>%, it can be said to be significant.


{start_show_hide}
## Detailed Explanation of Other Metrics

* F1 Score
  * F1 score is the harmonic mean of precision and recall, a metric for model prediction accuracy that considers the balance of both.
  * Values range from 0 to 1, where closer to 1 indicates a good model with a balance of precision and recall.
  * Particularly useful when there is a significant difference in the ratio of TRUE and FALSE in the original data.

* Accuracy
  * Accuracy shows the proportion of correct predictions out of all predictions.
  * Values range from 0 to 1, where closer to 1 means the model can correctly classify more cases.
  * If there is a significant difference in the ratio of TRUE and FALSE in the original data, or if there is imbalance, it may be misleading.

* Misclassification Rate
  * Misclassification rate is the proportion of incorrect predictions out of all predictions, calculated as 1 - Accuracy.
  * Values range from 0 to 1, where closer to 0 means fewer misclassifications.
  * Similar to accuracy, care should be taken in interpretation if there is a significant difference in the ratio of TRUE and FALSE in the original data.

* Precision
  * Precision shows the proportion of those predicted as TRUE that were actually TRUE.
  * Values range from 0 to 1, where closer to 1 means higher accuracy in "predicting as TRUE what is actually TRUE".
  * This metric is emphasized when you want to minimize false positives (predicting as TRUE when actually FALSE).

* Recall
  * Recall shows the proportion of those that are actually TRUE that were correctly predicted as TRUE.
  * Values range from 0 to 1, where closer to 1 means higher ability to "not miss actual TRUE cases".
  * This metric is emphasized when you want to minimize false negatives (predicting as FALSE when actually TRUE).

* P-value
  * P-value indicates the probability that the observed data is as extreme as or more extreme than the null hypothesis (no association between explanatory and target variables).
  * Generally considered statistically significant if less than 5% (0.05).
  * Values range from 0 to 1, where smaller P-values indicate higher statistical significance.

* Row Count (TRUE)
  * Shows the number of rows where the target variable is TRUE.
  * If the number of TRUEs is extremely small, there may be bias in model training and evaluation.

* Row Count (FALSE)
  * Shows the number of rows where the target variable is FALSE.
  * If the number of FALSEs is extremely small, there may be bias in model training and evaluation.

* Row Count
  * Row count is the total number of data used in analysis (sample size).
  * A larger number of data increases the reliability of the model.
  * Generally, a sample size of 10 times or more the number of explanatory variables is recommended.

* Log Likelihood
  * Log likelihood quantifies how well the model fits the data.
  * Usually takes negative values, where closer to 0 indicates higher model fit.
  * Difficult to interpret on its own and used to calculate AIC and BIC for model comparison.

* AIC
  * AIC (Akaike Information Criterion) is a metric that evaluates the balance between model complexity and fit.
  * Smaller values are considered better models and help select optimal models while preventing overfitting.
  * Used when comparing different models on the same dataset and usually takes positive values.

* BIC
  * BIC (Bayesian Information Criterion) is a model selection metric like AIC, but with a stricter correction by sample size.
  * Tends to select simpler models than AIC and is considered a better model if the value is smaller.
  * Useful for analysis with large sample sizes or when the true model is considered relatively simple.

* Residual Deviance
  * Residual deviance is a metric that measures the difference (residuals) between the actual results and the model's predictions.
  * Smaller values indicate better model fit.
  * A large value compared to the degrees of freedom suggests a poor model fit.

* Residual Degrees of Freedom
  * Residual degrees of freedom are calculated as "number of data - number of model parameters" and represent the remaining amount of information considering the model's complexity.
  * Always takes a positive integer value, and a larger value indicates higher accuracy of estimation.
  * Used together with residual deviance to evaluate model fit.

* Null Model Deviance
  * Null model deviance shows the deviance of a model that does not include explanatory variables (intercept only).
  * By comparing it with the model's deviance, you can evaluate the degree of model improvement by adding explanatory variables.
  * The difference from the model's deviance is more important than the value itself.

* Null Model Degrees of Freedom
  * Null model degrees of freedom is the degrees of freedom for the null (intercept only) model, usually data count-1.
  * By comparing it with the model's degrees of freedom, you can confirm the degrees of freedom used by adding explanatory variables.
  * Used as a reference value when comparing models.

* VIF (Maximum)
  * VIF (Variance Inflation Factor) is a metric that indicates the degree of multicollinearity between explanatory variables.
  * Generally, variables with VIF of 10 or more are considered to have multicollinearity problems.
  * Values are 1 or more, and closer to 1 indicates less multicollinearity.

{end_show_hide}


<% if (!test_mode) { %>
## Predictions on Training Data

The following table shows the results of predictions made on the training data using the created prediction model.
<% } else { %>
## Predictions on Training and Test Data

The following table shows the results of predictions made on the training data and test data using the created prediction model.
<% } %>

{start_lazy_show_hide}
### Prediction Results
{{data}}
{end_lazy_show_hide}

# Supplementary Information

## Next Steps

* Variable Selection Optimization: Excluding statistically non-significant variables (P-values ≥ <%= baseline_p_pct %>% (<%= baseline_p %>) can simplify the model and reduce the risk of overfitting. For variable selection guidelines, please see [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
<% if (!repeat_by) { %>
* Group-wise Analysis: Creating separate models for each group can provide a more detailed understanding of the factors determining <%= target %> within each group. In that case, you can select a grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Outlier Verification: Checking for outliers that may affect prediction accuracy and addressing them as necessary may improve model reliability. For methods to remove outliers, please see [this note](https://exploratory.io/note/exploratory/Eep7kip3).
<% if (!test_mode) { %>
* Model Evaluation: To evaluate the prediction performance of this model more rigorously, you can verify by splitting the data into training and test sets. In that case, set "Test Mode" to TRUE under the "Validation" section in [Settings](//analytics/settings) and re-run.
<% } %>
* Prediction on New Data: When you want to make predictions on new data using the created model, add a "Predict with Model (Analytics View)" step to the target data frame. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).

`;
module.exports = template; 
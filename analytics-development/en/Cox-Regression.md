const template = `

A Cox regression model was created to predict the survival curve for <%= event_status %> based on the selected explanatory variables.

<% if (predictorColumns.length > 1) { %>
# Multicollinearity

<% if (has_perfect_collinearity) { %>
{{multicollinearity:0.6}}

In this model, <%= perfect_collinearity_variables %> creates a problem of perfect [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be completely calculated by a formula from other explanatory variables), causing their VIF scores to become infinite and preventing the generation of a chart for testing multicollinearity. To resolve the multicollinearity problem, please exclude <%= perfect_collinearity_variables %> from the explanatory variables and re-run the analysis.
<% } else if (max_vif > 10) { %>
{{multicollinearity}}

This model shows signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple explanatory variables). When explanatory variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effects of individual variables.
To resolve this problem, please exclude explanatory variables with VIF values exceeding 10 one by one (starting with the least necessary ones), re-run the analysis, and repeat until no explanatory variables have VIF values exceeding 10.

<% } else { %>
{{multicollinearity}}

This model does not show signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple explanatory variables). (When explanatory variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effects of individual variables.)
<% } %>
<% } %>

# Survival Curves

The following chart shows survival curves for each explanatory variable based on the model. These curves show predicted values of survival probability (probability of non-occurrence of the event) over time (unit: <%= time_unit %>).

{{survival_curve}}

# Variable Relationships

<% if (predictorColumns.length > 1) { %>
## Variable Importance

The following chart shows which explanatory variables are relatively more important for predicting survival curves related to <%= event_status %>.

{{variable_importance}}

For more information about the mechanism of variable importance, please see [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>

## Variable Effects

<% if (predictorColumns.length > 1) { %>
At the time point of <%= survival_period%>, when the values of other variables are held constant, the following chart shows how the probability of <%= event_status %> occurrence changes when the value of each explanatory variable changes. The time period can be changed from [Settings](//analytics/settings) in Analytics.
<% } else { %>
At the time point of <%= survival_period%>, the following chart shows how the probability of <%= event_status %> occurrence changes when the value of the explanatory variable changes. The time period can be changed from [Settings](//analytics/settings) in Analytics.
<% } %>

{{variable_effect}}

* The blue line (or points) shows predicted values for explanatory variable values at the time point of <%= survival_period%>.
* Gray lines show actual measured values and their 95% confidence intervals.

Important Notes:

<% if (predictorColumns.length > 1) { %>

* Since we predict the effect of each explanatory variable individually while holding other variables constant, discrepancies arise between the mean of actual values and predicted values.
* For details on the prediction value calculation method, please refer to [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* For differences in interpretation between simple regression and multiple regression analysis, please see [this note](https://exploratory.io/note/exploratory/BDI7AeE5).
* Explanatory variables are arranged in order of importance as shown in the "Variable Importance" section above.

<% } %>

<% if (has_category_columns) { %>
* For categorical (Character, Factor) explanatory variables with more than 12 unique values, the 11 most frequent values are retained and others are grouped as "Others". This can be changed from [Settings](//analytics/settings) in Analytics.
<% } %>


# Variable Hazard Ratios

Hazard ratios, P-values for determining significance, and confidence intervals are listed for each variable.

{{coefficient_table}}

## Interpretation of Hazard Ratios

Shows how many times the hazard of <%= event_status %> (risk of <%= event_status %> occurrence per unit time) increases (or decreases) when the value of each explanatory variable changes by 1 unit. Hazard refers to the instantaneous risk (occurrence rate) of an event occurring at a given time point.

**Examples of Hazard Ratio Interpretation**

<% variables.forEach(variable => { %>
<% if (variable.type == 'numeric') { %>
* When other variable values are held constant, if <%= variable.variable %> increases by 1 unit, the hazard of <%= event_status %> (risk of <%= event_status %> occurrence per unit time: event occurrence rate / survival rate) becomes approximately <%= variable.hazard_ratio %> times.
<% } else if (variable.type == 'logical') { %>
* When other variable values are held constant, when <%= variable.variable %> is TRUE compared to FALSE, the hazard of <%= event_status %> (risk of <%= event_status %> occurrence per unit time: event occurrence rate / survival rate) becomes approximately <%= variable.hazard_ratio %> times.
<% } else { %>
* When other variable values are held constant, "<%= variable.variable %>" compared to the base level "<%= variable.base_level %>", the hazard of <%= event_status %> (risk of <%= event_status %> occurrence per unit time: event occurrence rate / survival rate) becomes approximately <%= variable.hazard_ratio %> times. For details on base levels, please refer to [this note](https://exploratory.io/note/exploratory/Pxa6FmO2).
<% } %>
<% }) %>

For interpretation methods of coefficients by data type in statistical prediction models, please see [this note](https://exploratory.io/note/exploratory/KOC5WYt3).

## Significance Testing Using P-values

Under a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), explanatory variables with P-values greater than <%= baseline_p_pct %>% (<%= baseline_p %>) cannot be said to have a statistically significant relationship with the survival curve. Conversely, explanatory variables with P-values less than <%= baseline_p_pct %>% (<%= baseline_p %>) can be said to have a statistically significant relationship with the survival curve.

_The current significance level (P-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed from [Settings](//analytics/settings) in Analytics._

## Visualization of Hazard Ratios and Confidence Intervals

The following chart visualizes the hazard ratios and significance of each variable.

{{coefficient}}

* The center point of each error bar represents the hazard ratio value, and the upper and lower lines represent the 95% confidence interval. Explanatory variables with significant relationships with survival curves and positive relationships are shown in red, those with negative relationships are shown in blue. Explanatory variables shown in gray do not have significant relationships with survival curves.
* A hazard ratio of 1 means that changes in the explanatory variable value do not change the risk of <%= event_status %> occurrence (occurrence rate per unit time), indicating no relationship with the survival curve.
* The 95% confidence interval of the hazard ratio means "there is a high possibility (95% confidence) that the true hazard ratio is within this range." Therefore, explanatory variables whose confidence intervals include 1 cannot be said to be statistically significant because there is a possibility of no relationship with the survival curve. Conversely, explanatory variables whose confidence intervals do not include 1 can be said to be statistically significant because there is almost no possibility of no relationship with the survival curve.
* Significance can be determined by either P-values or confidence intervals. Both methods yield the same results.

_The above explanation of confidence intervals is an intuitive explanation; more precisely, it means "when repeatedly sampling from the same population and calculating 95% confidence intervals each time, 95% of those intervals will contain the true hazard ratio."_

**Important Notes:**

* Hazard ratios represent the ratio of change in hazard (risk of event occurrence per unit time), not the ratio of probability change.
* When the hazard ratio is greater than 1, <%= event_status %> tends to occur earlier (in shorter time), and when less than 1, it tends to occur later (takes more time).
* These hazard ratio values only show relative risk changes when each explanatory variable value changes by 1 unit. When explanatory variables have different scales (units), their hazard ratio values cannot be used to directly compare the strength of relationships with survival curves. To compare the magnitude of effects between explanatory variables, please refer to "Variable Importance" above.

# Model Metrics

<% if (!test_mode) { %>
Various metrics related to model prediction accuracy and significance are summarized in the following table.
<% } else { %>
Various metrics related to model prediction accuracy and significance are summarized in the following table. Since we are currently in test mode, metrics for both training data and test data are displayed for prediction accuracy.
<% } %>

{{summary_chart}}

## Prediction Accuracy Metrics

* Concordance Index
  * The concordance index is a metric that shows the model's predictive ability, representing the probability that the model can correctly predict the order of actual survival times for two randomly selected observation subjects (rows).
  * Values range from 0.5 to 1, where 0.5 is equivalent to random prediction and 1 means perfect prediction.
  * Generally, 0.7 or above is acceptable, and 0.8 or above indicates good predictive performance.

* Time-dependent AUC
  * Time-dependent AUC is a metric that measures how well this model can classify TRUE and FALSE data at a specific time point.
  * Currently, the prediction period is <%= survival_period%>, so survival probability predictions at the <%= survival_period%> elapsed time point are used for time-dependent AUC calculation. The period can be changed from [Settings](//analytics/settings) in Analytics.
  * Values range from 0.5 to 1, where 0.5 is random prediction (equivalent to coin tossing) and 1 means perfect classification of TRUE and FALSE data.
  * Generally, 0.6 or above is acceptable, 0.8 or above is good, and 0.9 or above indicates excellent classification performance.
  * By examining AUC at multiple time points, you can evaluate the temporal stability of the model's predictive performance.

* R-squared
  * R-squared in Cox regression indicates the proportion of variation in event occurrence explained by the model.
  * Values range from 0 to 1, where larger values indicate higher explanatory power of the model.

* R-squared (Maximum)
  * Shows the theoretical maximum value of R-squared, representing the maximum explanatory power achievable given the data characteristics.
  * By comparing the actual R-squared to this value, you can evaluate the relative performance of the model.
  * A low maximum value suggests extensive censoring in the data.


## Model Significance Testing

Three hypothesis tests were performed to test model significance. Each has the following characteristics:

* Likelihood Ratio Test - A test based on the difference in log-likelihood between the full model (including all variables) and the restricted model (excluding specific variables).
* Log-rank Test (Score Test) - Calculates the test statistic based only on the restricted model. Calculated under the assumption that regression coefficients are zero (i.e., variables are not included in the model).
* Wald Test - Tests whether each coefficient is zero based on the ratio of estimated regression coefficients to their standard errors (similar to t or z).

The likelihood ratio test is the most accurate and reliable, so it is commonly used.

**Explanation of Each Metric**

* Likelihood Ratio Statistic
  * The likelihood ratio test evaluates model significance based on the difference in log-likelihood between the null model (without predictor variables) and the full model (with predictor variables).
  * The larger the statistic, the higher the possibility that predictor variables contribute significantly to the model.
  * Follows a chi-square distribution with degrees of freedom equal to the number of predictor variables.

* P-value (Likelihood Ratio Test)
  * The P-value corresponding to the likelihood ratio statistic evaluates whether the overall model is statistically significant.
  * Generally, if less than 5% (0.05), it can be judged as statistically significant.
  * The smaller the P-value, the higher the possibility that variables included in the model are significant.

* Log-rank Statistic (Score Statistic)
  * The score test evaluates significance from information in the restricted model (state without variables).
  * Calculation is efficient because it doesn't require complete model fitting.
  * The test statistic follows a chi-square distribution and is evaluated with degrees of freedom corresponding to the number of variables.

* P-value (Log-rank Test)
  * The P-value of the score statistic tests whether introducing predictor variables improves the model.
  * Generally, if less than 5% (0.05), it can be judged as statistically significant.
  * The smaller the P-value, the higher the possibility that variables included in the model are significant.

* Wald Statistic
  * The Wald test is a test that evaluates whether estimated regression coefficients are zero.
  * Uses the square of the value obtained by dividing regression coefficients by their standard errors as the statistic.
  * Follows a chi-square distribution with degrees of freedom equal to the number of predictor variables.

* P-value (Wald Test)
  * The P-value corresponding to the Wald statistic is used to confirm the significance of individual variables.
  * Generally, if less than 5% (0.05), it is judged as statistically significant.
  * The smaller the P-value, the higher the possibility that variables included in the model are significant.


{start_show_hide}
## Other Metrics

* Log-likelihood
  * Log-likelihood quantifies how well the model fits the data.
  * Usually takes negative values, and closer to 0 indicates higher model fit.
  * Difficult to interpret alone and is used in calculating AIC and BIC for model comparison.

* AIC
  * AIC (Akaike Information Criterion) is a metric that evaluates the balance between model complexity and fit.
  * Smaller values indicate better models and help select optimal models while preventing overfitting.
  * Used when comparing different models on the same dataset.

* BIC
  * BIC (Bayesian Information Criterion) is a metric for model selection similar to AIC, but with stricter correction for sample size.
  * Tends to select simpler models than AIC, and smaller values indicate better models.
  * Useful for analyses with large sample sizes or when the true model is considered relatively simple.

* VIF (Maximum)
  * VIF (Variance Inflation Factor) is a metric indicating the degree of multicollinearity between predictor variables.
  * Generally, variables with VIF of 10 or more are judged to have multicollinearity problems.
  * Values are 1 or greater, where closer to 1 indicates less multicollinearity.

{end_show_hide}

<% if (!test_mode) { %>
## Predictions on Training Data

The following table shows the results of predictions made on training data using the created predictive model.
<% } else { %>
## Predictions on Training and Test Data

The following table shows the results of predictions made on training data and test data using the created predictive model.
<% } %>

{start_lazy_show_hide}
### Prediction Results
{{data}}
{end_lazy_show_hide}

## ROC Curve

<% if (!test_mode) { %>
The following chart shows the ROC curve that evaluates the model's classification performance at various TRUE/FALSE threshold values. The Y-axis represents true positive rate (sensitivity), and the X-axis represents false positive rate (1-specificity). The blue line is the ROC curve for the current model, and the diagonal gray dotted line represents random prediction (AUC: 0.5). ROC curves that bulge toward the upper left indicate higher prediction accuracy, while those closer to the diagonal indicate lower prediction accuracy.
<% } else { %>
The following chart shows the ROC curve that evaluates the model's classification performance at various TRUE/FALSE threshold values. The Y-axis represents true positive rate (sensitivity), and the X-axis represents false positive rate (1-specificity). The blue line is the ROC curve for the current model on test data, and the orange line is for training data. The diagonal gray dotted line represents random prediction (AUC: 0.5). ROC curves that bulge toward the upper left indicate higher prediction accuracy, while those closer to the diagonal indicate lower prediction accuracy.
<% } %>

{{roc_curve}}

The ROC curve calculation uses survival probability predictions at the <%= survival_period%> elapsed time point. The period can be changed from [Settings](//analytics/settings) in Analytics.



# Supplementary Information

## Next Steps

* Variable Selection Optimization: By excluding variables that are not statistically significant (P-values of <%= baseline_p_pct %>% or higher) to simplify the model, you can make the model easier to interpret and reduce the risk of overfitting. For variable selection guidelines, please see [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
<% if (!repeat_by) { %>
* Group-wise Analysis: By creating separate models for each group, you may gain a more detailed understanding of the determinants of survival curves within each group. In that case, you can select a grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Outlier Verification: By checking for outliers that may affect prediction accuracy and addressing them as necessary, the reliability of the model may improve. For methods to remove outliers, please see [this note](https://exploratory.io/note/exploratory/Eep7kip3).
<% if (!test_mode) { %>
* Model Evaluation: To more rigorously evaluate the predictive performance of this model, you can validate it by splitting into training data and test data. In that case, set "Test Mode" to TRUE in the "Validation" section under [Settings](//analytics/settings) and re-run the analysis.
<% } %>
* Prediction on New Data: When you want to use the created model to make predictions on new data, add a "Predict with Model (Analytics View)" step to the target data frame you want to predict. For details, please refer to [this note](https://exploratory.io/note/exploratory/qIr9Hfa5).

`;

module.exports = template; 
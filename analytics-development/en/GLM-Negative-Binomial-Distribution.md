const template = `


A generalized linear model (negative binomial distribution) was created to predict <%= target %> based on the selected explanatory variables.

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
The following chart shows how the value of <%= target %> changes when the value of each explanatory variable changes, while other variables remain constant.
<% } else { %>
The following chart shows how the value of <%= target %> changes when the value of the explanatory variable changes.
<% } %>

{{variable_effect}}

* The blue line (or dots) shows predicted values for explanatory variable values.
* Gray lines show actual values and their 95% confidence intervals.
* The vertical axis represents the value of <%= target %>.

Important Notes:

<% if (predictorColumns.length > 1) { %>

* Since we predict the effect of each explanatory variable individually while keeping other variables constant, there will be discrepancies between the average of actual values and predicted values.
* For details on how predicted values are calculated, please see [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* For the differences in interpretation between simple and multiple regression analysis, please see [this note](https://exploratory.io/note/exploratory/BDI7AeE5).
* Explanatory variables are arranged in order of importance as shown in "Variable Importance" above.

<% } %>

<% if (has_category_columns) { %>
* For categorical (Character, Factor) explanatory variables with more than 12 unique values, the top 11 most frequent values are retained and the rest are grouped as "Others". This can be changed from [Settings](//analytics/settings) in Analytics.
<% } %>

# Variable Coefficients and Significance

Coefficients (slopes), P-values for determining their significance, and confidence intervals are listed for each variable.

{{coefficient_table}}

## Coefficient Interpretation

The coefficients show how much the value of <%= target %> changes when the value of each variable changes by 1 unit. In generalized linear models (negative binomial distribution), incidence rate ratios using the exponential of coefficients are used for interpretation.

### Examples of Coefficient Interpretation

<% variables.forEach(variable => {
  if (variable.type == 'numeric') { %>
When other variable values are constant, a 1-unit increase in <%= variable.variable %> results in <%= target %> becoming approximately <%= variable.coef %> times.
<% } else if (variable.type == 'logical') { %>
When other variable values are constant, when <%= variable.variable %> is TRUE compared to FALSE, <%= target %> becomes approximately <%= variable.coef %> times.
<% } else { %>
When other variable values are constant, "<%= variable.variable %>" becomes approximately <%= variable.coef %> times compared to the base level "<%= variable.base_level %>". For details on base levels, please refer to [this note](https://exploratory.io/note/exploratory/Pxa6FmO2).
<% } %>
<% }) %>

For coefficient interpretation methods by data type in statistical prediction models, please see [this note](https://exploratory.io/note/exploratory/KOC5WYt3).


## Significance Testing Using P-values

Under a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), explanatory variables with P-values greater than <%= baseline_p_pct %>% (<%= baseline_p %>) cannot be said to have a statistically significant relationship with <%= target %>. Conversely, explanatory variables with P-values less than <%= baseline_p_pct %>% (<%= baseline_p %>) can be said to have a statistically significant relationship with <%= target %>.

_The current significance level (P-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed from [Settings](//analytics/settings) in Analytics._

## Visualization of Coefficients and Confidence Intervals

The following chart visualizes the coefficients and confidence intervals of each variable using error bars.

{{coefficient}}

* The center point of each error bar represents the coefficient value, and the upper and lower lines represent its 95% confidence interval. Explanatory variables with a significant relationship to <%= target %> and a positive relationship are shown in blue, those with a negative relationship are shown in red. Explanatory variables shown in gray cannot be said to have a significant relationship with <%= target %>.
* The 95% confidence interval of coefficients means "there is high confidence (95% confidence) that the true coefficient is within this range." Therefore, explanatory variables whose 95% confidence intervals include 1 may have no relationship with <%= target %> at all, so they cannot be said to be statistically significant. Conversely, explanatory variables whose 95% confidence intervals do not include 1 have almost no possibility of having no relationship with <%= target %>, so they can be said to be statistically significant.
* Significance can be determined by either P-values or confidence intervals. Either method will yield the same results.

_The above explanation of confidence intervals is an intuitive explanation; more precisely, it means "if samples are repeatedly taken from the same population and 95% confidence intervals are calculated each time, 95% of those intervals will contain the true coefficient."_

### Important Notes

These coefficient values represent change amounts when each explanatory variable value changes by 1 point. When explanatory variables have different units, their coefficient values cannot be used to compare the strength of relationship with <%= target %>. To compare the strength of relationships between explanatory variables, please refer to "Variable Importance" above.


# Model Metrics

<% if (test_mode) { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below. Since test mode is currently enabled, metrics for both training data and test data are displayed for prediction accuracy.
<% } else { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below.
<% } %>

{{summary}}

## Prediction Accuracy

Residual deviance is commonly used as a metric to evaluate the prediction accuracy of negative binomial distribution GLM prediction models.

* Residual Deviance
  * Residual deviance represents the sum of squared differences (residuals) between actual values and model predictions.
  * Smaller values indicate higher model fit and are used for model diagnosis and comparison.
  * For negative binomial distribution GLM, if the residual deviance is close to the residual degrees of freedom, the model is considered appropriate.

## Significance

An F-test was performed for model significance testing. The null hypothesis is "all coefficients in the model are 0," meaning the explanatory variables used in the model have no relationship with the target variable <%= target %>. If the P-value is higher than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), the relationship between the selected explanatory variables and <%= target %> cannot be said to be statistically significant. Conversely, if the P-value is lower than <%= baseline_p_pct %>% (<%= baseline_p %>), it can be said to be significant.

{start_show_hide}
## Detailed Explanation of Model Metrics

* P-value
  * P-value shows the probability of statistical significance for the model or parameters.
  * Generally considered statistically significant if less than 5% (0.05).
  * Values range from 0 to 1, where smaller P-values indicate higher statistical significance.

* Row Count
  * Row count is the total number of data used in analysis (sample size).
  * Larger sample sizes increase the statistical power of tests and improve result reliability.
  * When numeric columns in explanatory variables contain missing values, those rows are removed before execution.

* Log Likelihood
  * Log likelihood quantifies how well the model fits the data.
  * Usually takes negative values, where closer to 0 indicates higher model fit.
  * Mainly used in calculating information criteria like AIC and BIC.

* AIC
  * AIC (Akaike Information Criterion) evaluates the balance between model complexity and fit.
  * Smaller values indicate better models, helping select optimal models while preventing overfitting.
  * Usually takes positive values, but may be negative when log likelihood is large.

* BIC
  * BIC (Bayesian Information Criterion) is a model selection metric like AIC, but with stricter correction by sample size.
  * Tends to select simpler models than AIC; smaller values indicate better models.
  * Usually takes positive values, but may be negative when log likelihood is large.

* Residual Deviance
  * Residual deviance represents the sum of squared differences (residuals) between actual values and model predictions.
  * Smaller values indicate higher model fit and are used for model diagnosis and comparison.
  * Takes values ≥ 0, becoming 0 for perfect models.

* Residual Degrees of Freedom
  * Residual degrees of freedom are calculated as "data count - model parameter count" and are used for residual evaluation and variance estimation.
  * Used in calculating test statistics and required for statistical testing.

* Null Model Deviance
  * Null model deviance shows the deviance of a model without explanatory variables (intercept only).
  * By comparing with model deviance, the improvement from adding explanatory variables can be evaluated.
  * The difference from model deviance is more important than the value itself.

* Null Model Degrees of Freedom
  * Null model degrees of freedom is the degrees of freedom for the null (intercept only) model, usually data count-1.
  * By comparing with model degrees of freedom, the degrees of freedom used by adding explanatory variables can be confirmed.

* Theta
  * Theta is the dispersion parameter for the negative binomial distribution, controlling the degree of overdispersion.
  * Smaller values indicate that the data's variance deviates significantly from the Poisson distribution assumption (mean = variance).
  * As the value approaches infinity, the model approaches Poisson regression.

* Theta Standard Error
  * This metric indicates the uncertainty of the estimated Theta parameter.
  * Smaller standard errors mean higher precision in the Theta estimate.
  * Used to calculate Theta's confidence interval and evaluate model stability.

* VIF (Maximum)
  * VIF (Variance Inflation Factor) indicates the degree of multicollinearity between explanatory variables.
  * Generally, variables with VIF ≥ 10 are considered to have multicollinearity problems.
  * Values ≥ 1, where closer to 1 indicates less multicollinearity.

{end_show_hide}

## Relationship Between Actual and Predicted Values

<% if (!test_mode) { %>
Although there are discrepancies between the original actual values and predicted values, the following chart visualizes their relationship using a scatter plot. Each point represents each row.
<% } else { %>
Although there are discrepancies between the original actual values and predicted values, the following chart visualizes their relationship using a scatter plot. Each point represents each row. Training data is visualized in blue and test data in orange.
<% } %>

{start_lazy_show_hide}
### Chart
{{actual_predicted}}
{end_lazy_show_hide}

## Relationship Between Predicted Values and Residuals

<% if (!test_mode) { %>
The following chart visualizes the relationship between predicted values and residuals (discrepancies between original actual values and predicted values) using a scatter plot. Each point represents each row.
<% } else { %>
The following chart visualizes the relationship between predicted values and residuals (discrepancies between original actual values and predicted values) using a scatter plot. Each point represents each row. Training data is visualized in blue and test data in orange.
<% } %>

{start_lazy_show_hide}
### Chart
{{predicted_residual}}
{end_lazy_show_hide}

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

# Supplementary Information

## Next Steps

* Variable Selection Optimization: Excluding statistically non-significant variables (P-values ≥ <%= baseline_p_pct %>%) to simplify the model can make interpretation easier and reduce overfitting risks. For variable selection guidelines, please see [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
<% if (!repeat_by) { %>
* Group-wise Analysis: Creating separate models for each group may provide more detailed understanding of <%= target %> determinants within each group. In that case, you can select a grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Outlier Verification: Checking for outliers that may affect prediction accuracy and addressing them as necessary may improve model reliability. For methods to remove outliers, please see [this note](https://exploratory.io/note/exploratory/Eep7kip3).
* Model Comparison: It may be beneficial to compare the fit of negative binomial and Poisson distribution generalized linear models to determine which is more suitable for the data. This can be judged by comparing AIC and BIC.
<% if (!test_mode) { %>
* Model Evaluation: To evaluate this model's prediction performance more rigorously, you can verify by splitting into training data and test data. In that case, set "Test Mode" to TRUE under the "Validation" section in [Settings](//analytics/settings) and re-run.
<% } %>
* Prediction on New Data: When you want to make predictions on new data using the created model, add a "Predict with Model (Analytics View)" step to the target data frame. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).

`;

module.exports = template; 
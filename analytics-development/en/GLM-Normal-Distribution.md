const template = `


A generalized linear model (normal distribution) was created to predict <%= target %> based on the selected explanatory variables.

<% if (predictorColumns.length > 1) { %>
# Multicollinearity

<% if (has_perfect_collinearity) { %>
{{multicollinearity:0.6}}

In this model, <%= perfect_collinearity_variables %> creates a problem of perfect [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be completely calculated by a formula using other predictor variables), causing their VIF scores to become infinite and preventing the generation of a chart for testing multicollinearity. To resolve the multicollinearity problem, please exclude <%= perfect_collinearity_variables %> from the predictor variables and re-run the analysis.
<% } else if (max_vif > 10) { %>
{{multicollinearity}}
<% if (perfect_collinearity_groups && perfect_collinearity_groups.length > 0) { %>
<%= perfect_collinearity_groups.join(', ') %> have a problem of [perfect multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be completely calculated by a formula using other predictor variables), causing their VIF scores to become infinite and preventing the generation of a chart for testing multicollinearity. To resolve the multicollinearity problem, please exclude <%= perfect_collinearity_groups.join(', ') %> from the predictor variables and re-run the analysis.
For other groups, this model shows signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple predictor variables). When predictor variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.
To resolve this issue, exclude one predictor variable with low necessity from those with VIF values exceeding 10, re-run the analysis, and repeat this process until no predictor variables have VIF values exceeding 10.
<% } else { %>
This model shows signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple predictor variables). When predictor variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.
To resolve this issue, exclude one predictor variable with low necessity from those with VIF values exceeding 10, re-run the analysis, and repeat this process until no predictor variables have VIF values exceeding 10.
<% } %>
<% } else { %>
{{multicollinearity}}
<% if (perfect_collinearity_groups && perfect_collinearity_groups.length > 0) { %>
<%= perfect_collinearity_groups.join(', ') %> have a problem of [perfect multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be completely calculated by a formula using other predictor variables), causing their VIF scores to become infinite and preventing the generation of a chart for testing multicollinearity. To resolve the multicollinearity problem, please exclude <%= perfect_collinearity_groups.join(', ') %> from the predictor variables and re-run the analysis.
For other groups, this model does not show signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple predictor variables). (When predictor variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.)
<% } else { %>
This model does not show signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple predictor variables). (When predictor variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.)
<% } %>
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
* For categorical (Character, Factor) explanatory variables with more than <%= predictor_n %> unique values, the top <%= predictor_n - 1 %> most frequent values are retained and the rest are grouped as "Others". This can be changed from [Settings](//analytics/settings/max_categories_for_factor) in Analytics.
<% } %>

# Variable Coefficients and Significance

Coefficients (slopes), P-values for determining their significance, and confidence intervals are listed for each variable.

{{coefficient_table}}

## Coefficient Interpretation

The coefficients show how much the value of <%= target %> changes when the value of each variable changes by 1 unit.

### Examples of Coefficient Interpretation

<% variables.forEach(variable => {
  if (variable.type == 'numeric') { %>

* When other variable values are constant, a 1-unit increase in <%= variable.variable %> results in <%= target %> increasing by approximately <%= variable.coef %>.

<% } else if (variable.type == 'logical') { %>

* When other variable values are constant, when <%= variable.variable %> is TRUE compared to FALSE, there is a difference of approximately <%= variable.coef %> in <%= target %>.

<% } else { %>

* When other variable values are constant, <%= variable.variable %> has a difference of approximately <%= variable.coef %> compared to the base level "<%= variable.base_level %>". For details on base levels, please refer to [this note](https://exploratory.io/note/exploratory/Pxa6FmO2).
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
* The 95% confidence interval of coefficients means "there is high confidence (95% confidence) that the true coefficient is within this range." Therefore, explanatory variables whose 95% confidence intervals include 0 may have no relationship with <%= target %> at all, so they cannot be said to be statistically significant. Conversely, explanatory variables whose 95% confidence intervals do not include 0 have almost no possibility of having no relationship with <%= target %>, so they can be said to be statistically significant.
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

When the target variable is numeric, R-squared and RMSE are commonly used metrics to evaluate model prediction accuracy.

* R-squared
  * R-squared shows the proportion of variability in the target variable's values that is explained by the explanatory variables used in this model.
  * Values range from 0 to 1, where 1 means the model can perfectly predict the target variable's values.
  * Generally interpreted as: 0.8+ indicates very high, 0.6-0.8 high, 0.4-0.6 moderate, 0.2-0.4 low, and less than 0.2 very low model fit.
  * For notes explaining R-squared, please see [here](https://exploratory.io/note/exploratory/R2-zVj7AqB3).

* RMSE
  * RMSE represents the root mean squared error, measuring the magnitude of error between predicted and actual values.
  * It is expressed in the same units as the target variable, making it easy to interpret. Smaller values indicate higher prediction accuracy.
  * Values are ≥ 0, becoming 0 for perfect predictions.
  * For notes explaining RMSE, please see [here](https://exploratory.io/note/exploratory/RMSE-DjQ0KQd5).


For the concepts and specific calculation methods of R-squared and RMSE, please see the following notes:

* R-squared - [Explanation Note](https://exploratory.io/note/exploratory/R2-zVj7AqB3)
* RMSE - [Explanation Note](https://exploratory.io/note/exploratory/RMSE-DjQ0KQd5).

## Significance

An F-test was performed for model significance testing. The null hypothesis is "all coefficients in the model are 0," meaning the explanatory variables used in the model have no relationship with the target variable <%= target %>. If the P-value is higher than the significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), the relationship between the selected explanatory variables and <%= target %> cannot be said to be statistically significant. Conversely, if the P-value is lower than <%= baseline_p_pct %>% (<%= baseline_p %>), it can be said to be significant.


{start_show_hide}
## Detailed Explanation of Other Metrics

* Adjusted R-squared
  * Adjusted R-squared is an improved version of R-squared that is adjusted for the number of explanatory variables included in the model.
  * Like R-squared, values range from 0 to 1, where 1 means the model can perfectly predict the target variable's values.
  * Adjusted R-squared decreases when meaningless explanatory variables are added, making it suitable for comparing different models.
  * For notes explaining adjusted R-squared, please see [here](https://exploratory.io/note/exploratory/R2-tjU2NHv6).

* F-value
  * The F-value is a statistic for testing the overall significance of the model.
  * It evaluates whether the model is useful for prediction; larger values indicate that the result is statistically meaningful rather than due to chance.
  * Values are ≥ 1; larger values indicate higher model significance.

* P-value
  * P-value indicates the probability of statistical significance for the model or parameters.
  * Generally considered statistically significant if less than 5% (0.05).
  * Values range from 0 to 1, where smaller P-values indicate higher statistical significance.

* Row Count
  * Row count is the total number of data used in analysis (sample size).
  * Larger sample sizes increase the statistical power of tests and improve result reliability.
  * When numeric columns in explanatory variables contain missing values, those rows are removed before execution.

* Degrees of Freedom
  * Degrees of freedom represent the number of parameters (coefficients) that can vary freely in the model.
  * This will be the number of variables (excluding the intercept) shown in the coefficient table.

* Log Likelihood
  * Log likelihood quantifies how well the data fits the model.
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
  * This is the data row count minus the number of all rows shown in the coefficient table.
  * Required for calculating test statistics.

* VIF (Maximum)
  * VIF (Variance Inflation Factor) indicates the degree of multicollinearity between explanatory variables.
  * Generally, variables with VIF ≥ 10 are considered to have multicollinearity problems.
  * Values range from 1 to infinity, where closer to 1 indicates less multicollinearity.

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

* Variable Selection Optimization: Excluding statistically non-significant variables (P-values ≥ <%= baseline_p_pct %>% (<%= baseline_p %>) to simplify the model can make interpretation easier and reduce overfitting risks. In that case, we recommend using [Adjusted R-squared](https://exploratory.io/note/exploratory/R2-tjU2NHv6) as a metric for model accuracy instead of R-squared. For variable selection guidelines, please see [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
<% if (!repeat_by) { %>
* Group-wise Analysis: Creating separate models for each group can provide more detailed analysis of <%= target %> determinants within each group. In that case, you can select a grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Examining Non-linear Relationships: Explanatory variables with non-linear relationships to <%= target %> can be modeled more accurately by transforming the data.
* Outlier Verification: Checking for outliers that may affect prediction accuracy and addressing them as necessary may improve model reliability. For methods to remove outliers, please see [this note](https://exploratory.io/note/exploratory/Eep7kip3).
<% if (!test_mode) { %>
* Model Evaluation: To evaluate this model's prediction performance more rigorously, you can verify by splitting into training data and test data. In that case, set "Test Mode" to TRUE under the "Validation" section in [Settings](//analytics/settings/test_mode) and re-run.
<% } %>
* Prediction on New Data: When you want to make predictions on new data using the created model, add a "Predict with Model (Analytics View)" step to the target data frame. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).

`;

module.exports = template; 
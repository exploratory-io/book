const template = `

A generalized linear model (Inverse Gaussian distribution) has been created to predict <%= target %> based on the selected predictor variables.

<% if (predictorColumns.length > 1) { %>
# Multicollinearity

<% if (has_perfect_collinearity) { %>
{{multicollinearity:0.6}}

In this model, <%= perfect_collinearity_variables %> creates a problem of perfect [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be completely calculated by a formula using other explanatory variables), causing their VIF scores to become infinite and preventing the generation of a chart for testing multicollinearity. To resolve the multicollinearity problem, please exclude <%= perfect_collinearity_variables %> from the explanatory variables and re-run the analysis.
<% } else if (max_vif > 10) { %>
{{multicollinearity}}
<% if (perfect_collinearity_groups && perfect_collinearity_groups.length > 0) { %>
<%= perfect_collinearity_groups.join(', ') %> have a problem of [perfect multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be completely calculated by a formula using other explanatory variables), causing their VIF scores to become infinite and preventing the generation of a chart for testing multicollinearity. To resolve the multicollinearity problem, please exclude <%= perfect_collinearity_groups.join(', ') %> from the explanatory variables and re-run the analysis.
For other groups, this model shows signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple explanatory variables). When explanatory variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.
To resolve this issue, exclude one explanatory variable with low necessity from those with VIF values exceeding 10, re-run the analysis, and repeat this process until no explanatory variables have VIF values exceeding 10.
<% } else { %>
This model shows signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple explanatory variables). When explanatory variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.
To resolve this issue, exclude one explanatory variable with low necessity from those with VIF values exceeding 10, re-run the analysis, and repeat this process until no explanatory variables have VIF values exceeding 10.
<% } %>
<% } else { %>
{{multicollinearity}}
<% if (perfect_collinearity_groups && perfect_collinearity_groups.length > 0) { %>
<%= perfect_collinearity_groups.join(', ') %> have a problem of [perfect multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be completely calculated by a formula using other explanatory variables), causing their VIF scores to become infinite and preventing the generation of a chart for testing multicollinearity. To resolve the multicollinearity problem, please exclude <%= perfect_collinearity_groups.join(', ') %> from the explanatory variables and re-run the analysis.
For other groups, this model does not show signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple explanatory variables). (When explanatory variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.)
<% } else { %>
This model does not show signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple explanatory variables). (When explanatory variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.)
<% } %>
<% } %>
<% } %>

# Relationships Between Variables

<% if (predictorColumns.length > 1) { %>
## Variable Importance

The following chart shows which predictor variables are relatively more important for predicting <%= target %>.

{{variable_importance}}

For more information about how variable importance works, please see [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>

## Effect of Predictor Variables

<% if (predictorColumns.length > 1) { %>
The following chart shows how the value of <%= target %> changes when the value of each predictor variable changes while other variables remain constant.
<% } else { %>
The following chart shows how the value of <%= target %> changes when the value of the predictor variable changes.
<% } %>

{{variable_effect}}

* The blue line (or points) shows the predicted values for the predictor variable values.
* The gray lines show the actual values and their 95% confidence intervals.
* The vertical axis represents the values of <%= target %>.

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

# Variable Coefficients and Significance

The coefficients (slopes), p-values for determining significance, and confidence intervals are listed for each variable.

{{coefficient_table}}

## Interpretation of Coefficients

The coefficients show how much the value of <%= target %> changes when each variable's value changes by 1 unit.


## Significance Testing Using P-values

At a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), predictor variables with p-values greater than <%= baseline_p_pct %>% (<%= baseline_p %>) cannot be considered statistically significant in their relationship with <%= target %>. Conversely, predictor variables with p-values less than <%= baseline_p_pct %>% (<%= baseline_p %>) can be considered statistically significant in their relationship with <%= target %>.

_The current significance level (p-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed in Analytics [Settings](//analytics/settings)._

## Visualization of Coefficients and Confidence Intervals

The following visualization shows the coefficients and confidence intervals for each variable using error bars.

{{coefficient}}

* The center point of each error bar represents the coefficient value, and the upper and lower lines represent its 95% confidence interval. Predictor variables with significant relationships with <%= target %> and positive relationships are shown in blue, those with negative relationships are shown in red. Predictor variables shown in gray do not have significant relationships with <%= target %>.
* The 95% confidence interval for coefficients means "there is high probability (95% confidence) that the true coefficient lies within this range." Therefore, predictor variables whose 95% confidence intervals include 0 cannot be considered statistically significant because there is a possibility of no relationship with <%= target %>. Conversely, predictor variables whose 95% confidence intervals do not include 0 can be considered statistically significant because there is almost no possibility of no relationship with <%= target %>.
* Significance can be determined using either p-values or confidence intervals, and both methods yield the same results.

_The above explanation of confidence intervals is intuitive; more precisely, it means "if we repeatedly sample from the same population and calculate 95% confidence intervals each time, 95% of those intervals will contain the true coefficient."_

### Notes

These coefficient values represent the amount of change when each predictor variable changes by 1 point. When predictor variables have different units, you cannot use these coefficient values to compare the strength of relationships with <%= target %>. To compare the strength of relationships between predictor variables, please refer to the "Variable Importance" section above.

# Model Metrics

<% if (test_mode) { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below. Since we are currently in test mode, prediction accuracy metrics are displayed for both training and test data.
<% } else { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below.
<% } %>

{{summary}}

## Prediction Accuracy

Residual deviance is commonly used as a metric for evaluating the prediction accuracy of GLM prediction models with Poisson distribution.

* Residual Deviance
  * Residual deviance represents the sum of squared differences (residuals) between actual values and model predictions.
  * Smaller values indicate better model fit and are used for model diagnosis and comparison.
  * For GLM with Poisson distribution, if the residual deviance is close to the residual degrees of freedom, the model is considered appropriate.

## Significance

An F-test was conducted to test the significance of the model. The null hypothesis is that "all coefficients in the model are 0," meaning that the predictor variables used in the model have no relationship with the target variable <%= target %>. If the p-value is higher than the significance level of <%= baseline_p_pct %>%, the relationship between the selected predictor variables and <%= target %> cannot be considered statistically significant. Conversely, if the p-value is lower than <%= baseline_p_pct %>%, it can be considered significant.

{start_show_hide}
## Details of Model Metrics
* P-value
  * P-value is a probability value indicating the statistical significance of the model or parameters.
  * Generally, values less than 5% (0.05) are considered statistically significant.
  * Values range from 0 to 1, with smaller p-values indicating higher statistical significance.

* Number of Rows
  * Number of rows indicates the total number of data points (sample size) used in the analysis.
  * Larger sample sizes increase the power of statistical tests and improve the reliability of results.
  * Rows containing missing values in numeric predictor variables are removed before execution.

* Log Likelihood
  * Log likelihood quantifies how well the data fits the model.
  * Usually takes negative values, with values closer to 0 indicating better model fit.
  * Primarily used in calculating information criteria such as AIC and BIC.

* AIC
  * AIC (Akaike Information Criterion) is a metric that evaluates the balance between model complexity and fit.
  * Smaller values indicate better models, helping to select optimal models while preventing overfitting.
  * Values are usually positive but can be negative when log likelihood is large.

* BIC
  * BIC (Bayesian Information Criterion) is a model selection criterion similar to AIC but with stricter correction for sample size.
  * It tends to select simpler models than AIC, with smaller values indicating better models.
  * Values are usually positive but can be negative when log likelihood is large.

* Residual Deviance
  * Residual deviance measures the difference (residuals) between actual values and model predictions.
  * Smaller values indicate better model fit and are used for model diagnosis and comparison.
  * Takes values of 0 or greater, with perfect models having a value of 0.

* Residual Degrees of Freedom
  * Residual degrees of freedom is calculated as "data quantity (number of rows) - number of model parameters."
  * Used for evaluating residuals and estimating variance, necessary for calculating test statistics.

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

## Relationship Between Actual and Predicted Values

<% if (!test_mode) { %>
As a result of prediction, there are discrepancies between the original actual values and predicted values. The following chart visualizes their relationship using a scatter plot. Each point represents each row.
<% } else { %>
As a result of prediction, there are discrepancies between the original actual values and predicted values. The following chart visualizes their relationship using a scatter plot. Each point represents each row. Training data is visualized in blue and test data in orange.
<% } %>

{start_lazy_show_hide}
### Chart
{{actual_predicted}}
{end_lazy_show_hide}

## Relationship Between Predicted Values and Residuals

<% if (!test_mode) { %>
As a result of prediction, the following chart visualizes the relationship between predicted values and residuals (discrepancies between original actual values and predicted values) using a scatter plot. Each point represents each row.
<% } else { %>
As a result of prediction, the following chart visualizes the relationship between predicted values and residuals (discrepancies between original actual values and predicted values) using a scatter plot. Each point represents each row. Training data is visualized in blue and test data in orange.
<% } %>

{start_lazy_show_hide}
### Chart
{{predicted_residual}}
{end_lazy_show_hide}

<% if (!test_mode) { %>
## Predictions on Training Data

The following table shows the results of predictions made on the training data using the created prediction model.
<% } else { %>
## Predictions on Training and Test Data

The following table shows the results of predictions made on both training and test data using the created prediction model.
<% } %>

{start_lazy_show_hide}
### Prediction Results
{{data}}
{end_lazy_show_hide}

# Additional Information

## Next Steps

* Variable selection optimization: Excluding variables that are not statistically significant (p-values of <%= baseline_p_pct %>% or higher) to simplify the model can make model interpretation easier and reduce the risk of overfitting. For variable selection guidelines, please see [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
<% if (!repeat_by) { %>
* Group-wise analysis: Creating separate models for each group allows for more detailed analysis of the determinants of <%= target %> within each group. In this case, you can select the grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Checking for outliers: Checking for outliers that may affect prediction accuracy and addressing them as necessary can improve model reliability. For methods to remove outliers, please see [this note](https://exploratory.io/note/exploratory/Eep7kip3).
* Consideration of other distributions: The Inverse Gaussian distribution is suitable for modeling non-negative continuous data with right-skewed distributions, but depending on the data characteristics, other distributions (such as Gamma distribution) may also be worth considering.
<% if (!test_mode) { %>
* Model evaluation: To more rigorously evaluate the predictive performance of this model, you can validate it by dividing into training and test data. In this case, set "Test Mode" to TRUE in the "Validation" section under [Settings](//analytics/settings/test_mode) and re-run.
<% } %>
* Prediction on new data: When you want to use the created model to make predictions on new data, add a "Predict with Model (Analytics View)" step to the target data frame. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).


`;

module.exports = template;

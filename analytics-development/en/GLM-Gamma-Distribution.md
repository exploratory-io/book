const template =
`

A generalized linear model (Gamma distribution) has been created to predict <%= target %> based on the selected explanatory variables.

<% if (predictorColumns.length > 1) { %>
# Multicollinearity

<% if (has_perfect_collinearity) { %>
{{multicollinearity:0.6}}

In this model, <%= perfect_collinearity_variables %> creates a problem of perfect [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be completely calculated by a formula using other explanatory variables), causing their VIF scores to become infinite and preventing the generation of a chart for testing multicollinearity. To resolve the multicollinearity problem, please exclude <%= perfect_collinearity_variables %> from the explanatory variables and re-run the analysis.
<% } else if (max_vif > 10) { %>
{{multicollinearity}}
<% if (perfect_collinearity_groups && perfect_collinearity_groups.length > 0) { %>
<%= perfect_collinearity_groups.join(', ') %> have a problem of [perfect multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be completely calculated by a formula using other explanatory variables), causing their VIF scores to become infinite and preventing the generation of a chart for testing multicollinearity. To resolve the multicollinearity problem, please exclude <%= perfect_collinearity_groups.join(', ') %> from the explanatory variables and re-run the analysis.
For other groups, this model shows signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlations between multiple explanatory variables). When explanatory variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.
To resolve this issue, exclude one explanatory variable with low necessity from those with VIF values exceeding 10, re-run the analysis, and repeat this process until no explanatory variables have VIF values exceeding 10.
<% } else { %>
This model shows signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlations between multiple explanatory variables). When explanatory variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.
To resolve this issue, exclude one explanatory variable with low necessity from those with VIF values exceeding 10, re-run the analysis, and repeat this process until no explanatory variables have VIF values exceeding 10.
<% } %>
<% } else { %>
{{multicollinearity}}
<% if (perfect_collinearity_groups && perfect_collinearity_groups.length > 0) { %>
<%= perfect_collinearity_groups.join(', ') %> have a problem of [perfect multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be completely calculated by a formula using other explanatory variables), causing their VIF scores to become infinite and preventing the generation of a chart for testing multicollinearity. To resolve the multicollinearity problem, please exclude <%= perfect_collinearity_groups.join(', ') %> from the explanatory variables and re-run the analysis.
For other groups, this model does not show signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlations between multiple explanatory variables). (When explanatory variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.)
<% } else { %>
This model does not show signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlations between multiple explanatory variables). (When explanatory variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.)
<% } %>
<% } %>
<% } %>

# Variable Relationships

<% if (predictorColumns.length > 1) { %>
## Variable Importance

The following chart shows which explanatory variables are relatively more important for predicting <%= target %>.

{{variable_importance}}

For more information about how variable importance works, please see [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>

## Variable Effects

<% if (predictorColumns.length > 1) { %>
The following chart shows how the value of <%= target %> changes when the value of each explanatory variable changes while other variables remain constant.
<% } else { %>
The following chart shows how the value of <%= target %> changes when the value of the explanatory variable changes.
<% } %>

{{variable_effect}}

* The blue line (or points) shows the predicted values for the explanatory variable values.
* The gray lines show the actual values and their 95% confidence intervals.
* The vertical axis represents the values of <%= target %>.

Notes:

<% if (predictorColumns.length > 1) { %>

* Since we are predicting the effect of each explanatory variable individually while keeping other variables constant, there may be discrepancies between the mean of actual values and predicted values.
* For detailed information about how predicted values are calculated, please see [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* For the differences in interpretation between simple regression analysis and multiple regression analysis, please see [this note](https://exploratory.io/note/exploratory/BDI7AeE5).
* The explanatory variables are arranged in order of importance as shown in the "Variable Importance" section above.

<% } %>

<% if (has_category_columns) { %>
* For categorical (Character type, Factor type) explanatory variables with more than <%= predictor_n %> unique values, the top <%= predictor_n - 1 %> most frequent values are kept and the rest are labeled as "Others". This can be changed in [Settings](//analytics/settings/max_categories_for_factor).
<% } %>

# Variable Coefficients and Significance

The coefficients (slopes), p-values for determining significance, and confidence intervals are listed for each variable.

{{coefficient_table}}

## Interpretation of Coefficients

The coefficients show how much the value of <%= target %> changes when each variable's value changes by 1 unit.

## Significance Testing Using P-values

With a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), explanatory variables with p-values greater than <%= baseline_p_pct %>% (<%= baseline_p %>) cannot be said to have a statistically significant relationship with <%= target %>. Conversely, explanatory variables with p-values less than <%= baseline_p_pct %>% (<%= baseline_p %>) can be said to have a statistically significant relationship with <%= target %>.

_The current significance level (p-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed in Analytics [Settings](//analytics/settings)._

## Visualization of Coefficients and Confidence Intervals

The following visualization shows the coefficients and confidence intervals for each variable using error bars.

{{coefficient}}

* The center point of each error bar represents the coefficient value, and the upper and lower lines represent the 95% confidence interval. Explanatory variables with a significant relationship with <%= target %> and a positive relationship are shown in blue, those with a negative relationship are shown in red. Explanatory variables shown in gray do not have a significant relationship with <%= target %>.
* The 95% confidence interval of the coefficient means "there is a high probability (95% confidence) that the true coefficient is within this range." Therefore, explanatory variables whose 95% confidence interval includes 0 may have no relationship with <%= target %> at all, so they cannot be said to be statistically significant. Conversely, explanatory variables whose 95% confidence interval does not include 0 have almost no possibility of having no relationship with <%= target %>, so they can be said to be statistically significant.
* Significance can be determined by either p-values or confidence intervals, and both methods yield the same results.

_The explanation of confidence intervals above is an intuitive explanation. More precisely, it means "if we repeatedly sample from the same population and calculate 95% confidence intervals each time, 95% of those intervals will contain the true coefficient."_

### Notes

These coefficient values are the amount of change when each explanatory variable's value changes by 1 point. When the units differ between explanatory variables, you cannot compare the strength of relationship with <%= target %> using these coefficient values. If you want to compare the strength of relationships between explanatory variables, please refer to the "Variable Importance" section above.

# Model Metrics

<% if (test_mode) { %>
Various metrics related to model prediction accuracy and significance are summarized in the following table. Since this is currently in test mode, metrics for both training data and test data are displayed for prediction accuracy.
<% } else { %>
Various metrics related to model prediction accuracy and significance are summarized in the following table.
<% } %>

{{summary}}

## Prediction Accuracy

Residual deviance is commonly used as a metric to evaluate the prediction accuracy of Poisson distribution GLM prediction models.

* Residual Deviance
  * Residual deviance represents the sum of squares of the differences (residuals) between actual values and model predictions.
  * The smaller the value, the higher the model fit, and it is used for model diagnosis and comparison.
  * For Gamma distribution GLM, if the residual deviance is close to the residual degrees of freedom, the model is considered appropriate.

## Significance

We performed an F-test for model significance testing. The null hypothesis is that "all coefficients of the model are 0," meaning that the explanatory variables used in the model have no relationship with the target variable <%= target %>. If the p-value is higher than the significance level of <%= baseline_p_pct %>%, the relationship between the selected explanatory variables and <%= target %> cannot be said to be statistically significant. Conversely, if the p-value is lower than <%= baseline_p_pct %>%, it can be said to be significant.

{start_show_hide}
## Model Metrics Details

* P-value
  * P-value is a probability value that indicates the statistical significance of a model or parameter.
  * Generally, if it is less than 5% (0.05), it is judged to be statistically significant.
  * The value is between 0 and 1, and the smaller the p-value, the higher the statistical significance.

* Number of Rows
  * Number of rows indicates the total number of data (sample size) used in the analysis.
  * The larger the sample size, the higher the detection power of statistical tests and the better the reliability of results.
  * If there are missing values in numeric columns of explanatory variables, those rows are removed before execution.

* Log Likelihood
  * Log likelihood is a numerical representation of how well the data fits the model.
  * Usually takes negative values, and the closer to 0, the higher the model fit.
  * Mainly used for calculating information criteria such as AIC and BIC.

* AIC
  * AIC (Akaike Information Criterion) is a metric that evaluates the balance between model complexity and fit.
  * The smaller the value, the better the model, and it helps select the optimal model while preventing overfitting.
  * Values are usually positive, but can be negative when the log likelihood is large.

* BIC
  * BIC (Bayesian Information Criterion) is a metric for model selection similar to AIC, but with stricter correction based on sample size.
  * It tends to select simpler models than AIC, and smaller values indicate better models.
  * Values are usually positive, but can be negative when the log likelihood is large.

* Residual Deviance
  * Residual deviance represents the difference (residuals) between actual values and model predictions, calculated in a form suitable for Gamma distribution GLM.
  * The smaller the value, the higher the model fit, and it is used for model diagnosis and comparison.
  * Takes values of 0 or greater, and becomes 0 for a perfect model.

* Residual Degrees of Freedom
  * Residual degrees of freedom are the degrees of freedom related to residuals, calculated as "data amount (number of rows) - number of model parameters."
  * Used for residual evaluation and variance estimation, necessary for calculating test statistics.

* Null Model Deviance
  * Null model deviance indicates the deviance of a model that does not include explanatory variables (intercept only).
  * By comparing with the model's deviance, you can evaluate the degree of model improvement by adding explanatory variables.
  * The difference from the model's deviance is more important than the value itself.

* Null Model Degrees of Freedom
  * Null model degrees of freedom are the degrees of freedom of the null (intercept only) model, usually the number of data points - 1.
  * By comparing with the model's degrees of freedom, you can check the degrees of freedom used by adding explanatory variables.

* VIF (Maximum)
  * VIF (Variance Inflation Factor) is a metric that indicates the degree of multicollinearity between explanatory variables.
  * Generally, variables with VIF of 10 or higher are judged to have multicollinearity problems.
  * Values are 1 or higher, and the closer to 1, the less multicollinearity.

{end_show_hide}

## Relationship Between Actual and Predicted Values

<% if (!test_mode) { %>
As a result of prediction, there are discrepancies between the original actual values and predicted values, but the following chart visualizes their relationship using a scatter plot. Each point represents each row.
<% } else { %>
As a result of prediction, there are discrepancies between the original actual values and predicted values, but the following chart visualizes their relationship using a scatter plot. Each point represents each row. Training data is visualized in blue and test data in orange.
<% } %>

{start_lazy_show_hide}
### Chart
{{actual_predicted}}
{end_lazy_show_hide}

## Relationship Between Predicted Values and Residuals

<% if (!test_mode) { %>
As a result of prediction, the relationship between predicted values and residuals (discrepancies between original actual values and predicted values) is visualized using a scatter plot in the following chart. Each point represents each row.
<% } else { %>
As a result of prediction, the relationship between predicted values and residuals (discrepancies between original actual values and predicted values) is visualized using a scatter plot in the following chart. Each point represents each row. Training data is visualized in blue and test data in orange.
<% } %>

{start_lazy_show_hide}
### Chart
{{predicted_residual}}
{end_lazy_show_hide}

<% if (!test_mode) { %>
## Predictions on Training Data

The following table shows the results of predictions on training data using the created prediction model.
<% } else { %>
## Predictions on Training and Test Data

The following table shows the results of predictions on training data and test data using the created prediction model.
<% } %>

{start_lazy_show_hide}
### Prediction Results
{{data}}
{end_lazy_show_hide}

# Additional Information

## Next Steps

* Variable selection optimization: By excluding variables that are not statistically significant (p-value >= <%= baseline_p_pct %>%) and simplifying the model, you can make the model easier to interpret and reduce the risk of overfitting. For variable selection guidelines, please see [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
<% if (!repeat_by) { %>
* Group-wise analysis: By creating separate models for each group, you can analyze the determinants of <%= target %> within each group in more detail. In that case, you can select the grouping variable in "Repeat By" and re-run.
<% } %>
* Outlier verification: By checking for outliers that may affect prediction accuracy and addressing them as needed, the reliability of the model may improve. For methods to remove outliers, please see [this note](https://exploratory.io/note/exploratory/Eep7kip3).
* Distribution fit verification: Gamma distribution is a model suitable for positive continuous values, but depending on data characteristics, other distributions might be worth considering.
<% if (!test_mode) { %>
* Model evaluation: To evaluate the prediction performance of this model more rigorously, you can validate by splitting into training data and test data. In that case, set "Test Mode" to TRUE in the "Validation" section under [Settings](//analytics/settings/test_mode) and re-run.
<% } %>
* Prediction on new data: When you want to use the created model to predict on new data, add a "Predict with Model (Analytics View)" step to the data frame you want to predict. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).

`;

module.exports = template;

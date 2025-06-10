const template = `

A linear regression model has been created to predict <%= target %> based on the selected predictor variables.

<% if (predictorColumns.length > 1) { %>
# Multicollinearity

<% if (has_perfect_collinearity) { %>
{{multicollinearity:0.6}}

In this model, <%= perfect_collinearity_variables %> creates a problem of [perfect multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (a state where values can be perfectly calculated by a formula using other predictor variables), resulting in infinite VIF scores and preventing the generation of charts for testing multicollinearity. To resolve the multicollinearity issue, please exclude <%= perfect_collinearity_variables %> from the predictor variables and re-run the analysis.
<% } else if (max_vif > 10) { %>
{{multicollinearity}}

This model shows signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple predictor variables). When predictor variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.
To resolve this issue, exclude one predictor variable with low necessity from those with VIF values exceeding 10, re-run the analysis, and repeat this process until no predictor variables have VIF values exceeding 10.

<% } else { %>
{{multicollinearity}}

This model does not show signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlation between multiple predictor variables). (When predictor variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effect of individual variables.)
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

<% if (predictorColumns.length > 1) { %>

Notes:

* Since this predicts the effect of each predictor variable individually while other variables remain constant, there may be discrepancies between the mean of actual values and predicted values.
* For details on how predicted values are calculated, please see [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* For differences in interpretation between simple regression and multiple regression analysis, please see [this note](https://exploratory.io/note/exploratory/BDI7AeE5).
* Predictor variables are arranged in order of importance as shown in the "Variable Importance" section above.

<% if (has_category_columns) { %>
* For categorical (Character, Factor) predictor variables with more than <%= predictor_n %> unique values, the top <%= predictor_n - 1 %> most frequent values are retained and the rest are grouped as "Others". This can be changed in [Settings](//analytics/settings/max_categories_for_factor).
<% } %>

<% } else { %>
<% if (has_category_columns) { %>
Notes:

* For categorical (Character, Factor) predictor variables with more than <%= predictor_n %> unique values, the top <%= predictor_n - 1 %> most frequent values are retained and the rest are grouped as "Others". This can be changed in [Settings](//analytics/settings/max_categories_for_factor).
<% } %>
<% } %>

# Variable Coefficients and Significance

The coefficients (slopes), p-values for determining significance, and confidence intervals are listed for each variable.

{{coefficient_table}}

<% if (has_category_columns) { %>
_For categorical (Character, Factor) predictor variables with more than <%= predictor_n %> unique values, the top <%= predictor_n - 1 %> most frequent values are retained and the rest are grouped as "Others". This can be changed in [Settings](//analytics/settings/max_categories_for_factor)._
<% } %>

## Interpretation of Coefficients

The coefficients show how much the value of <%= target %> changes when each variable's value changes by 1 unit.

### Examples of Coefficient Interpretation

<% variables.forEach(variable => { %>
<% if (variable.type == 'numeric') { %>

* When other variables remain constant, a 1-unit increase in <%= variable.variable %> <% if (variable.coef > 0) { %>increases<% } else { %>decreases<% } %> <%= target %> by approximately <%= variable.coef %>.

<% } else if (variable.type == 'logical') { %>

* When other variables remain constant, when <%= variable.variable %> is TRUE, there is a difference of approximately <%= variable.coef %> in <%= target %> compared to FALSE.  

<% } else { %>

* When other variables remain constant, <%= variable.variable %> has a difference of approximately <%= variable.coef %> compared to the base level "<%= variable.base_level %>". For details on base levels, please refer to [this note](https://exploratory.io/note/exploratory/Pxa6FmO2).
<% } %>
<% }) %>

For information on interpreting coefficients by data type in statistical prediction models, please see [this note](https://exploratory.io/note/exploratory/KOC5WYt3).

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

**Notes**

These coefficient values represent the amount of change when each predictor variable changes by 1 point. When predictor variables have different units, you cannot use these coefficient values to compare the strength of relationships with <%= target %>. To compare the strength of relationships between predictor variables, please refer to the "Variable Importance" section above.

# Model Metrics

<% if (test_mode) { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below. Since we are currently in test mode, prediction accuracy metrics are displayed for both training and test data.
<% } else { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below.
<% } %>

{{summary}}

## Prediction Accuracy

For numeric target variables, commonly used metrics for evaluating model prediction accuracy are R-squared and RMSE.

* R-squared
  * R-squared indicates the proportion of variance in the target variable that is explained by the predictor variables used in this model.
  * Values range from 0 to 1, where 1 means the model can perfectly predict the target variable values.
  * Generally interpreted as very high (0.8+), high (0.6-0.8), moderate (0.4-0.6), low (0.2-0.4), or very low (<0.2) model fit.
  * For a note explaining R-squared, please see [here](https://exploratory.io/note/exploratory/R2-zVj7AqB3).

* RMSE
  * RMSE represents the square root of the mean squared error and measures the magnitude of error between predicted and actual values.
  * It is expressed in the same units as the target variable, making it easy to interpret. Smaller values indicate higher prediction accuracy.
  * Takes values of 0 or greater, with 0 indicating perfect prediction.
  * For a note explaining RMSE, please see [here](https://exploratory.io/note/exploratory/RMSE-DjQ0KQd5).


For concepts and specific calculation methods of R-squared and RMSE, please see the following notes:

* R-squared - [Explanation Note](https://exploratory.io/note/exploratory/R2-zVj7AqB3)
* RMSE - [Explanation Note](https://exploratory.io/note/exploratory/RMSE-DjQ0KQd5).

## Significance

An F-test was conducted to test the significance of the model. The null hypothesis is that "all coefficients in the model are 0," meaning that the predictor variables used in the model have no relationship with the target variable <%= target %>. If the p-value is higher than the significance level of <%= baseline_p_pct %>%, the relationship between the selected predictor variables and <%= target %> cannot be considered statistically significant. Conversely, if the p-value is lower than <%= baseline_p_pct %>%, it can be considered significant.

{start_show_hide}
## Explanation of Other Metrics

* Adjusted R-squared
  * Adjusted R-squared is an improved version of R-squared that adjusts for the number of predictor variables included in the model.
  * Like R-squared, values range from 0 to 1, where 1 means the model can perfectly predict the target variable values.
  * It has the property of decreasing when meaningless predictor variables are added, making it suitable for comparing different models.
  * For a note explaining adjusted R-squared, please see [here](https://exploratory.io/note/exploratory/R2-tjU2NHv6).

* F-value
  * F-value is a test statistic for testing the overall significance of the model.
  * It evaluates "whether the model is useful for prediction," and larger values indicate statistical significance rather than chance.
  * Takes values of 1 or greater, with larger values indicating higher model significance.

* P-value
  * P-value is a probability value indicating the statistical significance of the model or parameters.
  * Generally, values less than 5% (0.05) are considered statistically significant.
  * Values range from 0 to 1, with smaller p-values indicating higher statistical significance.

* Number of Rows
  * Number of rows indicates the total number of data points (sample size) used in the analysis.
  * Larger sample sizes increase the power of statistical tests and improve the reliability of results.
  * Rows containing missing values in numeric predictor variables are removed before execution.

* Degrees of Freedom
  * Degrees of freedom represents the number of parameters (coefficients) that can vary freely in the model.
  * This equals the number of variables shown in the coefficient table (excluding the intercept).

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
  * Residual deviance represents the sum of squared differences (residuals) between actual values and model predictions.
  * Smaller values indicate better model fit and are used for model diagnosis and comparison.
  * Takes values of 0 or greater, with perfect models having a value of 0.

* Residual Degrees of Freedom
  * Residual degrees of freedom is the degrees of freedom related to residuals, calculated as "data quantity (number of rows) - number of model parameters."
  * This equals the number of data rows minus the total number of rows shown in the coefficient table.
  * Used for evaluating residuals and estimating variance, necessary for calculating test statistics.

* VIF (Maximum)
  * VIF (Variance Inflation Factor) is a metric indicating the degree of multicollinearity between predictor variables.
  * Generally, variables with VIF of 10 or higher are considered to have multicollinearity problems.
  * Values range from 1 to infinity, with values closer to 1 indicating less multicollinearity.

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

## Distribution of Residuals

<% if (!test_mode) { %>
The following chart visualizes the distribution of residuals (discrepancies between original actual values and predicted values) using a histogram.
<% } else { %>
The following chart visualizes the distribution of residuals (discrepancies between original actual values and predicted values) using a histogram. Training data is visualized in blue and test data in orange.
<% } %>

{start_lazy_show_hide}
### Chart
{{residual}}
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

* Variable selection optimization: Excluding variables that are not statistically significant (p-values of <%= baseline_p_pct %>% (<%= baseline_p %>) or higher) to simplify the model can make model interpretation easier and reduce the risk of overfitting. In this case, we recommend using [adjusted R-squared](https://exploratory.io/note/exploratory/R2-tjU2NHv6) rather than R-squared as a metric for measuring model accuracy. For variable selection guidelines, please see [this note](https://exploratory.io/note/exploratory/SWF4cTx8).

<% if (!repeat_by) { %>
* Group-wise analysis: Creating separate models for each group allows for more detailed analysis of the determinants of <%= target %> within each group. In this case, you can select the grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Consideration of non-linear relationships: Predictor variables that have non-linear relationships with <%= target %> can be modeled more accurately by transforming the data.
* Checking for outliers: Checking for outliers that may affect prediction accuracy and addressing them as necessary can improve model reliability. For methods to remove outliers, please see [this note](https://exploratory.io/note/exploratory/Eep7kip3).
<% if (!test_mode) { %>
* Model evaluation: To more rigorously evaluate the predictive performance of this model, you can validate it by dividing into training and test data. In this case, set "Test Mode" to TRUE in the "Validation" section under [Settings](//analytics/settings/test_mode) and re-run.
<% } %>
* Prediction on new data: When you want to use the created model to make predictions on new data, add a "Predict with Model (Analytics View)" step to the target data frame. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).

`;

module.exports = template;

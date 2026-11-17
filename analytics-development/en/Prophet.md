const template = `


<% if (!test_mode) { %>
A model to predict <%= target %> has been created. It predicts up to <%= period %> <%= unit %> ahead, and this prediction period can be changed from the "Prediction Period" in [Settings](//analytics/settings/forecast_period).
<% } else { %>
A model to predict <%= target %> has been created. Since it is currently in test mode, the model is built using data up to <%= test_period %><%= unit %> before the end of the data, and predictions are made for the period thereafter (test period). The test period can be changed from the "Test Data Period" section in [Settings](//analytics/settings/test_period) in Analytics.
<% } %>

<!-- If there are external regressors and a value greater than 0 is set for the prediction period, show this section -->
<% if (has_external_regressors && period > 0) { %>

**External Regressors and Future Prediction**

This model includes external regressors, but future data for the external regressors is not included, so future prediction is not possible. Since prediction is performed for the period for which external regressor data exists, the correlation between <%= target %> and the external regressors can be examined.

If you want to make future predictions with a model using external regressors in Prophet, please provide future data for the external regressors.

<% } %>

# Prediction Results

<% if (!test_mode) { %>
The following chart visualizes the predicted values with an orange line and the actual values with a blue line.
<% } else { %>
The following chart visualizes the predicted values with an orange line, the actual values for the training period with a blue line, and the actual values for the test period with a light blue line.
<% } %>

{{forecast_chart}}

The light orange shaded area above and below the orange line representing the predicted values is the uncertainty interval.

# Trend

The following chart visualizes the long-term trend (tendency) of <%= target %> read by the Prophet model from the data. This graph includes the following elements:

<% if (!test_mode) { %>
- Blue line: Actual values of <%= target %>.
- Green line: Represents the trend obtained by removing seasonality and irregular fluctuations from the actual values. The slope of the trend changes at change points.
- Red bars: Represent trend change points, indicating a significant change in the movement of <%= target %>.
<% } else { %>
- Blue line: Actual values of <%= target %> during the training period.
- Light blue line: Actual values of <%= target %> during the test period.
- Green line: Represents the trend obtained by removing seasonality and irregular fluctuations from the actual values. The slope of the trend changes at change points.
- Red bars: Represent trend change points, indicating a significant change in the movement of <%= target %>.
<% } %>

{{trend_chart}}

<!-- Display only if yearly seasonality exists -->
<% if (has_yearly_seasonality) { %>

## Yearly Seasonality

This is the yearly pattern of <%= target %> that repeats every year, as read by the Prophet model from the data.

{{yearly_seasonality_chart}}

<% } %>

<!-- Display only if quarterly seasonality exists -->
<% if (has_quarterly_seasonality) { %>

## Quarterly Seasonality

This is the quarterly pattern of <%= target %> that repeats every quarter, as read by the Prophet model from the data.

{{quarterly_seasonality_chart}}

<% } %>

<!-- Display only if monthly seasonality exists -->
<% if (has_monthly_seasonality) { %>

## Monthly Seasonality

This is the monthly pattern of <%= target %> that repeats every month, as read by the Prophet model from the data.

{{monthly_seasonality_chart}}

<% } %>


<!-- Display only if weekly seasonality exists -->
<% if (has_weekly_seasonality) { %>

## Weekly Seasonality

This is the weekly pattern of <%= target %> that repeats every week, as read by the Prophet model from the data.

{{weekly_seasonality_chart}}

<% } %>

<!-- Display only if daily seasonality exists -->
<% if (has_daily_seasonality) { %>

## Daily Seasonality

This is the daily pattern of <%= target %> that repeats every day, as read by the Prophet model from the data.

{{daily_seasonality_chart}}

<% } %>

# Time Series Component Analysis

<!-- Display only when external regressors are selected -->
<% if (has_external_regressors) { %>
## Variable Importance

The following chart relatively shows how important seasonality and the selected external regressors are for predicting <%= target %>.

{{variable_importance}}

For more information about the mechanism of variable importance, please refer to [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>

## Relationship between Time Series Components and Predicted Values

This Prophet model decomposes the <%= target %> data into the following components and uses them for prediction:

* Trend
* Seasonality: <%= seasonalities.map(seasonality => seasonality).join(', ') %>
<% if (has_external_regressors) { %>
* External Regressors: <%= external_regressors.map(regressor => regressor.name).join(', ') %>
<% } %>

The Prophet model is obtained by summing these components to get the predicted values. The gray line represents the predicted values. A component line that is closer to the shape of the gray line indicates that the component contributes more to the prediction by the Prophet model.

{{effect_chart}}

# Prediction Accuracy

<% if (!test_mode) { %>
The table below summarizes various metrics regarding the prediction accuracy of the model on the training data.
<% } else { %>
The table below summarizes various metrics regarding the prediction accuracy of the model on the test data, using the created prediction model.
<% } %>

{{summary}}

<% if (!repeat_by) { %>

The main evaluation metrics are as follows:

* RMSE (Root Mean Square Error): The average difference between predicted and actual values is about <%= rmse %>. A smaller value indicates higher prediction accuracy.
* MAE (Mean Absolute Error): The average absolute difference between predicted and actual values is about <%= mae %>. A smaller value indicates higher prediction accuracy.
* MAPE (Mean Absolute Percentage Error): The absolute difference between predicted and actual values is about <%= mape_pct %>% of the actual values. A smaller value indicates higher prediction accuracy.
* R-squared value: This model can explain <%= r_squared_pct %>% of the variability in <%= target %>.

<% } %>

{start_show_hide}
<% if (!test_mode) { %>
## Explanation of Model Metrics

* RMSE (Root Mean Square Error)
  * RMSE represents the square root of the mean squared error and measures the magnitude of the error between predicted and actual values.
  * It is expressed in the same units as the target variable, making it easy to interpret. A smaller value means higher prediction accuracy.
  * It takes values of 0 or greater, and is 0 for perfect prediction.

* MAE (Mean Absolute Error)
  * MAE represents the mean absolute error and indicates the average of the absolute differences between predicted and actual values.
  * It is expressed in the same units as the target variable, and a smaller value means higher prediction accuracy.
  * It takes values of 0 or greater, and is 0 for perfect prediction.

* MAPE (Mean Absolute Percentage Error)
  * MAPE represents the mean absolute percentage error, which is the average of the absolute values of the differences between predicted and actual values divided by the actual values, expressed as a percentage.
  * Values are 0% or greater, and a value closer to 0% means higher prediction accuracy.
  * Generally, it is often interpreted as high accuracy below 10%, good between 10-20%, and needs improvement above 20%.
  * It is often used to compare prediction accuracy across different groups.

* R-squared
  * R-squared indicates the proportion of the variability in the target variable that is explained by this model.
  * Values are generally between 0 and 1, where 1 means the model can perfectly predict the values of the target variable.
  * In time series forecasting, it serves as an indicator of how well the trend and seasonality patterns are captured.
  * Generally, R-squared values are often interpreted as very high above 0.8, high between 0.6 and 0.8, medium between 0.4 and 0.6, low between 0.2 and 0.4, and very low model fit below 0.2.

<% } else { %>

## Explanation of Model Metrics

* RMSE (Root Mean Square Error)
  * RMSE represents the square root of the mean squared error and measures the magnitude of the error between predicted and actual values.
  * It is expressed in the same units as the target variable, making it easy to interpret. A smaller value means higher prediction accuracy.
  * It takes values of 0 or greater, and is 0 for perfect prediction.

* MAE (Mean Absolute Error)
  * MAE represents the mean absolute error and indicates the average of the absolute differences between predicted and actual values.
  * It is expressed in the same units as the target variable, and a smaller value means higher prediction accuracy.
  * It takes values of 0 or greater, and is 0 for perfect prediction.

* MAPE (Mean Absolute Percentage Error)
  * MAPE represents the mean absolute percentage error, which is the average of the absolute values of the differences between predicted and actual values divided by the actual values, expressed as a percentage.
  * Values are 0% or greater, and a value closer to 0% means higher prediction accuracy.
  * Generally, it is often interpreted as high accuracy below 10%, good between 10-20%, and needs improvement above 20%.
  * It is often used to compare prediction accuracy across different groups.

* MASE (Mean Absolute Scaled Error)
  * MASE represents the Mean Absolute Scaled Error, which is the prediction error divided by the error of a baseline forecast (usually a naive forecast).
  * A value less than 1 means the proposed model is better than the baseline, and a value greater than or equal to 1 means it is worse than the baseline.
  * It is particularly useful for seasonal data and is suitable for comparing prediction performance across different time series data.
  * Since it is scale-independent, it is possible to compare datasets with different units.

* R-squared
  * R-squared indicates the proportion of the variability in the target variable that is explained by this model.
  * Values are generally between 0 and 1, where 1 means the model can perfectly predict the values of the target variable.
  * In time series forecasting, it serves as an indicator of how well the trend and seasonality patterns are captured.
  * Generally, R-squared values are often interpreted as very high above 0.8, high between 0.6 and 0.8, medium between 0.4 and 0.6, low between 0.2 and 0.4, and very low model fit below 0.2.

<% } %>
{end_show_hide}

## Predicted Data

<% if (!test_mode) { %>
The following table shows the prediction results added to the original data.
<% } else { %>
The following table shows the results of predicting on the training and test data using the created prediction model.
<% } %>

{start_lazy_show_hide}
### Data
{{data}}
{end_lazy_show_hide}

# Appendix

## Next Steps

* Optimizing the prediction period: Focusing on shorter-term predictions may improve prediction accuracy.
* When making predictions with Prophet, there are data-related considerations such as handling anomalies (outliers), the required data period, setting holiday effects, and future data for external regressors. For information on these issues and their solutions, please refer to [this note](https://exploratory.io/note/exploratory/Prophet-kEu1dMb1).
<% if (!test_mode) { %>
* Model evaluation: To more rigorously evaluate the prediction performance of this model, you can validate it by splitting the data into training and test sets. In that case, set "Test Mode" under the "Validation" section in [Settings](//analytics/settings/test_mode) to TRUE and re-run.
<% } %>

`;

module.exports = template; 
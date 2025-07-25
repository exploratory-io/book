const template = `


<% if (!test_mode) { %>
A model to predict <%= target %> has been created. We are forecasting up to <%= test_period %><%= unit %> ahead, and this forecast period can be changed from "Forecast Period" in [Settings](//analytics/settings/test_period).
<% } else { %>
A model to predict <%= target %> has been created. Since we are currently in test mode, the model was built using data up to <%= test_period %><%= unit %> before the end of the data, and predictions are made for the subsequent period (test period). The test period can be changed from the "Test Data Period" section in [Settings](//analytics/settings/test_period) of Analytics.
<% } %>

# Forecast Results

<% if (!test_mode) { %>
The following is a visualization of actual values (blue line) and values predicted by the model (orange line) using a line chart.
<% } else { %>
The following is a visualization of training data (blue line) and values predicted by the model (orange line) using a line chart. Since we are currently in test mode, the test data period is visualized with a light blue line.
<% } %>

{{forecast_chart}}

# Time Series Component Analysis

## Seasonality in Time Series Data

The following graph shows seasonal patterns contained in the data. This represents variations that repeat at regular intervals.

{{seasonality}}

## Trend in Time Series Data

The following chart visualizes the long-term trend of <%= target %>. This graph includes the following elements:

- The blue line shows the progression of actual values of <%= target %>.
- The green line represents the trend after removing seasonality and irregular variations from the actual values. This allows you to understand the slope of the <%= target %> trend. The slope of this trend changes according to trend change points.
- The red bars are trend change points, representing times when the movement of <%= target %> changed significantly.

{{trend_chart}}

## Stationarity of Time Series Data

The following chart shows the results of residual analysis using the KPSS test. You can see how much the data varies around the mean value of 0.

{{stationarity}}

Stationary data refers to data where the following characteristics remain constant over time, and this is an important prerequisite for properly applying ARIMA/SARIMA models:

* Constant mean (no trend)
* Constant variance (the way data varies does not change by time period)
* Autocorrelation depends only on time lag (no cyclical patterns such as seasonality)

## Autocorrelation

The following chart allows you to examine the autocorrelation function (ACF) of the time series data.

{{autocorrelation}}

Autocorrelation indicates the strength of the relationship between current values and past values in time series data.

The horizontal axis (X-axis) of the graph is called "lag" and represents how many days back in the data the relationship is being examined. The vertical axis (Y-axis) is the correlation coefficient, which takes values between -1 and 1. Values closer to 0 indicate a weaker relationship, while values closer to ±1 indicate a stronger relationship.

## Partial Autocorrelation

The following chart allows you to examine the partial autocorrelation function (PACF) of the time series data.

{{partial_autocorrelation}}

Partial autocorrelation indicates the strength of the direct relationship between current values and past values in time series data, after excluding the effects of intermediate values.

The horizontal axis (X-axis) of the graph is "lag," representing how many days back in the data the relationship is being examined. The vertical axis (Y-axis) is the correlation coefficient, which takes values between -1 and 1. Values closer to 0 indicate a weaker relationship, while values closer to ±1 indicate a stronger relationship.


# Forecast Accuracy

<% if (!test_mode) { %>
Various metrics related to the model's forecast accuracy for training data are summarized in the table below.
<% } else { %>
Since we are currently in test mode, various metrics related to the model's forecast accuracy for test data are summarized in the table below.
<% } %>

{{summary}}

<% if (!repeat_by) { %>

The main evaluation metrics are as follows:

* RMSE (Root Mean Square Error): The average difference between the predicted and actual values is about <%= rmse %>. The smaller the value, the higher the forecast accuracy.
* MAE (Mean Absolute Error): The average absolute difference between the predicted and actual values is about <%= mae %>. The smaller the value, the higher the forecast accuracy.
* MAPE (Mean Absolute Percentage Error): The average absolute difference between the predicted and actual values is about <%= mape_pct %>% of the actual values. The smaller the value, the higher the forecast accuracy.
* R-squared: This model explains <%= r_squared_pct %>% of the variance in <%= target %>.

## Model Diagnostics

The Ljung-Box test was performed to evaluate the validity of the ARIMA model. The null hypothesis of this test is "no autocorrelation in the residuals," meaning the model has adequately captured the structure of the time series data. If the p-value is higher than the significance level of <%= baseline_p_pct %>%, it suggests that there is no significant autocorrelation in the residuals and the model has adequately captured the structure of the time series. Conversely, if the p-value is lower than <%= baseline_p_pct %>%, there may still be autocorrelation in the residuals, and it may be necessary to adjust the model parameters or consider a different model structure.

<% } %>

{start_show_hide}
<% if (!test_mode) { %>
## Explanation of Model Metrics

* RMSE
 * RMSE (Root Mean Square Error) measures the magnitude of the error between predicted and actual values.
 * It is expressed in the same units as the target variable, making it easy to interpret. The smaller the value, the higher the forecast accuracy.
 * The value is always 0 or greater, and a perfect prediction would have a value of 0.

* MAE
 * MAE (Mean Absolute Error) is the average of the absolute errors between predicted and actual values.
 * It is expressed in the same units as the target variable, and the smaller the value, the higher the forecast accuracy.
 * Compared to RMSE, MAE is less sensitive to outliers.

* MAPE (Ratio)
 * MAPE (Mean Absolute Percentage Error) expresses the relative error of the forecast as a percentage.
 * The smaller the value, the higher the forecast accuracy. Generally, a value below 10% is considered a good forecast.
 * Note that if the actual value is 0 or very small, the value can become extremely large.

* R-squared
 * R-squared (coefficient of determination) indicates the explanatory power of the model, representing the proportion of variance in the data explained by the model.
 * The value is usually between 0 and 1, and the closer to 1, the better the model fit.
 * In time series models, the value can be artificially high for trending data, so interpretation requires caution.

* AIC
 * AIC (Akaike Information Criterion) is an indicator that evaluates the balance between model complexity and goodness of fit.
 * The smaller the value, the better the model, and it helps select the optimal model while avoiding overfitting.
 * It is especially useful for comparing different ARIMA/SARIMA models.

* BIC
 * BIC (Bayesian Information Criterion) is also an indicator for model selection, but it penalizes the number of parameters more strictly than AIC.
 * It tends to select simpler models than AIC, and the smaller the value, the better the model.
 * Useful for analyses with large sample sizes or when the true model is considered relatively simple.

* AICc
 * AICc (corrected AIC) is a variant of AIC that corrects for bias in small sample sizes.
 * It allows for reliable model selection even with small sample sizes.
 * As the sample size increases, it approaches AIC.

* p, d, q
 * Parameters of the ARIMA model: p (order of autoregressive terms), d (order of differencing), q (order of moving average terms).
 * p indicates how much past values affect the current value, q indicates how much past forecast errors affect the current value.
 * d indicates the number of differences needed to make the data stationary.

* P, D, Q
 * Parameters of the seasonal component of the SARIMA model: P (order of seasonal autoregressive terms), D (order of seasonal differencing), Q (order of seasonal moving average terms).
 * These have similar meanings to p, d, and q, but capture relationships for each seasonal period.

* Period
 * Indicates the period of the seasonal component. For example, 12 for monthly data, 4 for quarterly data, 7 for weekly data, etc.
 * Important parameter when considering seasonality in SARIMA models.

* Ljung-Box Statistic
 * A statistic to test whether there is autocorrelation in the model residuals (forecast errors).
 * The larger the value, the more likely there is autocorrelation remaining in the residuals.

* Ljung-Box Test p-value
 * The p-value based on the Ljung-Box statistic. Usually, if it is 0.05 or higher, it is judged that there is no significant autocorrelation in the residuals.
 * If the p-value is small, the model may not have adequately captured the structure of the time series.

* Number of Rows
 * Indicates the total number of data points (sample size) used in the analysis.
 * In time series models, having enough data is important for accurate forecasts.

<% } else { %>

## Model Diagnostics

The Ljung-Box test was performed to evaluate the validity of the ARIMA model. The null hypothesis of this test is "no autocorrelation in the residuals," meaning the model has adequately captured the structure of the time series data. If the p-value is higher than the significance level of <%= baseline_p_pct %>%, it suggests that there is no significant autocorrelation in the residuals and the model has adequately captured the structure of the time series. Conversely, if the p-value is lower than <%= baseline_p_pct %>%, there may still be autocorrelation in the residuals, and it may be necessary to adjust the model parameters or consider a different model structure.

## Explanation of Model Metrics

* RMSE
 * RMSE (Root Mean Square Error) measures the magnitude of error between predicted and actual values.
 * It is expressed in the same units as the target variable, making it easy to interpret, and smaller values indicate higher forecast accuracy.
 * It takes values of 0 or greater, and would be 0 for perfect prediction.

* MAE
 * MAE (Mean Absolute Error) represents the mean of absolute errors between predicted and actual values.
 * It is expressed in the same units as the target variable, and smaller values indicate higher forecast accuracy.
 * It has the characteristic of being less affected by outliers compared to RMSE.

* MAPE (Ratio)
 * MAPE (Mean Absolute Percentage Error) expresses the relative error of prediction as a percentage.
 * Smaller values indicate higher forecast accuracy, and generally less than 10% is considered good forecasting.
 * Caution is needed as values can become extremely large when actual values are 0 or very small.

* R-squared
 * R-squared (coefficient of determination) indicates the explanatory power of the model and represents the proportion of data variation that can be explained by the model.
 * Values are usually between 0 and 1, with values closer to 1 indicating higher model fit.
 * In time series models, caution is needed in interpretation as it can become artificially high with trending data.

* AIC
 * AIC (Akaike Information Criterion) is a metric that evaluates the balance between model complexity and fit.
 * Smaller values indicate better models and help select optimal models while preventing overfitting.
 * It is particularly useful when comparing different ARIMA/SARIMA models.

* BIC
 * BIC (Bayesian Information Criterion) is a metric for model selection similar to AIC, but with stricter penalties for the number of parameters.
 * It tends to select simpler models than AIC, with smaller values indicating better models.
 * It is useful for analysis with large sample sizes or when the true model is thought to be relatively simple.

* AICc
 * AICc (corrected AIC) is a variant of AIC that corrects for bias in small sample sizes.
 * It enables reliable model selection even with small sample sizes.
 * It approaches AIC as sample size increases.

* p, d, q
 * These are parameters of the ARIMA model, where p (order of autoregressive terms), d (order of differencing), and q (order of moving average terms).
 * p indicates how much past values influence current values, and q indicates how much past forecast errors influence.
 * d indicates the number of differencing operations needed to make the data stationary.

* P, D, Q
 * These are seasonal component parameters of the SARIMA model, where P (order of seasonal autoregressive terms), D (order of seasonal differencing), and Q (order of seasonal moving average terms).
 * These have the same meaning as p, q, and d but capture relationships for each seasonal cycle.

* Period
 * Represents the period of seasonal components, for example, 12 for monthly data, 4 for quarterly data, 7 for weekly data.
 * This is an important parameter when considering seasonality in SARIMA models.

* Ljung-Box Statistic
 * A statistic that tests whether there is autocorrelation in model residuals (forecast errors).
 * Larger values indicate a higher possibility that autocorrelation remains in the residuals.

* Ljung-Box Test P-value
 * P-value based on the Ljung-Box statistic, usually 0.05 or higher indicates no significant autocorrelation in residuals.
 * If the P-value is small, the model may not sufficiently capture the time series structure.

* Number of Rows
 * Indicates the total number of data (sample size) used in the analysis.
 * For time series models, having sufficient data volume is important for high-accuracy forecasting.
 
 <% } %>
{end_show_hide}


## Forecast Data

<% if (!test_mode) { %>
The following table shows the forecast results added to the original data.
<% } else { %>
The following table shows the results of dividing the original data into training and test data and adding predictions.
<% } %>

{start_lazy_show_hide}
### Data
{{data}}
{end_lazy_show_hide}

# Appendix

## Residual Analysis

The following is a line chart visualization of the residuals (errors between predicted and actual values) of the forecast model. In a good model, residuals are expected to be random with stable variance.

{start_lazy_show_hide}
### Chart
{{residuals}}
{end_lazy_show_hide}

## Autocorrelation of Residuals

The following is a bar chart visualization of the autocorrelation function (ACF) of the model residuals.

{start_lazy_show_hide}
### Chart
{{residual_autocorrelation}}
{end_lazy_show_hide}

## Partial Autocorrelation of Residuals

The following is a bar chart visualization of the partial autocorrelation function (PACF) of the model residuals.

{start_lazy_show_hide}
### Chart
{{residual_partial_autocorrelation}}
{end_lazy_show_hide}

# Next Steps

* Forecast Period Optimization: Focusing on shorter-term forecasts may improve forecast accuracy.
* Comparison with Other Models: Comparing different parameter settings for ARIMA/SARIMA models or other time series models like Prophet may help find more appropriate models.
<% if (!test_mode) { %>
* Model Evaluation: To more rigorously evaluate the forecast performance of this model, you can validate by splitting into training and test data. In that case, set "Test Mode" to TRUE in the "Evaluation" section under [Settings](//analytics/settings/test_mode) and re-run.
<% } %>
`;

module.exports = template; 
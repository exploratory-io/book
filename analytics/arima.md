# Time Series Forecasting (ARIMA)

Builds ARIMA time series forecasting model and makes forecast.

# Input Data

Input data should be a time series data. Each row should represent one observation with date/time. It should have the following columns.

  * Date/Time Column - A Date or POSIXct column to indicate when the observations were made.
  * Value Column - A Numeric column that stores observed values.

## Properties
  * Forecasting
    * Forecasting Time Period - Length of periods (e.g. days, months, years...) to forecast.
    * Prediction Interval - Controls the width of the displayed prediction interval. The default is 0.8. Probability which is covered by the prediction interval.
  * Model Parameters - Basic
    * Select Parameters Automatically
    * Criterion for Parameter Selection
      * AIC
      * AICC
      * BIC
    * AR Process (p)
    * Integration (d)
    * MA Process (q)
  * Model Parameters - Seasonal
    * Model with Seasonality
    * Seasonal Period
    * Select Parameters Automatically
    * AR Process (P)
    * Integration (D)
    * MA Process (Q)
  * Stationarity
    * Unit Root Test
      * KPSS
      * ADF
      * PP
  * Data Preprocessing
    * Missing Value Handling for Value - How to fill missing values after aggregation of data. There are following options. The default is No Fill.
      * Fill with Previous Value
      * Fill with Zero
      * Linear Interpolation
      * Spline Interpolation
  * Evaluation
    * Test Mode - When this option is set to TRUE, the last part of the input data for the period specified by "Forecasting Time Period" is not used for training data, and kept to test predictive performance of the model.
    * Time Period for Test Data - Length of periods (e.g. days, months, years...) at the end of the data to be kept as test data.

# How to Use This Feature

1. Under Analytics view, select "Time Series Forecasting (ARIMA)" for Analytics Type.
2. Select a column for Date and select an appropriate scale (e.g. Floor to Week).
3. (Optional) Select a column and aggregate function for Y Axis. The default is Number of Rows.
4. (Optional) Select a column to group subjects with "Repeat By" column selector. For each group, a separate small chart will be displayed.
5. Click Run button to run the analytics.
6. Select each view type (explained below) see the detail of the analysis.

## "Summary" View in Test Mode

There are several metrics to help you evaluate the forecasting model's performance. They are presented under "Summary" tab.

* RMSE (Root Mean Square Error) : Root of mean of squares of difference between actual value and forecasted value.
* MAE (Mean Absolute Error) : Mean of absolute differences between actual value and forecasted value.
* MAPE (Mean Absolute Percentage Error) : Mean of absolute differences in percentage of actual value.
* MASE (Mean Absolute Scaled Error)

## "Forecasted" View

"Forecasted" View displays how the future values look like. with a line chart. Blue line is for actual values and orange line is for forecasted values. Orange band shows uncertainty interval.

## "Seasonality" View

"Seasonality" View displays seasonality component of the data extracted by STL (Seasonal and Trend decomposition using Loess).

## "Trend" View

"Trend" View displays trend component of the data extracted by STL (Seasonal and Trend decomposition using Loess).

## "Stationarity" View

"Stationarity" View displays line chart that shows the data after differencing d times. One of the assumption for ARIMA model is that this data is stationary. Statistical test result for the stationarity of this data is displayed in the hover popup on the line.

## "ACF" View

"ACF" View shows autocorrelation of the data after differencing d times.

## "Partial ACF" View

"Partial ACF" View shows partial autocorrelation of the data after differencing d times.

## "Residuals" View

"Residuals" View shows the residual of the forecast by the model.

## "Residual ACF" View

"Residual ACF" View shows autocorrelation of the residual data of the forecast by the model.

## "Residual PACF" View

"Residual PACF" View shows partial autocorrelation of the residual data of the forecast by the model.

## "Data" View

"Data" View shows a table with both past data and forecasted data.

# Evaluation of Forecasting Models

You can enable 'Test Mode' to evaluate the forecasting model. This will split the data into Training and Test periods, build a model based on the training data and evaluate the forecasted values against the test data.

You can enable it from the property.

Take a look at [this note](https://blog.exploratory.io/a-gentle-introduction-to-backtesting-for-evaluating-the-prophet-forecasting-models-66c132adc37c) for more details on how the evaluation method works.

## "Forecasted" View in Test Mode

The dark blue line is the actual data in the training period, and the light blue line is the actual data in the test period. You can compare the orange line with the light blue line to see how close the forecasted values are against the actual values.

## R Package

Time Series Forecasting view uses the [fable](https://cran.rstudio.com/web/packages/fable/index.html) R Package under the hood.

## Exploratory R Package

For details about `fable` usage in Exploratory R Package, please refer to the [github repository](https://github.com/exploratory-io/exploratory_func/blob/master/R/arima.R)

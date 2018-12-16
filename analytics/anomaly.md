# Anomaly Detection

With algorithm "Seasonal Hybrid ESD (S-H-ESD)", created by Twitter, it detects anomaly in the presence of seasonality and an underlying trend

## Input Data
Input data should be a time series data. Each row should represent one observation with date/time. It should have following columns.

  * Date/Time Column - A Date or POSIXct column when the observation was made.
    * When data type is Date, data is aggregated (e.g. summed, averaged, etc.) for each day.
    * When data type is POSIXct, level of aggregation can be day, hour, minute, or second.
  * Value Column - Column that stores observed values.

## Analytics Properties
  * How to Fill NA - This algorithm requires NAs to be filled. The default is Fill with Previous Value. This can be...
    * Fill with Previous Value
    * Fill with Zero
    * Linear Interpolation 
    * Spline Interpolation 
  * Direction of Anomaly - Direction of anomaly. The default is Positive and Negative. This can be...
    * Positive and Negative - Both positive and negative direction.
    * Positive - Only positive direction.
    * Negative - Only negative direction.
  * Max Anomaly Ratio - The default is 0.1. The maximum ratio of anomaly data compared to the number of total data.
  * Alpha (Sensitivity to Anomaly Data) - The default is 0.05. The larger the value, the more anomaly data are captured.
  * Report Only Last Values within - The default is NULL. Find only last anomalies within a day or hour. This can be
    * Reporting All Anomaly - Find all anomalies.
    * Day - Find last anomalies within a day.
    * Hour - Find last anomalies within an hour.
  * Threshold of Positive Anomaly - The default is 'None'. If this is specified, only positive anomalies above the threshold are reported. This can be
    * No Threshold - No threshold.
    * 95th Percentile - 95th percentile of the daily max values.
    * 99th Percentile - 99th percentile of the daily max values.
    * Median of Max - Median of daily max values.
  * Piecewise Median Time Window (Weeks) - The default is 2. The size of piecewise median time window (span of seasons). The unit is weeks.


## How to Use This Feature
1. Click Analytics View tab.
2. If necessary, click "+" button on the left of existing Analytics tabs, to create a new Analytics.
3. Select "Anomaly Detection" for Analytics Type.
4. Select Date column and associated Round Function for Date/Time Column.
5. (Optional) Select Numeric column and aggregate function for Value Column.
6. (Optional) Select a column to group subjects with "Repeat By" column selector. For each group, a separate small chart will be displayed.
10. Click Run button to run the analytics.
11. Select view type (explained below) by clicking view type link to see each type of generated visualization.

### "Chart with Anomalies" View
"Chart with Anomalies" View displays a time series chart with anomalies as colored points. You can see orange points as positive anomalies and green points as negative anomalies on the chart. 

![](images/chart-with-anomaly.png)

### "Anomaly Data" View
"Anomaly Data" View displays actual anomaly values in table format. You can check if the anomaly is for positive (or negative), value of positive (or negative) anomaly and expected value.

![](images/anomaly-data.png)

## R Package

The `Anomaly Detection` uses [`AnomalyDetection`](https://github.com/twitter/AnomalyDetection) R Package under the hood.

## Exploratory R Package

For details about AnomalyDetection usage in Exploratory R Package, please refer to the [github repository](https://github.com/exploratory-io/exploratory_func/blob/master/R/anomaly_detection.R)

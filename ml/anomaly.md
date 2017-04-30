# Anomaly Detection

## Introduction

It detects anomaly in time series data frame. It employs an algorithm referred to as Seasonal Hybrid ESD (S-H-ESD), which can detect both global as well as local anomalies in the time series data by taking seasonality and trend into account. It’s built by a team at Twitter for their use on monitoring their traffics

### Underlying R Package

* [AnomalyDetection](https://github.com/twitter/AnomalyDetection)


## How to use? 

### How to Access

![](images/anomaly1.png)

### Column Selection


### Parameters

* direction (Optional) - The default is "both". Direction of anomaly. This can be
  * "both" - Both positive and negative direction.
  * "pos" - Only positive direction.
  * "neg" - Only negative direction.
* e_value (Optional) - The default is TRUE. Whether expected_values should be returned.
* max_anoms (Optional) - The default is 0.1. The maximum ratio of anomaly data compared to the number of total data.
* alpha (Optional) - The default is 0.05. The larger the value, the more anomaly data are captured.
* only_last (Optional) - The default is NULL.　Find only last anomalies within a day or hour. This can be
  * NULL - Find all anomarlies.
  * "day" - Find last anomalies within a day.
  * "hr" - Find last anomalies within an hour.
* threshold (Optional) - The default is 'None'. If this is specified, only positive anomalies above the threshold are reported. This can be
  * 'None' - No threshold.
  * 'med_max' - Median of daily max values.
  * 'p95' - 95th percentile of the daily max values.
  * 'p99' - 99th percentile of the daily max values.
* longterm (Optional) - The default is FALSE. This should be TRUE if the time span is longer than a month.
* piecewise_median_period_weeks (Optional) - The default is 2. The size of piecewise median time window (span of seasons). The unit is weeks.

## Step-by-Step Tutorial with Access Log data.

* [
Introduction to Anomaly Detection in R with Exploratory](https://blog.exploratory.io/introduction-to-anomaly-detection-in-r-with-exploratory-a0507d40385d)

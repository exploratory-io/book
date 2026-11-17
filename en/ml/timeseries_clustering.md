# Time Series Clustering

Clusters multiple time series data into groups.

# Input Data

Input data should be a time series data with category. Each row should represent one observation with date/time. It may have multiple rows for a date/time, in which case the rows are internally aggregated into one row for the date/time. It should have the following columns.

  * Group - A categorical (character or factor) column. The categories specified here are clustered into groups.
  * Date/Time - A Date or POSIXct column to indicate when the observations took place.
  * Value (Optional) - A column that stores observed values. Values for multiple rows for one date/time for a category are internally aggregated into one value by the specified aggregation function to form a time series for the category to be clustered. If not specified, the number of rows for each date/time is used as the time series to cluster.
  * Other Columns to Keep (Optional) - Other columns for values to keep in the output data. Values for multiple rows for one date/time for a category are internally aggregated into one value by the specified aggregation function, to be put together in the output.

# Parameters

  * Number of Clusters - The number of clusters to group the time series data into.
  * Cluster Center Method - Method to calculate cluster center time series (centroid) for each iteration.
    * Mean
    * Median
    * Shape Averaging
    * DTW Barycenter Averaging
    * Soft DTW Centroids
    * Partition around Medoids
  * Include Cluster Center Data - If set to TRUE, the output data includes the calculated cluster center time series data (centroid) for each cluster.
  * Distance Method - Method to calculate distance between the cluster center time series (centroid) and each time series for each iteration.
    * DTW
    * DTW with L2 Norm
    * DTW Basic
    * DTW Guided by Lemire's Lower Bound
    * Keogh's Lower Bound for DTW
    * Lemire's Lower Bound for DTW
    * Shape-Based Distance
    * Global Alignment Kernels
    * Soft-DTW
  * NA Fill Type - How to fill NAs that appear between the first and last non-NA value in a time series.
    * Fill with Previous Non-NA Value
    * Fill with 0
    * Linear Interpolation
    * Spline Interpolation
  * NA Fill Type - Beginning - How to fill NAs that appear before the first non-NA value in a time series.
    * Fill with 0
    * Fill with First Non-NA Value
  * NA Fill Type - Ending - How to fill NAs that appear after the last non-NA value in a time series.
    * Fill with 0
    * Fill with Last Non-NA Value
  * Remove Groups When NA Ratio Is Greater Than - If the time series data for a category has more NAs than this ratio, the category is removed from the data before the clustering is performed.
  * Normalize Value - Whether to normalize the aggregated values or not.
  * Random Seed - Random seed set before the clustering, so that the results are constant when the same calculations are repeated.

## R Package

Time Series Clustering Step uses the [dtwclust](https://cran.r-project.org/web/packages/dtwclust/index.html) R Package under the hood.

## Exploratory R Package

For details about `dtwclust` usage in Exploratory R Package, please refer to the [github repository](https://github.com/exploratory-io/exploratory_func/blob/master/R/ts_cluster.R)

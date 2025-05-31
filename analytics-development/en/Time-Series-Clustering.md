const template = `
# Analysis Results

We classified <%= group %> into <%= number_of_clusters %> clusters (groups) using time series data of <%= value %>.

{{summary_chart}}

# Key Statistical Indicators

* Cluster ID
  * Cluster ID is a unique identifier that indicates which group each <%= group %> belongs to.
  * It is automatically assigned based on the shape and trend of time series, but the ID value itself has no meaning.

* Number of Groups
  * Shows the number of <%= group %> included in each cluster.
  * If there is a large imbalance in the number of <%= group %> between clusters, adjustment of cluster numbers or verification of outliers may be necessary.

* Number of Groups (Ratio)
  * The proportion of <%= group %> in each cluster relative to the total <%= group %>.
  * Expressed as values from 0 to 1, and the total equals 1 (i.e., 100%).

* Within-cluster Distance
  * A quantified measure of the similarity between <%= group %> within the same cluster.
  * Smaller values indicate that the time series patterns within the cluster are more similar.
  * By comparing distance values between clusters, you can determine which cluster is most homogeneous and which cluster contains diverse patterns.


## Normalized Time Series Patterns

The following chart displays <%= value %> for each <%= group %> normalized (converted to mean 0, standard deviation 1). Normalization eliminates differences in value magnitude and allows focus on patterns of change only. This enables comparison of change rates and change shapes between groups with large <%= value %> and groups with small <%= value %> on the same scale, making pattern similarities clearer.

{{normalized_time_series}}

## Time Series Patterns

The following chart visualizes the progression of actual values of <%= value %> for each <%= group %> by cluster. Each line represents one <%= group %>, with the Y-axis showing actual values and the X-axis showing date/time. You can visually confirm what actual value ranges and variations each cluster represents.

{{time_series}}

## Cluster Center Patterns

The following chart displays the "representative pattern" of each cluster as a red line. This center line represents the average time series data of <%= group %> within the cluster and helps understand the characteristics of that cluster.

{{cluster_centers}}

## Cluster Member Composition

The following table shows which cluster each group belongs to in tabular format. It helps intuitively understand which cluster each <%= group %> belongs to.

{{cluster_members}}

# Additional Information

## Data Validity Verification

The following table shows whether there is sufficient data for each <%= group %> used in the analysis.

Green dots indicate sufficient data, and periods with missing or insufficient data are shown in gray. This information allows evaluation of the reliability of analysis results and data quality for specific periods.

{start_lazy_show_hide}
### Chart
{{data_confirmation}}
{end_lazy_show_hide}

## Time Series Data

The following table shows aggregated data of <%= value %> for each <%= group %> and the results of time series clustering. The table includes aggregated values for each time point by <%= group %>, normalized values, and cluster IDs.

{start_lazy_show_hide}
### Chart
{{data}}
{end_lazy_show_hide}

# Next Steps

* Cluster number optimization: Consider whether the current number of clusters is appropriate and re-run the analysis with different cluster numbers if necessary. Fewer clusters capture general trends, while more clusters capture more detailed patterns.
* Time range adjustment: By focusing on different periods, you can analyze the impact of specific events or seasonality in more detail. For example, by comparing clustering results using only recent data versus clustering using long-term data, you can understand pattern changes.
* Regular re-analysis: Patterns may change over time. By regularly re-running clustering, you can detect new trends and changes early.

`;
module.exports = template; 
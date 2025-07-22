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

<% if (normalize) { %>
## Normalized Time Series Patterns

The following chart displays <%= value %> for each <%= group %> normalized (converted to mean 0, standard deviation 1). Normalization eliminates differences in value magnitude and allows focus on patterns of change only. This enables comparison of change rates and change shapes between groups with large <%= value %> and groups with small <%= value %> on the same scale, making pattern similarities clearer.

{{normalized_time_series}}

<% } %>

## Time Series Patterns

The following chart visualizes the progression of actual values of <%= value %> for each <%= group %> by cluster. Each line represents one <%= group %>, with the Y-axis showing actual values and the X-axis showing date/time. You can visually confirm what actual value ranges and variations each cluster represents.

{{time_series}}

## Cluster Center Patterns

The following chart displays the "representative pattern" of each cluster as a red line. This center line represents the average time series data of <%= group %> within the cluster and helps understand the characteristics of that cluster.

{{cluster_centers}}

## Cluster Member Composition

The following table shows which cluster each group belongs to in tabular format. It helps intuitively understand which cluster each <%= group %> belongs to.

{{cluster_members}}

# Appendix

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

<% if (elbow_method_mode) { %>

# Optimal Number of Clusters

The Elbow method can be used as one visual technique for choosing the "optimal number of clusters (K)" in K-Means clustering.

Mechanism:

1. Perform K-Means clustering while varying the number of clusters from 1 to 10.
2. Calculate the sum of squared differences within clusters (within-cluster sum of squares) for each number of clusters.
3. Visualize the number of clusters on the horizontal axis and the within-cluster variability on the vertical axis using a line chart.
4. The "elbow" point, where the graph shape decreases sharply and then becomes gradual, is an indication of the optimal number of clusters.

If not needed, this can be disabled from [Settings](//analytics/settings). The maximum number of clusters can also be changed.

For more details on the Elbow method, please refer to [this note](https://exploratory.io/note/exploratory/K-Means-QRV2jAz0#%E3%82%A8%E3%83%AB%E3%83%9C%E3%83%BC%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89%E3%81%AB%E3%82%88%E3%82%8B%E3%82%AF%E3%83%A9%E3%82%B9%E3%82%BF%E3%83%BC%E6%95%B0%E3%81%AE%E6%B1%BA%E5%AE%9A) (Note: This link points to a Japanese section in the note, ideally it would point to an English section or the note in English).

## Elbow Curve

The following chart visualizes the within-cluster sum of squares for each number of clusters using a line called the Elbow curve, based on the Elbow method.

{{elbow}}

When the number of clusters is small, the variability of data within clusters is large, so the variability decreases significantly as the number of clusters increases up to a certain point. However, after a certain point, the amount of decrease in variability gradually becomes smaller. This "boundary between sharp decrease and gradual change (Elbow)" serves as a guideline for the "optimal number of clusters". However, in reality, it is also important whether the characteristics of each cluster are easy to understand and useful after dividing into a certain number of clusters, so please use this only as a reference.

## Degree of Variability Reduction

In the Elbow curve chart, it may not be visually clear where the "Elbow" is. In such cases, you can compare the numerical values of the degree of descent of the Elbow curve (the degree of reduction in the variability of data within clusters), and the point where the value becomes constant can be used as a guideline for the "optimal number of clusters".

{{elbow_diff}}

<% } %>


# Next Steps

* Cluster number optimization: Consider whether the current number of clusters is appropriate and re-run the analysis with different cluster numbers if necessary. Fewer clusters capture general trends, while more clusters capture more detailed patterns.
* Time range adjustment: By focusing on different periods, you can analyze the impact of specific events or seasonality in more detail. For example, by comparing clustering results using only recent data versus clustering using long-term data, you can understand pattern changes.
* Regular re-analysis: Patterns may change over time. By regularly re-running clustering, you can detect new trends and changes early.

`;
module.exports = template; 
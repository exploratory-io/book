const template = `

# Summary

The data was grouped into <%= cluster_number %> clusters based on the selected variables. Each row is assigned to the cluster whose center is closest to that row.

You can change the number of clusters from [Settings](//analytics/settings/cluster_number).

<% if (normalize) { %>
The following table summarizes each cluster by its size, compactness, separation quality, and average normalized values of the variables used for clustering.
<% } else { %>
The following table summarizes each cluster by its size, compactness, separation quality, and average values of the variables used for clustering.
<% } %>

{{summary}}

* A higher average Silhouette score suggests that observations are closer to their assigned cluster than to neighboring clusters.
* A high percentage of negative Silhouette scores suggests that many observations may fit another cluster better than their assigned cluster.
* Excluded Rows shows how many rows were excluded because one or more selected variables had missing values. If many rows were excluded, consider reviewing the selected variables or handling missing values before running clustering again.

A useful clustering result should have clusters that are not only reasonably separated, but also easy to explain and meaningful for your analysis.

<% if (use_silhouette_method) { %>

# Choosing Number of Clusters

You can use the information from the Silhouette Method to help identify candidate values for the number of clusters. The Silhouette Method evaluates how well each data point fits its assigned cluster compared to neighboring clusters.

## Silhouette Scores

A higher average Silhouette score generally indicates better separation between clusters. Therefore, the number of clusters with the highest average Silhouette score, or a value close to it, is often a strong candidate.

However, when deciding the number of clusters, it is important not to rely only on the average Silhouette score. You should also check the percentage of negative Silhouette scores and whether the resulting clusters are meaningful and interpretable.

{{silhouette}}

* Average Silhouette - Indicates how well observations fit their assigned cluster compared to neighboring clusters. Higher values indicate clearer separation between clusters.
* Minimum Silhouette - Shows the lowest Silhouette score within each cluster. A strongly negative value may indicate outliers or observations that are not well assigned to their cluster.
* % Negative - Shows the percentage of observations with negative Silhouette scores. A higher value suggests that some observations may fit another cluster better than their assigned cluster.

To use the “Elbow Method” instead, or to hide this section, you can change the setting from [Settings](//analytics/settings/elbow_method).

<% } %>

<% if (use_elbow_method) { %>

# Choosing Number of Clusters

You can use the information from the Elbow Method to help identify candidate values for the number of clusters. The Elbow Method looks for the point where the decrease in within-cluster variation starts to become smaller as the number of clusters increases. This point often appears like an “elbow” in the curve and can be used as a candidate for the number of clusters.

To use the “Silhouette Method” instead, or to hide this section, you can change the setting from [Settings](//analytics/settings/elbow_method).

## Elbow Curve

The following chart visualizes the within-cluster sum of squares for each number of clusters. The within-cluster sum of squares measures how far each data point is from the center of its assigned cluster. A smaller value indicates less variation within clusters.

{{elbow}}

When the number of clusters is small, the variation within clusters tends to be large. Therefore, increasing the number of clusters often reduces the variation substantially at first. However, after a certain point, adding more clusters produces only smaller improvements.

The point where the curve changes from a steep decrease to a more gradual decrease is called the “elbow,” and it can be used as a guideline for choosing the number of clusters.

However, the Elbow Method should be used only as one piece of evidence. In practice, it is also important to check whether the resulting clusters are easy to understand and useful for analysis or decision making.

## Reduction in Variation

In some cases, it may be difficult to visually identify the “elbow” from the Elbow Curve. In such cases, you can compare how much the within-cluster variation decreases when the number of clusters is increased.

{{elbow_diff}}

When the reduction in variation is large, increasing the number of clusters is still providing a meaningful improvement. When the reduction becomes small and the change becomes more gradual, adding more clusters may provide only limited improvement.

<% } %>


# Cluster Profile

Use the cluster profile charts to understand what makes each cluster different. The goal is to find patterns that are easy to explain and useful for your analysis.

## Variable Averages by Cluster

<% if (normalize) { %>
The following radar chart shows how each cluster differs based on the average normalized values of the variables used for clustering.
<% } else { %>
The following radar chart shows how each cluster differs based on the average values of the variables used for clustering.
<% } %>

{{radar}}

<% if (normalize) { %>
The values are normalized. A value of 0 represents the overall average. Positive values are above average, and negative values are below average.
<% } else { %>
Because the variables may use different units and scales, larger-looking values do not always mean more important differences. For comparing variables fairly, consider using normalization.
<% } %>

## Variation Within Each Cluster

The following boxplots show how the values of each variable vary within each cluster. They help you see whether a cluster is compact or whether it contains a wide range of values.

{{boxplot}}

<% if (normalize) { %>
The Y-axis values are normalized. A value of 0 represents the overall average. Positive values are above average, and negative values are below average.
<% } else { %>
The Y-axis values are the original values of each variable. Because each variable may use a different unit or scale, compare the distributions within each variable rather than across different variables.
<% } %>

## Biplot

The following biplot shows the relationships between clusters and variables, as well as relationships among variables.

{{biplot}}

The original data has <%= variables.length %> variables, so it cannot be fully visualized in two dimensions. This chart uses two summary dimensions that capture as much variation in the data as possible.

The X-axis explains <%= ratio_of_variance_of_p1_pct %>% of the variation in the original data, and the Y-axis explains <%= ratio_of_variance_of_p2_pct %>%.

Each variable is represented by a gray line extending from the center point. Variables pointing in similar directions tend to be positively related. Variables pointing in opposite directions tend to be negatively related.

If a cluster is located in the direction of a variable line, that cluster tends to have higher values for that variable. If it is located in the opposite direction, it tends to have lower values.


<% if (has_category) { %>

# Relationship with Categorical Variable

The following chart shows how the selected category variable, '<%= category %>', is distributed across clusters.

This can help you understand whether the clusters are associated with known groups in the data.

{{category_ratio}}

<% } %>


# Output Data

The output data contains the original rows with a cluster ID assigned to each row.

{{data}}

# Learn More

* When you want to cluster by an observation unit that is not a row in the current data, you first need to aggregate the data. You can find more details in [this note](https://exploratory.io/note/exploratory/K-Means-sfp4Syw0).

`;

module.exports = template;

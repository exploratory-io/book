const template = `
Using the selected variables, the data was classified into <%= cluster_number %> clusters (groups) with K-Means Clustering. You can change the number of clusters from [Settings](//analytics/settings/cluster_number).

# Characteristics of Each Cluster

<!-- AI_SUMMARY -->

## Summary

<% if (normalize) { %>
The following table summarizes the number of rows in each cluster and the average score (normalized value) for each variable used for the classification.
<% } else { %>
The following table summarizes the number of rows in each cluster and the average value for each variable used for the classification.
<% } %>

{{summary}}

* Excluded Rows - Any row with a missing value (NA) in any of the variables is excluded from the data. If the ratio of Excluded Rows is high, consider reviewing the variables to use or filling in the missing values.

## Radar Chart

<% if (normalize) { %>
You can interpret the characteristics of each cluster based on the average score (normalized value) for the variables used in the classification.
<% } else { %>
You can interpret the characteristics of each cluster based on the average value for the variables used in the classification.
<% } %>

{{radar}}

<% if (normalize) { %>
The values on each axis are normalized values of the original variables. A mean value is 0, positive values indicate above-average, and negative values indicate below-average.
<% } else { %>
The values on each axis are the original values of each variable. The scale of the values differs depending on the unit and scale of each variable. The axis is scaled to the largest value among all the variables.
<% } %>

## Boxplot

The following boxplots visualize the variation in each variable for each cluster.

{{boxplot}}

<% if (normalize) { %>
The Y-axis values are normalized values of the original variables. A mean value is 0, positive values indicate above-average, and negative values indicate below-average.
<% } else { %>
The Y-axis values are the original values of each variable. The scale of the values differs depending on the unit and scale of each variable. The axis is scaled to the largest value among all the variables.
<% } %>

## Biplot

The following chart, called a "biplot," visualizes the relationships between clusters and variables, as well as the relationships among variables.

{{biplot}}

The original data is represented by <%= variables.length %> variables, but it is not possible to visualize all the variation in two dimensions (X and Y axes). Therefore, this chart visualizes the variation in the original data using two virtual variables (X and Y axes) that retain as much of the original information (variation) as possible. The X-axis represents <%= ratio_of_variance_of_p1_pct %>% of the original data's variation, and the Y-axis represents <%= ratio_of_variance_of_p2_pct %>.

Each variable is represented by a gray line extending from the center point (0, 0) outward. Variables pointing in the same direction are highly correlated.

You can interpret the characteristics of each cluster by seeing which lines they are close to. If a cluster is near the tip of an outward line, it has a high score for that variable. Conversely, if it is on the opposite side across 0, it has a low score for that variable.

<% if (has_category) { %>

# Relationship with Category

The following is a visualization of the relationship between the '<%= category %>' column selected as a category and the clusters using a bar chart.

{{category_ratio}}

<% } %>


# Data

Based on the cluster classification results, we assigned a cluster ID to each row of the original data.

{{data}}

<% if (elbow_method_mode) { %>

# Optimal Number of Clusters

The elbow method is a heuristic used in determining the optimal number of clusters in a dataset.

How it works:

1. Run K-Means clustering for a range of cluster counts (e.g., from 1 to 10).
2. For each number of clusters, calculate the within-cluster sum of squares (WCSS).
3. Plot the WCSS for each cluster count.
4. The "elbow" on the plot, the point where the rate of decrease sharply changes, suggests the optimal number of clusters.

You can disable this from [Settings](//analytics/settings/elbow_method), where you can also change the maximum number of clusters to try.

## Elbow Curve

The following chart visualizes the within-cluster sum of squares for each number of clusters. This is called an elbow curve.

{{elbow}}

With a small number of clusters, the within-cluster variation is large. The variation decreases as the number of clusters increases. However, the rate of decrease slows down at some point, creating an "elbow". This elbow indicates a good trade-off between the number of clusters and the variation within them. Note that this is a heuristic, and the interpretability of clusters is also important.

## Rate of Decrease in WCSS

Sometimes the elbow is not clear on the elbow curve. In such cases, you can look at the rate of decrease in WCSS. When the rate of decrease becomes constant, that can be a good indication of the optimal number of clusters.

{{elbow_diff}}

<% } %>

# Learn More

* When you want to cluster by an observation unit that is not a row in the current data, you first need to aggregate the data. You can find more details in [this note](https://exploratory.io/note/exploratory/K-Means-sfp4Syw0).
`;

module.exports = template; 
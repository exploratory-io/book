const template = `


We classified the data into <%= cluster_number %> clusters (groups) using "K-Means Clustering" based on the selected variables, treating each row of the data as an observation. The number of clusters is <%= cluster_number %>, but this can be changed from [Settings](//analytics/settings).

# Characteristics of Each Cluster

<!-- AI_SUMMARY -->

## Summary Information

The table below summarizes the amount of data in each cluster and the average score (standardized value) for the variables used in the classification.

{{summary}}

* Excluded Rows - Rows with missing values (NA) in at least one variable are excluded from the data in advance. If the percentage of Excluded Rows is high, please reconsider the variables used or impute missing values.

## Visualization with Radar Chart

You can interpret the characteristics of each cluster based on the average score (standardized value) for the variables used in the classification.

{{radar}}

The values on each axis are the standardized original values of each variable. The average value is 0, positive values mean higher than average, and negative values mean lower than average.


## Visualization with Box Plot

The following is a visualization of the variability of values for each variable by cluster using box plots.

{{boxplot}}

The values on the Y-axis are the standardized original values of each variable. The average value is 0, positive values mean higher than average, and negative values mean lower than average.

## Visualization with Scatter Plot

This is a visualization of the relationship between clusters and variables, and the relationship between variables using a scatter plot. This chart is called a "Biplot".

{{biplot}}

The original data is represented by <%= variables.length %> variables, but it is not possible to visualize the variability of all data in a 2-dimensional (X-axis and Y-axis) space. Therefore, this chart attempts to visualize the variability of the original data using two virtually created variables (X-axis and Y-axis) so as not to lose as much information (variability) as possible from the original data. The X-axis represents <%= ratio_of_variance_of_p1_pct %>% of the original data's variability, and the Y-axis represents <%= ratio_of_variance_of_p2_pct %>%.

Each variable is represented by a gray line extending outwards from the center point (0, 0). Variables whose lines point in the same direction can be said to be strongly correlated variables.

Each cluster can be interpreted by how close it is to which line. If it is closer to the end of the line extending outwards, it means that the cluster has a high score for that variable. Conversely, if it is on the opposite side across 0, it means that the cluster has a low score for that variable.

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

# Supplementary Information

## Next Steps

* If the observations you want to cluster do not correspond to the current rows, you need to create data for K-Means clustering. For details, please refer to [this note](https://exploratory.io/note/exploratory/K-Means-sfp4Syw0) (Note: This link points to a Japanese section in the note, ideally it would point to an English section or the note in English).


`;

module.exports = template; 
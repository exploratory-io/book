const template = `


Distances were calculated for all combinations of the selected variables. The algorithm currently used for distance calculation is <%= distance_method %>. The algorithm can be changed from [Settings](//analytics/settings) in Analytics.

# Distance Magnitude

Distances were calculated for all combinations of the selected variables and visualized in a table called a heatmap. The darker the red color, the closer the distance (higher similarity).

{{distance_matrix}}

* Smaller values indicate that variables are more similar to each other
* Larger values indicate greater differences between variables
* Values on the diagonal are always 0 (distance between the same variable is zero)


## Distance Calculation Method

This analysis uses the <%= distance_method %> algorithm for distance calculation. The characteristics of each method are as follows:

* Euclidean: Straight-line distance representing the shortest distance between two points. This is the most commonly used distance calculation method.
* Manhattan: Like movement along grid-like roads, it represents the sum of vertical and horizontal movement distances.
* Binary: A method that measures distance by counting matches/mismatches between two variables, calculated based on the number of common 1s and 0s, or the proportion of differences. It is suitable for comparing binary attributes (Yes/No, True/False). Jaccard distance is a type of binary distance, and for cases that specifically focus on "1" to measure similarity, this Binary distance can be used.
* Canberra: A method that divides the absolute value of differences in each dimension by the sum of respective values and then sums them. It is sensitive to differences in small values.
* Chebyshev: A method that uses the maximum difference among all dimensions as the distance, used when focusing on the maximum error.
* Minkowski: A generalized distance that encompasses Euclidean and Manhattan distances.

The algorithm can be changed from [Settings](//analytics/settings) in Analytics.

# Similarity Visualization

The following similarity map uses MDS (Multidimensional Scaling) to visualize the distance relationships between variables in multidimensional space (space composed of multiple variables) on a two-dimensional plane.

{{similarity_map}}

* Objects placed close to each other have high similarity, while those placed far apart have low similarity.
* Variables are color-coded into three groups based on distances between variables. Variables of the same color have relatively higher similarity compared to others.

# Supplementary Information

## Distance Data

The pairs with high similarity among the selected variables are as follows. They are displayed in order from pairs with close distances and high similarity.

{{similarity_pairs}}
`;

module.exports = template; 
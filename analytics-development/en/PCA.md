const template = `
# Summary

Principal Component Analysis (PCA) was performed on the following variables to reduce the dimensionality of the data into a few principal components.

<% variables.forEach(function(variable) { %>
* <%= variable %>
<% }); %>

# Principal Component & Variable Relationships

The table below shows the loadings of each principal component for each variable.

{{component_loadings_table}}

Principal component loadings are indicators that represent how well the corresponding variable can explain each principal component, and the absolute values of the principal component loadings are displayed.
The values of the principal component loadings are between 0 and 1, where a value closer to 1 indicates higher explanatory power, and a value closer to 0 indicates lower explanatory power.

The following chart, called a "Biplot", visualizes the relationships between variables.

{{biplot}}

The original data is represented by <%= variables.length %> variables, but it is not possible to visualize the variability of all data in a 2-dimensional (X-axis and Y-axis) space. Therefore, this chart attempts to visualize the variability of the original data using two virtually created variables (X-axis and Y-axis) so as not to lose as much information (variability) as possible from the original data. The X-axis represents <%= ratio_of_variance_of_p1 %>% of the original data's variability, and the Y-axis represents <%= ratio_of_variance_of_p2 %>.

Each variable is represented by a gray line extending outwards from the center point (0, 0). Variables whose lines point in the same direction can be said to be strongly correlated variables.

The Scree plot charts the eigenvalues for each principal component.

{{scree_plot}}

Eigenvalues represent the explanatory power of each principal component, and it is generally recommended to adopt principal components with eigenvalues of 1 or more. The location of the "elbow" in the Scree plot (the point where the slope of the curve changes significantly) also serves as a guideline for determining the appropriate number of principal components.

The following chart visualizes the "cumulative proportion of variance explained" for each principal component, which represents how much of the total variability in the data is explained by each principal component. The cumulative proportion of variance explained shows how much is explained when these proportions are summed up.

{{variance_explained_chart}}

# Data

The following shows the principal component scores (the value each observation has for each principal component) calculated and added to the original data.

{{data}}
`;

module.exports = template; 
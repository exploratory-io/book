const template = `

Factor analysis was conducted based on the following variables to identify <%= factor_count %> latent common factors from the correlation relationships between variables. These <%= factor_count %> factors can explain <%= cumulative_variance_pct %>% of the total variance in the data. The current number of factors is <%= factor_count %>, but this can be changed from [Settings](//analytics/settings).

<% variables.forEach(variable => { %>
  - <%= variable.name %>
<% }); %>

# Relationship Between Factors and Variables

The following table shows the factor loadings of each factor for each variable.

{{factor_loadings_table}}

* Factor loadings represent the correlation coefficient between each variable and each factor, with values between -1 and 1, interpreted as follows:
  * Closer to 1: strong positive correlation
  * Closer to -1: strong negative correlation
  * Closer to 0: no correlation

* Generally, if the value is 0.4 or above or -0.4 or below, there is considered to be a meaningful relationship between that variable and factor.
* The proportion of each variable's variance explained by the extracted factors is shown in the "Communality" column, while the unexplained proportion is shown in the "Uniqueness" column.
* The current rotation type uses <%= rotation_type %>. For information about differences in rotation types, please see [this note](https://exploratory.io/note/exploratory/ppP5JXC8).

## Visualization of Factor Loadings Using Radar Charts

The following radar chart visualizes the factor loadings of each variable by factor.

{{factor_loadings_radar}}

Each axis represents each variable, and the values represent the absolute values of factor loadings. If the line for each factor extends outward at a particular variable, it can be interpreted as having a strong relationship with that variable.

# Relationships Between Variables

The following chart, called a "biplot," visualizes the relationships between all variables on a plane represented by Factor 1 and Factor 2.

{{biplot}}

The variance in the original data is represented by <%= number_of_variables %> variables, but this attempts to visualize it in a two-dimensional space (X-axis and Y-axis) using the first two of the <%= factor_count %> factors as the X-axis and Y-axis, while trying to preserve as much of the information content (variance) of the original data as possible.

Each variable is represented by gray lines extending outward from the center point (0, 0). Variables whose lines point in the same direction have strong correlations.

# Exploring the Optimal Number of Factors

To determine the optimal number of factors, the following chart called a scree plot can be used.

{{scree_plot}}

The X-axis shows the number of factors, and the Y-axis shows the eigenvalues, which indicate the magnitude of variance that can be explained for each number of factors. An eigenvalue of 1 can be considered equivalent to the variance of one variable. If the eigenvalue of Factor 1 is 2.7, this can be interpreted as explaining the variance of approximately 2.7 variables.

Therefore, it is generally recommended that the optimal number of factors is up to the number where eigenvalues are 1 or above (Kaiser's criterion). If the eigenvalue of the 3rd factor is 1 or above and the eigenvalue of the 4th factor is below 1, the optimal number of factors would be 3. Additionally, the "elbow" position in the scree plot (the point where the curve's slope changes significantly) is also recommended as a guideline for determining the appropriate number of factors.


<% if (has_category) { %>

# Relationship Between Factors and Categories

The following visualizes the relationship between '<%= category %>' selected as a category and the factors using a radar chart.

{{category_factor_relationship}}

This chart visualizes the average factor scores for each factor by category. This allows you to understand which factors are strongly related to specific categories.

<% } %>

# Supplementary Information

## Significance

{{summary}}

The significance information here is only useful when the purpose of this analysis is to "verify whether the hypothesized factor structure fits the data." If the purpose of the analysis is to "discover factor structure" from the data, the information here is practically not very meaningful.

<% if (p > baseline_p) { %>
A chi-square test is performed as a hypothesis test. The null hypothesis is "the factor model (structure) fits the data." The P-value is <%= p_value %>, which is larger than the significance level of <%= baseline_p_pct %>%, so the null hypothesis cannot be rejected, indicating that this factor model fits the data.
<% } else { %>
A chi-square test is performed as a hypothesis test. The null hypothesis is "the factor model (structure) fits the data." The P-value is <%= p_value %>, which is smaller than the significance level of <%= baseline_p_pct %>%, so the null hypothesis can be rejected, indicating that this factor model does not fit the data.
<% } %>

## Data

The following table shows factor scores (how much value each observation has for each factor) calculated and added to the original data.

{{data}}

## Contribution Rate

The contribution rate shows how much each factor explains the overall variance in the data (sum of squared factor loadings).

{start_lazy_show_hide}
### Chart
{{variance_explained}}
{end_lazy_show_hide}


## Charts Related to Factor Loadings

**Factor Loadings (Bar)**

This displays the factor loadings of each variable for each factor in a bar chart. The length of the bars represents the magnitude of factor loadings, with positive values extending to the right and negative values extending to the left.

{start_lazy_show_hide}
### Chart
{{factor_loadings_bars}}
{end_lazy_show_hide}

**Factor Loadings (Path)**

The following path diagram visualizes the relationships between each factor and variables, where line thickness is proportional to the absolute value of factor loadings - thicker lines indicate stronger relationships. Colors are used to distinguish each factor.

{start_lazy_show_hide}
### Chart
{{factor_path}}
{end_lazy_show_hide}
`;

module.exports = template; 
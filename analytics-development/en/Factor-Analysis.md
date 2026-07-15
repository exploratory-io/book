const template = `

# Summary

Factor analysis was conducted based on the following <%= number_of_variables %> variables to identify <%= factor_count %> latent common factors from the correlations among the variables. These <%= factor_count %> factors explain <%= cumulative_variance_pct %>% of the total variance in the data. The current number of factors is <%= factor_count %>, but this can be changed from [Settings](//analytics/settings).

<% variables.forEach(variable => { %>
  - <%= variable.name %>
<% }); %>

<% if (typeof factor_summaries !== 'undefined' && factor_summaries.length > 0) { %>
The variables most strongly related to each factor are:

<% factor_summaries.forEach(fs => { %><% if (fs.has_variables) { %>
- **<%= fs.factor %>** is mainly related to <%= fs.variables.map(v => '"' + v + '"').join(', ') %>.
<% } else { %>
- **<%= fs.factor %>** has no variables that relate to it strongly enough.
<% } %><% }); %>

<% if (warning_variables && warning_variables.length > 0) { %>On the other hand, <%= warning_variables.map(v => '"' + v + '"').join(', ') %> are flagged as cross-loading or hard to interpret.<% } else { %>No variables stand out as cross-loading or hard to interpret.<% } %>
<% } %>

<% if (typeof low_communality_variables !== 'undefined') { %>
<% if (low_communality_variables.length > 0) { %>Also, <%= low_communality_variables.map(v => '"' + v + '"').join(', ') %> have low communality and may not be well explained by the current factors.<% } else { %>No variables have extremely low communality.<% } %>
<% } %>

# Suitability

Before interpreting the factors, it is worth checking whether the selected variables are suitable for factor analysis.

{{suitability_table}}

The **KMO measure** indicates how well the selected variables are suited for factor analysis. It ranges from 0 to 1, and values closer to 1 indicate a better fit. **Bartlett's test of sphericity** checks whether there is enough correlation among the variables to run factor analysis; a small p-value means the variables are sufficiently correlated.

If either indicator suggests the data is weak, consider reselecting the variables before relying on the results below.

# Selecting the Number of Factors

To decide how many factors to keep, the following scree plot shows the actual eigenvalues alongside the eigenvalues expected from random data (parallel analysis) and the eigenvalue = 1 line (Kaiser criterion).

{{scree_plot_parallel}}

Factors whose actual eigenvalue exceeds the random-data eigenvalue are likely to reflect real structure in the data rather than noise. Factors with an eigenvalue of 1 or above are candidates under the Kaiser criterion.

{{factor_count_table}}

Each method can suggest a different number of factors, so treat these as guidelines. Together with the interpretability of the factors below, they help you judge whether <%= factor_count %> factors is a reasonable choice.

# Rotation Method

The current rotation method is **<%= rotation_type %>**. Rotation adjusts the factor axes so that each variable relates strongly to as few factors as possible, which makes the factors easier to name.

<% if (is_oblique) { %>
This is an **oblique** rotation, which allows the factors to be correlated with each other. When factors are expected to be related, an oblique rotation is a reasonable choice. You can review the inter-factor correlations in the "Correlations" tab.
<% } else { %>
This is an **orthogonal** rotation, which assumes the factors are independent of each other. If the factors are likely to be related (for example, preferences that tend to move together), it is worth also trying an oblique rotation such as Oblimin or Promax.
<% } %>

# Factor & Variable Relationships

The table below shows how strongly each variable is related to each factor. The bar in each cell represents the size of the factor loading; red indicates a positive loading and blue a negative loading. Generally, an absolute value of **0.4 or above** indicates a meaningful relationship and **0.6 or above** a strong one.

{{factor_loadings_table}}

The radar chart visualizes the absolute factor loadings of each variable by factor. When a factor's line extends outward at a particular variable, that factor is strongly related to it.

{{factor_loadings_radar}}

## Variables Needing Caution

Some variables do not belong cleanly to a single factor: they load meaningfully on more than one factor (cross-loading), or they do not load strongly on any factor. When naming and interpreting the factors, rely on the variables that load clearly on a single factor, and treat these variables with care.

# Variable Relationships

The following chart, called a "biplot," visualizes the relationships between all variables on a plane represented by Factor 1 and Factor 2.

{{biplot}}

The variance in the original data is represented by <%= number_of_variables %> variables, but this attempts to visualize it in a two-dimensional space (X-axis and Y-axis) using the first two of the <%= factor_count %> factors as the X-axis and Y-axis, while trying to preserve as much of the information content (variance) of the original data as possible.

Each variable is represented by gray lines extending outward from the center point (0, 0). Variables whose lines point in the same direction have strong correlations.

# How Well Each Variable Is Explained

The following chart shows, for each variable, the proportion of its variance explained by the extracted factors (communality) and the proportion left unexplained (uniqueness).

{{communality_bar}}

{{communality_table}}

<% if (improper_communality_variables && improper_communality_variables.length > 0) { %>
Note: The communality of <%= improper_communality_variables.map(v => '\`' + v + '\`').join(', ') %> exceeds 1. Communality is normally bounded between 0 and 1; a value above 1 does not mean the variable is "explained more than 100%" — it indicates that the factor-analysis estimation may be unstable. Consider reducing the number of factors, reviewing the target variables, or changing the missing-value handling or estimation method. For details, see [this note](<%= heywood_note_url %>).
<% } %>

Variables with **low communality** are not well captured by the current factor structure and may represent something the current factors do not cover. If several important variables have low communality, consider increasing the number of factors or revisiting the variable selection.

# Contribution of Each Factor

The following chart shows how much of the total variance each factor explains.

{{variance_explained}}

The bars show each factor's contribution and the line shows the cumulative contribution. The <%= factor_count %> factors together explain <%= cumulative_variance_pct %>% of the total variance. Because the cumulative contribution always rises as factors are added, do not decide the number of factors from the contribution alone — combine it with the scree plot, parallel analysis, and interpretability.

# Factor Scores

The table below adds "factor scores" to the original data.

{{data}}

Factor scores are standardized to a mean of 0 and a standard deviation of 1. Values near 0 indicate average observations, while values far from 0 (positive or negative) indicate stronger tendencies for that factor. As a guideline, values beyond ±1 show a strong tendency away from the average.

The sign of a factor score is interpreted together with the sign of the factor loadings:

* For variables with positive loadings, a higher factor score corresponds to a higher variable value.
* For variables with negative loadings, a higher factor score corresponds to a lower variable value.

Factor scores can be used for follow-up analysis such as segment comparison, clustering, regression, and prediction.

<% if (has_category) { %>

# Factor & Category Relationships

The following visualizes the relationship between '<%= category %>' selected as a category and the factors using a radar chart.

{{category_factor_relationship}}

This chart visualizes the average factor scores for each factor by category. This allows you to understand which factors are strongly related to specific categories.

<% } %>

# Appendix

## Significance

{{summary}}

The significance information here is useful when the goal is to "verify whether a hypothesized factor structure fits the data." When the goal is instead to "discover" a factor structure from the data, this information is of limited practical value.

<% if (p > baseline_p) { %>
A chi-square test is used as the hypothesis test. The null hypothesis is "the factor model (structure) fits the data." The p-value is <%= p_value %>, which is larger than the significance level of <%= baseline_p_pct %>%, so the null hypothesis cannot be rejected — indicating that this factor model fits the data.
<% } else { %>
A chi-square test is used as the hypothesis test. The null hypothesis is "the factor model (structure) fits the data." The p-value is <%= p_value %>, which is smaller than the significance level of <%= baseline_p_pct %>%, so the null hypothesis can be rejected — indicating that this factor model does not fit the data.
<% } %>

<% if (rmsr || rmsea || tli) { %>
The Summary table above also reports fit indices. As rough guidelines, a smaller RMSR and RMSEA indicate a better fit, and a TLI closer to 1 indicates a better fit.
<% } %>
`;

module.exports = template;

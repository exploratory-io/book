const template = `
<% var correlation_type_safe = (typeof correlation_type === 'undefined' || !correlation_type) ? 'pearson' : correlation_type; var is_correlation_known_safe = (typeof is_correlation_known === 'undefined') ? false : !!is_correlation_known; var is_correlation_auto_safe = (typeof correlation_is_auto === 'undefined') ? false : !!correlation_is_auto; var correlation_degraded_from_safe = (typeof correlation_degraded_from === 'undefined' || !correlation_degraded_from) ? '' : correlation_degraded_from; var is_polychoric_available_safe = (typeof is_polychoric_available === 'undefined') ? false : !!is_polychoric_available; var correlation_warnings_safe = (typeof correlation_warnings === 'undefined' || !correlation_warnings) ? [] : correlation_warnings; var is_category_correlation_safe = (typeof is_category_correlation === 'undefined') ? (correlation_type_safe !== 'pearson') : is_category_correlation; var score_scale_safe = (typeof score_scale === 'undefined' || !score_scale) ? 'preserve_variance' : score_scale; %>
# Summary

<% if (typeof n_variables_used !== 'undefined' && n_variables_used !== null) { %>Principal Component Analysis was performed on <%= n_variables_used %> variables<% if (typeof n_rows_used !== 'undefined' && n_rows_used !== null) { %> over <%= n_rows_used %> rows<% } %>.<% if (typeof pc1_pct !== 'undefined' && pc1_pct !== null && typeof pc2_pct !== 'undefined' && pc2_pct !== null) { %> The first two principal components retain <%= Math.round((pc1_pct + pc2_pct) * 10) / 10 %>% of the <% if (correlation_type_safe !== 'pearson') { %>variation in the estimated latent variables -- the continuous variables assumed behind the answers<% } else { %>original variation<% } %>.<% } %><% } %>

## Analysis Method

<% if (is_correlation_known_safe) { %>{{analysis_method_table}}

<% var correlation_name_en = {polychoric:'polychoric', tetrachoric:'tetrachoric', mixed:'mixed', pearson:'Pearson'}; %><% if (correlation_degraded_from_safe) { %>The <%= (correlation_name_en[correlation_degraded_from_safe] || correlation_degraded_from_safe) %> correlation requested for this analysis could not be estimated from the data, so Pearson correlation was used instead. Sparse categories, category combinations with no answers, or a variable that is not really categorical are the usual causes; consider merging categories or reselecting the variables before relying on the results.<% } else if (correlation_type_safe === 'polychoric') { %>The principal components were computed from a polychoric correlation matrix<% if (is_correlation_auto_safe) { %>, because the selected variables are ordinal categorical variables, based on their number of categories and the degree of skewness in their response distributions<% } else { %>, because Polychoric was selected as the correlation type<% } %>. A polychoric correlation assumes a continuous variable behind each ordinal answer and estimates the correlation between those, so it is more appropriate than Pearson for rating scales such as 1 to 5, whose intervals are not necessarily equal.<% } else if (correlation_type_safe === 'tetrachoric') { %>The principal components were computed from a tetrachoric correlation matrix, which is the two-category form of the polychoric correlation and assumes a continuous variable behind each binary answer.<% } else if (correlation_type_safe === 'mixed') { %>The principal components were computed from a mixed correlation matrix, which picks the appropriate correlation for each pair of variables because continuous and categorical variables were selected together.<% } else { %>The principal components were computed from a Pearson correlation matrix<% if (is_correlation_auto_safe) { %>, because the selected variables are continuous, or their categories are numerous enough to be treated as continuous<% } else { %>, because Pearson was selected as the correlation type<% } %>.<% if (is_polychoric_available_safe) { %> The selected variables are ordinal categorical variables, so a polychoric correlation may capture their relationships more appropriately; it can be selected from [Settings](//analytics/settings).<% } %><% } %>
<% if (correlation_warnings_safe.indexOf('sparse_categories') >= 0) { %>
Note: some variables have a category that holds less than 5% of the responses. Correlations estimated from categories can become unstable when categories are that sparse.
<% } %><% if (correlation_warnings_safe.indexOf('alphabetical_category_order') >= 0) { %>
Note: at least one categorical variable has no defined category order, so its categories were ordered alphabetically. Set the category order explicitly if that order is not the intended one.
<% } %><% if (is_category_correlation_safe) { %>
### Correlation Diagnostics

<% if (correlation_degraded_from_safe) { %>The diagnostics below describe the categorical correlation that could not be estimated.<% } else { %>Because this analysis estimates the correlations from categorical answers, the following diagnostics matter.<% } %>

{{correlation_diagnostics_table}}

Sparse categories, category combinations with no answers, and a correlation matrix that had to be smoothed all make the estimated correlations less stable. If any of them is flagged, consider merging categories or reselecting the variables.
<% } %><% } %>

## Data Used in the Analysis

{{data_conditions_table}}

# Choosing the Number of Components

## Scree Plot and Parallel Analysis

{{scree_plot_parallel}}

## Deciding the Number of Components

The table below lists each component's eigenvalue, contribution ratio, and how each criterion judges it.

{{component_selection_table}}

<% if (typeof recommended_n !== 'undefined' && recommended_n !== null && recommended_n !== 0) { %><% if (typeof methods_agree !== 'undefined' && methods_agree) { %>Parallel analysis and the Kaiser criterion both support keeping <%= recommended_n %> components.<% } else if (typeof kaiser_n !== 'undefined' && kaiser_n !== null) { %>Parallel analysis suggests <%= recommended_n %> and the Kaiser criterion <%= kaiser_n %>; prefer parallel analysis, which compares against random variation.<% } %>
<% } %>

## Cumulative Representation of Each Variable

The table below shows how well the information of <% if (correlation_type_safe !== 'pearson') { %>the continuous variable assumed behind each answer<% } else { %>each variable<% } %> is retained as principal components are added one at a time. A higher value means it is better represented by the components up to that point.

{{representation_table}}

The color indicates the level of representation: 70% or higher is judged "High", 50-70% "Mostly Retained", 30-50% "Partially Retained", and below 30% "Low". This lets you see, for the number of components adopted, which <% if (correlation_type_safe !== 'pearson') { %>assumed underlying continuous variables'<% } else { %>variables'<% } %> information is sufficiently retained and which are not yet well represented.

Even when the overall cumulative contribution rate is high, individual variables can differ in their representation. This table therefore helps you judge the adequacy of the number of components not only overall but also on a per-variable basis.

# Principal Components and Variables

## Principal Component Loadings

The table below shows the strength and direction of the relationship between each <% if (correlation_type_safe !== 'pearson') { %>variable's assumed underlying continuous variable<% } else { %>variable<% } %> and each principal component. The in-cell bar grows with the absolute value of the loading; blue indicates a positive loading and red a negative loading. As a guideline for interpretation, an absolute loading value of 0.4 or higher indicates some relationship, and 0.6 or higher indicates a strong relationship.

{{loadings_signed_table}}

**How to read the colors:**

| Loading value | Color | Meaning |
|---|---|---|
| 0.6 or higher | Dark blue | Strong positive relationship |
| 0.4 or higher | Medium blue | Moderate positive relationship |
| Greater than 0 | Light blue | Weak positive relationship |
| 0 | Gray | No relationship |
| Less than 0 | Light red | Weak negative relationship |
| -0.4 or lower | Medium red | Moderate negative relationship |
| -0.6 or lower | Dark red | Strong negative relationship |

<% if (typeof component_profiles !== 'undefined' && component_profiles && component_profiles.length > 0) { component_profiles.forEach(function(p){ %>
**<%= p.component %>** <% if (p.pattern_status === 'common_direction') { %>Variables such as <%= p.positive_variables.join(', ') %> are strongly related in the same direction, so this component represents an overall tendency shared by these variables.<% } else if (p.pattern_status === 'contrast') { %><%= p.positive_variables.join(', ') %> relate positively while <%= p.negative_variables.join(', ') %> relate negatively, so this component represents a contrast between the two groups.<% } else if (p.pattern_status === 'single_variable') { %>The contribution of <%= p.dominant_variable %> is especially large, so this component mainly represents information specific to <%= p.dominant_variable %>.<% } else if (p.pattern_status === 'diffuse') { %>Many variables relate weakly, so this component is hard to characterize with a few variables. Confirm the loadings and the original meaning before naming it.<% } else { %>Several variables relate but it does not fit a clear common-direction or contrast pattern; review the combination of related variables for your analysis goal.<% } %>
<% }); } %>

## Component Contribution Rates and Variable Breakdown

The chart below shows how much of the overall variation <% if (correlation_type_safe !== 'pearson') { %>in the estimated latent variables<% } else { %>in the data<% } %> each principal component explains, and which variables make up that component.

The total length of each bar represents the component's contribution rate: the longer the bar, the more of the <% if (correlation_type_safe !== 'pearson') { %>estimated latent variables'<% } else { %>original data's<% } %> information that component retains. The color segments within a bar show how much each variable contributes to the makeup of that component. A variable with a larger color segment is more important in characterizing that component.

{{contributions_table}}

## Visualizing Relationships Between Variables

The chart below plots each variable by its relationship to the first two principal components.

Variables whose arrows point the same way tend to be positively correlated; opposite arrows, negatively correlated; near-right-angle arrows, weakly correlated.<% if (correlation_type_safe !== 'pearson') { %> These are the correlations the polychoric correlation estimated between the continuous variables assumed behind the answers, not correlations among the recorded answers themselves.<% } %> Variables near the center may not be well represented by these two components.

{{variable_map_chart}}

## Biplot

<% if (correlation_type_safe !== 'pearson') { %>The observations are placed using approximate principal component scores; see Component Scores (Approximate) below.

<% } %>{{biplot}}

The biplot overlays variables and observations; read arrows by angle and direction rather than comparing raw arrow lengths to point distances.<% if (score_scale_safe === 'unit_variance') { %> With the score scale set to Unit Variance (SPSS Compatible), each component's scores are divided by that component's own standard deviation, so the axes are stretched by different amounts and the distances between points do not match distances in the original data -- read them as a rough guide.<% } %>

## Principal Components and Observations

<% if (correlation_type_safe !== 'pearson') { %>Note that this analysis was computed from a correlation matrix estimated from categorical answers, so the scores plotted here are **approximate principal component scores**; see Component Scores (Approximate) below.

<% } %>The scatter plot below places each observation using its principal component scores on PC1 and PC2. Each point is one observation; the closer two points are, the more similar their characteristics on the original variables<% if (correlation_type_safe !== 'pearson') { %> that the approximate scores were computed from<% } %>, and the farther apart, the more different.

<% if (typeof pc1_pct !== 'undefined' && pc1_pct !== null && typeof pc2_pct !== 'undefined' && pc2_pct !== null) { %>In this chart, PC1 explains <%= Math.round(pc1_pct * 10) / 10 %>% and PC2 <%= Math.round(pc2_pct * 10) / 10 %>% of the overall variation<% if (correlation_type_safe !== 'pearson') { %> in the estimated latent variables<% } %>, so the two axes together represent <%= Math.round((pc1_pct + pc2_pct) * 10) / 10 %>%.<% if (correlation_type_safe !== 'pearson') { %> These percentages come from the eigen-decomposition of the correlation matrix, not from the spread of the approximate scores themselves.<% } %>
<% } %>

{{observation_map_chart}}

<% if (score_scale_safe === 'unit_variance') { %>Note that with the score scale set to Unit Variance (SPSS Compatible), each component's scores are divided by that component's own standard deviation. Because the components are stretched by different amounts, distances between points in this chart do not match distances in the original data; read the chart for the pattern of the positions rather than for exact distances.

<% } %>Choosing a category column colors each observation by category, so you can see whether response patterns differ by category or whether observations with similar characteristics span categories. Observations far from the rest may have distinctive response patterns.

# Component Scores<% if (correlation_type_safe !== 'pearson') { %> (Approximate)<% } %>

Component scores show where each observation sits on each component. Values near 0 are near the overall average; large positive or negative values indicate a strong presence of that component's characteristic.
<% if (correlation_type_safe !== 'pearson') { %>
Because this analysis was computed from a correlation matrix estimated from categorical answers, an exact component score cannot be obtained for each observation. The scores below are therefore **approximate principal component scores**. They are obtained by coding each ordinal answer as a number, standardizing it, and multiplying by the principal component coefficients of that correlation matrix. They are therefore not the values of the continuous variables the polychoric correlation assumes behind each answer, so read them as relative positions among observations rather than as exact quantities. If you feed them into a downstream analysis such as a regression or a clustering, carry that approximation forward: avoid conclusions that depend on the exact values.<% if (score_scale_safe === 'unit_variance') { %> Note that the score scale is set to Unit Variance (SPSS Compatible), but that scale divides these approximate scores by each component's standard deviation, so the standard deviation of the scores shown here is close to 1 rather than exactly 1.<% } %>
<% } %>

{{data}}

## Principal Component Coefficients

Coefficients are the weights that combine the original variables into each component (<% if (correlation_type_safe !== 'pearson') { %>the eigenvectors of the correlation matrix<% } else { %>from the rotation matrix<% } %>). Unlike loadings, which show the correlation of <% if (correlation_type_safe !== 'pearson') { %>the continuous variable assumed behind each answer<% } else { %>a variable<% } %> with a component, coefficients show how much each variable is used to construct it.
<% if (score_scale_safe === 'unit_variance') { %>
Because the score scale is set to Unit Variance (SPSS Compatible), the table below shows two kinds of coefficients. Coefficient is the weight that defines the direction of the component, while Score Coefficient is the weight that produces each observation's component score (the coefficient divided by that component's standard deviation). Score Coefficient is what corresponds to SPSS's Component Score Coefficient Matrix.
<% } %>
{{coefficients_table}}
`;

module.exports = template;

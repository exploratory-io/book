const template = `

# Summary

Factor analysis was conducted based on the selected <%= number_of_variables %> variables to identify <%= factor_count %> latent common factor<%= factor_count === 1 ? '' : 's' %> from the correlations among the variables. <%= factor_count === 1 ? 'This factor explains' : 'These ' + factor_count + ' factors explain' %> <%= cumulative_variance_pct %>% of the total variance in the data. The current number of factors is <%= factor_count %>, but this can be changed from [Settings](//analytics/settings).

## Data and Analysis Conditions

<% var correlation_type_safe = (typeof correlation_type === 'undefined' || !correlation_type) ? 'pearson' : correlation_type; %><% var is_correlation_known_safe = (typeof is_correlation_known === 'undefined') ? (typeof correlation_type !== 'undefined' && !!correlation_type) : !!is_correlation_known; %><% var is_correlation_auto_safe = (typeof correlation_is_auto === 'undefined') ? true : !!correlation_is_auto; %><% var correlation_degraded_from_safe = (typeof correlation_degraded_from === 'undefined' || !correlation_degraded_from) ? '' : correlation_degraded_from; %><% var is_polychoric_available_safe = (typeof is_polychoric_available === 'undefined') ? true : !!is_polychoric_available; %><% var correlation_warnings_safe = (typeof correlation_warnings === 'undefined' || !correlation_warnings) ? [] : correlation_warnings; %><% var is_category_correlation_safe = (typeof is_category_correlation === 'undefined') ? (correlation_type_safe !== 'pearson') : is_category_correlation; %>

{{analysis_method_table}}

<% var correlation_names_en = {polychoric: 'polychoric', tetrachoric: 'tetrachoric', mixed: 'mixed', pearson: 'Pearson'}; %>
<% if (correlation_degraded_from_safe) { %>
<% var degraded_name_en = correlation_names_en[correlation_degraded_from_safe] || correlation_degraded_from_safe; %>
The <%= degraded_name_en %> correlation requested for this analysis could not be estimated from the data, so Pearson correlation was used instead. Sparse categories, category combinations with no answers, or a variable that is not really categorical are the usual causes; consider merging categories or reselecting the variables before relying on the results.
<% } else if (correlation_type_safe === 'polychoric') { %>
<% if (is_correlation_auto_safe) { %>
In this analysis, polychoric correlations are used because all of the selected variables are ordered-categorical, based on their number of categories and the degree of skewness in their response distributions.
<% } else { %>
In this analysis, polychoric correlations are used because Polychoric was selected as the correlation type.
<% } %>

Polychoric correlation estimates the relationships between items by assuming that ordinal categories, such as 1-to-5 rating scales, represent underlying continuous scales. It is suitable for survey items where the intervals between categories may not be equal and may capture the factor structure more appropriately than Pearson correlation.
<% } else if (correlation_type_safe === 'tetrachoric') { %>
In this analysis, tetrachoric correlations are used because all of the selected variables take only two values.

Tetrachoric correlation assumes that a continuous scale underlies each binary answer, and estimates the relationship between items from that assumed scale. It captures the factor structure of yes/no or 1/0 items more appropriately than Pearson correlation.
<% } else if (correlation_type_safe === 'mixed') { %>
In this analysis, mixed correlations are used because the selected variables include both numeric and ordered-categorical types.

Mixed correlation applies the correlation that suits each pair of variables - Pearson for continuous pairs, polychoric or tetrachoric where a category is involved - so that variables of different types can be analyzed together.
<% } else if (!is_correlation_known_safe) { %>
In this analysis, Pearson correlations are used.

Pearson correlation measures the linear relationship between two variables. When variables are ordinal categorical, such as 1-to-5 rating scales with concentrated or skewed answers, polychoric correlation may capture the factor structure more appropriately; it can be selected from [Settings](//analytics/settings).
<% } else { %>
<% if (is_correlation_auto_safe) { %>
In this analysis, Pearson correlations are used because all of the selected variables are numeric.
<% } else { %>
In this analysis, Pearson correlations are used because Pearson was selected as the correlation type.
<% } %>

Pearson correlation measures the linear relationship between two variables.<% if (is_polychoric_available_safe) { %> When variables are ordinal categorical, such as 1-to-5 rating scales with concentrated or skewed answers, polychoric correlation may capture the factor structure more appropriately; it can be selected from [Settings](//analytics/settings).<% } %>
<% } %>
<% if (correlation_warnings_safe.indexOf('sparse_categories') >= 0) { %>
Note: some variables have a category that holds less than 5% of the responses. Correlations estimated from categories can become unstable when categories are that sparse.
<% } %>
<% if (correlation_warnings_safe.indexOf('alphabetical_category_order') >= 0) { %>
Note: at least one categorical variable has no defined category order, so its categories were ordered alphabetically. Set the category order explicitly if that order is not the intended one.
<% } %>
The current rotation method is **<%= rotation_type %>**. The rotation method can be changed from [Settings](//analytics/settings).
<% if (factor_count === 1) { %>
Rotation has no effect when there is only one factor, since it adjusts the relationship between multiple factor axes.
<% } else if (is_oblique) { %>
This is an oblique rotation that allows the factors to be correlated with each other. When factors are expected to be related, an oblique rotation is a reasonable choice.
<% } else { %>
This is an orthogonal rotation that assumes the factors are independent of each other. If the factors are likely to be related, it is worth also trying an oblique rotation such as Oblimin or Promax.
<% } %>

## Suitability

Before interpreting the factors, it is worth checking whether the selected variables are suitable for factor analysis.

{{suitability_table}}

* The **KMO measure** indicates how well the selected variables are suited for factor analysis. It ranges from 0 to 1, and values closer to 1 indicate a better fit.
* **Bartlett's test of sphericity** checks whether there is enough correlation among the variables to run factor analysis; a small P value means the variables are sufficiently correlated.

If either indicator suggests the data is weak, consider reselecting the variables before relying on the results below.

<% if (is_category_correlation_safe) { %>
<% if (correlation_degraded_from_safe) { %>The diagnostics below describe the categorical correlation that could not be estimated.<% } else { %>Because this analysis estimates the correlations from categorical variables, use the diagnostics below as a reference on top of the KMO measure and Bartlett's test of sphericity.<% } %>

{{correlation_diagnostics_table}}

Sparse categories, category combinations with no answers, and a correlation matrix that had to be smoothed all make the estimated correlations less stable. If any of them is flagged, consider merging categories or reselecting the variables.
<% } %>

# Examining the Number of Factors

## Recommended Number of Factors

<% if (typeof parallel_n !== 'undefined' && parallel_n !== null) { %><% if (typeof methods_agree !== 'undefined' && methods_agree) { %>Parallel analysis and the Kaiser criterion both support <%= parallel_n %> factor<%= parallel_n === 1 ? '' : 's' %>.<% } else if (typeof kaiser_n !== 'undefined' && kaiser_n !== null) { %>Parallel analysis suggests <%= parallel_n %> and the Kaiser criterion <%= kaiser_n %>.<% } %>
<% } %>

{{factor_count_table}}

Each method can suggest a different number of factors, so treat these as guidelines. Combined with how interpretable each factor is using the "Factor & Variable Relationships" section, you ultimately choose the appropriate number of factors.

## Change in Eigenvalues (Scree Plot)

The following chart shows how the eigenvalues of the correlation matrix change as factors are added. The point where the decline in eigenvalues begins to level off (the "elbow") helps guide the choice of factor count. The horizontal reference line also shows the Kaiser criterion, which retains factors with eigenvalues above 1.

{{scree_plot}}

## Comparison with Random Data (Parallel Analysis)

The following chart compares the eigenvalues from the actual data with eigenvalues from random data, where the variables have no relationships. The range where the actual-data eigenvalues exceed the random-data eigenvalues helps guide the number of factors to retain.

<% if (typeof parallel_n !== 'undefined' && parallel_n !== null) { %>
<% if (parallel_method === 'smc') { %>
The eigenvalues are calculated using the \`Diagonal SMC\` selected under Parallel Analysis Method.
<% } else { %>
The eigenvalues are calculated using the \`Factor Model\` selected under Parallel Analysis Method.
<% } %>

{{scree_plot_parallel}}
<% } else { %>
Parallel analysis could not be computed.
<% } %>

## Factor Number Decision Results

The following table summarizes, for each factor, the eigenvalues used in the scree plot and parallel analysis, together with the Kaiser-criterion and parallel-analysis judgments. The recommended factor count can differ by method, so consider these results along with how readily the factors can be interpreted and the purpose of the analysis when deciding the number of factors.

{{factor_selection_table}}

# Factor & Variable Relationships

## Factor Loadings

The table below shows how strongly each variable is related to each factor. The bar in each cell represents the size of the factor loading; red indicates a positive loading and blue a negative loading. Generally, an absolute value of **0.4 or above** indicates a meaningful relationship and **0.6 or above** a strong one.

{{factor_loadings_table}}

**How to read the colors:**

| Loading value | Color | Meaning |
|---|---|---|
| 0.6 or higher | Dark red | Strong positive relationship |
| 0.4 or higher | Medium red | Moderate positive relationship |
| Greater than 0 | Light red | Weak positive relationship |
| 0 | Gray | No relationship |
| Less than 0 | Light blue | Weak negative relationship |
| -0.4 or lower | Medium blue | Moderate negative relationship |
| -0.6 or lower | Dark blue | Strong negative relationship |

<% if (typeof factor_summaries !== 'undefined' && factor_summaries.length > 0) { %>
The variables most strongly related to each factor are:

<% factor_summaries.forEach(fs => { %><% if (fs.has_variables) { %>
- **<%= fs.factor %>** is mainly related to <%= fs.variables.map(v => '"' + v + '"').join(', ') %>.
<% } else { %>
- **<%= fs.factor %>** has no variables that relate to it strongly enough.
<% } %><% }); %>
<% } %>

### Variables Needing Caution

Some variables do not belong cleanly to a single factor: they load meaningfully on more than one factor (cross-loading), or they do not load strongly on any factor. Care is needed when naming and interpreting the factors.

## Visualizing Each Variable's Factor Loadings

The radar chart visualizes the absolute factor loadings of each variable by factor. When a factor's line extends outward at a particular variable, that indicates the factor is strongly related to it.

{{factor_loadings_radar}}

<% if (factor_count > 1) { %>

## Variable Relationships

The following chart, called a "biplot," visualizes the relationships between all variables on a plane represented by Factor 1 and Factor 2.

{{biplot}}

The variance in the original data is represented by <%= number_of_variables %> variables, but this attempts to visualize it in a two-dimensional space (X-axis and Y-axis) using the first two of the <%= factor_count %> factors as the X-axis and Y-axis, while trying to preserve as much of the information content (variance) of the original data as possible.

Each variable is represented by gray lines extending outward from the center point (0, 0). Variables whose lines point in the same direction have strong correlations.

<% } %>

<% if (has_category) { %>

## Factor & Category Relationships

The following visualizes the relationship between '<%= category %>' selected as a category and the factors using a radar chart.

{{category_factor_relationship}}

This chart visualizes the average factor scores for each factor by category. This allows you to understand which factors are strongly related to specific categories.

<% } %>

# How Well Each Variable Is Explained

## Explanatory Degree

The following chart shows, for each variable, the proportion of its variance explained by the extracted factors (communality) and the proportion left unexplained (uniqueness).

{{communality_bar}}

<% if (improper_communality_variables && improper_communality_variables.length > 0) { %>
Note: The communality of <%= improper_communality_variables.map(v => '\`' + v + '\`').join(', ') %> exceeds 1. Communality is normally bounded between 0 and 1; a value above 1 does not mean the variable is "explained more than 100%" — it indicates that the factor-analysis estimation may be unstable. Consider reducing the number of factors, reviewing the target variables, or changing the missing-value handling or estimation method. For details, see [this note](<%= heywood_note_url %>).
<% } %>

## Judging the Explanatory Degree

Each variable was judged on how well it is explained, based on its communality score.

{{communality_table}}

**Judgment criteria:**

| Judgement | Rule |
|---|---|
| Well explained | Communality is 0.60 or higher and less than 0.95. |
| Moderately explained | Communality is 0.40 or higher and less than 0.60. |
| Weakly explained | Communality is less than 0.40. |
| Too high (caution) | Communality is 0.95 or higher and no more than 1. |
| Possibly improper solution | Communality exceeds 1 (equivalently, uniqueness is negative). |

Variables with **low communality** are not well captured by the current factor structure and may represent something the current factors do not cover. If several important variables have low communality, consider increasing the number of factors or revisiting the variable selection.

# Contribution of Each Factor

The following chart shows how much of the total variance each factor explains.

{{variance_explained}}

The bars show each factor's contribution and the line shows the cumulative contribution. <%= factor_count === 1 ? 'This factor explains' : 'The ' + factor_count + ' factors together explain' %> <%= cumulative_variance_pct %>% of the total variance.

# Factor Scores

The table below adds "factor scores" to the original data.

{{data}}

Factor scores are standardized to a mean of 0 and a standard deviation of 1. Values near 0 indicate average observations, while values far from 0 (positive or negative) indicate stronger tendencies for that factor. As a guideline, values beyond ±1 show a strong tendency away from the average.

The sign of a factor score is interpreted together with the sign of the factor loadings:

* For variables with positive loadings, a higher factor score corresponds to a higher variable value.
* For variables with negative loadings, a higher factor score corresponds to a lower variable value.

Factor scores can be used for follow-up analysis such as segment comparison, clustering, regression, and prediction.

## Factor Score Coefficients

The table below shows the weight each variable carries when the factor score for each factor is calculated.

{{factor_score_coefficients_table}}

Factor score coefficients are the weights that combine the standardized original variables into a factor score. Unlike factor loadings, which show the correlation between a variable and a factor, coefficients show how much each variable is used to calculate the score.

A positive coefficient means a higher value of the variable raises the factor score, and a negative coefficient means a higher value lowers it. Unlike factor loadings, coefficients have no generally accepted cutoff for what counts as "strong", so focus on which variables have relatively larger coefficients within the same factor rather than on the absolute value itself.

A factor score is obtained by multiplying each standardized variable by its coefficient and summing the results. This means you can also use these coefficients to calculate the same factor scores for new data.

# Significance Test

{{fit_metrics_table}}

The significance information here is useful when the goal is to "verify whether a hypothesized factor structure fits the data." When the goal is instead to "discover" a factor structure from the data, this information is of limited practical value.

<% var has_significance_test_safe = (typeof has_significance_test === 'undefined') ? (typeof p !== 'undefined' && isFinite(parseFloat(p)) && typeof df !== 'undefined' && parseFloat(df) > 0) : !!has_significance_test; %>
<% var df_display = (typeof df === 'undefined' || df === null || df === '') ? '-' : df; %>
<% if (has_significance_test_safe) { %>
<% if (p > baseline_p) { %>
A chi-square test is used as the hypothesis test. The null hypothesis is "the factor model (structure) fits the data." The P value is <%= p %>, which is larger than the significance level of <%= baseline_p_pct %>%, so the null hypothesis cannot be rejected — indicating that this factor model fits the data.
<% } else { %>
A chi-square test is used as the hypothesis test. The null hypothesis is "the factor model (structure) fits the data." The P value is <%= p %>, which is smaller than the significance level of <%= baseline_p_pct %>%, so the null hypothesis can be rejected — indicating that this factor model does not fit the data.
<% } %>


As rough guidelines for the fit indices in the table above, a smaller RMSR and RMSEA indicate a better fit, and a TLI closer to 1 indicates a better fit. BIC has no absolute cutoff -- it is only useful for comparing models fitted on the same data, where a smaller value is preferred.
<% } else { %>
The goodness-of-fit test could not be performed for this model: the number of factors is too large for the number of variables, so the degrees of freedom (<%= df_display %>) are not positive. The P value, RMSEA and BIC are therefore shown as "-", and the chi-square, RMSR and TLI values that are shown cannot be read as fit indices. Reduce the number of factors, or add variables, to obtain them.
<% } %>
`;

module.exports = template;

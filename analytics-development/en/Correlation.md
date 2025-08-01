const template = `


<% if (algorithm == 'pearson') { %>
Correlation coefficients were calculated for all variable combinations. The algorithm used for calculating correlation coefficients is "Pearson". The algorithm can be changed from [Settings](//analytics/settings/do_cor_argo) in Analytics.
<% } else { %>
Correlation coefficients were calculated for all variable combinations. The algorithm used for calculating correlation coefficients is "Spearman". The algorithm can be changed from [Settings](//analytics/settings/do_cor_argo) in Analytics.

<% } %>

# Correlation Strength

<% if (!repeat_by) { %>
Correlation coefficients were calculated for all variable combinations and compiled into a table called a heatmap, with each value colored according to the following rules:
<% } else { %>
Correlation coefficients were calculated for all variable combinations and compiled into a table called a heatmap for each <%= repeat_by %>, with each value colored according to the following rules:
<% } %>

* Closer to 1 (maximum positive correlation): darker red
* Closer to -1 (maximum negative correlation): darker blue
* Closer to 0 (no correlation): gray

{{correlation_chart:0.8}}

When "Show Correlation Coefficients" is checked, correlation coefficients are displayed on the heatmap.


## About Correlation Coefficients

Correlation coefficients take values between -1 and 1, indicating the strength and direction of correlation between variables.

* Closer to 1: strong positive correlation (as one increases, the other also increases)
* Closer to -1: strong negative correlation (as one increases, the other decreases)
* Closer to 0: weak or no correlation

Guidelines for interpreting correlation coefficients are as follows:

* 0.8 ~ 1.0 (or -0.8 ~ -1.0): Very strong correlation
* 0.6 ~ 0.8 (or -0.6 ~ -0.8): Strong correlation
* 0.4 ~ 0.6 (or -0.4 ~ -0.6): Moderate correlation
* 0.2 ~ 0.4 (or -0.2 ~ -0.4): Weak correlation
* 0.0 ~ 0.2 (or -0.0 ~ -0.2): Little to no correlation

## Important Notes

* Correlation coefficients do not indicate causal relationships between variables, but only indicate the strength of relationship in the sense that two numerical variables move together in the same direction.
* The algorithm for correlation coefficients is **Pearson's correlation coefficient** by default. However, if there is a monotonic but not linear relationship between variables, **Spearman's rank correlation coefficient** can more appropriately capture the correlation. The algorithm can be changed from [Settings](//analytics/settings/do_cor_argo) in Analytics.
* Spearman's rank correlation coefficient converts original values to rank values and then calculates correlation coefficients using the same method as Pearson's correlation coefficient. For details on these two correlation coefficients, please refer to [this note](https://exploratory.io/note/exploratory/2-BsF1LQF4).

# Correlation Significance

<% if (!repeat_by) { %>
Hypothesis testing is also performed for each variable combination's correlation coefficient to determine significance. The results are summarized in a scatter plot according to the following rules:
<% } else { %>
Hypothesis testing is also performed for each variable combination's correlation coefficient to determine significance. The results are summarized in a scatter plot for each <%= repeat_by %> according to the following rules:
<% } %>

* Red: Positive correlation
* Blue: Negative correlation
* Gray: Not significant
* Circle size: Correlation coefficient

{{significance_chart:0.8}}

## About Hypothesis Testing

A t-test is used for correlation coefficient hypothesis testing, and P-values are calculated for each correlation coefficient. P-values indicate the probability that the correlation coefficient is due to chance based on data variability.

* If the P-value is less than <%= baseline_p_pct %>%, the calculated correlation coefficient can be said to be statistically significant.
* If the P-value is greater than <%= baseline_p_pct %>%, the calculated correlation coefficient cannot be said to be statistically significant.

The current significance level (P-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed from [Settings](//analytics/settings) in Analytics.

## Correlation Coefficient and Test Result Data

Correlation coefficients, P-values, etc. for all variable combinations are listed in the following table.

{start_show_hide}
### Table
{{data}}

## Statistical Indicators Explanation

* Correlation Coefficient
  * The correlation coefficient is a statistic that indicates the strength and direction of linear relationship between two variables.
  * Values range from -1 to 1, where 1 indicates perfect positive correlation, -1 indicates perfect negative correlation, and 0 indicates no correlation.

* P-value
  * P-value indicates the probability that the observed correlation coefficient is due to chance.
  * Generally, if less than 5% (0.05), it is judged to be statistically significant.
  * Values range from 0 to 1, where smaller P-values indicate higher statistical significance.

* t-value
  * The t-value is a statistic used in t-tests for correlation coefficient testing, calculated as "correlation coefficient ÷ standard error of correlation coefficient".
  * If data size is large, the t-value tends to be large; if small, the t-value tends to be small.
  * The larger the absolute value, the higher the possibility that the correlation coefficient is not 0 (no correlation).
  * The larger the absolute value of the t-value, the smaller the P-value becomes.
{end_show_hide}

# Appendix

## Next Steps

<% if (!repeat_by) { %>
* Group-wise Analysis: By conducting correlation analysis for each group, you may gain a more detailed understanding of correlations within each group. In that case, you can select a grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Outlier Verification: Check for outliers in variables and address them as necessary to enable more accurate interpretation of relationships.
* Multivariate Analysis: Even if there is a correlation between two variables, it may be due to the influence of other correlated variables. We recommend using multivariate analysis such as "Linear Regression" to more appropriately analyze relationships between variables while considering the effects of other variables on the target variable.



`;

module.exports = template; 
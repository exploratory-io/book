const template = `


<% if (algorithm == 'pearson') { %>
Correlation coefficients were calculated for all variable combinations. The algorithm used for calculating correlation coefficients is "Pearson". The algorithm can be changed from [Settings](//analytics/settings/do_cor_argo) in Analytics.
<% } else if (algorithm == 'spearman') { %>
Correlation coefficients were calculated for all variable combinations. The algorithm used for calculating correlation coefficients is "Spearman". The algorithm can be changed from [Settings](//analytics/settings/do_cor_argo) in Analytics.
<% } else { %>
Correlation coefficients were calculated for all variable combinations. The algorithm used for calculating correlation coefficients is "Polychoric". The algorithm can be changed from [Settings](//analytics/settings/do_cor_argo) in Analytics.

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


## How to Read Correlation Coefficients

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
* Polychoric correlation is intended for ordinal variables such as survey rating scales (e.g. 1 to 5). It estimates the correlation between the continuous variables assumed to underlie the ordinal responses.

# Statistical Significance

We conducted hypothesis tests to determine whether the correlation coefficients for all pairs of variables are statistically significant.

{{data}}

## How to Read the Metrics

<% if (algorithm == 'pearson') { %>

* Correlation Coefficient (Pearson’s Correlation)
  * The correlation coefficient measures the strength and direction of linear relationship between two variables.
  * Values range from -1 to 1, where 1 indicates perfect positive correlation, -1 indicates perfect negative correlation, and 0 indicates no correlation.

* P-value
  * The P-value indicates how likely it is to observe the given correlation under the assumption that there is no correlation (correlation coefficient = 0).
  * In general, a value below 5% (0.05) is considered statistically significant.
  * The value ranges from 0 to 1, and a smaller P-value indicates stronger evidence against the null hypothesis.

* Statistic (t-value)
  * The t value is the test statistic used to evaluate whether the correlation coefficient is significantly different from 0.
  * It is calculated from the correlation coefficient and its standard error.
  * Larger absolute values indicate stronger evidence against the null hypothesis (no correlation), and correspond to smaller P-values.

<% } else if (algorithm == 'spearman') { %>

* Correlation Coefficient (Spearman’s Rank Correlation)
  * The correlation coefficient measures the strength and direction of a monotonic relationship (increasing or decreasing trend) between two variables.
  * It is calculated based on the ranks (order) of the data rather than the raw values, making it less sensitive to outliers.
  * The value ranges from -1 to 1, where 1 indicates a perfect positive monotonic relationship, -1 indicates a perfect negative monotonic relationship, and 0 indicates no monotonic relationship.

* P-value
  * The P-value indicates how likely it is to observe the given correlation under the assumption that there is no correlation (correlation coefficient = 0).
  * In general, a value below 5% (0.05) is considered statistically significant.
  * The value ranges from 0 to 1, and a smaller P-value indicates stronger evidence against the null hypothesis.

* Statistic
  * The statistic is used to test whether the correlation coefficient is significantly different from 0 (no correlation).
  * Depending on the data conditions, one of the following is used:

  * S value (Sum of Squared Rank Differences)
      * This is the sum of squared differences between the ranks of each observation.
      * Smaller values indicate closer agreement in ranks and stronger evidence against the null hypothesis.
      * Because S depends on the sample size, it is mainly used internally for hypothesis testing rather than direct interpretation.

  * Z value (Normal Approximation)
      * This is a standardized version of the correlation coefficient, transformed to follow a standard normal distribution.
      * It is typically used when the sample size is large or when there are tied ranks.
      * Larger absolute values indicate stronger evidence against the null hypothesis (no correlation), and correspond to smaller P-values.

<% } else { %>

* Correlation Coefficient (Polychoric Correlation)
  * The polychoric correlation estimates the correlation between two ordinal variables by assuming each is a discretization of an underlying continuous variable that follows a normal distribution.
  * It is suited to ordinal scales such as survey ratings (e.g. 1 to 5).
  * Values range from -1 to 1, where 1 indicates perfect positive correlation, -1 indicates perfect negative correlation, and 0 indicates no correlation.

* P-value
  * The P-value indicates how likely it is to observe the given correlation under the assumption that there is no correlation (correlation coefficient = 0).
  * In general, a value below 5% (0.05) is considered statistically significant.
  * The value ranges from 0 to 1, and a smaller P-value indicates stronger evidence against the null hypothesis.

* Statistic (z-value)
  * The z value is the test statistic used to evaluate whether the correlation coefficient is significantly different from 0.
  * It is calculated as the polychoric correlation divided by its standard error.
  * Larger absolute values indicate stronger evidence against the null hypothesis (no correlation), and correspond to smaller P-values.

<% } %>

## How the Test Works

The hypothesis test for correlation evaluates whether an observed correlation could have occurred by chance.

* For Pearson correlation, a t-Test is used.
* For Spearman correlation, the method depends on the data conditions:
  * When the sample size is small (as a guideline, n < 50) and there are no tied ranks: Exact Test
  * Otherwise: Approximate Test (normal approximation)
* For Polychoric correlation, a z-test based on the standard error of the estimated correlation is used.

In these tests, a P-value is calculated for each correlation coefficient. The P-value represents the probability of observing the given result under the null hypothesis that there is no correlation (correlation coefficient = 0).

* If the P-value is less than <%= baseline_p_pct %>%, the calculated correlation coefficient can be said to be statistically significant.
* If the P-value is greater than <%= baseline_p_pct %>%, the calculated correlation coefficient cannot be said to be statistically significant.

The current significance level (P-value threshold) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed from [Settings](//analytics/settings).


## Visualizing the Results

<% if (!repeat_by) { %>
The results of the hypothesis tests are visualized in a scatter plot based on the following rules:
<% } else { %>
The results of the hypothesis tests are visualized in a scatter plot for each <%= repeat_by %>, based on the following rules:
<% } %>

* Red: Statistically significant positive correlation
* Blue: Statistically significant negative correlation
* Gray: Not statistically significant
* Circle size: Magnitude of the correlation coefficient

{{significance_chart:0.8}}


# Appendix

## Next Steps

<% if (!repeat_by) { %>
* Group-wise Analysis: By conducting correlation analysis for each group, you may gain a more detailed understanding of correlations within each group. In that case, you can select a grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Outlier Verification: Check for outliers in variables and address them as necessary to enable more accurate interpretation of relationships.
* Multivariate Analysis: Even if there is a correlation between two variables, it may be due to the influence of other correlated variables. We recommend using multivariate analysis such as "Linear Regression" to more appropriately analyze relationships between variables while considering the effects of other variables on the target variable.



`;

module.exports = template;
